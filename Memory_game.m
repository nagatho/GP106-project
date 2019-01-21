function varargout = Memory_game(varargin)
% MEMORY_GAME MATLAB code for Memory_game.fig
%      MEMORY_GAME, by itself, creates a new MEMORY_GAME or raises the existing
%      singleton*.
%
%      H = MEMORY_GAME returns the handle to a new MEMORY_GAME or the handle to
%      the existing singleton*.
%
%      MEMORY_GAME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MEMORY_GAME.M with the given input arguments.
%
%      MEMORY_GAME('Property','Value',...) creates a new MEMORY_GAME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Memory_game_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Memory_game_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Memory_game

% Last Modified by GUIDE v2.5 19-Jan-2019 18:17:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Memory_game_OpeningFcn, ...
                   'gui_OutputFcn',  @Memory_game_OutputFcn, ...
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


% --- Executes just before Memory_game is made visible.
function Memory_game_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Memory_game (see VARARGIN)

% Choose default command line output for Memory_game
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Memory_game wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%setting the port
delete(instrfind({'Port'},{'COM8'}))
global a
a=arduino('com8');

%Test run
for i=2:9
    pinMode(a,i,'OUTPUT');
end

for i=2:9
    digitalWrite(a,i,1);
    buzzer(a,0.05,50)
    pause(0.04);
    digitalWrite(a,i,0);
    
    
end
pinMode(a,10,'Output');
digitalWrite(a,10,1);
pause(0.09)
digitalWrite(a,10,0);
p=8;
while p>=2
    digitalWrite(a,p,1);
    pause(0.05);
    buzzer(a,0.04,50)
    digitalWrite(a,p,0);
    
    p=p-1;
end

% --- Outputs from this function are returned to the command line.
function varargout = Memory_game_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Hard.
function Hard_Callback(hObject, eventdata, handles)
% hObject    handle to Hard (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Hard

set(handles.Start,'String',get(hObject,'String'));


% --- Executes on button press in Medium.
function Medium_Callback(hObject, eventdata, handles)
% hObject    handle to Medium (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Medium


set(handles.Start,'String',get(hObject,'String'));


% --- Executes on button press in Easy.
function Easy_Callback(hObject, eventdata, handles)
% hObject    handle to Easy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Easy

set(handles.Start,'String',get(hObject,'String'));



% --- Executes on button press in Start.
function Start_Callback(hObject, eventdata, handles)
% hObject    handle to Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%19/01/2019
%Memory game

global a;%Variable for arduino
%initals
marks=0;
count=1;
p=1;


%Easy level
if strcmp(get(hObject,'String'),'Easy level')==1%Comparing string value
    while count<11
    y=showPattern(a,0.6,4,5);%pattern Output
    pinMode(a,10,'Output');
    digitalWrite(a,10,1);%For white LED
    c=ldrMatrix(a,4);%pattern input
    digitalWrite(a,10,0);
        if c==y
           marks=marks+1;
           SSD(a,marks);%For seven segment
           
        
      
        else   
            
          while p<3 
          buzzer(a,1,50)    
          y=showPattern(a,0.6,4,5);%pattern Output
          digitalWrite(a,10,1);
          c=ldrMatrix(a,4);%pattern input
          digitalWrite(a,10,0);
             if c==y
                 marks=marks+1;
                 SSD(a,marks);
                 break;
             end
          SSD(a,marks);   
          p=p+1;
          buzzer(a,1,50);%For buzzer
          end
        end
        
        if p==3
            break;
        end
     count=count+1;
     
    end
if marks==9
   buzzer(a,2,50);
end

%Medium level     
elseif strcmp(get(hObject,'String'),'Medium level')==1%Comparing string value
    
    while count<11
    y=showPattern(a,0.6,7,7);%pattern Output
    pinMode(a,10,'Output');
    digitalWrite(a,10,1);
    c=ldrMatrix(a,7);%pattern input
    digitalWrite(a,10,0);
        if c==y
           marks=marks+1;
           SSD(a,marks);
           
        
      
        else   
          buzzer(a,1,50);  
          while p<2  
          y=showPattern(a,0.6,7,7);%pattern Output
          digitalWrite(a,10,1);
          c=ldrMatrix(a,7);%pattern input
          digitalWrite(a,10,0);
             if c==y
                 marks=marks+1;
                 SSD(a,marks);
                 break;
             end
          SSD(a,marks);   
          p=p+1;
          buzzer(a,1,50);
          end
        end
        
        if p==2
            break;
        end
     count=count+1;
     
     end
    
 

%Hard level
elseif strcmp(get(hObject,'String'),'Hard level')==1%Comparing string value
    while count<11
    y=showPattern(a,0.6,8,9);%pattern Output
    pinMode(a,10,'Output');
    digitalWrite(a,10,1);
    c=ldrMatrix(a,8);%pattern input
    digitalWrite(a,10,0);
        if c==y
           marks=marks+1;
           SSD(a,marks);
           
        
      
        else   
          buzzer(a,1,50);  
          while p<1  
          y=showPattern(a,0.6,8,9);%pattern Output
          digitalWrite(a,10,1);
          c=ldrMatrix(a,8);%pattern input
          digitalWrite(a,10,0);
             if c==y
                 marks=marks+1;
                 SSD(a,marks);
                 break;
             end
          SSD(a,marks);   
          p=p+1;
          buzzer(a,1,50);
          end
        end
        
        if p==1
            break;
        end
     count=count+1;
     
     end
    
 
    
end 
   
