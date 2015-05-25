/*
 * Author: ViperMaul
 * Unload a person from a vehicle, local
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

private ["_vehicle", "_loaded", "_emptyPos"];
PARAMS_1(_unit);
_vehicle = vehicle _unit;

if (_vehicle == _unit) exitwith {false;};
if !(speed _vehicle <1 && (((getpos _vehicle) select 2) < 2)) exitwith {false;};

_emptyPos = ((getPos _vehicle) findEmptyPosition [0, 10, typeof _unit]);
if (count _emptyPos == 0) exitwith {false};

_unit setPos _emptyPos;
unassignVehicle _unit;
if (!alive _unit) then {
    _unit action ["Eject", vehicle _unit];
};

[_unit, false, GROUP_SWITCH_ID, side group _unit] call FUNC(switchToGroupSide);

_loaded = _vehicle getvariable [QGVAR(loaded_persons),[]];
_loaded = _loaded - [_unit];
_vehicle setvariable [QGVAR(loaded_persons),_loaded,true];

if (!([_unit] call FUNC(isAwake))) then {
    [_unit,([_unit] call FUNC(getDeathAnim)), 1, true] call FUNC(doAnimation);
};

true;
