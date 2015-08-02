/*
 * Author: SilentSpike
 * Sets target unit to the given spectator state (physically)
 * To virtually handle a spectator see ace_spectator_fnc_setSpectator
 *
 * Units will be gathered at marker ace_spectator_respawn (or [0,0,0] by default)
 * Upon unstage, units will be moved to the position they were in upon staging
 *
 * Arguments:
 * 0: Unit to put into spectator stage <OBJECT>
 * 1: Spectator stage <BOOL> <OPTIONAL>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [player, false] call ace_spectator_fnc_stageSpectator
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit", ["_set",true,[true]]];

// No change, no service (but allow spectators to be reset)
if !(_set || (GETVAR(_unit,GVAR(isStaged),false))) exitWith {};

// Only run for player units
if !(isPlayer _unit) exitWith {};

if !(local _unit) exitwith {
    [[_unit, _set, _target], QFUNC(stageSpectator), _unit] call EFUNC(common,execRemoteFnc);
};

// Prevent player falling into water
_unit enableSimulation !_set;

// Move to/from group as appropriate
[_unit, _set, QGVAR(isStaged), side group _unit] call EFUNC(common,switchToGroupSide);

if (_set) then {
    // Move and hide the player ASAP to avoid being seen
    GVAR(oldPos) = getPosATL _unit;
    _unit setPos (getMarkerPos QGVAR(respawn));

    // Ghosts can't talk
    [_unit, QGVAR(isStaged)] call EFUNC(common,hideUnit);
    [_unit, QGVAR(isStaged)] call EFUNC(common,muteUnit);
} else {
    // Physical beings can talk
    [_unit, QGVAR(isStaged)] call EFUNC(common,unhideUnit);
    [_unit, QGVAR(isStaged)] call EFUNC(common,unmuteUnit);

    _unit setPosATL GVAR(oldPos);
};

// Spectators ignore damage (vanilla and ace_medical)
_unit allowDamage !_set;
_unit setVariable [QEGVAR(medical,allowDamage), !_set];

// No theoretical change if an existing spectator was reset
if !(_set isEqualTo (GETVAR(_unit,GVAR(isStaged),false))) then {
    // Mark spectator state for reference
    _unit setVariable [QGVAR(isStaged), _set, true];

    ["spectatorStaged",[_set]] call EFUNC(common,localEvent);
};
