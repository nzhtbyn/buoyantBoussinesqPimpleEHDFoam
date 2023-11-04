Info<< "Reading field elecPot\n" << endl;
volScalarField elecPot
(
    IOobject
    (
        "elecPot",
        runTime.timeName(),
        mesh,
        IOobject::MUST_READ,
        IOobject::AUTO_WRITE
    ),
    mesh
);

Info<< "Reading field chargeDens\n" << endl;
volScalarField chargeDens
(
    IOobject
    (
        "chargeDens",
        runTime.timeName(),
        mesh,
        IOobject::MUST_READ,
        IOobject::AUTO_WRITE
    ),
    mesh
);


    Info<< "Calculating field rhoFlux\n" << endl;
    surfaceScalarField rhoFlux
    (
        IOobject
        (
            "rhoFlux",
            runTime.timeName(),
            mesh,
            IOobject::NO_READ,
            IOobject::NO_WRITE
        ),
        -mobil*mesh.magSf()*fvc::snGrad(elecPot)
    );

    Info<< "Calculating field elecFieldSurf\n" << endl;
    surfaceScalarField gradphii
    (
        IOobject
        (
            "gradphii",
            runTime.timeName(),
            mesh,
            IOobject::NO_READ,
            IOobject::AUTO_WRITE
        ),
        mesh,
        dimensionedScalar("gradphii", elecPot.dimensions()/dimLength,scalar(0))
    );

    Info<< "Calculating field elecFieldVol\n" << endl;
    volVectorField elec
    (
        IOobject
        (
            "elec",
            runTime.timeName(),
            mesh,
            IOobject::NO_READ,
            IOobject::AUTO_WRITE
        ),
        -fvc::grad(elecPot)
    );

    Info<< "Calculating field elecFieldVolMag\n" << endl;
    volScalarField elecMag
    (
        IOobject
        (
            "elecMag",
            runTime.timeName(),
            mesh,
            IOobject::NO_READ,
            IOobject::AUTO_WRITE
        ),
        mag(elec)
    );
        Info<< "Calculating field curDensity\n" << endl;
    volVectorField curDens
    (
        IOobject
        (
            "curDens",
            runTime.timeName(),
            mesh,
            IOobject::NO_READ,
            IOobject::AUTO_WRITE
        ),
        chargeDens*mobil*elec
    );

        Info<< "Calculating field ionicForce\n" << endl;
    volVectorField ionicForce
    (
        IOobject
        (
            "ionicForce",
            runTime.timeName(),
            mesh,
            IOobject::NO_READ,
            IOobject::AUTO_WRITE
        ),
        -chargeDens*fvc::grad(elecPot)/rho0
    );
