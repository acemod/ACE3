#include "script_component.hpp"

#include "initKeybinds.sqf"

GVAR(currentbulletID) = -1;

GVAR(Protractor) = false;
GVAR(ProtractorStart) = ACE_time;
GVAR(allBullets) = [];
GVAR(currentGrid) = 0;

GVAR(extensionAvailable) = true;
/* @TODO: Remove this until versioning is in sync with cmake/build versioning
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
