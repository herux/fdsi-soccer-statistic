unit actions;

{$mode objfpc}{$H+}

interface

uses
  BrookRESTActions, BrookUtils;

type
  TClubs = class(TBrookRetrieveAction)
  end;

implementation

initialization
  TClubs.Register('clubs', '/clubs', rmGet);

end.
