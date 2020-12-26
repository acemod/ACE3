#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Formally a ace_setting, users can still disable by `setting ace_missileguidance_enabled = x;` 
// [0 - Off , 1 - PlayerOnly, 2 - PlayerAndAi]
// As weapons take config changes, there is little point in being able to disable guidance
if (isNil QGVAR(enabled)) then { GVAR(enabled) = 2; };

GVAR(guidedWeapons) = [];
GVAR(seekers) = [];
GVAR(sensors) = [];
GVAR(activeSensors) = [];
GVAR(flightProfiles) = [];
GVAR(projectiles) = [];
GVAR(countermeasures) = [];
GVAR(fuzes) = [];
GVAR(timeVars) = [0, 0, 0, 0];


ADDON = true;
