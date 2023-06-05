BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`BalancedParentheses;

Begin["`Private`"];

(* Define your public and private symbols here. *)

BalancedParentheses // ClearAll

BalancedParentheses[n_?PositiveIntegerQ] := 
 StringJoin[CatalanUnrank[n, #] /. {0 -> "(", 1 -> ")"}] & /@ 
  Range[0, CatalanNumber[n] - 1]

End[]; (* End `Private` *)

EndPackage[];

