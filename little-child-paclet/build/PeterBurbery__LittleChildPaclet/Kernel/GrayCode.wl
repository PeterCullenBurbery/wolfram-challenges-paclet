BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`GrayCode;

Begin["`Private`"];

(* Define your public and private symbols here. *)

GrayCode[n_?NonNegativeIntegerQ] :=
  StringJoin[ToString /@ IntegerDigits[BitXor[n, BitShiftRight[n, 1]],
     2]]

End[]; (* End `Private` *)

EndPackage[];
