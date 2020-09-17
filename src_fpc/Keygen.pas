
Program Keygen;

// {$APPTYPE CONSOLE}

Uses 
flcHash,
SysUtils;

//------------------------------------------------------------------------------

Function GetRandomAlNumStr(Len: Integer): String;

Const 
  Charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';

Var 
  I: Integer;
Begin
  SetLength(Result, Len);

  For I := 1 To Len Do
    Result[I] := Charset[Random(Length(Charset)) + 1];
End;

//------------------------------------------------------------------------------

Function GenerateCodes(Const ComputerID: String;
                       Var RegistrationCode, ActivationCode: String): Boolean;

Var 
  Hash1, Hash2: String;
  I: Integer;
Begin
  If Length(ComputerID) = 40 Then
    Begin
      RegistrationCode := GetRandomAlNumStr(18);
      Hash1 := SHA1DigestToHexA(CalcSHA1(SHA1DigestToHexA(CalcSHA1(RegistrationCode))));
      Hash2 := SHA1DigestToHexA(CalcSHA1(SHA1DigestToHexA(CalcSHA1(Copy(ComputerID, 1, 36)))));
      ActivationCode := '';
      For I := 1 To Length(Hash1) Do
        Begin
          ActivationCode := ActivationCode + Hash1[I] + Hash2[I];
        End;
      ActivationCode := UpperCase(SHA1DigestToHexA(CalcSHA1(ActivationCode))) + GetRandomAlNumStr(10
                        );
      Result := True;
    End
  Else
    Result := False;
End;

//------------------------------------------------------------------------------

Var 
  ComputerID, RegistrationCode, ActivationCode: String;
  Flag: Boolean;

Begin
  Randomize;

  WriteLn('Master PDF Editor 5.x Keygen [by RadiXX11]');
  WriteLn('==========================================');
  WriteLn;

  Repeat
    Write('Computer ID......: ');
    ReadLn(ComputerID);

    If Trim(ComputerID) <> '' Then
      Begin
        Flag := GenerateCodes(ComputerID, RegistrationCode, ActivationCode);

        If Flag Then
          Begin
            WriteLn('Registration Code: ', RegistrationCode);
            WriteLn('Activation Code..: ', ActivationCode);
          End
        Else
          WriteLn('Enter a valid computer ID!'#13#10);
      End
    Else
      Flag := True;
  Until Flag;

  ReadLn;
End.
