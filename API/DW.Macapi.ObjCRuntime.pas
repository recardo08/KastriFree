unit DW.Macapi.ObjCRuntime;

{*******************************************************}
{                                                       }
{                    Kastri Free                        }
{                                                       }
{          DelphiWorlds Cross-Platform Library          }
{                                                       }
{*******************************************************}

{$I DW.GlobalDefines.inc}

interface

uses
  // Mac
  Macapi.ObjCRuntime;

function imp_implementationWithBlock(block: pointer): pointer; cdecl; external libobjc name  _PU + 'imp_implementationWithBlock';
function imp_removeBlock(anImp: pointer): Integer; cdecl; external libobjc name _PU + 'imp_removeBlock';

// Convenience method for adding methods to objective-c delegates
function AddClassMethod(const AClassName, AMethodName: MarshaledAString; const AAddress: Pointer; const ATypesFormat: MarshaledAString): Boolean;

implementation

function AddClassMethod(const AClassName, AMethodName: MarshaledAString; const AAddress: Pointer; const ATypesFormat: MarshaledAString): Boolean;
begin
  Result := class_addMethod(objc_getClass(AClassName), sel_getUid(AMethodName), AAddress, ATypesFormat) <> 0;
end;

end.
