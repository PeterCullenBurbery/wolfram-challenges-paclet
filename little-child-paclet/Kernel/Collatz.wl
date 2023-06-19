BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`Collatz;

Begin["`Private`"];

(* Define your public and private symbols here. *)

Collatz // ClearAll

Collatz::usage = "Collatz[n] gives the Collatz sequence starting with a given value.";

SetAttributes[Collatz, Listable];

Collatz[n_ ? (Function[{x}, PositiveIntegerQ[x], {}]), maxits : _ ? (
    PositiveIntegerQ[#]&) | Infinity : 1000] :=
    NestWhileList[
        If[EvenQ[#],
            Quotient[#, 2]
            ,
            3 # + 1
        ]&
        ,
        n
        ,
        #1 != 1&
        ,
        1
        ,
        maxits
    ]

Collatz[args___] :=
    Null /; CheckArguments[Collatz[args], {1, 2}]

End[]; (* End `Private` *)

EndPackage[];
