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

% Last Modified by GUIDE v2.5 03-Apr-2018 12:37:03

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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in saveButton.
function saveButton_Callback(hObject, eventdata, handles)
% hObject    handle to saveButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in loadButton.
function loadButton_Callback(hObject, eventdata, handles)
% hObject    handle to loadButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in buildOptTree.
function buildOptTree_Callback(hObject, eventdata, handles)
% hObject    handle to buildOptTree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in openOptTree.
function openOptTree_Callback(hObject, eventdata, handles)
% hObject    handle to openOptTree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in buildClassTree.
function buildClassTree_Callback(hObject, eventdata, handles)
% hObject    handle to buildClassTree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tree = fitctree(Xtrain, Ytrain);
%----------------------------------------------------------
%ÂÛÂÎÄ ÄÅĞÅÂÀ ÊËÀÑÑÈÔÈÊÀÖÈÉ ÍÀ İÊĞÀÍ
view(tree,'mode','graph');
%----------------------------------------------------------
%ÍÀÕÎÆÄÅÍÈÅ ÎÏÒÈÌÀËÜÍÎÃÎ ÓĞÎÂÍß ÑÎÊĞÀÙÅÍÈß ÄÅĞÅÂÀ ÇÀ Ñ×ÅÒ ÌÈÍÈÌÈÇÀÖÈÈ
%ÏÎÒÅĞÜ
%Ôóíêöèÿ âîçâğàùàåò íàèëó÷øèé óğîâåíü ñîêğàùíèÿ äåğåâà,
%âñå îñòàëüíûå âûõîäíûå ïàğàìåòğû íå èñïîëüçóşòñÿ
[~,~,~, bestlevel] = cvLoss(tree,'SubTrees','All','TreeSize','min')
%-----------------------------------------------------------
%ÑÎÊĞÀÙÅÍÈÅ ÄÅĞÅÂÀ ÄÎ ÎÏÒÈÌÀËÜÍÎÃÎ ÓĞÎÂÍß
%ïîëó÷åíèå ñîêğàùåííîãî äåğåâà
tree1 = prune(tree, 'Level', bestlevel);

% --- Executes on button press in openClassTree.
function openClassTree_Callback(hObject, eventdata, handles)
% hObject    handle to openClassTree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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


% --- Executes on button press in generateButton.
function generateButton_Callback(hObject, eventdata, handles)
% hObject    handle to generateButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global range;
global attribute;
global succeed;
global attrcount;
global classcount;
global stree;
global tree;
global A;
global trainArray;
global trainY;
global testArray;
global testY;

range = str2num(get(handles.edit1,'String'));
attribute = str2num(get(handles.edit2,'String'));
succeed = str2double(get(handles.edit3,'String'));
attrcount = 5;
classcount = 5;

A = getRndNumbers(attribute, succeed, attrcount, classcount, range);

for j=1:classcount
    for i=((j-1)*attribute+1):attribute*j
        Y(((j-1)*attribute+1):attribute*j,1)=j;%
    end
end

A = normc(A)*10;

C = cvpartition(500,'holdout',0.4);
testArray = A(test(C),:);
trainArray = A(training(C),:);
testY= Y(test(C),:);
trainY = Y(training(C),:);

stree = fitctree(trainArray,trainY);
[~,~,~,bestlevel] = cvLoss(stree, 'SubTrees','All','TreeSize','min');
tree = prune(stree,'Level', bestlevel);
set(handles.uitable5, 'data', A);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tree;
global trainArray;
global trainY;
global testArray;
global testY;
global A;
save tree.mat tree;
save trainArray.mat trainArray;
save trainY.mat trainY;
save testArray.mat testArray;
save testY.mat testY;
save A.mat A;

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tree;
global trainArray;
global trainY;
global testArray;
global testY;
global A;
load tree.mat tree;
load trainArray.mat trainArray;
load trainY.mat trainY;
load testArray.mat testArray;
load testY.mat testY;
load A.mat A;
set(handles.uitable5, 'data', A);

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%ÂÛÂÎÄ ÄÅĞÅÂÀ ÊËÀÑÑÈÔÈÊÀÖÈÉ ÍÀ İÊĞÀÍ
global stree;
global trainArray;
global trainY;
stree = fitctree(trainArray,trainY);
view(stree,'mode','graph');

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%ÂÛÂÎÄ ÄÅĞÅÂÀ ÎÏÒÈÌÀËÜÍÎÃÎ ÓĞÎÂÍß ÍÀ İÊĞÀÍ
global tree;
view(tree,'mode','graph');

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tree;
global R;
R=double([]);
for i=1:size(tree.CutPoint)
    if (~ isnan(tree.CutPoint(i)))
        R=[R;tree.CutPoint(i)];
    end
end
R=sort(R,'ascend');

%set(handles.uitable5, 'data', R);

fis = newfis('fis','sugeno');

fis = addvar(fis, 'input', 'x2', [0 1]);
fis = addvar(fis, 'input', 'x4', [0 1]);
fis = addvar(fis, 'input', 'x5', [0 1]);
fis = addvar(fis, 'output', 'y1', [1 5]);

fis = addmf(fis,'input',1,'L1','trimf',[0, R(1)/2, R(1)]);
fis = addmf(fis,'input',1,'H1','trimf',[R(1), (R(1)+R(4))/2, R(4)]);

fis = addmf(fis,'input',2,'L','trimf',[0, R(2)/2, R(2)]);
fis = addmf(fis,'input',2,'H','trimf',[R(2), (R(2)+1)/2, 1]);

fis = addmf(fis,'input',3,'L','trimf',[0, R(3)/2, R(3)]);
fis = addmf(fis,'input',3,'H','trimf',[R(3), (R(3)+1)/2, 1]);

%fis = addmf(fis,'input',1,'L2','trimf',[R(1), (R(1)+R(4))/2, R(4)]);
fis = addmf(fis,'input',1,'H2','trimf',[R(4), (R(4)+1)/2, 1]);

fis = addmf(fis,'output',1,'one','constant',1);
fis = addmf(fis,'output',1,'two','constant',2);
fis = addmf(fis,'output',1,'three','constant',3);
fis = addmf(fis,'output',1,'four','constant',4);
fis = addmf(fis,'output',1,'five','constant',5);

r1='if x4 is L and x2 is L1 then y1 is five'; 
r2='if x4 is L and x2 is H1 then y1 is three';
r3='if x4 is H and x2 is H2 then y1 is two'; 
r4='if x4 is H and x2 is H1 and x5 is L then y1 is one'; 
r5='if x4 is H and x2 is H1 and x5 is H then y1 is four';
inrulelist=char(r1, r2, r3, r4, r5);
fis = parsrule(fis,inrulelist);
axes(handles.axes7);
plotfis(fis);
writefis(fis, 'fis');

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tree;
global trainArray;
global trainY;

Y = predict(tree, trainArray)
C = confusionmat(trainY,Y)
C = bsxfun(@rdivide,C,sum(C,2))*100;
set(handles.uitable1, 'data', C);

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tree;
global testArray;
global testY;

Y = predict(tree, testArray);
C = confusionmat(testY,Y);
C = bsxfun(@rdivide,C,sum(C,2))*100;
set(handles.uitable3, 'data', C);

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global trainArray;
global trainY;

fis = readfis('fis');
Y = round(evalfis(trainArray(:,[2 4 5]), fis));
C = confusionmat(trainY,Y);
C = bsxfun(@rdivide,C,sum(C,2))*100;
set(handles.uitable2, 'data', C);

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global testArray;
global testY;

fis = readfis('fis');
Y = round(evalfis(testArray(:,[2 4 5]), fis));
C = confusionmat(testY,Y);
C = bsxfun(@rdivide,C,sum(C,2))*100;
set(handles.uitable4, 'data', C);

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fis=readfis('fis');
global R;
r1 = get(handles.x21,'Value');
r2 = get(handles.x22,'Value');
r3 = get(handles.x23,'Value');
r4 = get(handles.x41,'Value');
r5 = get(handles.x42,'Value');
r6 = get(handles.x51,'Value');
r7 = get(handles.x52,'Value');

x2 = 0;
x4 = 0;
x5 = 0;

if (r1 == 1)
    x2 = R(1)/2;
end
if (r2 == 1)
    x2 = (R(1)+R(4))/2;
end
if (r3 == 1)
    x2 = (R(4)+1)/2;
end
if (r4 == 1)
    x4 = R(2)/2;
end
if (r5 == 1)
    x4 = (R(2)+1)/2;
end
if (r6 == 1)
    x5 = R(3)/2;
end
if (r7 == 1)
    x5 = (R(3)+1)/2;
end
Y = evalfis([x2 x4 x5], fis);
string = ['Êëàññ: ', num2str(Y,1)];
set(handles.text11,'String',string);

% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tree;
global R;
r1 = get(handles.x21,'Value');
r2 = get(handles.x22,'Value');
r3 = get(handles.x23,'Value');
r4 = get(handles.x41,'Value');
r5 = get(handles.x42,'Value');
r6 = get(handles.x51,'Value');
r7 = get(handles.x52,'Value');

x2 = 0;
x4 = 0;
x5 = 0;

if (r1 == 1)
    x2 = R(1)/2;
end
if (r2 == 1)
    x2 = (R(1)+R(4))/2;
end
if (r3 == 1)
    x2 = (R(4)+1)/2;
end
if (r4 == 1)
    x4 = R(2)/2;
end
if (r5 == 1)
    x4 = (R(2)+1)/2;
end
if (r6 == 1)
    x5 = R(3)/2;
end
if (r7 == 1)
    x5 = (R(3)+1)/2;
end
Y = predict(tree, [0 x2 0 x4 x5]);
string = ['Êëàññ: ', num2str(Y,1)];
set(handles.text11,'String',string);


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
