IOdictionary EHDproperties
(
	IOobject
	(
		"EHDproperties",
		runTime.constant(),
		mesh,
		IOobject::MUST_READ,
		IOobject::NO_WRITE
	)
);

dimensionedScalar rho0("rho0", dimMass/dimVolume, laminarTransport);


// Permitivity
dimensionedScalar epsilon0
(
	EHDproperties.lookup("epsilon0")
);

// Ion mobility
dimensionedScalar mobil
(
	EHDproperties.lookup("mobil")
);




