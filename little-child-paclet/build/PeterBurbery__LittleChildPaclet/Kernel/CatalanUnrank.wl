BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`CatalanUnrank;

Begin["`Private`"];

(* Define your public and private symbols here. *)

CatalanUnrank // ClearAll

CatalanUnrank::usage = "CatalanUnrank[n,rank] returns the rank-th Catalan sequence of length 2n."

CatalanUnrank[n_, rank_] :=
  Module[{lo = 0, y = 0, a = Table[0, 2 n], m},
    Do[
      m = Binomial[2 n - x, n - (x + y + 1) / 2] - Binomial[2 n - x, 
        n - 1 - (x + y + 1) / 2];
      If[rank <= lo + m - 1,
        y = y + 1;
        a[[x]] = 0
        ,
        lo = lo + m;
        y = y - 1;
        a[[x]] = 1
      ]
      ,
      {x, 1, 2 n}
    ];
    a
  ]

CatalanUnrank[args___] :=
  Null /; CheckArguments[CatalanUnrank[args], {2}]

End[]; (* End `Private` *)

EndPackage[];
