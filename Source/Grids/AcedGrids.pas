
////////////////////////////////////////////////////
//                                                //
//   AcedGrids 1.03                               //
//                                                //
//   ����� ���� ��� Grid, Check � View �������.   //
//                                                //
//   mailto: acedutils@yandex.ru                  //
//                                                //
////////////////////////////////////////////////////

unit AcedGrids;

interface

uses Classes, Graphics, Grids, AcedConsts;

const
  MaxLastGridColumn = 9999;

type

{ ������, ����������� ������� �����. }

  PGridColumnInfo = ^TGridColumnInfo;
  TGridColumnInfo = record
    Title: string;              // ��������� �������
    Alignment: TAlignment;      // ������������ ������ � �������
    TitleAlignment: TAlignment; // ������������ ������ � ���������
    Width: Integer;             // ������ ������� (� ��������)
    LeftIndent: Integer;        // ������ � ������ ���� ������
    RightIndent: Integer;       // ������ � ������� ����
    Searched: Boolean;          // ���� False, ������� �� ��������� � ������
  end;

  PGridColumnList = ^TGridColumnList;
  TGridColumnList = array[0..MaxLastGridColumn] of TGridColumnInfo;

{ �������� ���� ������� ��������� ������, ������������ ��� ��������� ������,
  ���������� � ������� �����. }

  TGridGetDataEvent = procedure (Sender: TObject) of object;

{ �������� ���� ������� ��������� ������, ������� ����� �������������� ���
  ������� �����, ������� ��������� ����� � ���������� ������. RowIndex -
  ������ ������ (������ ������ ����� ����� ����� ������ ����), ColumnIndex -
  ����� ������� (��������� � ����). ���� Selected ����� True, ������� ������
  �������� ����������. ���� Inactive ����� True, ����� ������ �� ��������
  ��������, �.�. �� ������� ������� �����. ������� ������ ������� ����,
  ������� ��������� ����� � ������� ������ ��� clDefault. }

  TGridCellGetColorEvent = function (Sender: TObject; RowIndex,
    ColumnIndex: Integer; Selected, Inactive: Boolean): TColor of object;

  TViewCellGetColorEvent = function (Sender: TObject; RowIndex,
    ColumnIndex: Integer): TColor of object;

{ �������� ���� ���������, ������� ����� ���������� ��� ��������� ������ ���
  ��� ������� ������ ����� �� ������. Sender - ��� ������, �������� �������,
  � RowIndex - ������ ��������� ������. }

  TGridFrameEvent = procedure (Sender: TObject; RowIndex: Integer) of object;

{ �������� ���� ���������, ������� ����� ���������� ��� ����������� ������
  ����� �� ������ �����, ���, ��������, ��� ������ ������� ������ �����. }

  TGridEnterExitEvent = procedure (Sender: TObject) of object;

{ �������� ���� ���������, ������� ���������� ��� ������� �� �������. }

  TGridKeyDownEvent = procedure (Sender: TObject; RowIndex: Integer;
    Key: Word; Shift: TShiftState) of object;

  TViewKeyDownEvent = procedure (Sender: TObject; Key: Word;
    Shift: TShiftState) of object;

  TViewKeyPressEvent = procedure (Sender: TObject; Key: Char) of object;

{ �������� ���� ���������, ������� ���������� ��� ������� ��� �������� �������. }

  TCheckStateChangedEvent = procedure (Sender: TObject) of object;

implementation

end.

