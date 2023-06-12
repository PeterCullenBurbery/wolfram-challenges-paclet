BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`ButterflyString;

Begin["`Private`"];

(* Define your public and private symbols here. *)

NearestNumbers[numbers : {__?(Function[{number},IntegerQ[number]])}] :=
    Sort /@ Union[KeySort[GroupBy[EuclideanDistance @@ #&][DeleteCases[
        {x_, x_}][Subsets[numbers, {2}]]]][[1]]]

End[]; (* End `Private` *)

EndPackage[];
