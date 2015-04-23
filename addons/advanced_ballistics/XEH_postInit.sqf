#include "script_component.hpp"

#include "initKeybinds.sqf"

GVAR(currentbulletID) = -1;

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

/* @TODO: Remove this until verisoning is in sync with cmake/build versioning
GVAR(extensionVersion) = ("ace_advanced_ballistics" callExtension "version");
GVAR(extensionAvailable) = (GVAR(extensionVersion) == EXTENSION_REQUIRED_VERSION);
if (!GVAR(extensionAvailable)) exitWith {
    if (GVAR(extensionVersion) == "") then {
        diag_log text "[ACE] ERROR: ace_advanced_ballistics.dll is missing";
    } else {
        diag_log text "[ACE] ERROR: ace_advanced_ballistics.dll is incompatible";
    };
};
*/
[] call FUNC(initializeTerrainExtension);
