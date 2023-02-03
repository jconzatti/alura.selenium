unit UJconzatti.Leilao.Datasnap.MetodoServidor.Exemplo;

interface

uses
   System.SysUtils,
   System.Classes,
   System.StrUtils,
   Datasnap.DSServer,
   Datasnap.DSAuth;

type
{$METHODINFO ON}
   TMetodoServidorExemplo = class(TComponent)
   public
      function EchoString(Value: string): string;
      function ReverseString(Value: string): string;
   end;
{$METHODINFO OFF}

implementation


function TMetodoServidorExemplo.EchoString(Value: string): string;
begin
   Result := Value;
end;

function TMetodoServidorExemplo.ReverseString(Value: string): string;
begin
   Result := System.StrUtils.ReverseString(Value);
end;

end.

