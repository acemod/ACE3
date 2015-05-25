/*
 * Author: Glowbal
 * Unload a person from a vehicle
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * Returns true if succesfully unloaded person <BOOL>
 *
 * Public: No
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

#define GROUP_SWITCH_ID QUOTE(FUNC(loadPerson))

private ["_vehicle", "_loaded","_caller"];
PARAMS_1(_unit);
_vehicle = vehicle _unit;
_caller = ACE_Player;

if (_vehicle == _unit) exitwith {false;};
if !(speed _vehicle <1 && (((getpos _vehicle) select 2) < 2)) exitwith {false;};

if (!isNull _vehicle) then {
    [_unit, true, GROUP_SWITCH_ID, side group _caller] call FUNC(switchToGroupSide);
    [[_unit], QUOTE(FUNC(unloadPersonLocal)), _unit, false] call EFUNC(common,execRemoteFnc);
};

true;
