BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`CountSquares;

Begin["`Private`"];

(* Define your public and private symbols here. *)

CountSquares // ClearAll
CountSquares::usage="CountSquares[inputPoints] counts the number of squares that can be formed on a rectangular grid with integer points from a list of points inputPoints."
CountSquares[inputPoints_ ? (ListQ[#]&)] :=
  Module[{count = 0, n = Length[inputPoints], pointA, pointB, pointC,
     pointD, sameDistancePoints},
    For[i = 1, i <= n, i++,
      pointA = inputPoints[[i]];
      For[j = 1, j <= n, j++,
        pointB = inputPoints[[j]];
        If[i != j,
          sameDistancePoints = Select[inputPoints, EuclideanDistance[
            pointA, #] == EuclideanDistance[pointA, pointB]&];
          For[k = 1, k <= Length[sameDistancePoints], k++,
            pointC = sameDistancePoints[[k]];
            If[VectorAngle[pointB - pointA, pointC - pointA] == Pi / 
              2,
              pointD = pointB + pointC - pointA;
              If[MemberQ[inputPoints, pointD],
                count++
              ]
            ]
          ]
        ]
      ]
    ];
    (count / 2) / 4
            (*Since we count each square twice,
we need to divide the total count by 2*)]

End[]; (* End `Private` *)

EndPackage[];
