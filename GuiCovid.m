function varargout = GuiCovid(varargin)
% GUICOVID MATLAB code for GuiCovid.fig
%      GUICOVID, by itself, creates a new GUICOVID or raises the existing
%      singleton*.
%
%      H = GUICOVID returns the handle to a new GUICOVID or the handle to
%      the existing singleton*.
%
%      GUICOVID('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUICOVID.M with the given input arguments.
%
%      GUICOVID('Property','Value',...) creates a new GUICOVID or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GuiCovid_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GuiCovid_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GuiCovid

% Last Modified by GUIDE v2.5 14-Oct-2021 02:58:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GuiCovid_OpeningFcn, ...
                   'gui_OutputFcn',  @GuiCovid_OutputFcn, ...
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


% --- Executes just before GuiCovid is made visible.
function GuiCovid_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GuiCovid (see VARARGIN)

% Choose default command line output for GuiCovid
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GuiCovid wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GuiCovid_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
check = get(handles.checkbox1,'Value');
if check == 1
    grid on;
else
    grid off;
end

% --- Executes on button press in pushbtnData.
function pushbtnData_Callback(hObject, eventdata, handles)
[num,txt,raw] = xlsread('Covid19Baru.xlsx');
set(handles.TabelData,'Data',raw);
% hObject    handle to pushbtnData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbtnGrafik.
function pushbtnGrafik_Callback(hObject, eventdata, handles)
[num,txt,raw] = xlsread('Covid19Baru.xlsx');
global x;
global y;
x = 1:12;
y = num;

handles.Grafik;
plot(x,y);
xlabel('Jumlah');
ylabel('Bulan');
 
% --- Executes on selection change in MenuBg.
function MenuBg_Callback(hObject, eventdata, handles)
background = get(handles.MenuBg,'Value');
if background == 1
    set(gca,'Color','r');
elseif background == 2
    set(gca,'Color','b');
elseif background == 3
    set(gca,'Color','g');
elseif background == 4
    set(gca,'Color','y');
elseif background == 5
    set(gca,'Color','m');
elseif background == 6
    set(gca,'Color','c');
elseif background == 7
    set(gca,'Color','k');
elseif background == 8
    set(gca,'Color','w');
end       


% --- Executes when selected object is changed in uibuttongroup2.
function uibuttongroup2_SelectionChangedFcn(hObject, eventdata, handles)
global x;
global y;

color = get(handles.uibuttongroup2,'SelectedObject');
switch get(color,'String');
    case 'Merah'
        plot(x,y,'-r*');
    case 'Biru'
        plot(x,y,'-b*');
    case 'Hijau'
        plot(x,y,'-g*');
end
% hObject    handle to the selected object in uibuttongroup2 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in TabelData.
function TabelData_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to TabelData (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
