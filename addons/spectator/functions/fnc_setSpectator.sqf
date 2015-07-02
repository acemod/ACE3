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

// Spectators aren't physical entities (todo: this command has to be executed on the server)
_unit hideObjectGlobal _set;

if (isClass (configFile >> "CfgPatches" >> "ace_hearing")) then {EGVAR(hearing,disableVolumeUpdate) = _set};
if (isClass (configFile >> "CfgPatches" >> "acre_sys_radio")) then {[_set] call acre_api_fnc_setSpectator};
if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {[_unit, _set] call TFAR_fnc_forceSpectator};

if (_set) then {
    // Move the player ASAP to avoid being seen
    _unit setPosATL GVAR(penPos);

    if !(GVAR(modulePos)) then {
        if !(isNull _target) then {
            GVAR(startingPos) = getPosATL _target;
        };
    };

    // Spectators shouldn't show in group UI
    [_unit] joinSilent grpNull;

    // Prevent drowning and vision blur
    if (surfaceisWater GVAR(penPos)) then {
        _unit forceAddUniform "U_B_Wetsuit";
        _unit addVest "V_RebreatherB";
    };

    // Dead men can't talk
    [_unit, "isSpectator"] call EFUNC(common,muteUnit);

    0 fadeSound 0;
    999999 cutText ["", "BLACK FADED", 0];
    ["Init", [true]] call FUNC(camera);
} else {
    // Code to exit spectator and "respawn" player goes here (WIP)
    ["Exit"] call FUNC(camera);
};

// Spectators ignore damage (vanilla and ace_medical)
_unit allowDamage !_set;
_unit setVariable ["ace_medical_allowDamage", !_set];

// Mark spectator state for external reference
[_unit,QGVAR(isSpectator),_set] call EFUNC(common,setVariableJIP);

["spectatorChanged",[_set]] call EFUNC(common,localEvent);
