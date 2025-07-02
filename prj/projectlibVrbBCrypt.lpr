library projectlibVrbBCrypt;

{$mode objfpc}{$H+}

uses
  Classes,
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  BCrypt.Consts, BCrypt.Core, BCrypt.Intf, BCrypt, BCrypt.Types;

  procedure compareHashBCrypt(textoPuro, textoHash: PChar; out Valido: Boolean); stdcall; Export;
  begin
    Valido := TBCrypt.CompareHash(textoPuro, textoHash);
  end;

  procedure encryptBCrypt(texto: PChar; out TextoEncriptado: PChar); stdcall; Export;
  begin
    TextoEncriptado := PChar(TBCrypt.GenerateHash(texto, 10, THashType.BSD));
  end;

exports
  compareHashBCrypt,
  encryptBCrypt;

begin

end.
