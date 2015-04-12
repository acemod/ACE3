#include "script_component.hpp"

#include "initKeybinds.sqf"

GVAR(enabled) = true;

//GVAR(vehicleGunnerEnabled) = true; // TODO: We currently do not have firedEHs on vehicles
GVAR(ammoTemperatureEnabled) = true;
GVAR(barrelLengthInfluenceEnabled) = true;
GVAR(bulletTraceEnabled) = true;
GVAR(onlyActiveForLocalPlayers) = false;
GVAR(disabledInFullAutoMode) = false;
GVAR(alwaysSimulateForSnipers) = true;
GVAR(simulationRadius) = 3000;

GVAR(bulletDatabase) = [];
GVAR(bulletDatabaseStartTime) = [];
GVAR(bulletDatabaseSpeed) = [];
GVAR(bulletDatabaseFrames) = [];
GVAR(bulletDatabaseLastFrame) = [];
GVAR(bulletDatabaseHDeflect) = [];
GVAR(bulletDatabaseSpinDrift) = [];
GVAR(bulletDatabaseOccupiedIndices) = [];
GVAR(bulletDatabaseFreeIndices) = [];

GVAR(WindInfo) = false;
GVAR(WindInfoStart) = time;

GVAR(Protractor) = false;
GVAR(ProtractorStart) = time;

// Those are only used in the pure sqf version (extension free PFH)
GVAR(SimulationPrecision) = 2;
GVAR(WindEnabled) = true;
GVAR(SpinDriftEnabled) = true;
GVAR(CoriolisEnabled) = true;
GVAR(EoetvoesEnabled) = true;
GVAR(AdvancedAirDragEnabled) = true;
GVAR(TransonicRegionEnabled) = true;
GVAR(AtmosphericDensitySimulationEnabled) = true;

GVAR(currentGrid) = 0;
GVAR(INIT_MESSAGE_ENABLED) = false;

[] call FUNC(initializeTerrainExtension);
