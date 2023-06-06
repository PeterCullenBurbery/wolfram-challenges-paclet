BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`AlmostPalindrome;

Begin["`Private`"];

(* Define your public and private symbols here. *)

AlmostPalindrome // ClearAll

AlmostPalindrome[n_?PositiveIntegerQ] := 
 Cases[word_ /; ! 
      PalindromeQ[
       word] && (CountsBy[PalindromeQ][
         StringDrop[word, {#}] & /@ Range[n]][True] >= 1)][
  DictionaryLookup[StringExpression @@ ConstantArray[Blank[], n]]]

End[]; (* End `Private` *)

EndPackage[];

