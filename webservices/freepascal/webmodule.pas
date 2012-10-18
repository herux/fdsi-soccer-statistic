unit WebModule;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, httpdefs, fpHTTP, fpWeb;

type
  TFDSIWebModule = class(TFPWebModule)
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FDSIWebModule: TFDSIWebModule;

implementation

{$R *.lfm}

initialization
  RegisterHTTPModule('TFDSIWebModule', TFDSIWebModule);
end.

