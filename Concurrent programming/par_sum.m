% ������� ����� ����������� ������ ���������
function y = par_sum(x)
    % ���������� ��������� ����� �� ������ �� ���������
    % fix() - ���������� � ���������� �������������� �����
    k = fix(20 / numlabs);
    % 
    if (k < 1)
        k = 1;
    end
    % �� ������ �������� ����������� �������� ������� x �� iBeg �� iEnd
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
    % ������ ��������� ���� �� �������� � ������� 1
    if (labindex == 1) 
        q = z;
        for i = 2 : numlabs
            z = labBroadcast(i);
            q = q + z;
        end
        y = q;
    else
        % ��� �������� �������� ���� ��������� �����
        labBroadcast(labindex, z);
    end
end

