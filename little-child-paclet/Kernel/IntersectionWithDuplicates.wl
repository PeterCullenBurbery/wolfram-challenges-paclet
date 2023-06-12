BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`IntersectionWithDuplicates;

Begin["`Private`"];

(* Define your public and private symbols here. *)

IntersectionWithDuplicates // ClearAll

IntersectionWithDuplicates[lists__ ? (ListQ[#]&)] :=
	With[{kint = KeyIntersection[Counts /@ {lists}]},
			If[kint === {},
				{}
				,
				MapThread[Splice[ConstantArray[#1, #2]]&, {Keys[First @ kint], Min
					 /@ Transpose[Values[kint]]}]
			]
		] // Sort

End[]; (* End `Private` *)

EndPackage[];
