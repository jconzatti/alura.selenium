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
    procedure DSServerClassExemploGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSAuthenticationManagerUserAuthorize(Sender: TObject;
      EventObject: TDSAuthorizeEventObject; var valid: Boolean);
    procedure DSAuthenticationManagerUserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
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
                       '<head><title>Leilões</title></head>' +
                       '<body>Projeto para manutenção de leilões</body>' +
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

initialization
finalization
   Web.WebReq.FreeWebModules;

end.

