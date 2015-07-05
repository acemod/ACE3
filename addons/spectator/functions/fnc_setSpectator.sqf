/*
 * Author: voiper, SilentSpike
 * Sets local player to the given spectator state
 *
 * Arguments:
 * 0: Spectator camera target <OBJECT>
 * 1: New spectator state <BOOL> <OPTIONAL>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [player, _killer] call ace_spectator_fnc_setSpectator
 *
 * Public: Yes
 */

#include "script_component.hpp"

_unit = player;
_target = _this select 0;
_set = if (count _this > 1) then {_this select 1} else {true};

// No change, no service (but allow spectators who respawn to be reset)
if !(_set || (_unit getVariable [QGVAR(isSpectator), false])) exitWith {};

// Prevent player falling into water
_unit enableSimulation !_set;

if (_set) then {
    // Move and hide the player ASAP to avoid being seen
    _unit setPosASL (getMarkerPos QGVAR(respawn));
    [_unit] joinSilent grpNull;

    // Ghosts can't talk
    [_unit, "isSpectator"] call EFUNC(common,hideUnit);
    [_unit, "isSpectator"] call EFUNC(common,muteUnit);

    if !(GVAR(modulePos)) then {
        if !(isNull _target) then {
            GVAR(startingPos) = getPosATL _target;
        };
    };

    ["Init", [true]] call FUNC(camera);
} else {
    // Code to exit spectator and "respawn" player goes here (WIP)
    ["Exit"] call FUNC(camera);

    // Physical beings can talk
    [_unit, "isSpectator"] call EFUNC(common,unhideUnit);
    [_unit, "isSpectator"] call EFUNC(common,unmuteUnit);

    // Don't create groups unless necessary (arma has a group limit)
    if (isNull GVAR(cachedGroup)) then {
        [_unit] joinSilent (createGroup GVAR(cachedSide));
    } else {
        [_unit] joinSilent GVAR(cachedGroup);
    };
};

// Handle common addon audio
if (["ace_hearing"] call EFUNC(common,isModLoaded)) then {EGVAR(hearing,disableVolumeUpdate) = _set};
if (["acre_sys_radio"] call EFUNC(common,isModLoaded)) then {[_set] call acre_api_fnc_setSpectator};
if (["task_force_radio"] call EFUNC(common,isModLoaded)) then {[_unit, _set] call TFAR_fnc_forceSpectator};

// Spectators ignore damage (vanilla and ace_medical)
_unit allowDamage !_set;
_unit setVariable [QEGVAR(medical,allowDamage), !_set];

// No theoretical change if an existing spectator was reset
if !(_set && (_unit getVariable [QGVAR(isSpectator), false])) then {
    // Mark spectator state for reference
    _unit setVariable [QGVAR(isSpectator), _set];

    ["spectatorChanged",[_set]] call EFUNC(common,localEvent);
};
