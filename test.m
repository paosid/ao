function varargout = test(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test_OpeningFcn, ...
                   'gui_OutputFcn',  @test_OutputFcn, ...
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
%end DO NOT EDIT

function test_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
guidata(hObject, handles);


function varargout = test_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


%metoda obs³uguj¹ca klawisz "Wczytaj obraz"
function wczytajButton_Callback(hObject, eventdata, handles)

[f,p] = uigetfile({'*.png;*.jpg;*.bmp;*.tif','Supported images';...
                 '*.png','Portable Network Graphics (*.png)';...
                 '*.jpg','J-PEG (*.jpg)';...
                 '*.bmp','Bitmap (*.bmp)';...
                 '*.tif','Tagged Image File (*.tif,)';...
                 '*.*','All files (*.*)'});
global object;
global object2
object = PraseImage;
object.bw;
object.readIm([p,f]);
object2 = object;
imshow(object.currentIm,'Parent',handles.axes1);
imshow(object2.currentIm,'Parent',handles.axes2);


%metoda obs³uguj¹ca klawisz "makeLighter"
function makeLighterButton_Callback(hObject, eventdata, handles)

global object;
object.makeLighter(0);
imshow(object.currentIm,'Parent',handles.axes1);


% --- Executes on button press in changeContrastButton.
function changeContrastButton_Callback(hObject, eventdata, handles)
%metoda obs³uguj¹ca klawisz "changeContrast"
global object;
object.changeContrast(3);
imshow(object.currentIm,'Parent',handles.axes1);


%metoda obs³uguj¹ca klawisz "changeCorelation"
function changeCorelationButton_Callback(hObject, eventdata, handles)

global object;
object.changeCorelation(2.1);
imshow(object.currentIm,'Parent',handles.axes1);


%metoda obs³uguj¹ca klawisz "binOtsu"
function binOtsuButton_Callback(hObject, eventdata, handles)
 
global object;
object.binOtsu();
imshow(object.currentIm,'Parent',handles.axes1);


%metoda obs³uguj¹ca klawisz "gradient"
function gradientButton_Callback(hObject, eventdata, handles)

global object;
object.gradient(0.1, 1.4,'o');
imshow(object.currentIm,'Parent',handles.axes1);


%metoda obs³uguj¹ca klawisz "changeToBw"
function changeToBwButton_Callback(hObject, eventdata, handles)
 
global object;
object.changeToBw();
imshow(object.currentIm,'Parent',handles.axes1);


% --- Executes on slider movement.
function ChangeContrastSlider_Callback(hObject, eventdata, handles)
% hObject    handle to ChangeContrastSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function ChangeContrastSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ChangeContrastSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% metoda obs³uguj¹ca przywracanie obrazu do stanu pocz¹tkowego
function przywroc_Callback(hObject, eventdata, handles)
global object;
global object2;
object = object2;
imshow(object2.currentIm,'Parent',handles.axes1);
