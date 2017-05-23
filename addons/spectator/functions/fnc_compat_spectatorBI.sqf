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

// Start our spectator
[true] call FUNC(setSpectator);

// Delete the seagull that spawns (not actually the player, a CfgNonAIVehicles object)
// This could delete seagulls created by a wildlife module (TODO: Find a more accurate method of getting the exact seagull)
{ if (_x isKindOf "seagull") then {deleteVehicle _x;}; } forEach (nearObjects [player, [], 250]);

// Switch to a virtual unit so draw3D continues to work
private _grp = createGroup [sideLogic, true];
private _virtual = _grp createUnit [QGVAR(virtual),[0,0,0],[],0,""];

selectPlayer _virtual;
