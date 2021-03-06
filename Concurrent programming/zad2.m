% ===================================
% ������������ ����������
% ===================================
% ������� �������
jm = parcluster();
% ������� �������, ��� ��������� ������� ������ ����������� ������������
% ��� ���� ����������, � ������� lab ����� �������������� ��� ����� �����
% �����������
pjob = createCommunicatingJob(jm, 'Type', 'SPMD');
% ������ ���������� x
x = 10;
% ����������� � ������������ ����������� ��� ����� �������, ����������� 
% ������
pjob.NumWorkersRange = 3;
% ������� ������� � ������� ������ pjob
% pjob - ������
% @par_sum - ����������� �������
% 1 - ����� ����������
% {x} - ��������� ������ ����� ������� ����������
createTask(pjob, @par_sum, 1, {x});
disp('������������ ����������:');
% ���������� ������ pjob ������������
submit(pjob);
% ������ ����������, ����� ���������� ������� wait()
wait(pjob);
% ��� ������ ������ �����������, �������� ������ � ��������� ������
res = fetchOutputs(pjob);
% ������� �����
disp('����� = ');
disp(res(1, :));
% ��������� ������������ ������
destroy(pjob);
% ===================================
% ���������������� ����������
% ===================================
disp('���������������� ����������:');
% �������������� ����������
out = 0;
for n=1:20
    % ���������
    top = x.^(n);
    % �����������
    bot = factorial(n);
    % �����
    out = out + (top / bot);
end
% ������� �����
disp('����� = ');
disp(out);