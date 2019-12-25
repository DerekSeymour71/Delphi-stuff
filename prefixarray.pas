unit prefixarray;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, FMX.Controls.Presentation, FMX.StdCtrls, system.math, FMX.Edit,
  FMX.EditBox, FMX.SpinBox;


const
  min = 0;
  max = 9;

type





  TForm7 = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    SpinBox1: TSpinBox;
    Button2: TButton;
    SpinBox2: TSpinBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure loop;
  end;

   TArrayOfInteger = array of integer;


  //                0  1   2   3   4   5
  //input numbers	  1	 2	 3	 4	 5	 6	...
  //prefix sums	 0  1	 3	 6	10	15	21	...

   //crawl array in sequence
   TCrawler = class
   private
     fArray : TArrayOfInteger;
     fSteps : integer;
     fLength : integer;
     fPairs : integer;
     fTriplets : integer;

     fIndex : integer;
   protected

   public
     function getNext : boolean;
     constructor create( A : TArrayOfInteger);

   end;






var
  Form7: TForm7;





implementation

 (*   optimal solution running in O(n) time
function TPrefixArray.MinSlice : integer;
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
  (* N := count;
   minSlice := (fArray[0] + fArray[1]) / 2;
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
end;  *)


   //crawling across an array in triplets
   constructor TCrawler.create( A : TArrayOfInteger);
   begin
     fArray := A;
     flength := length(A);
     fPairs := flength-1;
     Ftriplets := (FPairs * 2)-1;
     fSteps := Fpairs + Ftriplets;
   end;

   B F



  (*    working python caterpillar
function caterpillarMethod(A, s) : boolean;
 n = len(A)
 front, total = 0, 0
 for back in xrange(n):
 while (front < n and total + A[front] <= s):
 total += A[front]
 front += 1
 if total == s:
 return True
 total -= A[back]
 return False









  //various workings of triplets

  (* length
  [3,5]         =     2
  [3,5,6]       =     3               3      [3,5], [3,5,6], [5,6]
  [3,5,6,7]     =     4               5      [3,5], [3,5,6], [5,6], [5,6,7], [6,7]
  [3,5,6,7,8]   =     5               7      [3,5], [3,5,6], [5,6], [5,6,7], [6,7] [6,7,8], [7,8]
  [3,5,6,7,8,9] =     6                      [3,5], [3,5,6], [5,6], [5,6,7], [6,7] [6,7,8], [7,8], [7,8,9], [8,9]
  [3,5,6,7,8,9,10] =  7                      [3,5], [3,5,6], [5,6], [5,6,7], [6,7] [6,7,8], [7,8], [7,8,9], [8,9],[8,9,10], [9,10]

   *)



procedure TForm7.Button2Click(Sender: TObject);

var
  i : integer;
  length : integer;
  pairs : integer;
  triplets : integer;
  A : TArrayOfInteger;
  crawler : TCrawler;
begin
  SetLength(A,7);
  A[0] := 3;
  A[1] := 5;
  A[2] := 6;
  A[3] := 7;
  A[4] := 8;
  A[5] := 9;
  A[6] := 10;





  Crawler := TCrawler.create(A);


  //working for how many elements you need extra for triplet expansion, on 1 for loop pass (if not doing 2 per time*)
  (*length := round(spinBox1.value);
 // SpinBox2.Value := length + ((length div 2))-1  ;
  pairs := (length-1);
  triplets := (pairs * 2)-1;
  SpinBox2.Value := triplets;
  // (length of array div 2 * 3)
  *)


  for i := 0 to triplets-1 do
  begin

  end;
end;

procedure TForm7.loop;
begin


end;

{$R *.fmx}

procedure TForm7.Button1Click(Sender: TObject);
const
  A : array[0..4] of integer =  (-3, -5, -8, -4, -10);

  //       0      1     2      3     4
           3      5     8      4     10

  //prefix
           0      1     2      3     4    5
  //       0     -3     -8    -16   -20  -30


  //checking via triplets of prefix of array

 0    0,1 =    A= pf[i+1] = 8    B= pf[i] = 0    =     A-B = -8
 1    0,2 =    A= pf[i+1] = 16   B= pf[i] = 0    =     A-B = -16
 2    1,2 =    A= pf[i+1] = 16   B= pf[i] = 3    =     A-B = -13
 3    1,3 =    A= pf[i+1] = 20   B= pf[i] = 3    =     A-B = -17
 4    2,3 =    A= pf[i+1] = 20   B= pf[i] = 8    =     A-B = -12
 5    2,4 =    A= pf[i+1] = 30   B= pf[i] = 8    =     A-B = -22
 6    3,4 =    A= pf[i+1] = 30   B= pf[i] = 16   =     A-B = -14


     //index 2 to 4  is smallest average [8+4+10] / 3



  //5-2 + 2

  //  ([-3 -5] or [-3 -5 -8]) < ([-5 -8]) [-5 -8 -4])   [-8 -4]  [-8 -4 -10]  [-4,-10]
  //    -8            -16           -13       -17          -12      -22




 (*
  length
  [3,5]         =     2
  [3,5,6]       =     3               3
  [3,5,6,7]     =     4               5      [3,5], [3,5,6], [5,6], [5,6,7], [6,7]
  [3,5,6,7,8]   =     5               7      [3,5], [3,5,6], [5,6], [5,6,7], [6,7] [6,7,8], [7,8]
  [3,5,6,7,8,9] =     6                      [3,5], [3,5,6], [5,6], [5,6,7], [6,7] [6,7,8], [7,8], [7,8,9]


  (length of array div 2 * 3)




  //what is the loop?


 //  (-3, -5, -8, -4, -10);
 // 5=6

 //
 //
      //[-3 -5]  [-3 -5 -8]  [-5 -8]   [-5 -8 -4]   [-8 -4]  [-8 -4 -10]




 // 7
 //  (-3, -5, -8, -4, -10,-10,-10);
//  [-3 -5]  [-3 -5 -8]  [-5 -8]   [-5 -8 -4]   [-8 -4]  [-8 -4 -10] [10,10],[10,10,10]





//i=3 to

(*
   [3,5] = 8 /2 = 4
 at what point does 3 make it bigger?

 [3,5,1] = 3
 [3,5,2] = 3.3
 [3,5,3] = 3.6
 [3,5,4] = 4    Answer - when the average of 2 slices is > the last number of 3, the average increases
 [3,5,5] = 4.33


 3rd element 3 + 5 + 4 = 12               sum(i + i+1) + (sum/2) > sum(i



  at what point does last 2 of previous 3 make it bigger?

  [-3,5,4] = 3;
  [5,4] = 9;








  0  2 - 0
  1  3 - 0
  2  3 - 1
  3  4 - 1
  4  4 - 2
  5  5 - 2
  *)


var
  P : Array of integer;
  I : integer;
  Size : integer;
  SmallestAverageTotal,
  twoSliceAverage : double;
  Total : integer;

  Step : integer;
  index : integer;




begin
  (*SmallestAverageTotal := -1;
  size := length(A);


  if (Size >=2) then
  begin
    i := 2;
    SmallestAverageTotal := (A[0] + A[1])/2;
    While (i < size) do
    begin
      twoSliceAverageSlice := (A[i] = A[i+1])/2;
      if (i+1 < size) then //check the 3rd element;
      begin
        if (A[i+2]
      end;

    end;
  end;



  (*Make prefix array
  SetLength(P,Size+1);
  P[0] := 0;
  (*for i := 1 to size do
  begin

    P[i] := A[i-1] + P[i-1];
  end; *)

//  [-3 -5]  [-3 -5 -8]  [-5 -8]   [-5 -8 -4]   [-8 -4]  [-8 -4 -10]
//    -8      -16          -13       -17           -12      -22

//Min 0       0

 (* SmallestTotal := P[1];

  for i := 0 to size step by 2 do
  begin
    P[i] := A[i] + A[i+1];
    P[i+1] := A[i] + A[i+1] + [A[i+2];
  end;



    ListBox1.Items.add(P[i].ToString);
  end;
  // ListBox1.Items.add(SmallestTotal.ToString); *)
end;





end.

(*                0   1   2   3   4
Your test case: [-3, -5, -8, -4, -10]



0 [3 5] [3 5 8]
1 [5 8] [5 8 4]
2 [8 4] [8 4 10]


  [-3  -8  -16 -20 -30]







  [-3 -5]  [-3 -5 -8]  [-5 -8]   [-5 -8 -4]   [-8 -4]  [-8 -4 -10]
    -8      -16       -13       -17             -12      -22

                                                 -6        7.3

                                               [-8 -4]  [-8 -4 -6]

                                                 -6

                                                 -6*3 = 18



                                               [-2 -2] [-2 -2 -4]
                                                  -4      -8

                                                  4*3 = 12


                                               [-4 -5]


                                               next 3 has to bigger than current average * 3


                                               [-3 -6] = -4.5    >  9/2*3  =  13.5

                                               -3 -6 -3



                                               [-4,-4] = -4   > -12

                                               [-4 -4 -4] =  4.3


       vars
          totalTwo;
          totalThree;



       0 - prefix array

       1 - get current average of [i,i+1]



       2 - if i+3 < count then  check next i (i.e. i+3)
           begin
             if next total + [i+3]

           end


       3 - if current smallest average < previous smalles average then make the current smallest average the previous total;


  pick the smallest one



