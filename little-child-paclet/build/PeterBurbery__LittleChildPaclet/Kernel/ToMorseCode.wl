BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)
PeterBurbery`LittleChildPaclet`ToMorseCode

Begin["`Private`"];

(* Define your public and private symbols here. *)



ToMorseCode[text_?StringQ]:=StringRiffle[
  StringRiffle[
     StringReplace[Characters[#], 
      Thread[Alphabet[] -> CloudExpression["https://www.wolframcloud.com/obj/burbery1/CloudExpression/MorseCodeAlphabet"][]]], " "] & /@ 
   TextWords[ToLowerCase@text], "/"]


End[]; (* End `Private` *)

EndPackage[];