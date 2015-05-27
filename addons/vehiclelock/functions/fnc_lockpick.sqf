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

PARAMS_3(_unit,_veh,_funcType);

if (isNull _unit) exitWith {ERROR("null unit"); false};
if (isNull _veh) exitWith {ERROR("null vehicle"); false};

//Exit if vehicle unlocked:
if ((locked _veh) == 0) exitWith {false};

//need lockpick item
if (!("ACE_key_lockpick" in (items _unit))) exitWith {false};

_vehLockpickStrenth = _veh getVariable[QGVAR(lockpickStrength), GVAR(DefaultLockpickStrength)];
if (typeName _vehLockpickStrenth != "SCALAR") exitWith {ERROR("ACE_vehicleLock_LockpickStrength invalid"); false};

//-1 indicates unpickable lock
if (_vehLockpickStrenth < 0) exitWith {false};

//Condition check for progressBar
_condition = {
    PARAMS_1(_args);
    EXPLODE_2_PVT(_args,_unit,_veh);
    ((_unit distance _veh) < 5) && {(speed _veh) < 0.1}
};

if (!([[_unit, _veh]] call _condition)) exitWith {false};

_returnValue = false;
switch (true) do {
case (_funcType == "canLockpick"): {
        _returnValue = true;
    };
case (_funcType == "startLockpick"): {
        [_vehLockpickStrenth, [_unit, _veh, "finishLockpick"], {(_this select 0) call FUNC(lockpick)}, {}, (localize STRING(Action_LockpickInUse)), _condition] call EFUNC(common,progressBar);
        _returnValue = true;
    };
case (_funcType == "finishLockpick"): {
        ["VehicleLock_SetVehicleLock", [_veh], [_veh, false]] call EFUNC(common,targetEvent);
        _returnValue = true;
    };
    default {
        ERROR("bad function type");
    };
};

_returnValue
