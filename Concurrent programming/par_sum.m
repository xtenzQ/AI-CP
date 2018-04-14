% Функция будет выполняться каждым процессом
function y = par_sum(x)
    % Вычисление частичной суммы на каждом из процессов
    % fix() - округление к ближайшему целочисленному числу
    k = fix(20 / numlabs);
    % 
    if (k < 1)
        k = 1;
    end
    % На каждом процессе суммируются элементы вектора x от iBeg до iEnd
    iBeg = ((labindex - 1) * k) + 1;
    iEnd = (labindex * k);
    % 
    if(labindex == numlabs)
        iEnd = 20;
    end
    %
    y = 0;
    %
    z = 0;
    for n = iBeg : iEnd
        top = x.^(n);
        bot = factorial(n);
        z = z + (top / bot);
    end
    % Сборка частичных сумм на процессе с номером 1
    if (labindex == 1) 
        q = z;
        for i = 2 : numlabs
            z = labBroadcast(i);
            q = q + z;
        end
        y = q;
    else
        % Все процессы отсылают свои частичные суммы
        labBroadcast(labindex, z);
    end
end

