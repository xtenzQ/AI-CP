function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 12-Apr-2018 22:19:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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

range = str2num(get(handles.edit1,'String'));
attribute = str2num(get(handles.edit2,'String'));
succeed = str2double(get(handles.edit3,'String'));
classCount = str2num(get(handles.edit6,'String'));
attrcount = str2num(get(handles.edit5,'String'));

A = double([]);
for i=1:classCount
	R1=binornd(attribute, succeed, attribute, attrcount)+range*i;
	A = [A;R1];  
end

A = normc(A) * 10;

for j=1:classCount
    for i=((j-1)*attribute+1):attribute*j
        X(((j-1)*attribute+1):attribute*j,1)=j;%
    end
end

%set(handles.uitable3, 'data', A);

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
global trainArray;
global trainY;
global testArray;
global testY;

save trainArray trainArray;
save trainY trainY;
save testArray testArray;
save testY testY;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global trainArray;
global trainY;
global testArray;
global testY;

load trainArray trainArray;
load trainY trainY;
load testArray testArray;
load testY testY;

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global testArray;
global trainArray;
global testY;
global trainY;
global classCount;
global net3;
global net4;
if (get(handles.radiobutton1,'Value') == 1)
    Y = net3(trainArray');
    ind = vec2ind(Y);
    axes(handles.axes1);
    scatter3(trainArray(:,1),trainArray(:,2),trainArray(:,3),5,ind,'filled');
    grid on;

    C = confusionmat(trainY,ind');
    C = bsxfun(@rdivide,C,sum(C,2)) * 100;
    average=0;
    for i=1:classCount
        average=average+max(C(i,:));
    end
    average=average/classCount;
    set(handles.uitable1, 'data', C);
    %set(handles.text4,'String',['Среднее качество обучения: ', num2str(average)]);

    Y = net3(testArray');
    ind = vec2ind(Y);
    axes(handles.axes2);
    scatter3(testArray(:,1),testArray(:,2),testArray(:,3),5,ind,'filled');
    grid on;

    C = confusionmat(testY,ind');
    C = bsxfun(@rdivide,C,sum(C,2)) * 100;
    average=0;
    for i=1:classCount
        average=average+max(C(i,:));
    end
    average=average/classCount;
    set(handles.uitable2, 'data', C);
    %set(handles.text5,'String',['Среднее качество обучения: ', num2str(average)]);
end

if (get(handles.radiobutton2,'Value') == 1)
    Y = round(net4(trainArray'));
    axes(handles.axes1);
    scatter3(trainArray(:,1),trainArray(:,2),trainArray(:,3),5,Y,'filled');
    grid on;

    C = confusionmat(trainY,Y');
    C = bsxfun(@rdivide,C,sum(C,2)) * 100;
    average=0;
    for i=1:classCount
        average=average+max(C(i,:));
    end
    average=average/classCount;
    set(handles.uitable1, 'data', C);
    %set(handles.text4,'String',['Среднее качество обучения: ', num2str(average)]);

    Y = round(net4(testArray'));
    axes(handles.axes2);
    scatter3(testArray(:,1),testArray(:,2),testArray(:,3),5,Y,'filled');
    grid on;

    C = confusionmat(testY,Y');
    C = bsxfun(@rdivide,C,sum(C,2)) * 100;
    average=0;
    for i=1:classCount
        average=average+max(C(i,:));
    end
    average=average/classCount;
    set(handles.uitable2, 'data', C);
    %set(handles.text5,'String',['Среднее качество обучения: ', num2str(average)]);
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global net3;
global net4;
if (get(handles.radiobutton1,'Value') == 1)
    view(net3);
end
if (get(handles.radiobutton2,'Value') == 1)
    view(net4);
end

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2



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


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global net3;
global net4;
global trainArray;
global trainY;

if (get(handles.radiobutton1,'Value') == 1)
    net3 = patternnet(10);
    if (get(handles.checkbox1,'Value') == 1)
        par='yes';
    else
        par='no';
    end
    if (get(handles.checkbox2,'Value') == 1)
        gp='yes';
    else
        gp='no';
    end
    t = full(ind2vec(trainY'));
    % useGPU - yes (выполняются на GPU), no (выполняются на CPU)
    % useParallel - yes (происходят в обычной сессии), no (на параллельных процессах)	
    [net3 tr] = train(net3, trainArray', t, 'useParallel', par, 'useGPU',gp); 
    set(handles.text14,'String',num2str(max(tr.time)));
    % Получение  времени
    max(tr.time)
    save net3 net3
end

if (get(handles.radiobutton2,'Value') == 1)
    net4= feedforwardnet(10);
    if (get(handles.checkbox1,'Value') == 1)
        par='yes';
    else
        par='no';
    end
    if (get(handles.checkbox2,'Value') == 1)
        gp='yes';
    else
        gp='no';
    end
    [net4 tr]=train(net4,trainArray',trainY','useParallel',par,'useGPU',gp);
    set(handles.text14,'String',num2str(max(tr.time)));
    max(tr.time)
    save net4 net4
end
