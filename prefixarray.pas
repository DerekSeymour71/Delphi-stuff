unit prefixarray;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, FMX.Controls.Presentation, FMX.StdCtrls, system.math;


const
  min = 0;
  max = 9;

type

  TIntegerArray = array of integer;



  TForm7 = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure loop;
  end;





  //                0  1   2   3   4   5
  //input numbers	  1	 2	 3	 4	 5	 6	...
  //prefix sums	 0  1	 3	 6	10	15	21	...




  TPrefixSum = class
  private
    fArray : TIntegerArray;
    fPrefix : TIntegerArray;

  protected
    function count : integer;
    function Sum(const i, j : integer) : integer;
    function MinSlice() : integer;
    procedure MakePrefixArray;
    function Average(const i,j : integer) : Double;
    function getItem(const i : integer) : integer;
    procedure ForEachSlice(const callBack : TProc<Integer,integer>);
  public
    constructor create(const A : TIntegerArray);
  end;


  function GetPrefixSums(const A : TIntegerArray) : TPrefixSum;

var
  Form7: TForm7;




implementation

  function GetPrefixSums(const A : TIntegerArray) : TPrefixSum;
  begin
    result := TPrefixSum.create(A);
  end;


function TPrefixSum.count : integer;
begin
  result := length(fArray);
end;


function TPrefixSum.MinSlice : integer;
var
   minSlice : double;
   CurrentMinSlice : double;
   Minindex : integer;
   i : integer;
   N : integer;
   SumA : integer;
   AverageA : Double;
   SumB : integer;
   AverageB : double;

   function min(i,j : double) : double;
   begin
     if i < j then result := i
     else result := j;
   end;

begin
   N := count;
   minSlice := (fArray[0] + fArray[1]) / 2.0;
   Minindex := 0;

    for i:= 0 to N-2 do
    begin
      SumA := fArray[i] + fArray[i + 1];
      SumB := fArray[i] + fArray[i + 1] + fArray[i + 2];
      AverageA := SumA / 2;
      AverageB := SumB / 3;
      CurrentMinSlice := min(AverageA,AverageB);
      if (CurrentMinSlice < minSlice)then
      begin
        minSlice := CurrentMinSlice;
        Minindex := i;
      end;
    End;

    if (((fArray[N - 2] + fArray[N - 1]) / 2.0) < minSlice) then
    begin
        Minindex := N - 2;
    end;

    result := Minindex;
end;



function TPrefixSum.Sum(const i, j : integer) : integer;
begin
   assert((i >= 0) and (i< count ));
   assert((j >= 0) and (j< count ));

   if (i=j) then
   begin
     result := fArray[i] * 2;
   end
   else
   begin
     result := fPrefix[j+1] - fprefix[i]
   end;
end;

function TPrefixSum.Average(const i,j : integer) : Double;
begin
  result := sum(i,j) / ((j-i) + 1);
end;


procedure TPrefixSum.MakePrefixArray;
var
  i : integer;
begin
  setlength(fPrefix,length(fArray)+1);
  fPrefix[0] := 0;
  for i := low(fArray) to high(fArray)  do
  begin
    fPrefix[i+1] := fArray[i] + fPrefix[i];
  end;
end;

procedure TPrefixSum.ForEachSlice(const callBack : TProc<Integer,integer>);
var
  i : integer;

begin

  for I := 0 to count-2 do
  begin
    callback(i,i+1);
  end;
end;


function TPrefixSum.getItem(const i : integer) : integer;
begin
  assert((i >= low(fPrefix)) and (i<=high(fPrefix)));
  result := fPrefix[i];
end;


constructor TPrefixSum.create(const A : TIntegerArray);
begin
  fArray := A;
  MakePrefixArray;
end;





procedure TForm7.loop;
  var
    i : integer;
    average : double;
    minAverage : double;

    slice : TPrefixSum;
    A : TIntegerArray;
  begin

    //set up array;

    SetLength(A,2);

    A[0] := -2;
    A[1] := -8;



    slice := GetPrefixSums(A);


    minAverage := maxdouble;
    slice.ForEachSlice(procedure(i,j : integer)
    begin
      //ListBox1.items.add('sum     i: ' + i.tostring + '+ j:' + j.tostring + ' = ' + slice.sum(i,j).toString);
      //ListBox1.items.add('average i: ' + i.tostring + '+ j:' + j.tostring + ' = ' + slice.average(i,j).toString);
      average := slice.average(i,j);
      if  average < minAverage then
      begin
        minAverage := average;
      end;
    end);

    ListBox1.items.add('min Average:' + minAverage.toString);

    (* ListBox1.items.add('Count:' + Slice.count.tostring);
     ListBox1.items.add(slice.sum(0,1).toString);
     ListBox1.items.add(slice.sum(1,2).toString);
     ListBox1.items.add(slice.sum(2,3).toString);
     ListBox1.items.add('2,7 : ' + slice.sum(2,7).toString);
     ListBox1.items.add('average 2,7: ' + slice.Average(2,7).toString); *)

  end;

{$R *.fmx}

procedure TForm7.Button1Click(Sender: TObject);
begin
  loop;
end;

end.


