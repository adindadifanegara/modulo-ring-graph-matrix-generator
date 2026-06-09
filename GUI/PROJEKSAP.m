function varargout = PROJEKSAP(varargin)
% PROJEKSAP MATLAB code for PROJEKSAP.fig
%      PROJEKSAP, by itself, creates a new PROJEKSAP or raises the existing
%      singleton*.
%
%      H = PROJEKSAP returns the handle to a new PROJEKSAP or the handle to
%      the existing singleton*.
%
%      PROJEKSAP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJEKSAP.M with the given input arguments.
%
%      PROJEKSAP('Property','Value',...) creates a new PROJEKSAP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PROJEKSAP_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PROJEKSAP_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PROJEKSAP

% Last Modified by GUIDE v2.5 05-Dec-2024 07:52:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PROJEKSAP_OpeningFcn, ...
                   'gui_OutputFcn',  @PROJEKSAP_OutputFcn, ...
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


% --- Executes just before PROJEKSAP is made visible.
function PROJEKSAP_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PROJEKSAP (see VARARGIN)

% Choose default command line output for PROJEKSAP
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PROJEKSAP wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PROJEKSAP_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% Ambil input jumlah titik dari popupmenu1
contents = cellstr(get(handles.popupmenu1, 'String'));
n = str2double(contents{get(handles.popupmenu1, 'Value')});

% Validasi input
if isempty(n) || mod(n, 1) ~= 0 || n < 6 || mod(n, 2) ~= 0
    errordlg('Masukkan bilangan bulat genap minimal 6!', 'Error');
    return;
end

% Cek pilihan radiobutton
if get(handles.radiobutton1, 'Value') == 1
    % Matriks Adjacency
U = zeros(n);
for i = 1:n
        for j = 1:n
            if abs(i - j) > 1 
                if mod(i + j, 2) == 0
                    U(i, j) = 1;
                end
            end
        end
end
    % Tampilkan matriks adjacency di tabel
    set(handles.uitable1, 'Data', U);
    msgbox('Matriks adjacency telah dihitung', 'Informasi');

elseif get(handles.radiobutton2, 'Value') == 1
    % Matriks Insiden
    m = n / 2;
if n>=6 && mod(n,2)==0
   A = eye(m);
   for i=1:m-2
       A(i+2,i)=1;
   end

   B = zeros(m);
   B(1, m-1) = 1;
   B(2, m) = 1;

   C = eye(m);

   D = eye(m);
   for i = 5:m
        D(i, i - 4) = 1;
   end
    
   if n==6
       matriks_insiden = [A B;B A]
    
   elseif n==8
       matriks_insiden = [A B C;B A C]
    
   elseif n==10
          E = zeros(m);  
          for i = 1: min(4,m) 
              for i = 1:min(4,m) 
                  E(i, m-4+i) = 1; 
              end
          end 
       matriks_insiden = [A B D E;B A E D]
    
   elseif n==12
          E = zeros(m);  
          for i = 1: min(4,m) 
              for i = 1:min(4,m) 
                  E(i, m-4+i) = 1; 
              end
          end 
       matriks_insiden = [A B D E C;B A E D C]
   end
    else
        errordlg('Masukkan bilangan bulat genap 6, 8, 10, atau 12!', 'Error');
        return;
    end

    % Tampilkan matriks insiden di tabel
    set(handles.uitable1, 'Data', matriks_insiden);
    msgbox('Matriks insiden telah dihitung', 'Informasi');
else
    % Jika tidak ada radiobutton yang dipilih
    errordlg('Pilih salah satu: adjacency atau insiden!', 'Error');
end
    
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
set(handles.edit2, 'String', '');
set(handles.uitable1, 'data', '');
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
set(handles.radiobutton2,'Value',0);
handles.pilih = 1;
guidata(hObject,handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
set(handles.radiobutton1,'Value',0);
handles.pilih = 2;
guidata(hObject,handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end