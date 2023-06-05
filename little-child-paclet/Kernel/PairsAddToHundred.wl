BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)
PeterBurbery`LittleChildPaclet`PairsAddToHundred

Begin["`Private`"];

(* Define your public and private symbols here. *)
PairsAddToHundred[inputList_?VectorQ]:=Select[list |-> 
   And @@ Table[
     Counts[inputList][number] >= Count[list, number], {number, 
      list}]][IntegerPartitions[100, {2}, inputList]](*for why I chose VectorQ and not ListQ, see https://www.wolframcloud.com/obj/burbery1/Published/PairsAddToHundred.nb.
     *) /;AllTrue[IntegerQ][inputList]


End[]; (* End `Private` *)

EndPackage[];