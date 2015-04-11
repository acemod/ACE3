#include "script_component.hpp"

#include "initKeybinds.sqf"

// AB is disabled by default
GVAR(enabled) = false;

//GVAR(VehicleGunnerEnabled) = true; // TODO: We currently do not have firedEHs on vehicles
GVAR(AmmoTemperatureEnabled) = true;
GVAR(BarrelLengthInfluenceEnabled) = true;
GVAR(BulletTraceEnabled) = true;

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
