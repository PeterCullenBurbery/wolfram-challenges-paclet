BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`BalancedTernary;

Begin["`Private`"];

(* Define your public and private symbols here. *)

BalancedTernary // ClearAll
BalancedTernary[n_?IntegerQ,"Format"->"T"] := ToString[Module[{list, len},
    If[Head[n] === Row,
      list = Normal[n] /. 
      
\!\(\*UnderscriptBox[\(1\), \(_\)]\) -> -1;
      FromDigits[list, 3],
      len = Ceiling[Log[3, 1 + 2 Abs[n]]];
      Row[(IntegerDigits[-n - Quotient[3^len - 1, 2], 3, len] - 
              1) /. {{} -> {0}, -1 -> 
        T}]]]]

 BalancedTernary[n : (_Integer | _Row),"Format"->"Row"] := Module[{list, len},
  If[Head[n] === Row,
   list = Normal[n] /. 
\!\(\*UnderscriptBox[\(1\), \(_\)]\) -> -1;
   FromDigits[list, 3],
   len = Ceiling[Log[3, 1 + 2 Abs[n]]];
   Row[(IntegerDigits[-n - Quotient[3^len - 1, 2], 3, len] - 
       1) /. {{} -> {0}, -1 -> 
\!\(\*UnderscriptBox[\(1\), \(_\)]\)}]]]       

      BalancedTernary[n _] :=     BalancedTernary[n,"Format"->"Row"]   

End[]; (* End `Private` *)

EndPackage[];