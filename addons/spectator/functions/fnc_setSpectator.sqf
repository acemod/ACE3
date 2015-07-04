/*
 * Author: voiper, SilentSpike
 * Sets local player to the given spectator state
 *
 * Arguments:
 * 0: Player unit (unused, result of EH) <OBJECT>
 * 1: Spectator camera target <OBJECT>
 * 2: New spectator state <BOOL> <OPTIONAL>
 *
 * Return Value:
 * nil
 *
 * Example:
 * [player, _killer] call ace_spectator_fnc_setSpectator
 *
 * Public: Yes
 */

#include "script_component.hpp"

_unit = player;
_target = _this select 1;
_set = if (count _this > 2) then {_this select 2} else {true};

if (_set isEqualTo (_unit getVariable [QGVAR(isSpectator), false])) exitWith {};

// Prevent player falling into water
_unit enableSimulation !_set;

if (_set) then {
    //Cache resettable info first
    GVAR(cachedGroup) = group _unit;
    GVAR(cachedSide) = side GVAR(cachedGroup);

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
_unit setVariable [QGVAR(medical,allowDamage), !_set];

// Mark spectator state for external reference
_unit setVariable [QGVAR(isSpectator),_set];

["spectatorChanged",[_set]] call EFUNC(common,localEvent);
