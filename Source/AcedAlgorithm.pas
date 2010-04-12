
///////////////////////////////////////////////////////////
//                                                       //
//   AcedAlgorithm 1.16                                  //
//                                                       //
//   ������� ��������� � ��������� ������, ����������,   //
//   �������, ������������������ ��������� ������ �      //
//   ������ ������� ��� ������ �� ������� ���������,     //
//   �������������� � ���� ������� ����������.           //
//                                                       //
//   mailto: acedutils@yandex.ru                         //
//                                                       //
///////////////////////////////////////////////////////////

unit AcedAlgorithm;

{$B-,H+,R-,Q-,T-,X+}

interface

uses Registry, AcedBinary, AcedConsts, AcedCrypto;

{ �������� �������, ������������ ��� ������������� �������� �������� ������.
  ������� ������ �������� ��������, ������ �� ������� ���������� ����������
  Value, � ��������������� ���������, ���������� ��� �������� Item ������.
  ���� Value ������, ��� ��������, ������������ ��� �������� Item, �������
  ������ ������� ������������� �����. ���� Value ������, ��� ��������,
  ������������ ��� �������� Item, ������� ���������� ������������� �����.
  ���� Value ����� ��������, ������������� ��� �������� Item, ������� ������
  ������� ����. }

type
  TMatchFunction = function (Value, Item: Pointer): Integer;

{ �������� �������, ������������ ��� ���������� � ������������� ���������
  ������. ������� ������ �������� �������� Item1 � Item2 � ������� ��������
  ������ ����, ���� ������ ������� ������ �������, �������� ������ ����,
  ���� ������ ������� ������ �������, � ����, ���� �������� �����. }

  TCompareFunction = function (Item1, Item2: Pointer): Integer;


{ ������� ��� ������, ������, �������� � �������� ��������� ������� ���������� }

{ G_Search ��������� �������� ����� �������� Value � ������� ����������
  ItemList, ��������� �� Count ���������. ������� ��� ������������� ��������
  �������� ������� ���������� ���������� MatchFunction. ������� G_Search
  ���������� ������ ���������� �������� ��� -1, ���� �������� �� �������. }

function G_Search(Value: Pointer; ItemList: PPointerItemList; Count: Integer;
  MatchFunction: TMatchFunction): Integer;

{ G_SearchBackward ��������� �������� ����� �������� Value � �������
  ���������� ItemList, ��������� �� Count ���������. ����� ���������� �
  ��������� ��������� �������. ������� ��� ������������� �������� ��������
  ������� ���������� ���������� MatchFunction. ������� G_SearchBackward
  ���������� ������ ���������� �������� ��� -1, ���� �������� �� �������. }

function G_SearchBackward(Value: Pointer; ItemList: PPointerItemList;
  Count: Integer; MatchFunction: TMatchFunction): Integer;

{ G_Replace �������� ��� ��������, ������ �������� Value, � ������� ����������,
  ����� �������� ������� ���������� ItemList, ��������� NewP. Count - �����
  ��������� � ������� ItemList. MatchFunction - ������� ��� �������������
  �������� �������� �������. G_Replace ���������� �����, ������ ����������
  ������������� �����. }

function G_Replace(Value, NewP: Pointer; ItemList: PPointerItemList;
  Count: Integer; MatchFunction: TMatchFunction): Integer;

{ G_CountOf ���������� ����� ���������, ������ Value, � ������� ����������
  ItemList, ��������� �� Count ���������. ������� ��� ������������� ��������
  �������� ������� ���������� ���������� MatchFunction. }

function G_CountOf(Value: Pointer; ItemList: PPointerItemList; Count: Integer;
  MatchFunction: TMatchFunction): Integer;

{ G_CountOfUnique ���������� ����� ���������� ��������� � ������� ����������
  ItemList, ��������� �� Count ���������. ��� ���� ��������� ������ �������
  ��������� ��������� �� ����. ������� ��� ��������� ���� ��������� �������
  ���������� ���������� CompareFunction. }

function G_CountOfUnique(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction): Integer;

{ G_RemoveCopy �������� ��� ��������, ����� ���, ������� ����� Value, ��
  ������� ���������� ItemList, ���������� �� Count ���������, � ������,
  ���������� ���������� OutList. ������� ���������� ���������� ���������,
  ���������� � �������� ������. ������� ��� ������������� �������� ��������
  ������� ���������� ���������� MatchFunction. ���� �������� � OutList
  ��������� �� �������� ������ ItemList, �������� ���������� �� �����. }

function G_RemoveCopy(Value: Pointer; ItemList: PPointerItemList; Count: Integer;
  MatchFunction: TMatchFunction; OutList: PPointerItemList): Integer;

{ G_UniqueCopy �������� ��� ��������, �������� ������������� ������� ��������,
  �� ������� ���������� ItemList, ���������� �� Count ���������, � ������,
  ���������� ���������� OutList. ������� ���������� ���������� ���������,
  ���������� � �������� ������. � ��������� CompareFunction ���������� �������
  ��� ��������� ���� ��������� �������. ���� �������� � OutList ��������� ��
  �������� ������ ItemList, �������� ���������� �� �����. }

function G_UniqueCopy(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction; OutList: PPointerItemList): Integer;


{ ������� ��� ������ ������������ � ������������� ��������� ������� }

{ ��������� ������� G_SearchMin ���������� ������ ����������� �������
  � ������� ���������� ItemList. Count - ����� ����� ��������� � �������.
  CompareFunction - ������� ��� ��������� ���� ��������� �������. }

function G_SearchMin(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction): Pointer; overload;

{ ��������� ������� G_SearchMin ���������� ������ ����������� �������
  � ������� ���������� ItemList. � ��������� N ������������ ����� ���������
  �������, ������ ������������ ��������. Count - ����� ����� ���������
  � �������. CompareFunction - ������� ��� ��������� ���� ��������� �������. }

function G_SearchMin(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction; out N: Integer): Pointer; overload;

{ G_IndexOfMin ���������� ������ ������� ������������ �������� � �������
  ���������� ItemList. ���� � ��������� LastIndex ������� ��������� ��
  ���������� ���� Integer, � ��� ����������� ������ ���������� ������������
  �������� � ������� ItemList. Count - ����� ����� ��������� � �������.
  CompareFunction - ������� ��� ��������� ���� ��������� �������. }

function G_IndexOfMin(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction; LastIndex: PInteger = nil): Integer;

{ ��������� ������� G_SearchMax ���������� ������ ������������ �������
  � ������� ���������� ItemList. Count - ����� ����� ��������� � �������.
  CompareFunction - ������� ��� ��������� ���� ��������� �������. }

function G_SearchMax(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction): Pointer; overload;

{ ��������� ������� G_SearchMax ���������� ������ ������������ �������
  � ������� ���������� ItemList. � ��������� N ������������ ����� ���������
  �������, ������ ������������� ��������. Count - ����� ����� ���������
  � �������. CompareFunction - ������� ��� ��������� ���� ��������� �������. }

function G_SearchMax(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction; out N: Integer): Pointer; overload;

{ G_IndexOfMax ���������� ������ ������� ������������� �������� � �������
  ���������� ItemList. ���� � ��������� LastIndex ������� ��������� ��
  ���������� ���� Integer, � ��� ����������� ������ ���������� �������������
  �������� � ������� ItemList. Count - ����� ����� ��������� � �������.
  CompareFunction - ������� ��� ��������� ���� ��������� �������. }

function G_IndexOfMax(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction; LastIndex: PInteger = nil): Integer;

{ ������� G_SearchMinMax ���������� ����������� ������� � ������� ����������
  ItemList ��� ��������� �������, � ������������ ������� ����� �������
  ���������� � ��������� MaxItem. Count - ����� ����� ��������� � �������.
  CompareFunction - ������� ��� ��������� ���� ��������� �������. }

function G_SearchMinMax(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction; out MaxItem: Pointer): Pointer;


{ ������� ��� ������������������ ������� ���������� }

{ G_Rotate ��������� ����������� ����� ������� ���������� ItemList, ����������
  �� Count ���������, ����� �������, ����� ������� � �������� Index � ���
  ��������� �� ��� �������� ��������� � ������ �������, � �������� �� ��������
  �� (Index - 1)-�� ��������� � ����� �������. }

procedure G_Rotate(ItemList: PPointerItemList; Index, Count: Integer);

{ G_RotateCopy ��������� ����������� ����� ������� ���������� ItemList,
  ���������� �� Count ���������, � �������� ��������� � ������ OutList
  ��� �� �����. ����������� ����� ����������� ����� �������, ����� �������
  � �������� Index � ��� ��������� �� ��� �������� ��������� � ������ �������,
  � �������� �� �������� �� (Index - 1)-�� ��������� � ����� �������. }

procedure G_RotateCopy(ItemList: PPointerItemList; Index, Count: Integer;
  OutList: PPointerItemList);

{ G_PartitionStrict ���������� ��� �������� ������� ���������� ItemList,
  ������� �������� Value, � ������ �������. ����� ����� ��������� ������������
  ��� ��������� �������. ��������� �������� ������������ � ����� �������.
  Count - ����� ����� ��������� � �������. MatchFunction - ������� ���
  ������������� �������� �������� �������. }

function G_PartitionStrict(Value: Pointer; ItemList: PPointerItemList;
  Count: Integer; MatchFunction: TMatchFunction): Integer;

{ G_PartitionUnstrict ���������� ��� �������� ������� ���������� ItemList,
  ������� ��� ������ �������� Value, � ������ �������. ����� ����� ���������
  ������������ ��� ��������� �������. ��������� �������� ������������ � �����
  �������. Count - ����� ����� ��������� � �������. MatchFunction - �������
  ��� ������������� �������� �������� �������. }

function G_PartitionUnstrict(Value: Pointer; ItemList: PPointerItemList;
  Count: Integer; MatchFunction: TMatchFunction): Integer;

{ G_StablePartitionStrict ���������� ��� �������� ������� ���������� ItemList,
  ������� �������� Value, � ������ �������. ����� ����� ��������� ������������
  ��� ��������� �������. ��������� �������� ������������ � ����� �������.
  � ������� �� ������� G_PartitionStrict, ������������� ������������ ���������,
  ������� Value, � ���������, ������� ��� ������ Value, �� ��������. Count -
  ����� ����� ��������� � �������. MatchFunction - ������� ��� �������������
  �������� �������� �������. }

function G_StablePartitionStrict(Value: Pointer; ItemList: PPointerItemList;
  Count: Integer; MatchFunction: TMatchFunction): Integer;

{ G_StablePartitionUnstrict ���������� ��� �������� ������� ����������
  ItemList, ������� ��� ������ �������� Value, � ������ �������. ����� �����
  ��������� ������������ ��� ��������� �������. ��������� �������� ������������
  � ����� �������. � ������� �� ������� G_PartitionUnstrict, �������������
  ������������ ���������, ������� ��� ������ Value, � ���������, ������� Value,
  �� ��������. � ���� ���������� ������ ������� ���������� ��������������
  ������. Count - ����� ����� ��������� � �������. MatchFunction - ������� ���
  ������������� �������� �������� �������. }

function G_StablePartitionUnstrict(Value: Pointer; ItemList: PPointerItemList;
  Count: Integer; MatchFunction: TMatchFunction): Integer;

{ G_SelectTop ���������� N ����������� ��������� ������� ���������� ItemList
  � ������ �������. Count - ����� ����� ��������� � �������. CompareFunction -
  ������� ��� ��������� ���� ��������� �������. }

procedure G_SelectTop(N: Integer; ItemList: PPointerItemList;
  Count: Integer; CompareFunction: TCompareFunction);

{ G_StableSelectTop ���������� N ����������� ��������� ������� ����������
  ItemList � ������ �������. Count - ����� ����� ��������� � �������.
  CompareFunction - ������� ��� ��������� ���� ��������� �������. � �������
  �� G_SelectTop, ��� ���������� ������ ��������� ������������� ������������
  N ����������� ��������� �� ��������. ����� ����������� �������������
  ������������ (Count - N) ������������ ��������� �������. � ���� ������
  ��������� ���������� �������������� ������. }

procedure G_StableSelectTop(N: Integer; ItemList: PPointerItemList;
  Count: Integer; CompareFunction: TCompareFunction);

{ G_RandomShuffle ������������ ��������� ������� ������ ���������� ItemList,
  ��������� �� Count ���������. ���������� ���������� ��������������� �����
  ���������� ���������� H. ���� � ���� ��������� �������� �������� nil,
  ��������� ���������� ����������� ��������� ����������, ����������������
  ��������� �� ���������, ������� ������������ ��� ������ �� ���������. }

procedure G_RandomShuffle(ItemList: PPointerItemList; Count: Integer;
  H: HMT = nil);


{ ������� ��� ���������� ������� ���������� }

{ G_Sort ��������� �� ����������� ������ ���������� ItemList, ��������� ��
  Count ���������. ������� ��� ��������� ���� ��������� ������� ����������
  ���������� CompareFunction. ������������ ����� ��������������� ����������. }

procedure G_Sort(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction);

{ G_StableSort ��������� �� ����������� ������ ���������� ItemList, ���������
  �� Count ���������. ������� ��� ��������� ���� ��������� ������� ����������
  ���������� CompareFunction. � ������� �� ��������� G_Sort, �������������
  ������������ ������ ��������� ������� �� ��������. � ���� ���������� ����
  ��������� ���������� �������������� ������. ����������� ����� ����������
  ��������. }

procedure G_StableSort(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction);

{ G_PartialSort ��������� �� ����������� N ����������� ��������� �������
  ���������� ItemList, ���������� �� Count ���������. ��������� ��������
  ������������ � ����� �������. ������� ��� ��������� ���� ��������� �������
  ���������� ���������� CompareFunction. ������������ ����� �������������
  ����������. }

procedure G_PartialSort(N: Integer; ItemList: PPointerItemList;
  Count: Integer; CompareFunction: TCompareFunction);

{ G_PartialSortCopy ��������� ������ OutList ������������ ���������� �������
  ���������� ItemList, ���������������� �� �����������. Count - ����� �����
  ��������� � ������� ItemList. OutCount - ������������ ����� ���������,
  ������� ����� ���� �������� � ������ OutList. CompareFunction - �������
  ��� ��������� ���� ��������� ������� ItemList. }

function G_PartialSortCopy(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction; OutList: PPointerItemList;
  OutCount: Integer): Integer;

{ G_IsSorted ���������� True, ���� ������ ���������� ItemList ��������
  ��������������� �� �����������. Count - ����� ��������� � �������.
  CompareFunction - ������� ��� ��������� ���� ���������. ���� � �������
  ���� ���� �� ���� ���� ���������, ��� ������� ���������� �������
  ���������� �� �����������, ������� ���������� False. }

function G_IsSorted(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction): Boolean;


{ ������� ��� ��������� ������ � ��������������� ������� ���������� }

{ ��������� ������� G_BinarySearch ��������� �������� ����� �������� Value
  � ������� ���������� ItemList, ��������� �� Count ���������. �������
  ���������� ������ �������� �������, �������� �������� ����� Value. ����
  � ������� ��� �������� � ����� ���������, ������� ���������� -1. ������
  ������ ���� ������������ �� �����������. ������� ��� �������������
  �������� �������� ������� ���������� ���������� MatchFunction. }

function G_BinarySearch(Value: Pointer; ItemList: PPointerItemList; Count: Integer;
  MatchFunction: TMatchFunction): Integer; overload;

{ ��������� ������� G_BinarySearch ��������� �������� ����� �������� Value
  � ������� ���������� ItemList, ��������� �� Count ���������. ���� � ����
  ���������� ������� ������ ������� �������, �������� �������� ����� Value,
  ������� ���������� True � ������ ���������� �������� � ��������� Index.
  ���� � ������� ��� �������� � ����� ���������, ������� ���������� False,
  � � ��������� Index ���������� ������ ��������, � ������� �������� �����
  ���� ��������� ������� �������� ��� ��������� ������� ����������. ������
  ������ ���� ������������ �� �����������. ������� ��� ������������� ��������
  �������� ������� ���������� ���������� MatchFunction. }

function G_BinarySearch(Value: Pointer; ItemList: PPointerItemList; Count: Integer;
  MatchFunction: TMatchFunction; out Index: Integer): Boolean; overload;

{ G_SearchFirstGreater ���������� ������ ������� �������� � ������� ����������
  ItemList, �������� �������� ������ Value. Count - ����� ��������� � �������.
  MatchFunction - ������� ��� ������������� �������� �������� �������. ����
  � ������� ��� ��������, �������� Value, ������� ���������� Count. ��������
  ������� ItemList ������ ���� ������������� �� �����������. }

function G_SearchFirstGreater(Value: Pointer; ItemList: PPointerItemList;
  Count: Integer; MatchFunction: TMatchFunction): Integer;

{ G_SearchFirstGreaterOrEqual ���������� ������ ������� �������� � �������
  ���������� ItemList, �������� �������� ������ ��� ����� Value. Count - �����
  ��������� � �������. MatchFunction - ������� ��� ������������� ��������
  �������� �������. ���� � ������� ��� ��������, �������� ��� ������� Value,
  ������� ���������� Count. �������� ������� ItemList ������ ���� �������������
  �� �����������. }

function G_SearchFirstGreaterOrEqual(Value: Pointer; ItemList: PPointerItemList;
  Count: Integer; MatchFunction: TMatchFunction): Integer;

{ G_SearchLastLesser ���������� ������ ���������� �������� � �������
  ���������� ItemList, �������� �������� ������ Value. Count - ����� ���������
  � �������. MatchFunction - ������� ��� ������������� �������� ��������
  �������. ���� � ������� ��� ��������, �������� Value, ������� ���������� -1.
  �������� ������� ItemList ������ ���� ������������� �� �����������. }

function G_SearchLastLesser(Value: Pointer; ItemList: PPointerItemList;
  Count: Integer; MatchFunction: TMatchFunction): Integer;

{ G_SearchLastLesserOrEqual ���������� ������ ���������� �������� � �������
  ���������� ItemList, �������� �������� ������ ��� ����� Value. Count - �����
  ��������� � �������. MatchFunction - ������� ��� ������������� ��������
  �������� �������. ���� � ������� ��� ��������, �������� ��� ������� Value,
  ������� ���������� -1. �������� ������� ItemList ������ ���� �������������
  �� �����������. }

function G_SearchLastLesserOrEqual(Value: Pointer; ItemList: PPointerItemList;
  Count: Integer; MatchFunction: TMatchFunction): Integer;


{ ������� ��� ������� ������������� �������� ���������� }

{ G_Merge ��������� �� ���� ��������������� �� ����������� �������� ����������
  ����� ������, ��������� �� ���� ��������� �������� ��������, ������� �����
  ����� ������������ �� �����������. ItemList1 - ����� ������� �������. Count1
  - ����� ��������� � ������ �������. ItemList2 - ����� ������� �������. Count2
  - ����� ��������� �� ������ �������. OutList - ����� �������, � �������
  ����������� ��������� ������� ��������. ������� ���������� ����� ���������,
  ���������� � �������� ������. ������� ��� ��������� ���� ��������� ��������
  ���������� ���������� CompareFunction. }

function G_Merge(ItemList1: PPointerItemList; Count1: Integer;
  ItemList2: PPointerItemList; Count2: Integer; CompareFunction: TCompareFunction;
  OutList: PPointerItemList): Integer;

{ G_SetContainedIn ���������� True, ���� ��� �������� ������� �������
  ItemList1 ������ Count1 ��������� ������������ �� ������ ������� ItemList2
  ������ Count2 ���������. ���� � ������ ������� ���� �����-���� ��������,
  ������������� �� ������ �������, ������� ���������� False. ������� ItemList1
  � ItemList2 ������ ���� ������������� �� �����������. ������� ��� ���������
  ���� ��������� �������� ���������� ���������� CompareFunction. }

function G_SetContainedIn(ItemList1: PPointerItemList; Count1: Integer;
  ItemList2: PPointerItemList; Count2: Integer; CompareFunction: TCompareFunction): Boolean;

{ G_SetIntersectsWith ���������� True, ������ ������ ItemList1 ������ Count1
  �������� �����-���� ��������, �������������� �� ������ ������� ItemList2
  ������ Count2 ���������. ���� � �������� ��� ������ ���������, �������
  ���������� False. ������� ItemList1 � ItemList2 ������ ���� �������������
  �� �����������. ������� ��� ��������� ���� ��������� �������� ����������
  ���������� CompareFunction. }

function G_SetIntersectsWith(ItemList1: PPointerItemList; Count1: Integer;
  ItemList2: PPointerItemList; Count2: Integer; CompareFunction: TCompareFunction): Boolean;

{ G_SetUnion ��������� �� ���� �������� ���������� ����� ������, ���������
  �� ���������, ������� ������������ ���� �� � ����� �� �������� ��������.
  ItemList1 - ����� ������� �������. Count1 - ����� ��������� � ������ �������.
  ItemList2 - ����� ������� �������. Count2 - ����� ��������� �� ������
  �������. OutList - ����� �������, � ������� ����������� ��������� �����������
  ��������. ������� ���������� ����� ���������, ���������� � �������� ������.
  ������� ItemList1 � ItemList2 ������ ���� ������������� �� �����������.
  ������� ��� ��������� ���� ��������� �������� ���������� ����������
  CompareFunction. ���� � ��������� OutList �������� �������� nil, �������
  ������ ���������� ����� ���������, ������� ������ ���� �������� � ��������
  ������. }

function G_SetUnion(ItemList1: PPointerItemList; Count1: Integer;
  ItemList2: PPointerItemList; Count2: Integer; CompareFunction: TCompareFunction;
  OutList: PPointerItemList = nil): Integer;

{ G_SetIntersection ��������� �� ���� �������� ���������� ����� ������,
  ��������� �� ���������, ������� ������������ � ����� �������� ��������.
  ItemList1 - ����� ������� �������. Count1 - ����� ��������� � ������ �������.
  ItemList2 - ����� ������� �������. Count2 - ����� ��������� �� ������
  �������. OutList - ����� �������, � ������� ����������� ��������� �����������
  ��������. ������� ���������� ����� ���������, ���������� � �������� ������.
  ������� ItemList1 � ItemList2 ������ ���� ������������� �� �����������.
  ������� ��� ��������� ���� ��������� �������� ���������� ����������
  CompareFunction. ���� � ��������� OutList �������� �������� nil, �������
  ������ ���������� ����� ���������, ������� ������ ���� �������� � ��������
  ������. }

function G_SetIntersection(ItemList1: PPointerItemList; Count1: Integer;
  ItemList2: PPointerItemList; Count2: Integer; CompareFunction: TCompareFunction;
  OutList: PPointerItemList = nil): Integer;

{ G_SetDifference ��������� �� ���� �������� ���������� ����� ������,
  ��������� �� ���������, ������� ������������ ������ �������, �� �����������
  �� ������. ItemList1 - ����� ������� �������. Count1 - ����� ���������
  � ������ �������. ItemList2 - ����� ������� �������. Count2 - ����� ���������
  �� ������ �������. OutList - ����� �������, � ������� ����������� ������ -
  ��������� �������� ��������. ������� ���������� ����� ���������, ����������
  � �������� ������. ������� ItemList1 � ItemList2 ������ ���� �������������
  �� �����������. ������� ��� ��������� ���� ��������� �������� ����������
  ���������� CompareFunction. ���� � ��������� OutList �������� �������� nil,
  ������� ������ ���������� ����� ���������, ������� ������ ���� ��������
  � �������� ������. }

function G_SetDifference(ItemList1: PPointerItemList; Count1: Integer;
  ItemList2: PPointerItemList; Count2: Integer; CompareFunction: TCompareFunction;
  OutList: PPointerItemList = nil): Integer;

{ G_SetSymmetricDifference ��������� �� ���� �������� ���������� ����� ������,
  ��������� �� ���������, ������� ������������ ������ � ����� �� ��������
  ��������. ��������, �������������� � ����� �������� ��������, ��� ����
  ������������. ItemList1 - ����� ������� �������. Count1 - ����� ���������
  � ������ �������. ItemList2 - ����� ������� �������. Count2 - ����� ���������
  �� ������ �������. OutList - ����� �������, � ������� ����������� ������ -
  ��������� �������� XOR ��������. ������� ���������� ����� ���������,
  ���������� � �������� ������. ������� ItemList1 � ItemList2 ������ ����
  ������������� �� �����������. ������� ��� ��������� ���� ��������� ��������
  ���������� ���������� CompareFunction. ���� � ��������� OutList ��������
  �������� nil, ������� ������ ���������� ����� ���������, ������� ������ ����
  �������� � �������� ������. }

function G_SetSymmetricDifference(ItemList1: PPointerItemList; Count1: Integer;
  ItemList2: PPointerItemList; Count2: Integer; CompareFunction: TCompareFunction;
  OutList: PPointerItemList = nil): Integer;


{ ������� ��� ������ � ����� }

{ ����� ���������� �������� ������, ������������� � ���� �����������������
  ������ ���������, ������� �������� ����� ������� ����������: ������ �������
  ������ �������� ������������, ���������� � �������� ��������� ������������
  � ��������������� ����������. �������� ������� ���� ������ ��������� ������
  ������ ��� ����� �������� ������� �� ��� �������� �����. }

{ G_MakeHeap ����������������� ������ ���������� ItemList, ��������� ��
  Count ���������, ����� �������, ����� ����� ��������� ����������� �����
  ����, �.�. �������� ������� �������� ���� ������ ��� ����� �������� �������
  �� ��� �������� ���������. ������� ��� ��������� ���� ��������� �������
  ���������� ���������� CompareFunction. }

procedure G_MakeHeap(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction);

{ G_PushHeap �������� � ���� ����� �������. ����� ���� ���������� ����������
  ItemList, ����� ��������� � ������� - ���������� Count. ��������������,
  ��� ��������� ������� �������, �.�. ������� ItemList^[Count - 1], ��������
  �������� ������� ����. �� ����������� �� ��������������� ��� �����. �������
  ���������� ������ �������� �������, � ������� ��� ��������� ���������,
  �.�. �����������, �������. ������� ��� ��������� ���� ��������� ����������
  ���������� CompareFunction. }

function G_PushHeap(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction): Integer;

{ ��������� ������� G_PopHeap ��������� �� ���� ������, �.�. ������������,
  �������, ������� ������������ ��� ��������� �������. ������������,
  ������� ���������� ��������� ������� � ����� �������. ����� ���� ����������
  ���������� ItemList, ����� ��������� � ���� - ���������� Count. �����
  ������ ������ ������� ������ ���� ������� ��������� �� 1, �.�. ���������
  �������, ��������, �������� ������� ����. ������� ��� ��������� ����
  ��������� ���������� ���������� CompareFunction. }

function G_PopHeap(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction): Pointer; overload;

{ ��������� ������� G_PopHeap ��������� �� ���� ������� � �������� Index,
  ������� ������������ ��� ��������� �������. ������������, ������� ����������
  ��������� ������� � ����� �������. ����� ���� ���������� ���������� ItemList,
  ����� ��������� � ���� - ���������� Count. ����� ������ ������ ������� ������
  ���� ������� ��������� �� 1, �.�. ��������� �������, ��������, ��������
  ������� ����. ������� ��� ��������� ���� ��������� ���������� ����������
  CompareFunction. }

function G_PopHeap(Index: Integer; ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction): Pointer; overload;

{ G_SortHeap ��������� �������� ���� �� �����������. ����� ���� ����������
  ���������� ItemList, ����� ��������� � ���� - ���������� Count. ������� ���
  ��������� ���� ��������� ���������� ���������� CompareFunction. ���������
  G_SortHeap, ����������, ��������� ����� ������������� ����������. }

procedure G_SortHeap(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction);

{ G_IsHeap ���������� True, ���� ������ ���������� ItemList, ��������� ��
  Count ���������, ������������ ����� ����, �.�. �������� ������� ��������
  ������ ��� ����� �������� ������� �� ��� �������� ���������. ���� ������
  ������� �� ����������� ��� ������-���� �������� �������, �������
  ���������� False. �������� ������� ������������ ����� ����� � �������
  �������, ������������ ���������� CompareFunction. }

function G_IsHeap(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction): Boolean;

implementation

uses Windows, AcedCommon, AcedStrings;

{ ������� ��� ������, ������, �������� � �������� ��������� ������� ���������� }

function G_Search(Value: Pointer; ItemList: PPointerItemList; Count: Integer;
  MatchFunction: TMatchFunction): Integer;
var
  I: Integer;
begin
  Result := -1;
  I := 0;
  while I < Count do
  begin
    if MatchFunction(Value, ItemList^[I]) = 0 then
    begin
      Result := I;
      Exit;
    end;
    Inc(I);
  end;
end;

function G_SearchBackward(Value: Pointer; ItemList: PPointerItemList;
  Count: Integer; MatchFunction: TMatchFunction): Integer;
var
  I: Integer;
begin
  Result := -1;
  I := Count - 1;
  while I >= 0 do
  begin
    if MatchFunction(Value, ItemList^[I]) = 0 then
    begin
      Result := I;
      Exit;
    end;
    Dec(I);
  end;
end;

function G_Replace(Value, NewP: Pointer; ItemList: PPointerItemList;
  Count: Integer; MatchFunction: TMatchFunction): Integer;
var
  I: Integer;
begin
  Result := 0;
  I := 0;
  while I < Count do
  begin
    if MatchFunction(Value, ItemList^[I]) = 0 then
    begin
      ItemList^[I] := NewP;
      Inc(Result);
    end;
    Inc(I);
  end;
end;

function G_CountOf(Value: Pointer; ItemList: PPointerItemList; Count: Integer;
  MatchFunction: TMatchFunction): Integer;
var
  I: Integer;
begin
  Result := 0;
  I := 0;
  while I < Count do
  begin
    if MatchFunction(Value, ItemList^[I]) = 0 then
      Inc(Result);
    Inc(I);
  end;
end;

function G_CountOfUnique(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction): Integer;
var
  I: Integer;
begin
  Result := 0;
  if Count > 0 then
  begin
    I := 1;
    Result := I;
    while I < Count do
    begin
      if CompareFunction(ItemList^[I - 1], ItemList^[I]) <> 0 then
        Inc(Result);
      Inc(I);
    end;
  end;
end;

function G_RemoveCopy(Value: Pointer; ItemList: PPointerItemList; Count: Integer;
  MatchFunction: TMatchFunction; OutList: PPointerItemList): Integer;
var
  I: Integer;
begin
  Result := Integer(OutList);
  I := 0;
  while I < Count do
  begin
    if MatchFunction(Value, ItemList^[I]) <> 0 then
    begin
      PPointer(OutList)^ := ItemList^[I];
      Inc(LongWord(OutList), SizeOf(Pointer));
    end;
    Inc(I);
  end;
  Result := (LongWord(OutList) - LongWord(Result)) shr 2;
end;

function G_UniqueCopy(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction; OutList: PPointerItemList): Integer;
var
  I: Integer;
begin
  Result := Integer(OutList);
  if Count > 0 then
  begin
    PPointer(OutList)^ := ItemList^[0];
    Inc(LongWord(OutList), SizeOf(Pointer));
    I := 1;
    while I < Count do
    begin
      if CompareFunction(ItemList^[I - 1], ItemList^[I]) <> 0 then
      begin
        PPointer(OutList)^ := ItemList^[I];
        Inc(LongWord(OutList), SizeOf(Pointer));
      end;
      Inc(I);
    end;
  end;
  Result := (LongWord(OutList) - LongWord(Result)) shr 2;
end;

{ ������� ��� ������ ������������ � ������������� ��������� ������� }

function G_SearchMin(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction): Pointer;
var
  I: Integer;
begin
  if Count = 0 then
    Result := nil
  else
  begin
    Result := ItemList^[0];
    I := 1;
    while I < Count do
    begin
      if CompareFunction(Result, ItemList^[I]) > 0 then
        Result := ItemList^[I];
      Inc(I);
    end;
  end;
end;

function G_SearchMin(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction; out N: Integer): Pointer;
var
  I, J, C: Integer;
begin
  if Count = 0 then
  begin
    Result := nil;
    J := 0;
  end else
  begin
    Result := ItemList^[0];
    I := 1;
    J := I;
    while I < Count do
    begin
      C := CompareFunction(Result, ItemList^[I]);
      if C >= 0 then
        if C = 0 then
          Inc(J)
        else
        begin
          Result := ItemList^[I];
          J := 1;
        end;
      Inc(I);
    end;
  end;
  N := J;
end;

function G_IndexOfMin(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction; LastIndex: PInteger): Integer;
var
  I, J1, J2, C: Integer;
  P: Pointer;
begin
  if Count = 0 then
  begin
    if LastIndex <> nil then
      LastIndex^ := -1;
    Result := -1;
  end else
  begin
    J1 := 0;
    J2 := 0;
    P := ItemList^[0];
    I := 1;
    while I < Count do
    begin
      C := CompareFunction(P, ItemList^[I]);
      if C >= 0 then
        if C = 0 then
          J2 := I
        else
        begin
          J1 := I;
          J2 := I;
          P := ItemList^[I];
        end;
      Inc(I);
    end;
    if LastIndex <> nil then
      LastIndex^ := J2;
    Result := J1;
  end;
end;

function G_SearchMax(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction): Pointer;
var
  I: Integer;
begin
  if Count = 0 then
    Result := nil
  else
  begin
    Result := ItemList^[0];
    I := 1;
    while I < Count do
    begin
      if CompareFunction(Result, ItemList^[I]) < 0 then
        Result := ItemList^[I];
      Inc(I);
    end;
  end;
end;

function G_SearchMax(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction; out N: Integer): Pointer;
var
  I, J, C: Integer;
begin
  if Count = 0 then
  begin
    Result := nil;
    J := 0;
  end else
  begin
    Result := ItemList^[0];
    I := 1;
    J := I;
    while I < Count do
    begin
      C := CompareFunction(Result, ItemList^[I]);
      if C <= 0 then
        if C = 0 then
          Inc(J)
        else
        begin
          Result := ItemList^[I];
          J := 1;
        end;
      Inc(I);
    end;
  end;
  N := J;
end;

function G_IndexOfMax(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction; LastIndex: PInteger): Integer;
var
  I, J1, J2, C: Integer;
  P: Pointer;
begin
  if Count = 0 then
  begin
    if LastIndex <> nil then
      LastIndex^ := -1;
    Result := -1;
  end else
  begin
    J1 := 0;
    J2 := 0;
    P := ItemList^[0];
    I := 1;
    while I < Count do
    begin
      C := CompareFunction(P, ItemList^[I]);
      if C <= 0 then
        if C = 0 then
          J2 := I
        else
        begin
          J1 := I;
          J2 := I;
          P := ItemList^[I];
        end;
      Inc(I);
    end;
    if LastIndex <> nil then
      LastIndex^ := J2;
    Result := J1;
  end;
end;

function G_SearchMinMax(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction; out MaxItem: Pointer): Pointer;
var
  I: Integer;
  PMin, PMax: Pointer;
begin
  if Count = 0 then
  begin
    MaxItem := nil;
    Result := nil;
  end else
  begin
    PMin := ItemList^[0];
    PMax := PMin;
    I := 1;
    Dec(Count);
    while I < Count do
    begin
      if CompareFunction(ItemList^[I], ItemList^[I + 1]) < 0 then
      begin
        if CompareFunction(PMin, ItemList^[I]) > 0 then
          PMin := ItemList^[I];
        if CompareFunction(PMax, ItemList^[I + 1]) < 0 then
          PMax := ItemList^[I + 1];
      end else
      begin
        if CompareFunction(PMin, ItemList^[I + 1]) > 0 then
          PMin := ItemList^[I + 1];
        if CompareFunction(PMax, ItemList^[I]) < 0 then
          PMax := ItemList^[I];
      end;
      Inc(I, 2);
    end;
    if I = Count then
      if CompareFunction(PMax, ItemList^[I]) < 0 then
        PMax := ItemList^[I]
      else if CompareFunction(PMin, ItemList^[I]) > 0 then
        PMin := ItemList^[I];
    MaxItem := PMax;
    Result := PMin;
  end;
end;

{ ������� ��� ������������������ ������� ���������� }

procedure G_Rotate(ItemList: PPointerItemList; Index, Count: Integer);
var
  L: Integer;
begin
  if (Index > 0) and (Index < Count) then
  begin
    L := Count - Index;
    if Index = L then
      G_SwapLongs(ItemList, @ItemList^[Index], L)
    else
    begin
      G_ReverseLongs(ItemList, Index);
      G_ReverseLongs(@ItemList^[Index], L);
      G_ReverseLongs(ItemList, Count);
    end;
  end;
end;

procedure G_RotateCopy(ItemList: PPointerItemList; Index, Count: Integer;
  OutList: PPointerItemList);
begin
  if (Index = 0) or (Index >= Count) then
    G_CopyLongs(ItemList, OutList, Count)
  else
  begin
    Dec(Count, Index);
    G_CopyLongs(@ItemList^[Index], OutList, Count);
    G_CopyLongs(ItemList, @OutList^[Count], Index);
  end;
end;

function G_PartitionStrict(Value: Pointer; ItemList: PPointerItemList;
  Count: Integer; MatchFunction: TMatchFunction): Integer;
var
  P: Pointer;
begin
  Result := 0;
  repeat
    repeat
      if Result = Count then
        Exit;
      if MatchFunction(Value, ItemList^[Result]) > 0 then
        Inc(Result)
      else
        Break;
    until False;
    Dec(Count);
    repeat
      if Result = Count then
        Exit;
      if MatchFunction(Value, ItemList^[Count]) <= 0 then
        Dec(Count)
      else
        Break;
    until False;
    P := ItemList^[Result];
    ItemList^[Result] := ItemList^[Count];
    ItemList^[Count] := P;
    Inc(Result);
  until False;
end;

function G_PartitionUnstrict(Value: Pointer; ItemList: PPointerItemList;
  Count: Integer; MatchFunction: TMatchFunction): Integer;
var
  P: Pointer;
begin
  Result := 0;
  repeat
    repeat
      if Result = Count then
        Exit;
      if MatchFunction(Value, ItemList^[Result]) >= 0 then
        Inc(Result)
      else
        Break;
    until False;
    Dec(Count);
    repeat
      if Result = Count then
        Exit;
      if MatchFunction(Value, ItemList^[Count]) < 0 then
        Dec(Count)
      else
        Break;
    until False;
    P := ItemList^[Result];
    ItemList^[Result] := ItemList^[Count];
    ItemList^[Count] := P;
    Inc(Result);
  until False;
end;

function G_StablePartitionStrict(Value: Pointer; ItemList: PPointerItemList;
  Count: Integer; MatchFunction: TMatchFunction): Integer;
var
  Buffer: PPointerItemList;
  I, L: Integer;
begin
  GetMem(Buffer, Count * SizeOf(Pointer));
  Result := 0;
  L := 0;
  I := 0;
  while I < Count do
  begin
    if MatchFunction(Value, ItemList^[I]) > 0 then
    begin
      ItemList^[Result] := ItemList^[I];
      Inc(Result);
    end else
    begin
      Buffer^[L] := ItemList^[I];
      Inc(L);
    end;
    Inc(I);
  end;
  G_CopyLongs(Buffer, @ItemList^[Result], L);
  FreeMem(Buffer);
end;

function G_StablePartitionUnstrict(Value: Pointer; ItemList: PPointerItemList;
  Count: Integer; MatchFunction: TMatchFunction): Integer;
var
  Buffer: PPointerItemList;
  I, L: Integer;
begin
  GetMem(Buffer, Count * SizeOf(Pointer));
  Result := 0;
  L := 0;
  I := 0;
  while I < Count do
  begin
    if MatchFunction(Value, ItemList^[I]) >= 0 then
    begin
      ItemList^[Result] := ItemList^[I];
      Inc(Result);
    end else
    begin
      Buffer^[L] := ItemList^[I];
      Inc(L);
    end;
    Inc(I);
  end;
  G_CopyLongs(Buffer, @ItemList^[Result], L);
  FreeMem(Buffer);
end;

procedure IntSort3(ItemList: PPointerItemList; CompareFunction: TCompareFunction);
asm
        PUSH    EBX
        PUSH    ESI
        PUSH    EDI
        PUSH    EBP
        MOV     EBX,EAX
        MOV     EDI,[EBX+4]
        MOV     ESI,EDX
        MOV     EBP,[EBX+8]
        MOV     EDX,EDI
        MOV     EAX,[EBX]
        CALL    ESI
        TEST    EAX,EAX
        JNLE    @@m2
        MOV     EAX,EDI
        MOV     EDX,EBP
        CALL    ESI
        TEST    EAX,EAX
        JLE     @@qt
        MOV     EAX,[EBX]
        MOV     EDX,EBP
        CALL    ESI
        TEST    EAX,EAX
        JNLE    @@m1
        MOV     [EBX+4],EBP
        MOV     [EBX+8],EDI
        JMP     @@qt
@@m1:   MOV     [EBX+8],EDI
        MOV     EAX,[EBX]
        MOV     [EBX],EBP
        MOV     [EBX+4],EAX
        JMP     @@qt
@@m2:   MOV     EAX,[EBX]
        MOV     EDX,EBP
        CALL    ESI
        TEST    EAX,EAX
        JNLE    @@m3
        MOV     EAX,[EBX]
        MOV     [EBX],EDI
        MOV     [EBX+4],EAX
        JMP     @@qt
@@m3:   MOV     EAX,EDI
        MOV     EDX,EBP
        CALL    ESI
        MOV     ECX,[EBX]
        MOV     [EBX+8],ECX
        TEST    EAX,EAX
        JNLE    @@m4
        MOV     [EBX],EDI
        MOV     [EBX+4],EBP
        JMP     @@qt
@@m4:   MOV     [EBX],EBP
@@qt:   POP     EBP
        POP     EDI
        POP     ESI
        POP     EBX
end;

procedure IntSort4(ItemList: PPointerItemList; CompareFunction: TCompareFunction);
asm
        PUSH    EBX
        PUSH    ESI
        PUSH    EDI
        MOV     EBX,EAX
        MOV     EAX,[EAX]
        MOV     ESI,EDX
        MOV     EDX,[EBX+4]
        CALL    ESI
        TEST    EAX,EAX
        JLE     @@nx1
        MOV     EAX,[EBX]
        MOV     EDX,[EBX+4]
        MOV     [EBX],EDX
        MOV     [EBX+4],EAX
@@nx1:  MOV     EAX,[EBX+8]
        MOV     EDX,[EBX+12]
        CALL    ESI
        TEST    EAX,EAX
        JLE     @@nx2
        MOV     EAX,[EBX+8]
        MOV     EDX,[EBX+12]
        MOV     [EBX+8],EDX
        MOV     [EBX+12],EAX
@@nx2:  MOV     EAX,[EBX]
        MOV     EDX,[EBX+8]
        CALL    ESI
        MOV     EDX,[EBX+12]
        MOV     EDI,EAX
        MOV     EAX,[EBX+4]
        CALL    ESI
        TEST    EAX,EAX
        JNLE    @@m2
        TEST    EDI,EDI
        JNLE    @@m1
        MOV     EAX,[EBX+4]
        MOV     EDX,[EBX+8]
        CALL    ESI
        TEST    EAX,EAX
        JLE     @@qt
        MOV     EAX,[EBX+4]
        MOV     EDX,[EBX+8]
        MOV     [EBX+4],EDX
        MOV     [EBX+8],EAX
        JMP     @@qt
@@m1:   MOV     EAX,[EBX]
        MOV     EDX,[EBX+8]
        MOV     [EBX],EDX
        MOV     EDX,[EBX+4]
        MOV     [EBX+4],EAX
        MOV     [EBX+8],EDX
        JMP     @@qt
@@m2:   TEST    EDI,EDI
        JNLE    @@m3
        MOV     EAX,[EBX+4]
        MOV     EDX,[EBX+8]
        MOV     [EBX+4],EDX
        MOV     EDX,[EBX+12]
        MOV     [EBX+8],EDX
        MOV     [EBX+12],EAX
        JMP     @@qt
@@m3:   MOV     EAX,[EBX]
        MOV     EDX,[EBX+12]
        CALL    ESI
        MOV     ECX,[EBX]
        MOV     EDX,[EBX+4]
        MOV     EDI,[EBX+8]
        MOV     [EBX],EDI
        MOV     EDI,[EBX+12]
        MOV     [EBX+12],EDX
        TEST    EAX,EAX
        JNLE    @@m4
        MOV     [EBX+4],ECX
        MOV     [EBX+8],EDI
        JMP     @@qt
@@m4:   MOV     [EBX+4],EDI
        MOV     [EBX+8],ECX
@@qt:   POP     EDI
        POP     ESI
        POP     EBX
end;

procedure IntTinySort(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction);
begin
  if Count > 2 then
  begin
    if Count = 4 then
      IntSort4(ItemList, CompareFunction)
    else
      IntSort3(ItemList, CompareFunction)
  end
  else if (Count = 2) and (CompareFunction(ItemList^[0], ItemList^[1]) > 0) then
  begin
    Count := Integer(ItemList^[0]);
    ItemList^[0] := ItemList^[1];
    ItemList^[1] := Pointer(Count);
  end;
end;

procedure G_SelectTop(N: Integer; ItemList: PPointerItemList;
  Count: Integer; CompareFunction: TCompareFunction);
label
  99;
var
  L, H, QL: Integer;
  P, T: Pointer;
begin
  if (N = 0) or (N >= Count) then
    Exit;
  L := 0;
  H := Count;
  QL := L;
  while H - L > 4 do
  begin
    P := ItemList^[(L + H) shr 1];
    T := ItemList^[H - 1];
    if CompareFunction(ItemList^[L], P) <= 0 then
    begin
      if CompareFunction(P, T) > 0 then
        if CompareFunction(ItemList^[L], T) <= 0 then
          P := T
        else
          P := ItemList^[L];
    end
    else if CompareFunction(ItemList^[L], T) <= 0 then
      P := ItemList^[L]
    else if CompareFunction(P, T) <= 0 then
      P := T;
    repeat
      repeat
        if L = H then
          goto 99;
        if CompareFunction(P, ItemList^[L]) > 0 then
          Inc(L)
        else
          Break;
      until False;
      Dec(H);
      repeat
        if L = H then
          goto 99;
        if CompareFunction(P, ItemList^[H]) <= 0 then
          Dec(H)
        else
          Break;
      until False;
      T := ItemList^[L];
      ItemList^[L] := ItemList^[H];
      ItemList^[H] := T;
      Inc(L);
    until False;
  99:
    if L <= N then
      QL := L
    else
      Count := L;
    L := QL;
    H := Count;
  end;
  IntTinySort(@ItemList^[L], H - L, CompareFunction);
end;

procedure G_StableSelectTop(N: Integer; ItemList: PPointerItemList;
  Count: Integer; CompareFunction: TCompareFunction);
var
  L, B, I, C: Integer;
  Buffer: PPointerItemList;
  P: Pointer;
begin
  if (N = 0) or (N >= Count) then
    Exit;
  GetMem(Buffer, Count * SizeOf(Pointer));
  G_CopyLongs(ItemList, Buffer, Count);
  G_SelectTop(N, Buffer, Count, CompareFunction);
  P := G_SearchMax(Buffer, N, CompareFunction, N);
  L := 0;
  B := 0;
  I := 0;
  while I < Count do
  begin
    C := CompareFunction(P, ItemList^[I]);
    if C > 0 then
    begin
      ItemList^[L] := ItemList^[I];
      Inc(L);
    end
    else if (C < 0) or (N = 0) then
    begin
      Buffer^[B] := ItemList^[I];
      Inc(B);
    end else
    begin
      ItemList^[L] := ItemList^[I];
      Inc(L);
      Dec(N);
    end;
    Inc(I);
  end;
  G_CopyLongs(Buffer, @ItemList^[L], B);
  FreeMem(Buffer);
end;

procedure G_RandomShuffle(ItemList: PPointerItemList; Count: Integer; H: HMT);
var
  I, R: Integer;
  P: Pointer;
  G: Boolean;
begin
  if H = nil then
  begin
    G_RandomInit(H);
    G := True;
  end else
    G := False;
  I := 1;
  while I < Count do
  begin
    R := G_RandomUInt32(H, I + 1);
    P := ItemList^[R];
    ItemList^[R] := ItemList^[I];
    ItemList^[I] := P;
    Inc(I);
  end;
  if G then
    G_RandomDone(H);
end;

{ ������� ��� ���������� ������� ���������� }

procedure IntRotateRight(P: Pointer; Count: Cardinal);
asm
        MOV     ECX,[EAX+EDX*4]
        JMP     DWORD PTR @@wV[EDX*4]
@@wV :  DD      @@w00, @@w01, @@w02, @@w03
        DD      @@w04, @@w05, @@w06, @@w07
        DD      @@w08, @@w09, @@w10, @@w11
        DD      @@w12, @@w13, @@w14, @@w15
@@w15:  MOV     EDX,[EAX+56]
        MOV     [EAX+60],EDX
@@w14:  MOV     EDX,[EAX+52]
        MOV     [EAX+56],EDX
@@w13:  MOV     EDX,[EAX+48]
        MOV     [EAX+52],EDX
@@w12:  MOV     EDX,[EAX+44]
        MOV     [EAX+48],EDX
@@w11:  MOV     EDX,[EAX+40]
        MOV     [EAX+44],EDX
@@w10:  MOV     EDX,[EAX+36]
        MOV     [EAX+40],EDX
@@w09:  MOV     EDX,[EAX+32]
        MOV     [EAX+36],EDX
@@w08:  MOV     EDX,[EAX+28]
        MOV     [EAX+32],EDX
@@w07:  MOV     EDX,[EAX+24]
        MOV     [EAX+28],EDX
@@w06:  MOV     EDX,[EAX+20]
        MOV     [EAX+24],EDX
@@w05:  MOV     EDX,[EAX+16]
        MOV     [EAX+20],EDX
@@w04:  MOV     EDX,[EAX+12]
        MOV     [EAX+16],EDX
@@w03:  MOV     EDX,[EAX+8]
        MOV     [EAX+12],EDX
@@w02:  MOV     EDX,[EAX+4]
        MOV     [EAX+8],EDX
@@w01:  MOV     EDX,[EAX]
        MOV     [EAX+4],EDX
@@w00:  MOV     [EAX],ECX
end;

procedure IntInsertionSort(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction);
var
  I, J: Integer;
begin
  I := 1;
  while I < Count do
  begin
    J := I - 1;
    while J >= 0 do
    begin
      if CompareFunction(ItemList^[I], ItemList^[J]) >= 0 then
        Break;
      Dec(J);
    end;
    Inc(J);
    if I <> J then
      IntRotateRight(@ItemList^[J], I - J);
    Inc(I);
  end;
end;

procedure IntroSort(L, R: Integer; ItemList: PPointerItemList;
  CompareFunction: TCompareFunction; DepthLimit: Integer);
var
  I, J: Integer;
  P, T: Pointer;
begin
  I := L;
  J := R;
  if DepthLimit = 0 then
  begin
    Dec(J, I);
    G_MakeHeap(@ItemList^[I], J + 1, CompareFunction);
    G_SortHeap(@ItemList^[I], J + 1, CompareFunction);
    Exit;
  end;
  Dec(DepthLimit);
  P := ItemList^[(I + J) shr 1];
  if CompareFunction(ItemList^[I], P) <= 0 then
  begin
    if CompareFunction(P, ItemList^[J]) > 0 then
      if CompareFunction(ItemList^[I], ItemList^[J]) <= 0 then
        P := ItemList^[J]
      else
        P := ItemList^[I];
  end
  else if CompareFunction(ItemList^[I], ItemList^[J]) <= 0 then
    P := ItemList^[I]
  else if CompareFunction(P, ItemList^[J]) <= 0 then
    P := ItemList^[J];
  repeat
    while CompareFunction(ItemList^[I], P) < 0 do Inc(I);
    while CompareFunction(ItemList^[J], P) > 0 do Dec(J);
    if I <= J then
    begin
      T := ItemList^[I];
      ItemList^[I] := ItemList^[J];
      ItemList^[J] := T;
      Inc(I);
      Dec(J);
    end;
  until I > J;
  if J - L > 15 then
    IntroSort(L, J, ItemList, CompareFunction, DepthLimit)
  else
    IntInsertionSort(@ItemList^[L], J - L + 1, CompareFunction);
  if R - I > 15 then
    IntroSort(I, R, ItemList, CompareFunction, DepthLimit)
  else
    IntInsertionSort(@ItemList^[I], R - I + 1, CompareFunction);
end;

procedure G_Sort(ItemList: PPointerItemList; Count: Integer; CompareFunction: TCompareFunction);
begin
  if Count < 17 then
  begin
    IntInsertionSort(ItemList, Count, CompareFunction);
    Exit;
  end;
  IntroSort(0, Count - 1, ItemList, CompareFunction, G_Log2(Count) * 2);
end;

procedure IntMergeLoop(InList, OutList: PPointerItemList; Step, Count: Integer;
  CompareFunction: TCompareFunction);
var
  I1, I2, DoubleStep: Integer;
begin
  DoubleStep := Step * 2;
  repeat
    if Count < DoubleStep then
      if Count > Step then
        DoubleStep := Count
      else
      begin
        G_CopyLongs(InList, OutList, Count);
        Break;
      end;
    I1 := 0;
    I2 := Step;
    repeat
      if CompareFunction(InList^[I1], InList^[I2]) <= 0 then
      begin
        PPointer(OutList)^ := InList^[I1];
        Inc(I1);
        Inc(LongWord(OutList), SizeOf(Pointer));
        if I1 = Step then
        begin
          I1 := DoubleStep - I2;
          G_CopyLongs(@InList^[I2], OutList, I1);
          Inc(LongWord(OutList), I1 * SizeOf(Pointer));
          Break;
        end;
      end else
      begin
        PPointer(OutList)^ := InList^[I2];
        Inc(I2);
        Inc(LongWord(OutList), SizeOf(Pointer));
        if I2 = DoubleStep then
        begin
          I2 := Step - I1;
          G_CopyLongs(@InList^[I1], OutList, I2);
          Inc(LongWord(OutList), I2 * SizeOf(Pointer));
          Break;
        end;
      end;
    until False;
    Inc(LongWord(InList), DoubleStep * SizeOf(Pointer));
    Dec(Count, DoubleStep);
  until Count = 0;
end;

procedure G_StableSort(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction);
var
  I: Integer;
  Buffer: PPointerItemList;
begin
  if Count < 17 then
  begin
    IntInsertionSort(ItemList, Count, CompareFunction);
    Exit;
  end;
  I := 0;
  Dec(Count, 4);
  while I <= Count do
  begin
    IntSort4(@ItemList^[I], CompareFunction);
    Inc(I, 4);
  end;
  Inc(Count, 4);
  IntTinySort(@ItemList^[I], Count - I, CompareFunction);
  GetMem(Buffer, Count * SizeOf(Pointer));
  I := 4;
  while I < Count do
  begin
    IntMergeLoop(ItemList, Buffer, I, Count, CompareFunction);
    Inc(I, I);
    IntMergeLoop(Buffer, ItemList, I, Count, CompareFunction);
    Inc(I, I);
  end;
  FreeMem(Buffer);
end;

procedure IntDownHeap(ItemList: PPointerItemList; Index, Count: Integer;
  P: Pointer; CompareFunction: TCompareFunction);
var
  Top, J: Integer;
begin
  Top := Index;
  J := (Index * 2) + 2;
  while J < Count do
  begin
    if CompareFunction(ItemList^[J], ItemList^[J - 1]) < 0 then
      Dec(J);
    ItemList^[Index] := ItemList^[J];
    Index := J;
    Inc(J, J + 2);
  end;
  if J = Count then
  begin
    ItemList^[Index] := ItemList^[J - 1];
    Index := J - 1;
  end;
  J := (Index - 1) shr 1;
  while (Index > Top) and (CompareFunction(ItemList^[J], P) < 0) do
  begin
    ItemList^[Index] := ItemList^[J];
    Index := J;
    J := (Index - 1) shr 1;
  end;
  ItemList^[Index] := P;
end;

procedure G_PartialSort(N: Integer; ItemList: PPointerItemList;
  Count: Integer; CompareFunction: TCompareFunction);
var
  I: Integer;
  P: Pointer;
begin
  if N > Count then
    N := Count;
  if N <= 0 then
    Exit;
  G_MakeHeap(ItemList, N, CompareFunction);
  I := N;
  while I < Count do
  begin
    P := ItemList^[I];
    if CompareFunction(P, ItemList^[0]) < 0 then
    begin
      ItemList^[I] := ItemList^[0];
      IntDownHeap(ItemList, 0, N, P, CompareFunction);
    end;
    Inc(I);
  end;
  G_SortHeap(ItemList, N, CompareFunction);
end;

function G_PartialSortCopy(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction; OutList: PPointerItemList;
  OutCount: Integer): Integer;
var
  I: Integer;
  P: Pointer;
begin
  I := OutCount;
  if I > Count then
    I := Count;
  Result := I;
  if I <= 0 then
    Exit;
  G_CopyLongs(ItemList, OutList, I);
  G_MakeHeap(OutList, I, CompareFunction);
  while I < Count do
  begin
    P := ItemList^[I];
    if CompareFunction(P, OutList^[0]) < 0 then
      IntDownHeap(OutList, 0, Result, P, CompareFunction);
    Inc(I);
  end;
  G_SortHeap(OutList, Result, CompareFunction);
end;

function G_IsSorted(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction): Boolean;
var
  I: Integer;
begin
  if Count > 1 then
  begin
    I := 1;
    repeat
      if CompareFunction(ItemList^[I], ItemList^[I - 1]) < 0 then
      begin
        Result := False;
        Exit;
      end;
      Inc(I);
    until I = Count;
  end;
  Result := True;
end;

{ ������� ��� ��������� ������ � ��������������� ������� ���������� }

function G_BinarySearch(Value: Pointer; ItemList: PPointerItemList; Count: Integer;
  MatchFunction: TMatchFunction): Integer;
var
  L, M, C: Integer;
begin
  if Count > 0 then
  begin
    L := 0;
    Dec(Count);
    while L <= Count do
    begin
      M := (L + Count) shr 1;
      C := MatchFunction(Value, ItemList^[M]);
      if C > 0 then
        L := M + 1
      else if C <> 0 then
        Count := M - 1
      else
      begin
        Result := M;
        Exit;
      end;
    end;
  end;
  Result := -1;
end;

function G_BinarySearch(Value: Pointer; ItemList: PPointerItemList; Count: Integer;
  MatchFunction: TMatchFunction; out Index: Integer): Boolean;
var
  L, M, C: Integer;
begin
  L := 0;
  if Count > 0 then
  begin
    Dec(Count);
    while L <= Count do
    begin
      M := (L + Count) shr 1;
      C := MatchFunction(Value, ItemList^[M]);
      if C > 0 then
        L := M + 1
      else if C <> 0 then
        Count := M - 1
      else
      begin
        Index := M;
        Result := True;
        Exit;
      end;
    end;
  end;
  Index := L;
  Result := False;
end;

function G_SearchFirstGreater(Value: Pointer; ItemList: PPointerItemList;
  Count: Integer; MatchFunction: TMatchFunction): Integer;
var
  L, M: Integer;
begin
  Result := Count;
  if Count > 0 then
  begin
    L := 0;
    Dec(Count);
    while L <= Count do
    begin
      M := (L + Count) shr 1;
      if MatchFunction(Value, ItemList^[M]) >= 0 then
        L := M + 1
      else
      begin
        Count := M - 1;
        Result := M;
      end;
    end;
  end;
end;

function G_SearchFirstGreaterOrEqual(Value: Pointer; ItemList: PPointerItemList;
  Count: Integer; MatchFunction: TMatchFunction): Integer;
var
  L, M: Integer;
begin
  Result := Count;
  if Count > 0 then
  begin
    L := 0;
    Dec(Count);
    while L <= Count do
    begin
      M := (L + Count) shr 1;
      if MatchFunction(Value, ItemList^[M]) > 0 then
        L := M + 1
      else
      begin
        Count := M - 1;
        Result := M;
      end;
    end;
  end;
end;

function G_SearchLastLesser(Value: Pointer; ItemList: PPointerItemList;
  Count: Integer; MatchFunction: TMatchFunction): Integer;
var
  L, M: Integer;
begin
  Result := -1;
  if Count > 0 then
  begin
    L := 0;
    Dec(Count);
    while L <= Count do
    begin
      M := (L + Count) shr 1;
      if MatchFunction(Value, ItemList^[M]) <= 0 then
        Count := M - 1
      else
      begin
        L := M + 1;
        Result := M;
      end;
    end;
  end;
end;

function G_SearchLastLesserOrEqual(Value: Pointer; ItemList: PPointerItemList;
  Count: Integer; MatchFunction: TMatchFunction): Integer;
var
  L, M: Integer;
begin
  Result := -1;
  if Count > 0 then
  begin
    L := 0;
    Dec(Count);
    while L <= Count do
    begin
      M := (L + Count) shr 1;
      if MatchFunction(Value, ItemList^[M]) < 0 then
        Count := M - 1
      else
      begin
        L := M + 1;
        Result := M;
      end;
    end;
  end;
end;

{ ������� ��� ������� ������������� �������� ���������� }

function G_Merge(ItemList1: PPointerItemList; Count1: Integer;
  ItemList2: PPointerItemList; Count2: Integer; CompareFunction: TCompareFunction;
  OutList: PPointerItemList): Integer;
var
  I1, I2: Integer;
begin
  if Count1 = 0 then
    G_CopyLongs(ItemList2, OutList, Count2)
  else if Count2 = 0 then
    G_CopyLongs(ItemList1, OutList, Count1)
  else
  begin
    I1 := 0;
    I2 := 0;
    repeat
      if CompareFunction(ItemList1^[I1], ItemList2^[I2]) <= 0 then
      begin
        PPointer(OutList)^ := ItemList1^[I1];
        Inc(I1);
        Inc(LongWord(OutList), SizeOf(Pointer));
        if I1 = Count1 then
        begin
          G_CopyLongs(@ItemList2^[I2], OutList, Count2 - I2);
          Break;
        end;
      end else
      begin
        PPointer(OutList)^ := ItemList2^[I2];
        Inc(I2);
        Inc(LongWord(OutList), SizeOf(Pointer));
        if I2 = Count2 then
        begin
          G_CopyLongs(@ItemList1^[I1], OutList, Count1 - I1);
          Break;
        end;
      end;
    until False;
  end;
  Result := Count1 + Count2;
end;

function G_SetContainedIn(ItemList1: PPointerItemList; Count1: Integer;
  ItemList2: PPointerItemList; Count2: Integer; CompareFunction: TCompareFunction): Boolean;
var
  I1, I2, C: Integer;
begin
  Result := False;
  I1 := 0;
  I2 := 0;
  repeat
    if I1 = Count1 then
      Break;
    if I2 = Count2 then
      Exit;
    repeat
      C := CompareFunction(ItemList1^[I1], ItemList2^[I2]);
      if C = 0 then
        Break;
      if C < 0 then
        Exit;
      Inc(I2);
      if I2 = Count2 then
        Exit;
    until False;
    Inc(I1);
    Inc(I2);
  until False;
  Result := True;
end;

function G_SetIntersectsWith(ItemList1: PPointerItemList; Count1: Integer;
  ItemList2: PPointerItemList; Count2: Integer; CompareFunction: TCompareFunction): Boolean;
var
  I1, I2, C: Integer;
begin
  Result := True;
  if (Count1 <> 0) and (Count2 <> 0) then
  begin
    I1 := 0;
    I2 := 0;
    repeat
      C := CompareFunction(ItemList1^[I1], ItemList2^[I2]);
      if C < 0 then
      begin
        Inc(I1);
        if I1 = Count1 then
          Break;
      end
      else if C <> 0 then
      begin
        Inc(I2);
        if I2 = Count2 then
          Break;
      end else
        Exit;
    until False;
  end;
  Result := False;
end;

function G_SetUnion(ItemList1: PPointerItemList; Count1: Integer;
  ItemList2: PPointerItemList; Count2: Integer; CompareFunction: TCompareFunction;
  OutList: PPointerItemList): Integer;
var
  I1, I2, C: Integer;
begin
  Result := Count1 + Count2;
  I1 := 0;
  I2 := 0;
  if OutList <> nil then
  begin
    if Count1 = 0 then
      G_CopyLongs(ItemList2, OutList, Count2)
    else if Count2 = 0 then
      G_CopyLongs(ItemList1, OutList, Count1)
    else
      repeat
        C := CompareFunction(ItemList1^[I1], ItemList2^[I2]);
        if C = 0 then
        begin
          Dec(Result);
          PPointer(OutList)^ := ItemList1^[I1];
          Inc(I1);
          Inc(I2);
          Inc(LongWord(OutList), SizeOf(Pointer));
          if I1 = Count1 then
          begin
            G_CopyLongs(@ItemList2^[I2], OutList, Count2 - I2);
            Break;
          end;
          if I2 = Count2 then
          begin
            G_CopyLongs(@ItemList1^[I1], OutList, Count1 - I1);
            Break;
          end;
        end
        else if C < 0 then
        begin
          PPointer(OutList)^ := ItemList1^[I1];
          Inc(I1);
          Inc(LongWord(OutList), SizeOf(Pointer));
          if I1 = Count1 then
          begin
            G_CopyLongs(@ItemList2^[I2], OutList, Count2 - I2);
            Break;
          end;
        end else
        begin
          PPointer(OutList)^ := ItemList2^[I2];
          Inc(I2);
          Inc(LongWord(OutList), SizeOf(Pointer));
          if I2 = Count2 then
          begin
            G_CopyLongs(@ItemList1^[I1], OutList, Count1 - I1);
            Break;
          end;
        end;
      until False;
  end
  else if (Count1 <> 0) and (Count2 <> 0) then
    repeat
      C := CompareFunction(ItemList1^[I1], ItemList2^[I2]);
      if C = 0 then
      begin
        Dec(Result);
        Inc(I1);
        Inc(I2);
        if (I1 = Count1) or (I2 = Count2) then
          Break;
      end
      else if C < 0 then
      begin
        Inc(I1);
        if I1 = Count1 then
          Break;
      end else
      begin
        Inc(I2);
        if I2 = Count2 then
          Break;
      end;
    until False;
end;

function G_SetIntersection(ItemList1: PPointerItemList; Count1: Integer;
  ItemList2: PPointerItemList; Count2: Integer; CompareFunction: TCompareFunction;
  OutList: PPointerItemList): Integer;
var
  I1, I2, C: Integer;
begin
  Result := 0;
  if (Count1 <> 0) and (Count2 <> 0) then
  begin
    I1 := 0;
    I2 := 0;
    repeat
      C := CompareFunction(ItemList1^[I1], ItemList2^[I2]);
      if C = 0 then
      begin
        if OutList <> nil then
        begin
          PPointer(OutList)^ := ItemList1^[I1];
          Inc(LongWord(OutList), SizeOf(Pointer));
        end;
        Inc(Result);
        Inc(I1);
        Inc(I2);
        if (I1 = Count1) or (I2 = Count2) then
          Break;
      end
      else if C < 0 then
      begin
        Inc(I1);
        if I1 = Count1 then
          Break;
      end else
      begin
        Inc(I2);
        if I2 = Count2 then
          Break;
      end;
    until False;
  end;
end;

function G_SetDifference(ItemList1: PPointerItemList; Count1: Integer;
  ItemList2: PPointerItemList; Count2: Integer; CompareFunction: TCompareFunction;
  OutList: PPointerItemList): Integer;
var
  I1, I2, C: Integer;
begin
  Result := Count1;
  I1 := 0;
  I2 := 0;
  if OutList <> nil then
  begin
    if Count2 = 0 then
      G_CopyLongs(ItemList1, OutList, Count1)
    else if Count1 <> 0 then
      repeat
        C := CompareFunction(ItemList1^[I1], ItemList2^[I2]);
        if C = 0 then
        begin
          Dec(Result);
          Inc(I1);
          Inc(I2);
          if I1 = Count1 then
            Break;
          if I2 = Count2 then
          begin
            G_CopyLongs(@ItemList1^[I1], OutList, Count1 - I1);
            Break;
          end;
        end
        else if C < 0 then
        begin
          PPointer(OutList)^ := ItemList1^[I1];
          Inc(I1);
          Inc(LongWord(OutList), SizeOf(Pointer));
          if I1 = Count1 then
            Break;
        end else
        begin
          Inc(I2);
          if I2 = Count2 then
          begin
            G_CopyLongs(@ItemList1^[I1], OutList, Count1 - I1);
            Break;
          end;
        end;
      until False;
  end
  else if (Count1 <> 0) and (Count2 <> 0) then
    repeat
      C := CompareFunction(ItemList1^[I1], ItemList2^[I2]);
      if C = 0 then
      begin
        Dec(Result);
        Inc(I1);
        Inc(I2);
        if (I1 = Count1) or (I2 = Count2) then
          Break;
      end
      else if C < 0 then
      begin
        Inc(I1);
        if I1 = Count1 then
          Break;
      end else
      begin
        Inc(I2);
        if I2 = Count2 then
          Break;
      end;
    until False;
end;

function G_SetSymmetricDifference(ItemList1: PPointerItemList; Count1: Integer;
  ItemList2: PPointerItemList; Count2: Integer; CompareFunction: TCompareFunction;
  OutList: PPointerItemList): Integer;
var
  I1, I2, C: Integer;
begin
  Result := Count1 + Count2;
  I1 := 0;
  I2 := 0;
  if OutList <> nil then
  begin
    if Count1 = 0 then
      G_CopyLongs(ItemList2, OutList, Count2)
    else if Count2 = 0 then
      G_CopyLongs(ItemList1, OutList, Count1)
    else
      repeat
        C := CompareFunction(ItemList1^[I1], ItemList2^[I2]);
        if C = 0 then
        begin
          Dec(Result, 2);
          Inc(I1);
          Inc(I2);
          if I1 = Count1 then
          begin
            G_CopyLongs(@ItemList2^[I2], OutList, Count2 - I2);
            Break;
          end;
          if I2 = Count2 then
          begin
            G_CopyLongs(@ItemList1^[I1], OutList, Count1 - I1);
            Break;
          end;
        end
        else if C < 0 then
        begin
          PPointer(OutList)^ := ItemList1^[I1];
          Inc(I1);
          Inc(LongWord(OutList), SizeOf(Pointer));
          if I1 = Count1 then
          begin
            G_CopyLongs(@ItemList2^[I2], OutList, Count2 - I2);
            Break;
          end;
        end else
        begin
          PPointer(OutList)^ := ItemList2^[I2];
          Inc(I2);
          Inc(LongWord(OutList), SizeOf(Pointer));
          if I2 = Count2 then
          begin
            G_CopyLongs(@ItemList1^[I1], OutList, Count1 - I1);
            Break;
          end;
        end;
      until False;
  end
  else if (Count1 <> 0) and (Count2 <> 0) then
    repeat
      C := CompareFunction(ItemList1^[I1], ItemList2^[I2]);
      if C = 0 then
      begin
        Dec(Result, 2);
        Inc(I1);
        Inc(I2);
        if (I1 = Count1) or (I2 = Count2) then
          Break;
      end
      else if C < 0 then
      begin
        Inc(I1);
        if I1 = Count1 then
          Break;
      end else
      begin
        Inc(I2);
        if I2 = Count2 then
          Break;
      end;
    until False;
end;

{ ������� ��� ������ � ����� }

procedure G_MakeHeap(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction);
var
  Parent: Integer;
begin
  if Count > 1 then
  begin
    Parent := (Count - 2) shr 1;
    repeat
      IntDownHeap(ItemList, Parent, Count, ItemList^[Parent], CompareFunction);
      if Parent = 0 then
        Break;
      Dec(Parent);
    until False;
  end;
end;

function G_PushHeap(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction): Integer;
var
  Parent: Integer;
  V: Pointer;
begin
  Dec(Count);
  Parent := (Count - 1) shr 1;
  V := ItemList^[Count];
  while (Count > 0) and (CompareFunction(ItemList^[Parent], V) < 0) do
  begin
    ItemList^[Count] := ItemList^[Parent];
    Count := Parent;
    Parent := (Count - 1) shr 1;
  end;
  ItemList^[Count] := V;
  Result := Count;
end;

function G_PopHeap(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction): Pointer;
begin
  Dec(Count);
  Result := ItemList^[Count];
  ItemList^[Count] := ItemList^[0];
  IntDownHeap(ItemList, 0, Count, Result, CompareFunction);
  Result := ItemList^[Count];
end;

function G_PopHeap(Index: Integer; ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction): Pointer;
begin
  Dec(Count);
  if Index < Count then
  begin
    Result := ItemList^[Count];
    ItemList^[Count] := ItemList^[Index];
    IntDownHeap(ItemList, Index, Count, Result, CompareFunction);
  end;
  Result := ItemList^[Count];
end;

procedure G_SortHeap(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction);
var
  P: Pointer;
begin
  while Count > 1 do
  begin
    Dec(Count);
    P := ItemList^[Count];
    ItemList^[Count] := ItemList^[0];
    IntDownHeap(ItemList, 0, Count, P, CompareFunction);
  end;
end;

function G_IsHeap(ItemList: PPointerItemList; Count: Integer;
  CompareFunction: TCompareFunction): Boolean;
var
  P, C: Integer;
begin
  Result := False;
  P := 0;
  Dec(Count);
  C := 1;
  while C < Count do
  begin
    if CompareFunction(ItemList^[P], ItemList^[C]) < 0 then
      Exit;
    Inc(C);
    if CompareFunction(ItemList^[P], ItemList^[C]) < 0 then
      Exit;
    Inc(C);
    Inc(P);
  end;
  if (Count > 0) and (Count and 1 <> 0) then
    Result := CompareFunction(ItemList^[P], ItemList^[C]) >= 0
  else
    Result := True;
end;

end.

