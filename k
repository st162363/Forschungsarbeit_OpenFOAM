/*--------------------------------*- C++ -*----------------------------------*\
  =========                 |
  \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox
   \\    /   O peration     | Website:  https://openfoam.org
    \\  /    A nd           | Version:  11
     \\/     M anipulation  |
\*---------------------------------------------------------------------------*/
FoamFile
{
    format      ascii;
    class       volScalarField;
    location    "0";
    object      k;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

dimensions      [0 2 -2 0 0 0 0];

internalField   uniform 0.003534;		

boundaryField
{
    movingWall
    {
        type            kqRWallFunction;	// Wandfunktion an der bewegten Wand - 
        					// kqRWallFunction; kLowReWallFunction oder fixedValue
        value           uniform 0;		// Initialwert fuer Stabilitaet oder Wert fuer fixedValue-Bedingung -
    }						// CP1/CP3:0
    fixedWall
    {
        type            kqRWallFunction;	// Wandfunktion an der stationaeren Wand - 
        					// kqRWallFunction; kLowReWallFunction oder fixedValue
        value           uniform 0;		// Initialwert fuer Stabilitaet oder Wert fuer fixedValue-Bedingung -
    }						// CP1/CP3:0
    inlet
    {
        type            zeroGradient;		// zeroGradient oder fixedValue 
    //	value		uniform 0.003534;	// Wert fuer fixedValue-Bedingung - CP1:0.001446; CP3:0.003534
    }
    outlet
    {
        type            zeroGradient;		// zeroGradient gewaehlt
    }
    frontAndBack
    {
        type            empty;			// 2D-Bedingung fuer z-Richtung
    }
}


// ************************************************************************* //
