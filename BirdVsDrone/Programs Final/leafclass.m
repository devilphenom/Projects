function varargout = leafclass(varargin)
% LEAFCLASS MATLAB code for leafclass.fig
%      LEAFCLASS, by itself, creates a new LEAFCLASS or raises the existing
%      singleton*.
%
%      H = LEAFCLASS returns the handle to a new LEAFCLASS or the handle to
%      the existing singleton*.
%
%      LEAFCLASS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LEAFCLASS.M with the given input arguments.
%
%      LEAFCLASS('Property','Value',...) creates a new LEAFCLASS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before leafclass_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to leafclass_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help leafclass

% Last Modified by GUIDE v2.5 02-May-2023 20:27:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @leafclass_OpeningFcn, ...
                   'gui_OutputFcn',  @leafclass_OutputFcn, ...
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


% --- Executes just before leafclass is made visible.
function leafclass_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to leafclass (see VARARGIN)

% Choose default command line output for leafclass
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes leafclass wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = leafclass_OutputFcn(hObject, eventdata, handles) 
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


[filename, pathname] = uigetfile({'*.jpg';'*.bmp';'*.gif';'*.*'}, 'Pick an Image File');

S1 = imread([pathname,filename]);
S1 =imresize(S1,[256 256]);
axes(handles.axes1);
imshow(S1);

J = rgb2hsv(S1);
axes(handles.axes2);
imshow(J);

img_crop =S1;
NumberOfBlocksForImagePartition=1;
%         [texture entro] = funextrafeature(img_crop);
        FeatureMatrix(1,:) = funExtractGabourFeatures(img_crop, NumberOfBlocksForImagePartition);
        ss=FeatureMatrix(1,:);
        ss1=ss';
        FMatrix = cat(1,ss1);
        [col row]=size(FMatrix);




TestingFeatures12=FMatrix;

% [F3]=extra1();
F4=load('Featutematrix.mat');
F3=F4.FF1;
f = figure;
t = uitable(f,'Data',TestingFeatures12,'Position',[20 20 262 204]);


NumberOfClasses=2;
nosamples=[389 389];
k1 = 1;
for index1 = 1 : NumberOfClasses
    for index2 = 1 :nosamples(1,index1)
        ClassIndex(1,k1) = index1;
        k1 = k1 + 1;
    end
end


for i=1:389
    FF21(i,:)=F3(i,:);
end

for i=390:778
    FF22(i,:)=F3(i,:);
end


 for i=1:501
     FF31(i,:)=mean2(FF21(:,i));
 end

 for i=1:501
     FF32(i,:)=mean2(FF22(:,i));
 end

dist12=pdist2(FF31',TestingFeatures12','cityblock')
% pdist2(F3(1,:)',TestingFeatures12','cityblock')

if dist12<80

TempClassLabels=ind2vec(ClassIndex);
net = newpnn(F3',TempClassLabels,0.868);
TempClassLabel = sim(net,TestingFeatures12);
handles.TempClassLabel = TempClassLabel;
str= {'Bird';'Drone';'Leaf3';'Leaf4';};
[val, num] = max(TempClassLabel);
num1=str(num);
set(handles.edit1, 'string',num1);

else
    
str= {'Other';};
% [val, num] = max(TempClassLabel);
num=1;
num1=str(num);
set(handles.edit1, 'string',num1);
    
%     disp('other');
end







handles.S1 = S1;
guidata(hObject, handles);





% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_crop = handles.S1;
NumberOfBlocksForImagePartition=1;
%         [texture entro] = funextrafeature(img_crop);
        FeatureMatrix(1,:) = funExtractGabourFeatures(img_crop, NumberOfBlocksForImagePartition);
        ss=FeatureMatrix(1,:);
        ss1=ss';
        FMatrix = cat(1,ss1);
        [col row]=size(FMatrix);
handles.FMatrix = FMatrix;
guidata(hObject, handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

TestingFeatures12=handles.FMatrix;

% [F3]=extra1();
F4=load('Featutematrix.mat');
F3=F4.FF1;
f = figure;
t = uitable(f,'Data',TestingFeatures12,'Position',[20 20 262 204]);


NumberOfClasses=2;
nosamples=[389 389];
k1 = 1;
for index1 = 1 : NumberOfClasses
    for index2 = 1 :nosamples(1,index1)
        ClassIndex(1,k1) = index1;
        k1 = k1 + 1;
    end
end


for i=1:389
    FF21(i,:)=F3(i,:);
end

for i=390:778
    FF22(i,:)=F3(i,:);
end


 for i=1:501
     FF31(i,:)=mean2(FF21(:,i));
 end

 for i=1:501
     FF32(i,:)=mean2(FF22(:,i));
 end

dist12=pdist2(FF31',TestingFeatures12','cityblock')
% pdist2(F3(1,:)',TestingFeatures12','cityblock')

if dist12<80

TempClassLabels=ind2vec(ClassIndex);
net = newpnn(F3',TempClassLabels,0.868);
TempClassLabel = sim(net,TestingFeatures12);
handles.TempClassLabel = TempClassLabel;
str= {'Bird';'Drone';'Leaf3';'Leaf4';};
[val, num] = max(TempClassLabel);
num1=str(num);
set(handles.edit1, 'string',num1);

else
    
str= {'Other';};
% [val, num] = max(TempClassLabel);
num=1;
num1=str(num);
set(handles.edit1, 'string',num1);
    
%     disp('other');
end

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
