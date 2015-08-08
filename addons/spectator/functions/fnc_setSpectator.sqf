/*
 * Author: SilentSpike
 * Sets local client to the given spectator state (virtually)
 * To physically handle a spectator see ace_spectator_fnc_stageSpectator
 *
 * Client will be able to communicate in ACRE/TFAR as appropriate
 * The spectator interface will be opened/closed
 *
 * Arguments:
 * 0: Spectator state of local client <BOOL> <OPTIONAL>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [true] call ace_spectator_fnc_setSpectator
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_set",true,[true]]];

// Only clients can be spectators
if !(hasInterface) exitWith {};

// Handle common addon audio
if (["ace_hearing"] call EFUNC(common,isModLoaded)) then {EGVAR(hearing,disableVolumeUpdate) = _set};
if (["acre_sys_radio"] call EFUNC(common,isModLoaded)) then {[_set] call acre_api_fnc_setSpectator};
if (["task_force_radio"] call EFUNC(common,isModLoaded)) then {[player, _set] call TFAR_fnc_forceSpectator};

if (_set) then {
    ["open"] call FUNC(handleInterface);
} else {
    ["close"] call FUNC(handleInterface);
};

// Mark spectator state for reference
GVAR(isSet) = _set;

["spectatorSet",[_set]] call EFUNC(common,localEvent);
