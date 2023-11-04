/*--------------------------------*- C++ -*----------------------------------*\
| =========                 |                                                 |
| \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           |
|  \\    /   O peration     | Version:  4.x                                   |
|   \\  /    A nd           | Web:      www.OpenFOAM.org                      |
|    \\/     M anipulation  |                                                 |
\*---------------------------------------------------------------------------*/
FoamFile
{
    version     2.0;
    format      ascii;
    class       dictionary;
    object      blockMeshDict;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

dnl> -----------------------------------------------------------------
dnl> <STANDARD DEFINTIONS>
dnl>
changecom(//)changequote([,]) dnl>
define(calc, [esyscmd(perl -e 'print ($1)')]) dnl>
define(VCOUNT, 0)  dnl>
define(vlabel, [[// ]pt VCOUNT ($1) define($1, VCOUNT)define([VCOUNT], incr(VCOUNT))])  dnl>
dnl>
dnl>
dnl> </STANDARD DEFINTIONS>
dnl> -----------------------------------------------------------------
dnl>
define(r, 0.0395) dnl> //Wire radius
define(rr, 8) dnl> //Radius 2
define(D, 60) dnl> //Distance between wire center and upper surface
define(H, 320) dnl> //Half of wire to wire distance (half of plate width)
define(L, 300) dnl> //Wire length
define(Gap, 20.04) dnl> //Gap between electrodes
define(theta, 22.5) dnl>
dnl>
define(onRadi1,calc(sqrt(0.5*r*r))) dnl>
define(onRadi2,calc(sqrt(0.5*0.25*rr*rr))) dnl>
define(onRadi1RightX,calc(sqrt(r*r/(1+0.41421*0.41421)))) dnl>
define(onRadi1RightY,calc(sqrt(r*r-onRadi1RightX*onRadi1RightX))) dnl>
define(onRadi1LeftX,calc(onRadi1RightY*1)) dnl>
define(onRadi1LeftY,calc(onRadi1RightX*1)) dnl>

define(onRadi2RightX,calc(sqrt(0.25*rr*rr/(1+0.41421*0.41421)))) dnl>     //tan 22.5=0.41421
define(onRadi2RightY,calc(sqrt(0.25*rr*rr-onRadi2RightX*onRadi2RightX))) dnl>
define(onRadi2LeftX,calc(onRadi2RightY*1)) dnl>
define(onRadi2LeftY,calc(onRadi2RightX*1)) dnl>

define(Hhalf,calc(0.5*rr)) dnl>
dnl>


convertToMeters 0.001;


vertices
(
    (r 0 0)	//0
    (Hhalf 0 0) //1
    (H 0 0) //2
    (H onRadi2 0) //3
    (onRadi2 onRadi2 0) //4
    (onRadi1 onRadi1 0) //5
    (H D 0) //6
    (onRadi2 D 0) //7
    (0 D 0) //8
    (0 Hhalf 0) //9
    (0 r 0) //10
    (r 0 L) //11
    (Hhalf 0 L) //12
    (H 0 L) //13
    (H onRadi2 L) //14
    (onRadi2 onRadi2 L) //15
    (onRadi1 onRadi1 L) //16
    (H D L) //17
    (onRadi2 D L) //18
    (0 D L) //19
    (0 Hhalf L) //20
    (0 r L) //21
    (H -onRadi2 0) //22
    (onRadi2 -onRadi2 0) //23
    (onRadi1 -onRadi1 0) //24
    (H -Gap 0) //25
    (onRadi2 -Gap 0) //26
    (0 -Gap 0) //27
    (0 -Hhalf 0) //28
    (0 -r 0) //29
    (H -onRadi2 L) //30
    (onRadi2 -onRadi2 L) //31
    (onRadi1 -onRadi1 L) //32
    (H -Gap L) //33
    (onRadi2 -Gap L) //34
    (0 -Gap L) //35
    (0 -Hhalf L) //36
    (0 -r L) //37
    
);



blocks
(
    hex (5 4 9 10 16 15 20 21) (10 5 1) simpleGrading (5 1 1)
    hex (0 1 4 5 11 12 15 16) (10 5 1) simpleGrading (5 1 1)
    hex (24 23 1 0 32 31 12 11) (10 5 1) simpleGrading (5 1 1)   
    hex (29 28 23 24 37 36 31 32) (10 5 1) simpleGrading (5 1 1)
    hex (1 2 3 4 12 13 14 15) (60 5 1) simpleGrading (15 1 1)
    hex (23 22 2 1 31 30 13 12) (60 5 1) simpleGrading (15 1 1) 
    hex (4 3 6 7 15 14 17 18) (60 30 1) simpleGrading (15 5 1)
    hex (26 25 22 23 34 33 30 31) (60 30 1) simpleGrading (15 1 1)
    hex (9 4 7 8 20 15 18 19) (5 30 1) simpleGrading (1 5 1)
    hex (23 28 27 26 31 36 35 34) (5 30 1) simpleGrading (1 1 1)
);

edges
(
    arc 0 5 (onRadi1RightX onRadi1RightY 0)
    arc 5 10 (onRadi1LeftX onRadi1LeftY 0)
    arc 24 0 (onRadi1RightX -onRadi1RightY 0)
    arc 29 24 (onRadi1LeftX -onRadi1LeftY 0)
    arc 1 4 (onRadi2RightX onRadi2RightY 0)
    arc 4 9 (onRadi2LeftX onRadi2LeftY 0)
    arc 23 1 (onRadi2RightX -onRadi2RightY 0)
    arc 28 23 (onRadi2LeftX -onRadi2LeftY 0)
    arc 11 16 (onRadi1RightX onRadi1RightY L)
    arc 16 21 (onRadi1LeftX onRadi1LeftY L)
    arc 32 11 (onRadi1RightX -onRadi1RightY L)
    arc 37 32 (onRadi1LeftX -onRadi1LeftY L)
    arc 12 15 (onRadi2RightX onRadi2RightY L)
    arc 15 20 (onRadi2LeftX onRadi2LeftY L)
    arc 31 12 (onRadi2RightX -onRadi2RightY L)
    arc 36 31 (onRadi2LeftX -onRadi2LeftY L)
);

boundary
(
    left
    {
        type symmetryPlane;
        faces
        (
            (8 9 20 19)
            (9 10 21 20)
            (28 27 35 36)
	    (29 28 36 37)
        );
    }
    right
    {
        type patch;
        faces
        (
            (2 3 14 13)
            (3 6 17 14)
            (22 2 13 30)  
            (25 22 30 33)
        );
    }
    down
    {
        type wall;
        faces
        (
           (27 26 34 35)
           (26 25 33 34) 
        );
    }
    up
    {
        type patch;
        faces
        (
            (7 8 19 18)
            (6 7 18 17)
        );
    }
    hole
    {
        type wall;
        faces
        (
            (10 5 16 21)
            (5 0 11 16)
            (0 24 32 11)
            (24 29 37 32)
        );
    }
);


mergePatchPairs
(
);

// ************************************************************************* //
