% Функция генерации случайных чисел по биноминальному закону распределения
% вероятности
% 
% rangeValue - диапазон случайной величины
% obsCount - количество наблюдений
% classCount - количество классов
% attrCount - количество признаков
% succProb - вероятность успеха
% 
function R = getRndNumbers(obsCount, succProb, attrCount, classCount, rangeValue)
    % Функция binornd(N, P, MM, NN) генерирует случайные числа по
    % биноминальному закону распределения вероятности с параметрами N -
    % количество испытаний, P - вероятность успеха, MMXNN - размерность матрицы 
    
    % генерируем случайные числа в заданном диапазоне в количестве
    % classCount
    rndMass = unidrnd(rangeValue, classCount, 1);
    
    % генерируем массив наблюдений по биноминальному закону по заданным
    % значениям
    for i = 1 : classCount
        for j = ((i - 1) * obsCount + 1) : obsCount * i
            R(((i - 1) * obsCount + 1) : obsCount * i, :) = binornd(obsCount, succProb, obsCount, attrCount) + rndMass(i, 1);
        end
    end
    
   % for i = 0 : (classCount - 1)
   %     R(i * obsCount + 1 : obsCount * (i + 1), :) =  binornd(obsCount, succProb, obsCount, attrCount) + i * rangeValue;
   % end
end