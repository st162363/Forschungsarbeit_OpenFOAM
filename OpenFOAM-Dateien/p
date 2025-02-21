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
    object      p;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

dimensions      [0 2 -2 0 0 0 0];

internalField   uniform 0.0053865;		// Mittelwert zwischen Inlet und Outlet

boundaryField
{
    movingWall
    {
        type            zeroGradient;
    }

    fixedWall
    {
        type            zeroGradient;
    }
    
	inlet
    {
        type            fixedValue;
        value           uniform 0.010773;	// Druck am Inlet - CP1:0.01265544; CP3:0.010773
    }
    
    outlet
    {
        type            fixedValue;
        value           uniform 0;		// Referenzdruck am Outlet
    }						// (gleich 0 gesetzt um errechneten Druckgradient zu erzeugen)
    
    frontAndBack
    {
        type            empty;			// 2D-Bedingung fuer z-Richtung
    }
}

// ************************************************************************* //
