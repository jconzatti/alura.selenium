unit UJconzatti.Leilao.Datasnap.ModuloWeb;

interface

uses
  System.SysUtils,
  System.Classes,
  Web.HTTPApp,
  Web.WebReq,
  Web.WebFileDispatcher,
  Web.HTTPProd,
  Datasnap.DSHTTPCommon,
  Datasnap.DSHTTPWebBroker,
  Datasnap.DSServer,
  DataSnap.DSAuth,
  Datasnap.DSProxyJavaScript,
  Datasnap.DSMetadata,
  Datasnap.DSServerMetadata,
  Datasnap.DSClientMetadata,
  Datasnap.DSCommonServer,
  Datasnap.DSHTTP,
  IPPeerServer,
  UJconzatti.Leilao.Datasnap.MetodoServidor.Exemplo;

type
  TModuloWeb = class(TWebModule)
    DSHTTPWebDispatcher: TDSHTTPWebDispatcher;
    DSServer: TDSServer;
    DSAuthenticationManager: TDSAuthenticationManager;
    DSServerClassExemplo: TDSServerClass;
    WebFileDispatcher: TWebFileDispatcher;
    DSProxyGenerator: TDSProxyGenerator;
    DSServerMetaDataProvider: TDSServerMetaDataProvider;
    procedure DSServerClassExemploGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSAuthenticationManagerUserAuthorize(Sender: TObject;
      EventObject: TDSAuthorizeEventObject; var valid: Boolean);
    procedure DSAuthenticationManagerUserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebFileDispatcherBeforeDispatch(Sender: TObject;
      const AFileName: string; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var ModuloWebClass: TComponentClass = TModuloWeb;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TModuloWeb.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
   Response.Content := '<html>' +
                       '<head><title>DataSnap Server</title></head>' +
                       '<body>DataSnap Server</body>' +
                       '</html>';
end;

procedure TModuloWeb.DSServerClassExemploGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
   PersistentClass := TMetodoServidorExemplo;
end;

procedure TModuloWeb.DSAuthenticationManagerUserAuthenticate(
  Sender: TObject; const Protocol, Context, User, Password: string;
  var valid: Boolean; UserRoles: TStrings);
begin
   valid := True;
end;

procedure TModuloWeb.DSAuthenticationManagerUserAuthorize(
  Sender: TObject; EventObject: TDSAuthorizeEventObject; 
  var valid: Boolean);
begin
   valid := True;
end;

procedure TModuloWeb.WebFileDispatcherBeforeDispatch(Sender: TObject;
  const AFileName: string; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var D1, D2: TDateTime;
begin
   Handled := False;
   if SameFileName(ExtractFileName(AFileName), 'serverfunctions.js') then
   begin
      if not FileExists(AFileName) or (FileAge(AFileName, D1) and FileAge(WebApplicationFileName, D2) and (D1 < D2)) then
      begin
         DSProxyGenerator.TargetDirectory := ExtractFilePath(AFileName);
         DSProxyGenerator.TargetUnitName := ExtractFileName(AFileName);
         DSProxyGenerator.Write;
      end;
   end;
end;

initialization
finalization
   Web.WebReq.FreeWebModules;

end.

