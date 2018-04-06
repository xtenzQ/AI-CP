function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 05-Apr-2018 19:08:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global range;
global attribute;
global succeed;
global attrcount;
global classCount;
global stree;
global tree1;
global X;
global A;
global trainArray ;
global trainY;
global testArray ;
global testY;

range = str2num(get(handles.edit3,'String'));
attribute = str2num(get(handles.edit4,'String'));
succeed = str2double(get(handles.edit5,'String'));
classCount = str2num(get(handles.edit7,'String'));
attrcount = str2num(get(handles.edit8,'String'));

A = double([]);
for i=1:classCount
	R1=binornd(attribute, succeed, attribute, attrcount)+range*i;
	A=[A;R1];  
end

A = normc(A) * 10;

%A = getRndNumbers(attribute, succeed, attrcount, classCount, range);

for j=1:classCount
    for i=((j-1)*attribute+1):attribute*j
        X(((j-1)*attribute+1):attribute*j,1)=j;%
    end
end


set(handles.uitable3, 'data', A);

%testY = A(test(C),:);
%trainY = A(training(C),:);
%testArray = A(test(C),:);
%trainArray  = A(training(C),:);

%stree = fitctree(trainArray ,trainY);
%[~,~,~,bestlevel] = cvLoss(stree, 'SubTrees','All','TreeSize','min');
%tree1 = prune(stree,'Level', bestlevel);

C = cvpartition(classCount * attribute,'holdout',0.4);
trainY = X(training(C),:);
trainArray  = A(training(C),:);
testY = X(test(C),:);
testArray  = A(test(C),:);
t1= fitctree(trainArray ,trainY);
[~,~,~,bestlevel] = cvLoss(t1, 'SubTrees','All','TreeSize','min');
tree1 = prune(t1,'Level', bestlevel) ;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tree1;
global trainY;
global testY;
global trainArray ;
global testArray ;
global classCount;
global attrcount;
global X;
global A;
save main.mat X A classCount attrcount;
save trainTree.mat tree1;
save xte.mat testY;
save xtr.mat trainY;
save yte.mat testArray ;
save ytr.mat trainArray ;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tree1;
global trainY;
global testY;
global trainArray ;
global testArray ;
global classCount;
global attrcount;
global X;
global A;
load main.mat X A classCount attrcount;
load trainTree.mat tree1;
load xte.mat testY;
load xtr.mat trainY;
load yte.mat testArray ;
load ytr.mat trainArray ;
set(handles.uitable3, 'data', A);


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

r1 = get(handles.net11,'Value');
r2 = get(handles.net22,'Value');
r3 = get(handles.net33,'Value');
r4 = get(handles.net44,'Value');

global tree1;
global trainArray ;
global testArray ;
global trainY;
global testY;
global net1;
global net2;
global net3;
global net4;
global classCount;
global attrcount;

% Конкурирующая сеть (Кохонена)
if (r1 == 1)
    % Создание сети
    net1 = competlayer(classCount);
    % 
    net1.trainParam.epochs = str2num(get(handles.edit6,'String'));
    % Обучение сети
    net1 = train(net1, trainArray');
    % 
    save net1 net1
end
if (r2 == 1)
    for i=1:size(trainY)
        Xtr(i,trainY(i))=1;
    end
    net2 = patternnet(10);
    t=full(ind2vec(trainY'));
    net2.trainParam.epochs = str2num(get(handles.edit6,'String'));
     % Обучение сети
    net2 = train(net2,trainArray',t); 
    save net2 net2;
end
if (r3 == 1)
    net3 = feedforwardnet(10);
    net3.trainParam.epochs = str2num(get(handles.edit6,'String'));
    % Обучение сети
    net3=train(net3,trainArray',trainY');
    save net3 net3;
end
if (r4 == 1)
    Xtrain2=trainY;
    for i=1:size(trainY)
        if (trainY(i) ~= 1)
            Xtrain2(i)=0;
        end
    end
    net4 = perceptron;
    net4.trainParam.epochs = str2num(get(handles.edit6,'String'));
    % Обучение сети
    net4 = train(net4,trainArray',Xtrain2');
    save net4 net4;
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global net1;
global net2;
global net3;
global net4;
global trainArray ;
global trainY;
global testArray ;
global testY;
global classCount;
global nett;

r1 = get(handles.net11,'Value');
r2 = get(handles.net22,'Value');
r3 = get(handles.net33,'Value');
r4 = get(handles.net44,'Value');

if (r1 == 1)
    load net1 net1;
    % 
    R = net1(testArray');
    % преобразование матрицы - результата классификации для сети Кохнена в
    % массив ind - номеров классов для классифицированных объектов
    ind = vec2ind(R);
    % Задаем оси
    axes(handles.axes1);
    % Строим график
    scatter3(testArray(:, 1), testArray(:, 2), testArray(:, 3), 5, ind, 'filled');
    grid on;
    % Матрица совпадений по каждому классу
    c_M = confusionmat(testY, ind');
    % 
    C_tt = bsxfun(@rdivide,c_M,sum(c_M,2)) * 100;
    % 
    set(handles.uitable1, 'data', C_tt);
    A_train = 0;
    for i = 1 : classCount
        A_train = A_train + max(C_tt(i,:));
    end
    A_train = A_train / classCount;
    %
    %
    %
    R = net1(trainArray');
    %
    ind = vec2ind(R);
    axes(handles.axes2);
    scatter3(trainArray(:,1), trainArray(:,2), trainArray(:,3),5,ind,'filled');
    grid on;

    c_M=confusionmat(trainY, ind');

    C_tt = bsxfun(@rdivide,c_M,sum(c_M,2)) * 100;
    set(handles.uitable2, 'data', C_tt);
    A_train2 = 0;
    
    for i=1:classCount
        A_train2 = A_train2+max(C_tt(i,:));
    end;
    A_train2 = A_train2/classCount;
    
    disp('Среднее качество обсулживания ');
    disp((A_train+A_train2)/2);
end
if (r2 == 1)
    load net2 net2;
    %
    %
    %
    y = net2(testArray');

    ind = vec2ind(y);
    
    axes(handles.axes1);
    scatter3(testArray(:,1), testArray(:,2), testArray(:,3), 5, ind, 'filled');
    grid on;

    c_M = confusionmat(testY, ind');

    C_tt = bsxfun(@rdivide, c_M, sum(c_M, 2)) * 100;
    set(handles.uitable1, 'data', C_tt);
    A_train = 0;
    for i=1 : classCount
        A_train = A_train+max(C_tt(i,:));
    end
    A_train = A_train / classCount;
    %
    %
    %
    y = net2(trainArray');
    
    ind = vec2ind(y);
    axes(handles.axes2);
    scatter3(trainArray (:,1),trainArray (:,2),trainArray (:,3),5,ind,'filled');
    grid on;

    c_M=confusionmat(trainY,ind');

    C_tt = bsxfun(@rdivide,c_M,sum(c_M,2)) * 100;
    set(handles.uitable2, 'data', C_tt);
    A_train2 = 0;
    for i=1:classCount
        A_train2=A_train2+max(C_tt(i,:));
    end
    A_train2=A_train2/classCount;

    disp('Среднее качество обсулживания ');
    disp((A_train+A_train2)/2);
end
if (r3 == 1)
    load net3 net3;
    y = net3(testArray');
    axes(handles.axes1);
    scatter3(testArray (:,1),testArray (:,2),testArray (:,3),5,round(y'),'filled');
    grid on;

    c_M=confusionmat(testY,round(y));
    disp('feed forward net - test');
    C_tt = bsxfun(@rdivide, c_M, sum(c_M,2)) * 100;
    set(handles.uitable1, 'data', C_tt);
    A_train=0;
    for i=1:classCount
        A_train=A_train + max(C_tt(i,:));
    end
    A_train=A_train/classCount;

    y = net3(trainArray');
    axes(handles.axes2);
    scatter3(trainArray (:,1),trainArray (:,2),trainArray (:,3),5,round(y'),'filled');
    grid on;

    c_M=confusionmat(trainY,round(y));
    disp('feed forward net - train');
    C_tt = bsxfun(@rdivide,c_M,sum(c_M,2)) * 100;
    set(handles.uitable2, 'data', C_tt);
    A_train2=0;
    for i=1:classCount
        A_train2=A_train2+max(C_tt(i,:));
    end;
    A_train2=A_train2/classCount;

    disp('Среднее качество обсулживания ');
    disp((A_train+A_train2)/2);
end
if (r4 == 1)
    load net4 net4;
    
    Xtest2 = testY;
    
    for i=1:size(testY)
        if (testY(i) ~= 1)
            Xtest2(i) = 0;
        end
    end
    % Выборка по тестирующему массиву
    y = net4(testArray');
    axes(handles.axes1);
    % 
    plotpv(testArray', Xtest2');
    hold on;
    %
    plotpc(net4.IW{1},net4.b{1});
    grid on;

    c_M = confusionmat(Xtest2, round(y));
    C_tt = bsxfun(@rdivide,c_M,sum(c_M,2)) * 100;
    set(handles.uitable1, 'data', C_tt);
    A_train = 0;
    for i=1:2
        A_train=A_train+max(C_tt(i,:));
    end
    A_train=A_train/2;

    Xtrain2=trainY;
    for i=1:size(trainY)
        if (trainY(i) ~= 1)
            Xtrain2(i)=0;
        end
    end

    y = net4(trainArray');
    axes(handles.axes2);
    plotpv(trainArray',Xtrain2');
    hold on;
    plotpc(net4.IW{1},net4.b{1});
    grid on;

    c_M=confusionmat(Xtrain2,round(y));
    C_tt = bsxfun(@rdivide,c_M,sum(c_M,2)) * 100;
    set(handles.uitable2, 'data', C_tt);
    A_train2=0;
    for i=1:2
        A_train2=A_train2+max(C_tt(i,:));
    end
    A_train2=A_train2/2;

    disp('Среднее качество обсулживания ');
    disp((A_train+A_train2)/2);
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global net1;
global net2;
global net3;
global net4;

r1 = get(handles.net11,'Value');
r2 = get(handles.net22,'Value');
r3 = get(handles.net33,'Value');
r4 = get(handles.net44,'Value');
if (r1 == 1)
    load net1 net1;
    view(net1);
end
if (r2 == 1)
    load net1 net2;
    view(net2);
end
if (r3 == 1)
    load net1 net3;
    view(net3);
end
if (r4 == 1)
    load net1 net4;
    view(net4);
end


function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
