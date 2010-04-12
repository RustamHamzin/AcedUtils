
//////////////////////////////////////////////////////
//                                                  //
//   AcedStreams 1.16                               //
//                                                  //
//   ������ ��� ������ � �������� ������� ������.   //
//                                                  //
//   mailto: acedutils@yandex.ru                    //
//                                                  //
//////////////////////////////////////////////////////

unit AcedStreams;

{$B-,H+,R-,Q-,T-,X+}

interface

uses AcedConsts, AcedCompression, AcedCrypto, Classes;

type

{ ����� TBinaryReader ������������ ��� ������ ������ �� ��������� ������. }

  TBinaryReader = class(TObject)
  private
    FLength: Integer;
    FPosition: Integer;
    FBytes: PBytes;
    procedure EraseData;
    procedure Load(P: Pointer; L: Integer; EncryptionKey: PSHA256Digest);
  public

  { ���������� Destroy �������� � ����������� ������, ������� ����������
    ��������, ���������� ������ ��������� ������. ����� ����, �����������
    ������, ������� ����� ����������� ������ TBinaryReader. }

    destructor Destroy; override;

  { �������� Position ���������� ������� ������� � ������ ������������ ������
    ��������� ������, �.�. ������ ���������� ��������� �����. }

    property Position: Integer read FPosition;

  { �������� Length ���������� ����� ��������� ������ � ������. ��� ��������
    ������������� ������������� �������� �������� Position. ��� ������� ������
    ������ �� ��������� ���� ����� ��������� ����������. }

    property Length: Integer read FLength;

  { ����� LoadFromArray ��������� ������ ��������� ������ �� ������� ������
    ������ Length ����, ���������� ���������� Bytes. ���� �������� OwnBytes
    ����� True, ������, �������������� ��� ������ Bytes, ������������� �����
    ���������� �� ��� ������. ���� �������� EncryptionKey �� ����� nil,
    ��������������, ��� �������� ������ ������ ����������� � ����� ���������
    �� �� ���������� ������ ��������� ������ ��� ���������������� � ������
    EncryptionKey. }

    procedure LoadFromArray(Bytes: Pointer; Length: Integer;
      OwnBytes: Boolean = False; EncryptionKey: PSHA256Digest = nil);

  { ����� LoadFromBase64 ��������� ������ ��������� ������ �� ������ S,
    �������������� � ��������� Base64. ���� �������� EncryptionKey �� �����
    nil, ��� ��������, ��� �������� ������ ������ ����������� � �����
    ��������� �� �� ���������� ������ ��������� ������ ��� ����������������
    � ������ EncryptionKey. }

    procedure LoadFromBase64(const S: AnsiString; EncryptionKey: PSHA256Digest = nil);

  { ������� LoadFromFile ��������� ������ ��������� ������ �� �����,
    ���������� �������� ���������� ���������� FileHandle. ������� �������
    � ����� ������ ���� ������� ����������� �� ������ ������ ���������
    ������. ���� �������� EncryptionKey �� ����� nil, ��������������, ���
    ������ � ����� ����������� � ����� ��������� �� �� ���������� ������
    ��������� ������ ��� ���������������� � ������ EncryptionKey. }

    function LoadFromFile(FileHandle: THandle;
      EncryptionKey: PSHA256Digest = nil): Boolean;

  { ������� LoadFromStream ��������� ������ ��������� ������ �� �������,
    ������ ���� TStream. ���� �������� EncryptionKey �� ����� nil,
    ��������������, ��� ������ � ������ Stream �����������. �����
    ����� ��������� �� �� ���������� ������ ����� ��������� ������ ���
    ���������������� � ������ EncryptionKey. }

    function LoadFromStream(Stream: TStream;
      EncryptionKey: PSHA256Digest = nil): Boolean;

  { ����� Reset ������������� ������� ������� �� ������ ��������� ������.
    ����� ����� ������ ����� ���� �������� ������� �� ��������� ������. }

    procedure Reset;

  { ����� Read ��������� Count ���� �� ��������� ������ � �������� ��
    � ������� ������, ���������� ���������� P. }

    procedure Read(P: Pointer; Count: Integer); overload;

  { ������� Read ���������� Count ���� �� ������� ������ ������. ��������
    Position ������������� ��� ���� �� �������� Count. ������� ����������
    ��������� �� ������ ���� ������������ ��������� ��������� ������. }

    function Read(Count: Integer): Pointer; overload;

  { ������� ReadString ��������� ������ ���� AnsiString �� ��������� ������. }

    function ReadString(): AnsiString;

  { ������� ReadShortInt ��������� �������� ���� ShortInt �� ��������� ������. }

    function ReadShortInt(): ShortInt;

  { ������� ReadByte ��������� �������� ���� Byte �� ��������� ������. }

    function ReadByte(): Byte;

  { ������� ReadSmallInt ��������� �������� ���� SmallInt �� ��������� ������. }

    function ReadSmallInt(): SmallInt;

  { ������� ReadWord ��������� �������� ���� Word �� ��������� ������. }

    function ReadWord(): Word;

  { ������� ReadInteger ��������� �������� ���� Integer �� ��������� ������. }

    function ReadInteger(): Integer;

  { ������� ReadLongWord ��������� �������� ���� LongWord �� ��������� ������. }

    function ReadLongWord(): LongWord;

  { ������� ReadInt64 ��������� �������� ���� Int64 �� ��������� ������. }

    function ReadInt64(): Int64;

  { ������� ReadDateTime ��������� �������� ���� TDateTime �� ��������� ������. }

    function ReadDateTime(): TDateTime;

  { ������� ReadSingle ��������� �������� ���� Single �� ��������� ������. }

    function ReadSingle(): Single;

  { ������� ReadDouble ��������� �������� ���� Double �� ��������� ������. }

    function ReadDouble(): Double;

  { ������� ReadCurrency ��������� �������� ���� Currency �� ��������� ������. }

    function ReadCurrency(): Currency;

  { ������� ReadBoolean ��������� �������� ���� Boolean �� ��������� ������. }

    function ReadBoolean(): Boolean;

  { ������� ReadChar ��������� �������� ���� AnsiChar �� ��������� ������. }

    function ReadChar(): AnsiChar;
  end;


{ ����� TBinaryWriter ������������ ��� ��������� ������ � �������� �����. }

  TBinaryWriter = class(TObject)
  private
    FLength: Integer;
    FCapacity: Integer;
    FBytes: PBytes;
    procedure SetCapacity(NewCapacity: Integer);
    procedure EnlargeCapacity(Capacity: Integer);
  public

  { ����������� Create c������ ��������� ������ TBinaryWriter, �.�. ��������
    �����, ��������������� ��� ������ � ���� ������. ���� ������� ��������
    ����� ������, ������� ����� �������� � �������� �����, ����� �������� ���
    �������� � ��������� Capacity ������������, ����� ��������� ������
    ����������������� ������. }

    constructor Create(Capacity: Integer = 0);

  { ���������� Destroy �������� � ����������� ������, ������� ����������
    ��������, ���������� ������ ��������� ������. ����� ����, �����������
    ������, ������� ����� ����������� ������ TBinaryWriter. }

    destructor Destroy; override;

  { �������� Capacity ���������� ��� ������������� ������ ����� ������,
    ����������� ��� �������� �����. ��� ���������� ����� ������� ����������
    ��������� ������ ����� ������ � ����������� � ���� ������ ���������
    ������. }

    property Capacity: Integer read FCapacity write SetCapacity;

  { �������� Length ���������� ������� ����� ��������� ������, �.�. �������
    ���������� ������������ ����� ������������ ������ ������. }

    property Length: Integer read FLength;

  { ����� ������ EnsureCapacity �����������, ��� ��� �������� ����� �����
    ������� ���� ������, ����������� ��� �������� Capacity ����. }

    procedure EnsureCapacity(Capacity: Integer);

  { ����� Reset ������� �������� �������� ����� � �������������� ��� �
    ���������� ������ �������. �������� Capacity ��� ���� �� ����������. }

    procedure Reset;

  { ����� Write �������� Count ����, ���������� ���������� P, � ��������
    �������� �����. }

    procedure Write(P: Pointer; Count: Integer); overload;

  { ������� Write ����������� ����� ��������� ��������� ������ �� Count ����,
    �� �������� ������� �������� ���������������� �������. ������� ����������
    ��������� �� ������ ���� ������������ ���������. }

    function Write(Count: Integer): Pointer; overload;

  { ����� WriteString �������� � ����� ������ S ���� AnsiString. }

    procedure WriteString(const S: AnsiString);

  { ����� WriteShortInt �������� � ����� �������� ���� ShortInt. }

    procedure WriteShortInt(N: ShortInt);

  { ����� WriteByte �������� � ����� �������� ���� Byte. }

    procedure WriteByte(N: Byte);

  { ����� WriteSmallInt �������� � ����� �������� ���� SmallInt. }

    procedure WriteSmallInt(N: SmallInt);

  { ����� WriteWord �������� � ����� �������� ���� Word. }

    procedure WriteWord(N: Word);

  { ����� WriteInteger �������� � ����� �������� ���� Integer. }

    procedure WriteInteger(N: Integer);

  { ����� WriteLongWord �������� � ����� �������� ���� LongWord. }

    procedure WriteLongWord(N: LongWord);

  { ����� WriteInt64 �������� � ����� �������� ���� Int64. }

    procedure WriteInt64(const N: Int64);

  { ����� WriteDateTime �������� � ����� �������� ���� TDateTime. }

    procedure WriteDateTime(const D: TDateTime);

  { ����� WriteSingle �������� � ����� �������� ���� Single. }

    procedure WriteSingle(const V: Single);

  { ����� WriteDouble �������� � ����� �������� ���� Double. }

    procedure WriteDouble(const V: Double);

  { ����� WriteCurrency �������� � ����� �������� ���� Currency. }

    procedure WriteCurrency(const V: Currency);

  { ����� WriteBoolean �������� � ����� �������� ���� Boolean. }

    procedure WriteBoolean(V: Boolean);

  { ����� WriteChar �������� � ����� �������� ���� AnsiChar. }

    procedure WriteChar(C: AnsiChar);

  { ������� SaveToArray ��������� ������ ��������� ������ � ������� ������,
    ����� ������� ������������ ����� � ��������� Bytes, � ����� ���� �������
    ������ ������������ ��� ��������� �������. ���� �������� EncryptionKey
    �� ����� nil, ����� ����������� ������ ��������� � ������ EncryptionKey.
    �������� CompressionMode, ���� �� ������� �� dcmNoCompression, ������
    ����� ������ ������ ��������� ������. }

    function SaveToArray(var Bytes: Pointer; EncryptionKey: PSHA256Digest = nil;
      CompressionMode: TCompressionMode = dcmNoCompression): Integer;

  { ������� SaveToBase64 ������������ ������ ��������� ������ � ���� ������
    � ��������� Base64. ��� ������ ������������ ��� ��������� �������. ����
    �������� EncryptionKey �� ����� nil, ����� ����������� ������ ���������
    � ������ EncryptionKey. �������� CompressionMode, ���� �� ������� ��
    dcmNoCompression, ������ ����� ������ ������ ��������� ������. }

    function SaveToBase64(EncryptionKey: PSHA256Digest = nil;
      CompressionMode: TCompressionMode = dcmNoCompression): AnsiString;

  { ������� SaveToFile ��������� ������ ��������� ������ � �����, ����������
    �������� ������� ���������� FileHandle. ������� ������� � ����� ������
    ���� ������� ����������� � ������ ���������. ���� �������� EncryptionKey
    �� ����� nil, ����� ����������� ������ ��������� � ������ EncryptionKey.
    �������� CompressionMode, ���� �� ������� �� dcmNoCompression, ������
    ����� ������ ������ ��������� ������. }

    function SaveToFile(FileHandle: THandle; EncryptionKey: PSHA256Digest = nil;
      CompressionMode: TCompressionMode = dcmNoCompression): Boolean;

  { ������� SaveToStream ��������� ������ ��������� ������ � ������ ������
    ���� TStream, ������� �������� ���������� Stream. ���� ��������
    EncryptionKey �� ����� nil, ����� ����������� ������ ��������� � ������
    EncryptionKey. �������� CompressionMode, ���� �� ������� ��
    dcmNoCompression, ������ ����� ������ ������ ��������� ������. }

    function SaveToStream(Stream: TStream; EncryptionKey: PSHA256Digest = nil;
      CompressionMode: TCompressionMode = dcmNoCompression): Boolean;
  end;


{ ����� TReaderStream ��������� ����������� ��������� ������ TBinaryReader
  � ���� �������, ������������ �� ������ TStream. }

  TReaderStream = class(TStream)
  private
    FReader: TBinaryReader;
  protected
    function GetSize: Int64; override;
    procedure SetSize(NewSize: Longint); override;
  public

  { ����������� Create ������� ��������� ������ TReaderStream �� ������
    ���������� ������ TBinaryReader, ������������� ���������� Reader. }

    constructor Create(Reader: TBinaryReader);

  { �������� Reader ���������� ��������� ������ TBinaryReader,
    ��������������� ������ �������. }

    property Reader: TBinaryReader read FReader;

  { ������� Read �������� ������� Count ���� �� ��������� ������ � ���������
    ����������� ������ � ������� ������, ������ �� ������� ����������
    ���������� Buffer. ���� ����� ������ � ������ ������ Count ����,
    ����������� ���, ��� ����. ������� ���������� ����� ����, ����������
    ����������� �� ��������� ������. }

    function Read(var Buffer; Count: Longint): Longint; override;

  { ��� ������ ������� Write ������ TReaderStream ��������� ����������,
    �.�. ���� ����� �� ������������ ��� ������ ������ � �����. }

    function Write(const Buffer; Count: Longint): Longint; override;

  { ������� Seek ���������� ������� ������� � �������� ������ � ����������
    ����� �������� �������� Reader.Position. ���� �������� Origin �����
    soFromBeginning, ������� ������� ��������������� �� ���������� Offset
    ���� �� ������ ��������� ������. ���� Origin ����� soFromCurrent �������
    ������� ��������� �� Offset ���� ������������ �� �������� ���������.
    ���� �������� Origin ����� soFromEnd, ������� ��������������� ��
    ���������� Offset ���� � ����� ��������� ������. � ��������� ������
    Offset, ��� �������, �������� ������������� ������. }

    function Seek(Offset: Longint; Origin: Word): Longint; override;
  end;


{ ����� TWriterStream ��������� ����������� ��������� ������ TBinaryWriter
  � ���� �������, ������������ �� ������ TStream. }

  TWriterStream = class(TStream)
  private
    FWriter: TBinaryWriter;
  protected
    function GetSize: Int64; override;
    procedure SetSize(NewSize: Longint); override;
  public

  { ����������� Create ������� ��������� ������ TWriterStream �� ������
    ���������� ������ TBinaryWriter, ������������� ���������� Writer. }

    constructor Create(Writer: TBinaryWriter);

  { �������� Writer ���������� ��������� ������ TBinaryWriter,
    ��������������� ������ �������. }

    property Writer: TBinaryWriter read FWriter;

  { ��� ������ ������� Read ������ TWriterStream ��������� ����������,
    �.�. ���� ����� �� ������������ ��� ������ ������ �� ������. }

    function Read(var Buffer; Count: Longint): Longint; override;

  { ������� Write ������������ � �������� ����� Count ���� �� ������� ������,
    ������ �� ������� ���������� ���������� Buffer. ������� ����������
    ���������� � ��� �������� ��������� Count. }

    function Write(const Buffer; Count: Longint): Longint; override;

  { ������� Seek �������� ������� ����� ��������� �������� ������ � ����������
    ����� �������� �������� Writer.Length. ���� �������� Origin �����
    soFromBeginning, ������� �������, �.�. �����, ��������������� �� ����������
    Offset ���� �� ������ ��������� ������. ���� Origin ����� soFromCurrent
    ������� ������� ��������� �� Offset ���� ������������ ������� �����.
    ���� �������� Origin ����� soFromEnd, ������� ��������������� �� ����������
    Offset ���� � ����� ��������� ������. ���� ����� ����� ������ �����������
    ������� �������� �����, �������� ��������� �������������� ������ ���
    ���������� ������ ��������� ������. }

    function Seek(Offset: Longint; Origin: Word): Longint; override;
  end;

implementation

uses Windows, AcedBinary, AcedCommon;

{ TBinaryReader }

destructor TBinaryReader.Destroy;
begin
  EraseData;
end;

procedure TBinaryReader.EraseData;
begin
  if FBytes <> nil then
  begin
    G_ZeroMem(FBytes, FLength);
    FLength := 0;
    FPosition := 0;
    FreeMem(FBytes);
    FBytes := nil;
  end;
end;

procedure TBinaryReader.Load(P: Pointer; L: Integer; EncryptionKey: PSHA256Digest);
var
  Hash: TSHA256Digest;
  H: HRC6;
begin
  Dec(L, 4);
  if (L < 0) or (G_Adler32(@PBytes(P)^[4], L) <> PLongWord(P)^) then
    RaiseError(SErrBinaryStreamCorrupted);
  if not Assigned(EncryptionKey) then
    FLength := PInteger(@PBytes(P)^[4])^
  else
  begin
    Dec(L, 32);
    G_RC6Init(H, EncryptionKey, 32);
    G_RC6SetOrdinaryVector(H);
    G_RC6DecryptCFB(H, @PBytes(P)^[36], L);
    G_RC6Done(H);
    G_SHA256(@PBytes(P)^[36], L, @Hash);
    if not G_SHA256Equals(@PBytes(P)^[4], @Hash) then
      RaiseError(SErrWrongDecryptionKey);
    FLength := PInteger(@PBytes(P)^[36])^;
  end;
  if FLength > 0 then
  begin
    GetMem(FBytes, FLength);
    if not Assigned(EncryptionKey) then
      G_Inflate(@PBytes(P)^[4], L, FBytes)
    else
    begin
      G_Inflate(@PBytes(P)^[36], L, FBytes);
      G_ZeroMem(P, L + 36);
    end;
    FreeMem(P);
  end else
  begin
    FLength := -FLength;
    if FLength <> L - 4 then
      RaiseError(SErrWrongStreamLength);
    L := (L - 1) shr 2;
    if not Assigned(EncryptionKey) then
      G_CopyLongs(@PBytes(P)^[8], P, L)
    else
    begin
      G_CopyLongs(@PBytes(P)^[40], P, L);
      G_ZeroMem(@PBytes(P)^[FLength], 40);
    end;
    FBytes := P;
  end;
end;

procedure TBinaryReader.LoadFromArray(Bytes: Pointer; Length: Integer;
  OwnBytes: Boolean; EncryptionKey: PSHA256Digest);
var
  P: Pointer;
begin
  EraseData;
  if not OwnBytes then
  begin
    GetMem(P, Length);
    G_CopyMem(Bytes, P, Length);
  end else
    P := Bytes;
  Load(P, Length, EncryptionKey);
end;

procedure TBinaryReader.LoadFromBase64(const S: AnsiString; EncryptionKey: PSHA256Digest);
var
  L: Integer;
  P: Pointer;
begin
  EraseData;
  L := G_Base64Decode(S, nil);
  if L > 0 then
  begin
    GetMem(P, L);
    G_Base64Decode(S, P);
    Load(P, L, EncryptionKey);
  end;
end;

function TBinaryReader.LoadFromFile(FileHandle: THandle;
  EncryptionKey: PSHA256Digest): Boolean;
var
  Count: LongWord;
  L: Integer;
  P: Pointer;
begin
  EraseData;
  Result := False;
  if not ReadFile(FileHandle, L, 4, Count, nil) or (Count <> 4) or (L < 8) then
    Exit;
  GetMem(P, L);
  if not ReadFile(FileHandle, P^, L, Count, nil) or (Integer(Count) <> L) then
  begin
    FreeMem(P);
    Exit;
  end;
  Load(P, L, EncryptionKey);
  Result := True;
end;

function TBinaryReader.LoadFromStream(Stream: TStream;
  EncryptionKey: PSHA256Digest): Boolean;
var
  L: Integer;
  P: Pointer;
begin
  EraseData;
  Result := False;
  if (Stream.Read(L, 4) <> 4) or (L < 8) then
    Exit;
  GetMem(P, L);
  if Stream.Read(P^, L) <> L then
  begin
    FreeMem(P);
    Exit;
  end;
  Load(P, L, EncryptionKey);
  Result := True;
end;

procedure TBinaryReader.Reset;
begin
  FPosition := 0;
end;

procedure TBinaryReader.Read(P: Pointer; Count: Integer);
var
  X: Integer;
begin
  X := FPosition + Count;
  if X > FLength then
    RaiseError(SErrReadBeyondTheEndOfStream);
  G_CopyMem(@FBytes^[FPosition], P, Count);
  FPosition := X;
end;

function TBinaryReader.Read(Count: Integer): Pointer;
var
  X: Integer;
begin
  X := FPosition + Count;
  if X > FLength then
    RaiseError(SErrReadBeyondTheEndOfStream);
  Result := @FBytes^[FPosition];
  FPosition := X;
end;

function TBinaryReader.ReadString(): AnsiString;
var
  L, X: Integer;
begin
  L := ReadByte;
  if L = $FF then
  begin
    L := ReadWord;
    if L = $FFFF then
      L := ReadInteger
    else
      Inc(L, $FF);
  end;
  SetLength(Result, L);
  if L > 0 then
  begin
    X := FPosition + L;
    if X > FLength then
      RaiseError(SErrReadBeyondTheEndOfStream);
    G_CopyMem(@FBytes^[FPosition], Pointer(Result), L);
    FPosition := X;
  end;
end;

function TBinaryReader.ReadShortInt(): ShortInt;
begin
  if FPosition = FLength then
    RaiseError(SErrReadBeyondTheEndOfStream);
  Result := PShortInt(@FBytes^[FPosition])^;
  Inc(FPosition);
end;

function TBinaryReader.ReadByte(): Byte;
begin
  if FPosition = FLength then
    RaiseError(SErrReadBeyondTheEndOfStream);
  Result := FBytes^[FPosition];
  Inc(FPosition);
end;

function TBinaryReader.ReadSmallInt(): SmallInt;
var
  X: Integer;
begin
  X := FPosition + 2;
  if X > FLength then
    RaiseError(SErrReadBeyondTheEndOfStream);
  Result := PSmallInt(@FBytes^[FPosition])^;
  FPosition := X;
end;

function TBinaryReader.ReadWord(): Word;
var
  X: Integer;
begin
  X := FPosition + 2;
  if X > FLength then
    RaiseError(SErrReadBeyondTheEndOfStream);
  Result := PWord(@FBytes^[FPosition])^;
  FPosition := X;
end;

function TBinaryReader.ReadInteger(): Integer;
var
  X: Integer;
begin
  X := FPosition + 4;
  if X > FLength then
    RaiseError(SErrReadBeyondTheEndOfStream);
  Result := PInteger(@FBytes^[FPosition])^;
  FPosition := X;
end;

function TBinaryReader.ReadLongWord(): LongWord;
var
  X: Integer;
begin
  X := FPosition + 4;
  if X > FLength then
    RaiseError(SErrReadBeyondTheEndOfStream);
  Result := PLongWord(@FBytes^[FPosition])^;
  FPosition := X;
end;

function TBinaryReader.ReadInt64(): Int64;
var
  X: Integer;
begin
  X := FPosition + 8;
  if X > FLength then
    RaiseError(SErrReadBeyondTheEndOfStream);
  Result := PInt64(@FBytes^[FPosition])^;
  FPosition := X;
end;

function TBinaryReader.ReadDateTime(): TDateTime;
var
  X: Integer;
begin
  X := FPosition + 8;
  if X > FLength then
    RaiseError(SErrReadBeyondTheEndOfStream);
  Result := PDateTime(@FBytes^[FPosition])^;
  FPosition := X;
end;

function TBinaryReader.ReadSingle(): Single;
var
  X: Integer;
begin
  X := FPosition + 4;
  if X > FLength then
    RaiseError(SErrReadBeyondTheEndOfStream);
  Result := PSingle(@FBytes^[FPosition])^;
  FPosition := X;
end;

function TBinaryReader.ReadDouble(): Double;
var
  X: Integer;
begin
  X := FPosition + 8;
  if X > FLength then
    RaiseError(SErrReadBeyondTheEndOfStream);
  Result := PDouble(@FBytes^[FPosition])^;
  FPosition := X;
end;

function TBinaryReader.ReadCurrency(): Currency;
var
  X: Integer;
begin
  X := FPosition + 8;
  if X > FLength then
    RaiseError(SErrReadBeyondTheEndOfStream);
  Result := PCurrency(@FBytes^[FPosition])^;
  FPosition := X;
end;

function TBinaryReader.ReadBoolean(): Boolean;
begin
  if FPosition = FLength then
    RaiseError(SErrReadBeyondTheEndOfStream);
  Result := PBoolean(@FBytes^[FPosition])^;
  Inc(FPosition);
end;

function TBinaryReader.ReadChar(): AnsiChar;
begin
  if FPosition = FLength then
    RaiseError(SErrReadBeyondTheEndOfStream);
  Result := PAnsiChar(@FBytes^[FPosition])^;
  Inc(FPosition);
end;

{ TBinaryWriter }

constructor TBinaryWriter.Create(Capacity: Integer);
begin
  FCapacity := G_NormalizeCapacity(Capacity);
  FBytes := G_AllocMem(FCapacity);
end;

destructor TBinaryWriter.Destroy;
begin
  if FCapacity > 0 then
  begin
    G_ZeroMem(FBytes, FLength);
    FreeMem(FBytes);
  end;
end;

procedure TBinaryWriter.SetCapacity(NewCapacity: Integer);
var
  NewBytes: PBytes;
begin
  if (NewCapacity <> FCapacity) and (NewCapacity >= FLength) then
  begin
    GetMem(NewBytes, NewCapacity);
    FCapacity := NewCapacity;
    G_CopyMem(FBytes, NewBytes, FLength);
    G_ZeroMem(FBytes, FLength);
    FreeMem(FBytes);
    FBytes := NewBytes;
  end;
end;

procedure TBinaryWriter.EnlargeCapacity(Capacity: Integer);
var
  NewCapacity: Integer;
begin
  NewCapacity := G_EnlargeCapacity(FCapacity);
  if NewCapacity < Capacity then
    NewCapacity := G_NormalizeCapacity(Capacity);
  SetCapacity(NewCapacity);
end;

procedure TBinaryWriter.EnsureCapacity(Capacity: Integer);
begin
  if FCapacity < Capacity then
    SetCapacity(G_NormalizeCapacity(Capacity));
end;

procedure TBinaryWriter.Reset;
begin
  G_ZeroMem(FBytes, FLength);
  FLength := 0;
end;

procedure TBinaryWriter.Write(P: Pointer; Count: Integer);
var
  X: Integer;
begin
  X := FLength + Count;
  if X > FCapacity then
    EnlargeCapacity(X);
  G_CopyMem(P, @FBytes^[FLength], Count);
  FLength := X;
end;

function TBinaryWriter.Write(Count: Integer): Pointer;
var
  X: Integer;
begin
  X := FLength + Count;
  if X > FCapacity then
    EnlargeCapacity(X);
  Result := @FBytes^[FLength];
  FLength := X;
end;

procedure TBinaryWriter.WriteString(const S: AnsiString);
var
  L, X: Integer;
begin
  L := System.Length(S);
  X := L + FLength;
  if L < $FF then
    Inc(X)
  else if L < $100FE then
    Inc(X, 3)
  else
    Inc(X, 7);
  if X > FCapacity then
    EnlargeCapacity(X);
  if L < $FF then
  begin
    FBytes^[FLength] := Byte(L);
    Inc(FLength);
  end
  else if L < $100FE then
  begin
    FBytes^[FLength] := $FF;
    FBytes^[FLength + 1] := Byte(L - $FF);
    FBytes^[FLength + 2] := Byte((L - $FF) shr 8);
    Inc(FLength, 3);
  end else
  begin
    FBytes^[FLength] := $FF;
    FBytes^[FLength + 1] := $FF;
    FBytes^[FLength + 2] := $FF;
    PInteger(@FBytes^[FLength + 3])^ := L;
    Inc(FLength, 7);
  end;
  if L > 0 then
    G_CopyMem(Pointer(S), @FBytes^[FLength], L);
  FLength := X;
end;

procedure TBinaryWriter.WriteShortInt(N: ShortInt);
begin
  if FLength = FCapacity then
    EnlargeCapacity(FLength + 1);
  PShortInt(@FBytes^[FLength])^ := N;
  Inc(FLength);
end;

procedure TBinaryWriter.WriteByte(N: Byte);
begin
  if FLength = FCapacity then
    EnlargeCapacity(FLength + 1);
  FBytes^[FLength] := N;
  Inc(FLength);
end;

procedure TBinaryWriter.WriteSmallInt(N: SmallInt);
var
  X: Integer;
begin
  X := FLength + 2;
  if X > FCapacity then
    EnlargeCapacity(X);
  PSmallInt(@FBytes^[FLength])^ := N;
  FLength := X;
end;

procedure TBinaryWriter.WriteWord(N: Word);
var
  X: Integer;
begin
  X := FLength + 2;
  if X > FCapacity then
    EnlargeCapacity(X);
  PWord(@FBytes^[FLength])^ := N;
  FLength := X;
end;

procedure TBinaryWriter.WriteInteger(N: Integer);
var
  X: Integer;
begin
  X := FLength + 4;
  if X > FCapacity then
    EnlargeCapacity(X);
  PInteger(@FBytes^[FLength])^ := N;
  FLength := X;
end;

procedure TBinaryWriter.WriteLongWord(N: LongWord);
var
  X: Integer;
begin
  X := FLength + 4;
  if X > FCapacity then
    EnlargeCapacity(X);
  PLongWord(@FBytes^[FLength])^ := N;
  FLength := X;
end;

procedure TBinaryWriter.WriteInt64(const N: Int64);
var
  X: Integer;
begin
  X := FLength + 8;
  if X > FCapacity then
    EnlargeCapacity(X);
  PInt64(@FBytes^[FLength])^ := N;
  FLength := X;
end;

procedure TBinaryWriter.WriteDateTime(const D: TDateTime);
var
  X: Integer;
begin
  X := FLength + 8;
  if X > FCapacity then
    EnlargeCapacity(X);
  PDateTime(@FBytes^[FLength])^ := D;
  FLength := X;
end;

procedure TBinaryWriter.WriteSingle(const V: Single);
var
  X: Integer;
begin
  X := FLength + 4;
  if X > FCapacity then
    EnlargeCapacity(X);
  PSingle(@FBytes^[FLength])^ := V;
  FLength := X;
end;

procedure TBinaryWriter.WriteDouble(const V: Double);
var
  X: Integer;
begin
  X := FLength + 8;
  if X > FCapacity then
    EnlargeCapacity(X);
  PDouble(@FBytes^[FLength])^ := V;
  FLength := X;
end;

procedure TBinaryWriter.WriteCurrency(const V: Currency);
var
  X: Integer;
begin
  X := FLength + 8;
  if X > FCapacity then
    EnlargeCapacity(X);
  PCurrency(@FBytes^[FLength])^ := V;
  FLength := X;
end;

procedure TBinaryWriter.WriteBoolean(V: Boolean);
begin
  if FLength = FCapacity then
    EnlargeCapacity(FLength + 1);
  PBoolean(@FBytes^[FLength])^ := V;
  Inc(FLength);
end;

procedure TBinaryWriter.WriteChar(C: AnsiChar);
begin
  if FLength = FCapacity then
    EnlargeCapacity(FLength + 1);
  PAnsiChar(@FBytes^[FLength])^ := C;
  Inc(FLength);
end;

function TBinaryWriter.SaveToArray(var Bytes: Pointer; EncryptionKey: PSHA256Digest;
  CompressionMode: TCompressionMode): Integer;
var
  H: HRC6;
begin
  if not Assigned(EncryptionKey) then
    Result := G_Deflate(FBytes, FLength, Bytes, 4, 0, CompressionMode)
  else
  begin
    Result := G_Deflate(FBytes, FLength, Bytes, 36, 0, CompressionMode);
    G_SHA256(@PBytes(Bytes)^[36], Result, @PBytes(Bytes)^[4]);
    G_RC6Init(H, EncryptionKey, 32);
    G_RC6SetOrdinaryVector(H);
    G_RC6EncryptCFB(H, @PBytes(Bytes)^[36], Result);
    G_RC6Done(H);
    Inc(Result, 32);
  end;
  PLongWord(Bytes)^ := G_Adler32(@PBytes(Bytes)^[4], Result);
  Inc(Result, 4);
end;

function TBinaryWriter.SaveToBase64(EncryptionKey: PSHA256Digest;
  CompressionMode: TCompressionMode): AnsiString;
var
  P: Pointer;
  L: Integer;
begin
  L := SaveToArray(P, EncryptionKey, CompressionMode);
  Result := G_Base64Encode(P, L);
  FreeMem(P);
end;

function TBinaryWriter.SaveToFile(FileHandle: THandle; EncryptionKey: PSHA256Digest;
  CompressionMode: TCompressionMode): Boolean;
var
  P: Pointer;
  L: Integer;
  Count: LongWord;
begin
  L := SaveToArray(P, EncryptionKey, CompressionMode);
  Result := False;
  if not WriteFile(FileHandle, L, 4, Count, nil) or (Count <> 4) then
  begin
    FreeMem(P);
    Exit;
  end;
  Result := WriteFile(FileHandle, P^, L, Count, nil) and (Integer(Count) = L);
  FreeMem(P);
end;

function TBinaryWriter.SaveToStream(Stream: TStream; EncryptionKey: PSHA256Digest;
  CompressionMode: TCompressionMode): Boolean;
var
  P: Pointer;
  L: Integer;
begin
  L := SaveToArray(P, EncryptionKey, CompressionMode);
  Result := False;
  if Stream.Write(L, 4) <> 4 then
  begin
    FreeMem(P);
    Exit;
  end;
  Result := Stream.Write(P^, L) = L;
  FreeMem(P);
end;

{ TReaderStream }

constructor TReaderStream.Create(Reader: TBinaryReader);
begin
  FReader := Reader;
end;

function TReaderStream.GetSize: Int64;
begin
  Result := FReader.FLength;
end;

procedure TReaderStream.SetSize(NewSize: Longint);
begin
  RaiseError(SErrStreamIsReadOnly);
end;

function TReaderStream.Read(var Buffer; Count: Longint): Longint;
var
  P0, P1: Integer;
begin
  P0 := FReader.FPosition;
  P1 := P0 + Count;
  if P1 > FReader.FLength then
  begin
    P1 := FReader.FLength;
    Result := P1 - P0;
  end else
    Result := Count;
  G_CopyMem(@FReader.FBytes^[P0], @Buffer, Result);
  FReader.FPosition := P1;
end;

function TReaderStream.Write(const Buffer; Count: Longint): Longint;
begin
  RaiseError(SErrStreamIsReadOnly);
  Result := 0;
end;

function TReaderStream.Seek(Offset: Longint; Origin: Word): Longint;
begin
  Result := FReader.FPosition;
  case Origin of
    soFromBeginning: Result := Offset;
    soFromCurrent: Inc(Result, Offset);
    soFromEnd: Result := FReader.FLength + Offset;
  end;
  if Result > FReader.FLength then
    Result := FReader.FLength
  else if Result < 0 then
    Result := 0;
  FReader.FPosition := Result;
end;

{ TWriterStream }

constructor TWriterStream.Create(Writer: TBinaryWriter);
begin
  FWriter := Writer;
end;

function TWriterStream.GetSize: Int64;
begin
  Result := FWriter.FLength;
end;

procedure TWriterStream.SetSize(NewSize: Longint);
begin
  Seek(NewSize, soFromBeginning);
end;

function TWriterStream.Read(var Buffer; Count: Longint): Longint;
begin
  RaiseError(SErrStreamIsWriteOnly);
  Result := 0;
end;

function TWriterStream.Write(const Buffer; Count: Longint): Longint;
begin
  FWriter.Write(@Buffer, Count);
  Result := Count;
end;

function TWriterStream.Seek(Offset: Longint; Origin: Word): Longint;
begin
  Result := FWriter.FLength;
  case Origin of
    soFromBeginning: Result := Offset;
    soFromCurrent: Inc(Result, Offset);
    soFromEnd: Result := FWriter.FLength + Offset;
  end;
  if Result < 0 then
    Result := 0;
  if Result > FWriter.FCapacity then
    FWriter.EnlargeCapacity(Result);
  FWriter.FLength := Result;
end;

end.

