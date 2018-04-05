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
global Y;
global Ytrain;
global Xtrain;
global Ytest;
global Xtest;

range = str2num(get(handles.edit3,'String'));
attribute = str2num(get(handles.edit4,'String'));
succeed = str2double(get(handles.edit5,'String'));
classCount = str2num(get(handles.edit7,'String'));
attrcount = str2num(get(handles.edit8,'String'));

Y = getRndNumbers(attribute, succeed, attrcount, classCount, range);


for j=1:classCount
    for i=((j-1)*attribute+1):attribute*j
        X(((j-1)*attribute+1):attribute*j,1)=j;%
    end
end

Y = normc(Y)*10;
set(handles.uitable3, 'data', Y);

%Xtest = A(test(C),:);
%Xtrain = A(training(C),:);
%Ytest= Y(test(C),:);
%Ytrain = Y(training(C),:);

%stree = fitctree(Ytrain,Xtrain);
%[~,~,~,bestlevel] = cvLoss(stree, 'SubTrees','All','TreeSize','min');
%tree1 = prune(stree,'Level', bestlevel);

cv = cvpartition(classCount * attribute,'holdout',0.4);
Xtrain = X(training(cv),:);
Ytrain = Y(training(cv),:);
Xtest = X(test(cv),:);
Ytest = Y(test(cv),:);
t1= fitctree(Ytrain,Xtrain);
[~,~,~,bestlevel] = cvLoss(t1, 'SubTrees','All','TreeSize','min');
tree1 = prune(t1,'Level', bestlevel) ;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tree1;
global Xtrain;
global Xtest;
global Ytrain;
global Ytest;
global classCount;
global attrcount;
global X;
global Y;
save main.mat X Y classCount attrcount;
save trainTree.mat tree1;
save xte.mat Xtest;
save xtr.mat Xtrain;
save yte.mat Ytest;
save ytr.mat Ytrain;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tree1;
global Xtrain;
global Xtest;
global Ytrain;
global Ytest;
global classCount;
global attrcount;
global X;
global Y;
load main.mat X Y classCount attrcount;
load trainTree.mat tree1;
load xte.mat Xtest;
load xtr.mat Xtrain;
load yte.mat Ytest;
load ytr.mat Ytrain;
set(handles.uitable3, 'data', Y);


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
global Ytrain;
global Ytest;
global Xtrain;
global Xtest;
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
    net1 = train(net1, Ytrain');
    % 
    save net1 net1
end
if (r2 == 1)
    for i=1:size(Xtrain)
        Xtr(i,Xtrain(i))=1;
    end
    %load iris_dataset [x,t];
    net2=patternnet(10);
    net2.trainParam.epochs = str2num(get(handles.edit6,'String'));
    net2 = train(net2,Ytrain',Xtrain'); 
    save net2 net2;
end
if (r3 == 1)
    net3 = feedforwardnet(10);
    net3.trainParam.epochs = str2num(get(handles.edit6,'String'));
    net3=train(net3,Ytrain',Xtrain');
    save net3 net3;
end
if (r4 == 1)
    Xtrain2=Xtrain;
    for i=1:size(Xtrain)
        if (Xtrain(i) ~= 1)
            Xtrain2(i)=0;
        end
    end
    net4 = perceptron;
    net4.trainParam.epochs = str2num(get(handles.edit6,'String'));
    net4 = train(net4,Ytrain',Xtrain2');
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
global Ytrain;
global Xtrain;
global Ytest;
global Xtest;
global classCount;
global nett;

r1 = get(handles.net11,'Value');
r2 = get(handles.net22,'Value');
r3 = get(handles.net33,'Value');
r4 = get(handles.net44,'Value');

if (r1 == 1)
    load net1 net1;
    % 
    R = net1(Ytest');
    % преобразование матрицы - результата классификации для сети Кохнена в
    % массив ind - номеров классов для классифицированных объектов
    ind = vec2ind(R);
    % Задаем оси
    axes(handles.axes1);
    % Строим график
    scatter3(Ytest(:, 1), Ytest(:, 2), Ytest(:, 3), 5, ind, 'filled');
    grid on;
    % Матрица совпадений по каждому классу
    c_M = confusionmat(Xtest, ind');
    % 
    disp('Kohonen net - test');
    % 
    C_tt = bsxfun(@rdivide,c_M,sum(c_M,2)) * 100;
    % 
    set(handles.uitable1, 'data', C_tt);
    A_train = 0;
    for i = 1 : classCount
        A_train = A_train + max(C_tt(i,:));
    end
    A_train = A_train / classCount;

    R=net1(Ytrain');
    ind = vec2ind(R);
    axes(handles.axes2);
    scatter3(Ytrain(:,1), Ytrain(:,2), Ytrain(:,3),5,ind,'filled');
    grid on;

    c_M=confusionmat(Xtrain,ind');
    disp('Kohonen net - train');
    C_tt = bsxfun(@rdivide,c_M,sum(c_M,2)) * 100;
    set(handles.uitable2, 'data', C_tt);
    A_train2 = 0;
    
    for i=1:classCount
        A_train2 = A_train2+max(C_tt(i,:));
    end;
    A_train2 = A_train2/classCount;
    disp('Number of iterations for Kohonen net ');
    disp(net1.trainParam.epochs);

    disp('Average training for Kohonen net ');
    disp((A_train+A_train2)/2);
end
if (r2 == 1)
    load net2 net2;
    y = net2(Ytest');

    perf = perform(net2,Xtest',y);
    disp(perf);
    ind = vec2ind(y);
    disp(ind);
    axes(handles.axes1);
    scatter3(Ytest(:,1),Ytest(:,2),Ytest(:,3),5,ind,'filled');
    grid on;

    c_M=confusionmat(Xtest,ind');
    disp('recognition - test');
    C_tt = bsxfun(@rdivide,c_M,sum(c_M,2)) * 100;
    set(handles.uitable1, 'data', C_tt);
    A_train=0;
    for i=1:classCount
        A_train=A_train+max(C_tt(i,:));
    end
    A_train=A_train/classCount;

    y = net2(Ytrain');
    ind=round(y);
    axes(handles.axes2);
    scatter3(Ytrain(:,1),Ytrain(:,2),Ytrain(:,3),5,ind,'filled');
    grid on;

    c_M=confusionmat(Xtrain,ind');
    disp('recognition net - train');
    C_tt = bsxfun(@rdivide,c_M,sum(c_M,2)) * 100;
    set(handles.uitable2, 'data', C_tt);
    A_train2=0;
    for i=1:classCount
        A_train2=A_train2+max(C_tt(i,:));
    end;
    A_train2=A_train2/classCount;

    disp('Number of iterations for recognition net ');
    disp(net2.trainParam.epochs);

    disp('Average training for recognition net ');
    disp((A_train+A_train2)/2);
end
if (r3 == 1)
    load net3 net3;
    y = net3(Ytest');
    axes(handles.axes1);
    scatter3(Ytest(:,1),Ytest(:,2),Ytest(:,3),5,round(y'),'filled');
    grid on;

    c_M=confusionmat(Xtest,round(y));
    disp('feed forward net - test');
    C_tt = bsxfun(@rdivide,c_M,sum(c_M,2)) * 100;
    set(handles.uitable1, 'data', C_tt);
    A_train=0;
    for i=1:classCount
        A_train=A_train+max(C_tt(i,:));
    end
    A_train=A_train/classCount;

    y = net3(Ytrain');
    axes(handles.axes2);
    scatter3(Ytrain(:,1),Ytrain(:,2),Ytrain(:,3),5,round(y'),'filled');
    grid on;

    c_M=confusionmat(Xtrain,round(y));
    disp('feed forward net - train');
    C_tt = bsxfun(@rdivide,c_M,sum(c_M,2)) * 100;
    set(handles.uitable2, 'data', C_tt);
    A_train2=0;
    for i=1:classCount
        A_train2=A_train2+max(C_tt(i,:));
    end;
    A_train2=A_train2/classCount;

    disp('Number of iterations for feed forward net ');
    disp(net3.trainParam.epochs);

    disp('Average training for feed forward net ');
    disp((A_train+A_train2)/2);
end
if (r4 == 1)
    load net4 net4;
    Xtest2 = Xtest;
    for i=1:size(Xtest)
        if (Xtest(i) ~= 1)
            Xtest2(i) = 0;
        end
    end
    
    y = net4(Ytest');
    axes(handles.axes1);
    plotpv(Ytest',Xtest2');
    hold on;
    plotpc(net4.IW{1},net4.b{1});
    grid on;

    c_M=confusionmat(Xtest,round(y));
    disp('feed forward net - test');
    C_tt = bsxfun(@rdivide,c_M,sum(c_M,2)) * 100;
    set(handles.uitable1, 'data', C_tt);
    A_train=0;
    for i=1:classCount
        A_train=A_train+max(C_tt(i,:));
    end
    A_train=A_train/classCount;

    Xtrain2=Xtrain;
    for i=1:size(Xtrain)
        if (Xtrain(i) ~= 1)
            Xtrain2(i)=0;
        end
    end

    y = net4(Ytrain');
    axes(handles.axes2);
    plotpv(Ytrain',Xtrain2');
    hold on;
    plotpc(net4.IW{1},net4.b{1});
    grid on;

    c_M=confusionmat(Xtrain,round(y));
    disp('feed forward net - train');
    C_tt = bsxfun(@rdivide,c_M,sum(c_M,2)) * 100;
    set(handles.uitable2, 'data', C_tt);
    A_train2=0;
    for i=1:classCount
        A_train2=A_train2+max(C_tt(i,:));
    end
    A_train2=A_train2/classCount;

    disp('Number of iterations for persiptron net ');
    disp(net4.trainParam.epochs);

    disp('Average training for persiptron net ');
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
view(nett);


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
