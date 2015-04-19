/*
 * Author: Ruthberg
 * Selects a new gun profile and updates the gun column and the result input/output fields
 *
 * Arguments:
 * gunID <number>
 * update solution <BOOL>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_change_gun
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_gunID", "_updateSolution"];
_gunID          = _this select 0;
_updateSolution = _this select 1;

if (_gunID < 0 || _gunID > (count GVAR(gunList)) - 1) exitWith {};

GVAR(workingMemory) = +(GVAR(gunList) select _gunID);
GVAR(currentGun) = _gunID;

lbSetCurSel [6000, GVAR(currentGun)];

if ((GVAR(scopeUnits) select GVAR(currentScopeUnit)) != "Clicks") then {
    GVAR(currentScopeUnit) = GVAR(workingMemory) select 6;
};

[] call FUNC(update_gun);
[] call FUNC(update_gun_ammo_data);

GVAR(elevationOutput) set [GVAR(currentTarget), 0];
GVAR(windage1Output) set [GVAR(currentTarget), 0];
GVAR(windage2Output) set [GVAR(currentTarget), 0];
GVAR(leadOutput) set [GVAR(currentTarget), 0];
GVAR(tofOutput) set [GVAR(currentTarget), 0];
GVAR(velocityOutput) set [GVAR(currentTarget), 0];

if (_updateSolution) then {
    [] call FUNC(calculate_target_solution);
};
