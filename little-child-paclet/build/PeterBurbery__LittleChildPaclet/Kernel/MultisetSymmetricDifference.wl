

  BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)
PeterBurbery`LittleChildPaclet`MultisetSymmetricDifference
Begin["`Private`"];

(* Define your public and private symbols here. *)

MultisetSymmetricDifference//ClearAll
MultisetSymmetricDifference[lists___] := 
 With[{j = Join[lists]}, 
   Select[Union[lists], OddQ[Count[j, #1]] & ]] /; 
  And @@ ListQ /@ {lists}
End[]; (* End `Private` *)

EndPackage[];