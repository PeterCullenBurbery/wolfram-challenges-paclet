BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`FourPointParabolas;

Begin["`Private`"];

(* Define your public and private symbols here. *)

FourPointParabolas // ClearAll

FourPointParabolas[pts_] :=
   FourPointParabolas[pts, {\[FormalX], \[FormalY]}]

FourPointParabolas[pts_?MatrixQ, {x_, y_}] /; Dimensions[pts] === {4,
    2} :=
   Module[{d, den, h, q, r},
      den = Det[{##, #^2, 1}& @@@ pts];
      If[!TrueQ[den == 0],
         {q, r} = {Det[{##, Times[##], 1}& @@@ pts], Det[{##, #2^2, 1
            }& @@@ pts]} / den;
         h = -q - Sign[q] Sqrt[q^2 - r];
         If[!TrueQ[h == 0],
            d = {r / h, h};
            (#1 x + y) ^ 2 + {1, x, y} . {##2}& @@@ Transpose[Prepend[
               LinearSolve[PadLeft[pts, {3, 3}, 1], -(Rest[pts] . {d, {1, 1}}) ^ 2],
                d]]
            ,
            iPara4P[pts, {x, y}]
         ]
         ,
         iPara4P[pts, {x, y}]
      ]
   ]

iPara4P[pts_, {x_, y_}] :=
   Module[{c1, c2, d, e, f, r},
      c1 = f + d * x + e * y + (r * x + y) ^ 2 /. Quiet[Solve[(f + d 
         * #1 + e * #2 + (r * #1 + #2) ^ 2 == 0)& @@@ pts, {r, d, e, f}]];
      If[Length[c1] == 2,
         Return[c1, Module]
         ,
         c2 = f + d * x + e * y + (-x - r y) ^ 2 /. Quiet[Solve[(f + 
            d * #1 + e * #2 + (-#1 - r #2) ^ 2 == 0)& @@@ pts, {r, d, e, f}]];
         Last /@ (Sort /@ GatherBy[Join[c1, c2], Expand[# Max[Denominator[
            Flatten[CoefficientList[#, {x, y}]]]]]&])
      ]
   ]

End[]; (* End `Private` *)

EndPackage[];
