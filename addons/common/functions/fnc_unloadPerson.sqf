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

private ["_vehicle","_emptyPos"];
PARAMS_1(_unit);
_vehicle = vehicle _unit;

if (_vehicle == _unit) exitwith {false;};
if !(speed _vehicle <1 && (((getpos _vehicle) select 2) < 2)) exitwith {false;};

_emptyPos = ((getPos _vehicle) findEmptyPosition [0, 10, typeof _unit]);
if (count _emptyPos == 0) exitwith {false};

if (!isNull _vehicle) then {
    [[_unit], QUOTE(FUNC(unloadPersonLocal)), _unit, false] call EFUNC(common,execRemoteFnc);
};

true;
