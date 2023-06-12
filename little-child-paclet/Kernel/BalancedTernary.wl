BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`BalancedTernary;

Begin["`Private`"];

(* Define your public and private symbols here. *)

BalancedTernary // ClearAll

BalancedTernary::usage = "BalancedTernary[n] toggles the n between integer and balanced ternary format."

SetAttributes[BalancedTernary, {Listable}]

BalancedTernary[n : (_ ? (IntegerQ[#]&) | _Row)] :=
      Module[{list, len},
            If[Head[n] === Row,
                  list = Normal[n] /. \!\(\*UnderscriptBox[\(1\), \(_\)]\)
                         -> -1;
                  FromDigits[list, 3]
                  ,
                  len = Ceiling[Log[3, 1 + 2 Abs[n]]];
                  Row[(IntegerDigits[-n - Quotient[3^len - 1, 2], 3, 
                        len] - 1) /. {{} -> {0}, -1 -> \!\(\*UnderscriptBox[\(1\), \(_\)]\)}]
                        
            ]
      ]

BalancedTernary[args___] :=
      Null /; CheckArguments[BalancedTernary[args], 1]

End[]; (* End `Private` *)

EndPackage[];
