/*
 * Author: SilentSpike
 * Stores and hides a player safely out of the way (used on spectator players)
 *
 * Units will be gathered at marker ace_spectator_respawn (or [0,0,0] by default)
 * Upon unstage, units will be moved to the position they were in before staging
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_unit",player,[objNull]], ["_set",true,[true]]];

// No change, no service (but allow spectators to be reset)
if !(_set || (GETVAR(_unit,GVAR(isStaged),false))) exitWith {};

if !(local _unit) exitWith {
    [QGVAR(stageSpectator), [_unit, _set], _unit] call CBA_fnc_targetEvent;
};

// Prevent unit falling into water
_unit enableSimulation !_set;

// Move to/from group as appropriate
[_unit, _set, QGVAR(isStaged), side group _unit] call EFUNC(common,switchToGroupSide);

if (_set) then {
    // Position should only be saved on first entry
    if !(GETVAR(_unit,GVAR(isStaged),false)) then {
        SETVAR(_unit,GVAR(preStagePos),getPosATL _unit);

        // Handle players respawning via pause menu (or script)
        private _id = _unit addEventHandler ["Respawn",{
            params ["_unit"];
            [_unit] call FUNC(stageSpectator);
        }];

        SETVAR(_unit,GVAR(respawnEH),_id);
    };

    // Ghosts can't talk
    [_unit, QGVAR(isStaged)] call EFUNC(common,hideUnit);
    [_unit, QGVAR(isStaged)] call EFUNC(common,muteUnit);

    // Position defaults to [0,0,0] if marker doesn't exist
    _unit setPos (markerPos QGVAR(respawn));
} else {
    // Physical beings can talk
    [_unit, QGVAR(isStaged)] call EFUNC(common,unhideUnit);
    [_unit, QGVAR(isStaged)] call EFUNC(common,unmuteUnit);

    // Restore original position and delete stored value
    _unit setPosATL (GETVAR(_unit,GVAR(preStagePos),getPosATL _unit));
    SETVAR(_unit,GVAR(preStagePos),nil);

    // Remove the respawn handling
    _unit removeEventHandler ["Respawn",GETVAR(_unit,GVAR(respawnEH),-1)];
    SETVAR(_unit,GVAR(respawnEH),nil);
};

// Spectators ignore damage (vanilla and ace_medical)
_unit allowDamage !_set;
_unit setVariable [QEGVAR(medical,allowDamage), !_set];

// No theoretical change if an existing spectator was reset
if !(_set isEqualTo (GETVAR(_unit,GVAR(isStaged),false))) then {
    // Mark spectator state for reference
    _unit setVariable [QGVAR(isStaged), _set, true];
};
