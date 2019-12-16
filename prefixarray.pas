unit prefixarray;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, FMX.Controls.Presentation, FMX.StdCtrls;


const
  min = 0;
  max = 4;

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

  TPrefix = TIntegerArray;




  //input numbers	  1	 2	 3	 4	 5	 6	...
  //prefix sums	 0  1	 3	 6	10	15	21	...
  TPrefixSum = class
  private
    fArray : TIntegerArray;
    fPrefix : TIntegerArray;

  protected
    procedure MakePrefixArray;
    function getItem(const i : integer) : integer;
    procedure ForEach(const callBack : TProc<Integer>);
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

procedure TPrefixSum.ForEach(const callBack : TProc<Integer>);
var
  i : integer;
begin

    for I := low(FPrefix) to high(FPrefix) do
    begin
      callback(fPrefix[i]);
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




   //input numbers	  1	 2	 3	 4	 5	 6	...
   //prefix sums	 0  1	 3	 6	10	15	21	...
   //result[i+1] := A[i] + result[i];


   (*

 A[P] + A[P + 1] + ... + A[Q] divided by the length of the slice.
 To be precise, the average equals (A[P] + A[P + 1] + ... + A[Q]) / (Q − P + 1).

p = 1
q = 5

1+2+3+4+5 / (5-1 + 1)




i   0  1  2  3   4   5
    1  2  3  4   5   6   -- prefix of entire array.


0  1  2  3  4   5   6
0

10+15 / (15-0+1)

1-  5      (15  / 5
1 - 4      (10) / 4
1 - 3      6/3  /3
1 - 2      3/2 / 2


2-4       (10-1) /  (4-2 + 1)
2-5       (15-1) /  (5-2 + 1)





I don't have to keep adding it up

2+3+4       3 index for loop compared to 2 index
2+3+4+5     4 index for loop compared to 2 index   


I'm no longer doing a brute force o(n) on any slice if I do this right, at most it will be two indexs for any size of slice*)





procedure TForm7.loop;
  var
    i,j : integer;

    slice : TPrefixSum;
    A : TIntegerArray;
  begin

    //set up array;

    SetLength(A,Max);
    for I := low(A) to High(A) do
    begin
      A[i] := i+1;

    end;


    slice := TPrefixSum.create(A);


    slice.ForEach(
       procedure(i : integer)
       begin
         ListBox1.Items.add(i.toString);
       end);


  end;

{$R *.fmx}

procedure TForm7.Button1Click(Sender: TObject);
begin
  loop;
end;

end.
