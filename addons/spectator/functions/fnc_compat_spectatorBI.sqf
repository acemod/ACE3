/*
 * Author: SilentSpike
 * Handles "compatibility" (i.e. override) for BI spectator respawn types 1, 4 & 5
 *
 * Called from the EG spectator display XEH
 *
 * Public: No
 */

#include "script_component.hpp"

private _respawn = getMissionConfigValue ["respawn",0];
if (_respawn isEqualType "") then { _respawn = ["","bird","","","group","side"] find (toLower _respawn); };
if !(_respawn in [1,4,5]) exitWith {};

private _templates = getMissionConfigValue ["respawnTemplates",[]];
if !(QUOTE(ADDON) in _templates) exitWith {};

// Kill BI spectator
["Terminate"] call BIS_fnc_EGSpectator;

// Don't be a seagull
// TODO: Make this work
private _seagull = player;
if (typeOf _seagull == "seagull") then {
    private _grp = createGroup [sideLogic, true];
    private _virtual = _grp createUnit [QGVAR(virtual),[0,0,0],[],0,""];

    selectPlayer _virtual;
    deleteVehicle _seagull;
};

// Start our spectator
[true] call FUNC(setSpectator);
