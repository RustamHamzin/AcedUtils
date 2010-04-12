
///////////////////////////////////////////////////////
//                                                   //
//   AcedNetWait 1.03                                //
//                                                   //
//   ���� � ���������� � ���, ��� ����������� ����   //
//   ������������ ������ �������������.              //
//                                                   //
//   mailto: acedutils@yandex.ru                     //
//                                                   //
///////////////////////////////////////////////////////

unit AcedNetWait;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

const
  netWaitActionNone   = 0;
  netWaitActionRetry  = 1;
  netWaitActionCancel = 2;

type
  TNetWaitNotifyForm = class(TForm)
    FileInfoLabel: TLabel;
    btnRetry: TButton;
    btnCancel: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnRetryClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { private declaration }
  public
    { public declaration }
  end;

const
  NetWaitMsgBeginning = '������ ��� �������� ����� ';
  NetWaitResourceMsgBeginning = '������ ��� �������� ������� ';
  NetWaitMsgToRead = ' ��� ������.';
  NetWaitMsgToWrite = ' ��� ������.';

var
  NetWaitNotifyForm: TNetWaitNotifyForm = nil;
  NetWaitAction: Integer;

implementation

{$R *.DFM}

procedure TNetWaitNotifyForm.btnRetryClick(Sender: TObject);
begin
  NetWaitAction := netWaitActionRetry;
  Hide;
end;

procedure TNetWaitNotifyForm.btnCancelClick(Sender: TObject);
begin
  NetWaitAction := netWaitActionCancel;
  Hide;
end;

end.

