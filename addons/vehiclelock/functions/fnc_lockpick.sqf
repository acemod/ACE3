/*
 * Author: PabstMirror
 * Handles lockpick functionality.  Three different functions:
 * "canLockpick": returns BOOL if lockpick is possible
 * "startLockpick": starts the process
 * "finishLockpick": on completions, opens the lock
 *
 * Arguments:
 * 0: Unit (player) <OBJECT>
 * 1: Vehicle <OBJECT>
 * 2: Function Type <OBJECT>
 *
 * Return Value:
 * "canLockpick" <BOOL>
 *
 * Example:
 * [ACE_player, ACE_Interaction_Target, 'canLockpick'] call ACE_VehicleLock_fnc_lockpick
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_vehLockpickStrenth","_condition","_returnValue"];

params ["_unit", "_veh", "_funcType"];
TRACE_3("params",_unit,_veh,_funcType);

if (isNull _unit) exitWith {ERROR("null unit"); false};
if (isNull _veh) exitWith {ERROR("null vehicle"); false};

//Exit if vehicle unlocked:
if ((locked _veh) == 0) exitWith {false};

//need lockpick item
if (!("ACE_key_lockpick" in (items _unit))) exitWith {false};

_vehLockpickStrenth = _veh getVariable[QGVAR(lockpickStrength), GVAR(DefaultLockpickStrength)];
if (!(_vehLockpickStrenth isEqualType 0)) exitWith {ERROR("ACE_vehicleLock_LockpickStrength invalid"); false};

//-1 indicates unpickable lock
if (_vehLockpickStrenth < 0) exitWith {false};

//Condition check for progressBar
_condition = {
    params ["_args"];
    _args params ["_unit", "_veh"];
    ((_unit distance _veh) < 5) && {(speed _veh) < 0.1}
};

if (!([[_unit, _veh]] call _condition)) exitWith {false};

_returnValue = _funcType in ["canLockpick", "startLockpick", "finishLockpick"];
switch (_funcType) do {
    case "canLockpick": {
        _returnValue = !([_unit, _veh] call FUNC(hasKeyForVehicle)) && {(locked _veh) in [2, 3]};
    };
    case "startLockpick": {
        [_vehLockpickStrenth, [_unit, _veh, "finishLockpick"], {(_this select 0) call FUNC(lockpick)}, {}, (localize LSTRING(Action_LockpickInUse)), _condition, ["isNotInside"]] call EFUNC(common,progressBar);
    };
    case "finishLockpick": {
        [QGVAR(setVehicleLock), [_veh, false], [_veh]] call CBA_fnc_targetEvent;
    };
    default {
        ERROR("bad function type");
    };
};

_returnValue
