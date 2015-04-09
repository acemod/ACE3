#include "script_component.hpp"

#include "initKeybinds.sqf"

GVAR(enabled) = true;

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

GVAR(SimulationPrecision) = 1;

GVAR(WindEnabled) = true;
GVAR(SpinDriftEnabled) = true;
GVAR(CoriolisEnabled) = true;
GVAR(EoetvoesEnabled) = true;
GVAR(AdvancedAirDragEnabled) = true;
GVAR(TransonicRegionEnabled) = true;
GVAR(AmmoTemperatureEnabled) = true;
GVAR(BulletTraceEnabled) = true;
GVAR(AtmosphericDensitySimulationEnabled) = true;
GVAR(BarrelLengthInfluenceEnabled) = true;
GVAR(VehicleGunnerEnabled) = true;

GVAR(INIT_MESSAGE_ENABLED) = false;

[] call FUNC(initializeTerrainExtension);
