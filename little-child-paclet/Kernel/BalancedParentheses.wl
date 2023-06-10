BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`BalancedParentheses;

Begin["`Private`"];

(* Define your public and private symbols here. *)

BalancedParentheses // ClearAll

BalancedParentheses::usage = "BalancedParentheses[n] returns a list of all balanced parentheses strings of length 2n. The strings are ordered lexicographically.";

BalancedParentheses[n_?PositiveIntegerQ] :=
  StringJoin[CatalanUnrank[n, #] /. {0 -> "(", 1 -> ")"}]& /@ Range[0,
     CatalanNumber[n] - 1]

BalancedParentheses[args___] :=
  Null /; CheckArguments[BalancedParentheses[args], 1]

End[]; (* End `Private` *)

EndPackage[];
