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
    Left = 72
    Top = 75
  end
  object DSAuthenticationManager: TDSAuthenticationManager
    OnUserAuthenticate = DSAuthenticationManagerUserAuthenticate
    OnUserAuthorize = DSAuthenticationManagerUserAuthorize
    Roles = <>
    Left = 288
    Top = 19
  end
  object DSServerClassExemplo: TDSServerClass
    OnGetClass = DSServerClassExemploGetClass
    Server = DSServer
    Left = 152
    Top = 11
  end
  object WebFileDispatcher: TWebFileDispatcher
    WebFileExtensions = <
      item
        MimeType = 'text/css'
        Extensions = 'css'
      end
      item
        MimeType = 'text/javascript'
        Extensions = 'js'
      end
      item
        MimeType = 'image/x-png'
        Extensions = 'png'
      end
      item
        MimeType = 'text/html'
        Extensions = 'htm;html'
      end
      item
        MimeType = 'image/jpeg'
        Extensions = 'jpg;jpeg;jpe'
      end
      item
        MimeType = 'image/gif'
        Extensions = 'gif'
      end>
    BeforeDispatch = WebFileDispatcherBeforeDispatch
    WebDirectories = <
      item
        DirectoryAction = dirInclude
        DirectoryMask = '*'
      end
      item
        DirectoryAction = dirExclude
        DirectoryMask = '\templates\*'
      end>
    RootDirectory = '.'
    VirtualPath = '/'
    Left = 72
    Top = 120
  end
  object DSProxyGenerator: TDSProxyGenerator
    ExcludeClasses = 'DSMetadata'
    MetaDataProvider = DSServerMetaDataProvider
    Writer = 'Java Script REST'
    Left = 72
    Top = 176
  end
  object DSServerMetaDataProvider: TDSServerMetaDataProvider
    Server = DSServer
    Left = 64
    Top = 232
  end
end
