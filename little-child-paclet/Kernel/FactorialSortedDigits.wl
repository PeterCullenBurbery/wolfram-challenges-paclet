BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`FactorialSortedDigits;

Begin["`Private`"];

(* Define your public and private symbols here. *)

FactorialSortedDigits//ClearAll
FactorialSortedDigits[n_?IntegerQ] /; n > 10 := 
 First /@ 
  Join @@ Values[
    KeySort[SortBy[First] /@ 
      GroupBy[Last][
       Tally[Flatten[Table[IntegerDigits[i!], {i, n}]]]]]]

End[]; (* End `Private` *)

EndPackage[];