% =========================
% ��� ������������� �������
% =========================
% ���������� �������
F = @(x) atan(x);
% ���������� �������� ��������������
% labindex - ����� ������� ���������
% numlabs - ����� ���������� ��������
a = (labindex - 1) / numlabs;
b = labindex / numlabs;
% ��������� �������� ������������� ��������� � ������ �� ������� ���������
my = integral(F, a, b);
% ���������� ����� �������� ���������� � �� ���� ���������
% ��������� ������������ �� ���� ������� ���������
result = gplus(my);
% ������� lab2client ��������� ���������� ������������ ���������� 
% (� ����� ������ - result) �� ������ �������� � ���������������� ������
pmode lab2client result 1;
% ������� ���������
result;
% =========================
% ��� ����������������� �������
% =========================
a = 0;
b = 1;
F = @(x)atan(x);
q = integral (F,a,b);
% =========================