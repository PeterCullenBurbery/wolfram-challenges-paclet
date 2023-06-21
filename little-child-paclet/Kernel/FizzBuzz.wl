BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`FizzBuzz;

Begin["`Private`"];

(* Define your public and private symbols here. *)

ClearAll[FizzBuzz]

FizzBuzz::usage = "FizzBuzz[n] makes fizz for numbers divisible by 3, buzz for multiples of 5, and fizzbuzz for multiples of 15 in Array[#&,n]. FizzBuzz[n,p] makes fizz for numbers divisible by 3, buzz for multiples of 5, and fizzbuzz for multiples of 15 in Array[#&,n,p].";

FizzBuzz[
    n_ ? (Function[{x}, PositiveIntegerQ[x], {}])                    
            (*the length has to be positive. 
It cannot be negative*) ,
    Optional[p_?IntegerQ, 1]
] :=
    Array[
        Which[
            Divisible[#, 3] && Divisible[#, 5],
                "fizzbuzz"
            ,
            !Divisible[#, 3] && !Divisible[#, 5],
                #
            ,
            Divisible[#, 3],
                "fizz"
            ,
            Divisible[#, 5],
                "buzz"
        ]&
        ,
        n
        ,
        p
    ]

End[]; (* End `Private` *)

EndPackage[];
