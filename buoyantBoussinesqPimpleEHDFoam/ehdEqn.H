	// Electrostatic Solvers
        solve
        (
            fvm::laplacian(elecPot) + chargeDens/epsilon0
        );

        rhoFlux = -mobil*mesh.magSf()*fvc::snGrad(elecPot);

        solve
        (
            fvm::ddt(chargeDens)+fvm::div(rhoFlux, chargeDens)
        );
        
		elec=-fvc::grad(elecPot);
		elecMag=mag(elec);
		curDens=chargeDens*mobil*elec;
		ionicForce= -chargeDens*fvc::grad(elecPot)/rho0;
