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
global object2;
object = PraseImage;
object.bw;
object.readIm([p,f]);
object2=object;
imshow(object.currentIm,'Parent',handles.axes1);
imshow(object.currentIm,'Parent',handles.axes2);


%metoda obs³uguj¹ca klawisz "makeLighter"
function makeLighterButton_Callback(hObject, eventdata, handles)

global object;
sliderVal = get(handles.makeLighterSlider, 'Value');
object.makeLighter(sliderVal);
imshow(object.currentIm,'Parent',handles.axes1);


%metoda obs³uguj¹ca klawisz "changeContrast"ngeC
function changeContrastButton_Callback(hObject, eventdata, handles)

global object;
sliderVal = get(handles.ChangeContrastSlider, 'Value');
object.changeContrast(sliderVal);
imshow(object.currentIm,'Parent',handles.axes1);


%metoda obs³uguj¹ca klawisz "changeCorelation"
function changeCorelationButton_Callback(hObject, eventdata, handles)

global object;
sliderVal = get(handles.changeCorelationSlider, 'Value');
object.changeCorelation(sliderVal);
imshow(object.currentIm,'Parent',handles.axes1);


%metoda obs³uguj¹ca klawisz "binOtsu"
function binOtsuButton_Callback(hObject, eventdata, handles)
 
global object;
object.binOtsu();
imshow(object.currentIm,'Parent',handles.axes1);


%metoda obs³uguj¹ca klawisz "gradient"
function gradientButton_Callback(hObject, eventdata, handles)

global object;
sliderVal1 = get(handles.changeGradientSlider1, 'Value');
sliderVal2 = get(handles.changeGradientSlider2, 'Value');
object.gradient(sliderVal1, sliderVal2);
imshow(object.currentIm,'Parent',handles.axes1);


%metoda obs³uguj¹ca klawisz "changeToBw"
function changeToBwButton_Callback(hObject, eventdata, handles)
 
global object;
object.changeToBw();
imshow(object.currentIm,'Parent',handles.axes1);

% metoda obs³uguj¹ca klawisz removeHighFreButton
function removeHighFreButton_Callback(hObject, eventdata, handles)
    global object;
    object.removeHighFre();
    imshow(object.currentIm,'Parent',handles.axes1);
    
% metoda obs³uguj¹ca klawisz removeLowFreButton
function removeLowFreButton_Callback(hObject, eventdata, handles)
    global object;
    object.removeLowFre();
    imshow(object.currentIm,'Parent',handles.axes1);

% metoda obs³uguj¹ca klawisz motionBlur
function motionBlurButton_Callback(hObject, eventdata, handles)
    global object;
    object.motionBlur();
    imshow(object.currentIm,'Parent',handles.axes1);
    
% metoda obs³uguj¹ca klawisz modfiltr
function medfiltrButton_Callback(hObject, eventdata, handles)
    global object;
    object.medfiltr();
    imshow(object.currentIm,'Parent',handles.axes1);
    
% metoda obs³uguj¹ca klawisz erose
function eroseButton_Callback(hObject, eventdata, handles)
    global object;
    sliderVal = get(handles.EroseSlider, 'Value');
    sliderVal = int8(sliderVal);
    object.erose(sliderVal);
    imshow(object.currentIm,'Parent',handles.axes1);
    
% metoda obs³uguj¹ca klawisz dilate
function dilateButton_Callback(hObject, eventdata, handles)
global object;
    sliderVal = get(handles.DilateSlider, 'Value');
    sliderVal = int8(sliderVal);
    object.dilate(sliderVal);
    imshow(object.currentIm,'Parent',handles.axes1);

% metoda obs³uguj¹ca klawisz showEdges
function showEdgesButton_Callback(hObject, eventdata, handles)
    global object;
    object.showEdges();
    imshow(object.currentIm,'Parent',handles.axes1);
 
% metoda obs³uguj¹ca przywracanie obrazu do stanu pocz¹tkowego
function przywroc_Callback(hObject, eventdata, handles)
global object;
object.setOriginal();
imshow(object.currentIm,'Parent',handles.axes1);

% metoda obs³uguj¹ca slider ChangeContrast
function ChangeContrastSlider_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function ChangeContrastSlider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% metoda obs³uguj¹ca slider makeLighter
function makeLighterSlider_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function makeLighterSlider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% % metoda obs³uguj¹ca slider changeCorelation
function changeCorelationSlider_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function changeCorelationSlider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



















% --- Executes on slider movement.
function changeGradientSlider1_Callback(hObject, eventdata, handles)
% hObject    handle to changeGradientSlider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function changeGradientSlider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to changeGradientSlider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function changeGradientSlider2_Callback(hObject, eventdata, handles)
% hObject    handle to changeGradientSlider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function changeGradientSlider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to changeGradientSlider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function EroseSlider_Callback(hObject, eventdata, handles)
% hObject    handle to EroseSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function EroseSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EroseSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function DilateSlider_Callback(hObject, eventdata, handles)
% hObject    handle to DilateSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function DilateSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DilateSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
