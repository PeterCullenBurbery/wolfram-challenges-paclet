BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`InsideTriangle;

Begin["`Private`"];

(* Define your public and private symbols here. *)

InsideTriangle // ClearAll

InsideTriangle[vertices : {{p1_?RealValuedNumericQ, p2_?RealValuedNumericQ
  }, {q1_?RealValuedNumericQ, q2_?RealValuedNumericQ}, {r1_?RealValuedNumericQ,
   r2_?RealValuedNumericQ}}, {s1_?RealValuedNumericQ, s2_?RealValuedNumericQ
  }] :=
  RegionMember[Triangle[vertices], {s1, s2}]

End[]; (* End `Private` *)

EndPackage[];
