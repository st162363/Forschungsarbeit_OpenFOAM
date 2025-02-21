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
    object      nut;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

dimensions      [0 2 -1 0 0 0 0];

internalField   uniform 0;

boundaryField
{
    movingWall
    {
        type            nutkWallFunction;	// Wandfunktion an der bewegten Wand - 
        					// nutkWallFunction; nutLowReWallFunction; nutUSpaldingWallFunction
        value           uniform 0;		// Initialwert fuer Stabilitaet
    }
    fixedWall
    {
        type            nutkWallFunction;	// Wandfunktion an der stationaeren Wand - 
        					// nutkWallFunction; nutLowReWallFunction; nutUSpaldingWallFunction
        value           uniform 0;
    }
    inlet
    {
    	type            calculated;		//calculated statt zeroGradient gewaehlt
    	value           uniform 0;
    }
    outlet
    {
    	type            calculated;		//calculated statt zeroGradient gewaehlt
    	value           uniform 0;
    }
    frontAndBack
    {
        type            empty;			// 2D-Bedingung fuer z-Richtung
    }
}


// ************************************************************************* //
