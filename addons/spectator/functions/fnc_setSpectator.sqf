/*
 * Author: SilentSpike
 * Sets target unit to the given spectator state (virtually)
 * To physically handle a spectator see ace_spectator_fnc_stageSpectator
 *
 * Units will be able to communicate in ACRE/TFAR as appropriate
 * The spectator interface will be opened/closed
 *
 * Arguments:
 * 0: Unit to put into spectator state <OBJECT>
 * 1: Spectator state <BOOL> <OPTIONAL>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [player, true] call ace_spectator_fnc_setSpectator
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit", ["_set",true,[true]]];

// No change, no service (but allow spectators to be reset)
if !(_set || (GETVAR(_unit,GVAR(isSet),false))) exitWith {};

// Only run for player units
if !(isPlayer _unit) exitWith {};

if !(local _unit) exitwith {
    [[_unit, _set, _target], QFUNC(setSpectator), _unit] call EFUNC(common,execRemoteFnc);
};

if (_set) then {
    ["open"] call FUNC(handleInterface);
} else {
    ["close",_unit] call FUNC(handleInterface);
};

// Handle common addon audio
if (["ace_hearing"] call EFUNC(common,isModLoaded)) then {EGVAR(hearing,disableVolumeUpdate) = _set};
if (["acre_sys_radio"] call EFUNC(common,isModLoaded)) then {[_set] call acre_api_fnc_setSpectator};
if (["task_force_radio"] call EFUNC(common,isModLoaded)) then {[_unit, _set] call TFAR_fnc_forceSpectator};

// No theoretical change if an existing spectator was reset
if !(_set isEqualTo (GETVAR(_unit,GVAR(isSet),false))) then {
    // Mark spectator state for reference
    _unit setVariable [QGVAR(isSet), _set, true];

    ["spectatorSet",[_set]] call EFUNC(common,localEvent);
};
