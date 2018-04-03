% ������� ��������� ��������� ����� �� �������������� ������ �������������
% �����������
% 
% rangeValue - �������� ��������� ��������
% obsCount - ���������� ����������
% classCount - ���������� �������
% attrCount - ���������� ���������
% succProb - ����������� ������
% 
function R = getRndNumbers(obsCount, succProb, attrCount, classCount, rangeValue)
    % ������� binornd(N, P, MM, NN) ���������� ��������� ����� ��
    % �������������� ������ ������������� ����������� � ����������� N -
    % ���������� ���������, P - ����������� ������, MMXNN - ����������� ������� 
    
    % ���������� ��������� ����� � �������� ��������� � ����������
    % classCount
    rndMass = unidrnd(rangeValue, classCount, 1);
    
    % ���������� ������ ���������� �� �������������� ������ �� ��������
    % ���������
    for i = 1 : classCount
        for j = ((i - 1) * obsCount + 1) : obsCount * i
            R(((i - 1) * obsCount + 1) : obsCount * i, :) = binornd(obsCount, succProb, obsCount, attrCount) + rndMass(i, 1);
        end
    end
    
   % for i = 0 : (classCount - 1)
   %     R(i * obsCount + 1 : obsCount * (i + 1), :) =  binornd(obsCount, succProb, obsCount, attrCount) + i * rangeValue;
   % end
end