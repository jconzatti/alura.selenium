object ModuloWeb: TModuloWeb
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end>
  Height = 333
  Width = 414
  object DSServer: TDSServer
    Left = 64
    Top = 11
  end
  object DSHTTPWebDispatcher: TDSHTTPWebDispatcher
    Server = DSServer
    Filters = <>
    AuthenticationManager = DSAuthenticationManager
    WebDispatch.PathInfo = 'datasnap*'
    Left = 176
    Top = 11
  end
  object DSAuthenticationManager: TDSAuthenticationManager
    OnUserAuthenticate = DSAuthenticationManagerUserAuthenticate
    OnUserAuthorize = DSAuthenticationManagerUserAuthorize
    Roles = <>
    Left = 312
    Top = 11
  end
  object DSServerClassExemplo: TDSServerClass
    OnGetClass = DSServerClassExemploGetClass
    Server = DSServer
    Left = 56
    Top = 83
  end
end
