function varargout = guide1(varargin)
% GUIDE1 MATLAB code for guide1.fig
%      GUIDE1, by itself, creates a new GUIDE1 or raises the existing
%      singleton*.
%
%      H = GUIDE1 returns the handle to a new GUIDE1 or the handle to
%      the existing singleton*.
%
%      GUIDE1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDE1.M with the given input arguments.
%
%      GUIDE1('Property','Value',...) creates a new GUIDE1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guide1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guide1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guide1

% Last Modified by GUIDE v2.5 30-Aug-2022 14:17:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guide1_OpeningFcn, ...
                   'gui_OutputFcn',  @guide1_OutputFcn, ...
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


% --- Executes just before guide1 is made visible.
function guide1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guide1 (see VARARGIN)

% Choose default command line output for guide1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guide1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guide1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in cargar.
function cargar_Callback(hObject, eventdata, handles)
% hObject    handle to cargar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%msgbox('No soportas panzona')
% x=0:0.1:2*pi;
% y=sin(x);
% plot(y)
[ARCH,DIR]=uigetfile({'*.*'},'Abrir imagen');
archivoI=fullfile(DIR,ARCH);%usa el SO del momento
imagen=imread(archivoI);
imshow(imagen)



function dato1_Callback(hObject, eventdata, handles)
% hObject    handle to dato1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dato1 as text
%        str2double(get(hObject,'String')) returns contents of dato1 as a double
%texto=get(hObject,'String');
% texto=get(handles.dato1,'String');
% msgbox(['No puedo ',texto]);
% x=0:0.1:2*pi;
% y=sin(x);
% plot(y)

valor=get(handles.dato1,'String');%periodo entre muestras
Ts= str2double(valor);
T=3;%duración de la señal
n=T/Ts;%muestras totales
fs=1/Ts;%freq muestreo
t=1/fs:1/fs:T;%vector de tiempo
s2=sin(2*pi*t);%creacion de nueva onda seno
plot(t,s2)%resultado

% --- Executes during object creation, after setting all properties.
function dato1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dato1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
