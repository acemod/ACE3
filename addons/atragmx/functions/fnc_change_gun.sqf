/*
 * Author: Ruthberg
 * Selects a new gun profile and updates the gun column and the result input/output fields
 *
 * Arguments:
 * gunID <number>
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

if (_this < 0 || _this > (count GVAR(gunList)) - 1) exitWith {};

GVAR(workingMemory) set [GVAR(currentTarget), +(GVAR(gunList) select _this)];
GVAR(currentGun) set [GVAR(currentTarget), _this];

lbSetCurSel [6000, (GVAR(currentGun) select GVAR(currentTarget))];

if ((GVAR(scopeUnits) select (GVAR(currentScopeUnit) select GVAR(currentTarget))) != "Clicks") then
{
    GVAR(currentScopeUnit) set [GVAR(currentTarget), (GVAR(workingMemory) select GVAR(currentTarget)) select 6];
};

[] call FUNC(update_gun);

GVAR(elevationOutput) set [GVAR(currentTarget), 0];
GVAR(windageOutput) set [GVAR(currentTarget), 0];
GVAR(leadOutput) set [GVAR(currentTarget), 0];
GVAR(tofOutput) set [GVAR(currentTarget), 0];
GVAR(velocityOutput) set [GVAR(currentTarget), 0];

[] call FUNC(update_result);
