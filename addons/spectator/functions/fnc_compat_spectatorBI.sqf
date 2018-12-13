#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Handles "compatibility" (i.e. override) for BI spectator respawn types 1, 4 & 5
 *
 * Called from the RscDisplayEGSpectator XEH
 *
 * Arguments:
 * 0: RscDisplayEGSpectator <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * _this call ace_spectator_fnc_compat_spectatorBI
 *
 * Public: No
 */

private _respawn = getMissionConfigValue ["respawn",0];
if (_respawn isEqualType "") then { _respawn = ["","bird","","","group","side"] find (toLower _respawn); };
if !(_respawn in [1,4,5]) exitWith {};

// Remember to check for side specific templates
private _templates = getMissionConfigValue [["respawnTemplates",side group player] joinString "",getMissionConfigValue ["respawnTemplates",[]]];
if !(QUOTE(ADDON) in _templates) exitWith {};

// Kill BI spectator
["Terminate"] call BIS_fnc_EGSpectator;

// Start our spectator
[true] call FUNC(setSpectator);

// Delete the seagull that spawns (not actually the player, a CfgNonAIVehicles object)
// Respawn type 1 is handled in the template where seagull is passed as paremeter
if (_respawn in [4,5]) then {
    // This could delete seagulls created by a wildlife module (a necessary evil)
    // TODO: Try to find seagull position and delete more accurately with reduced radius
    { if (_x isKindOf "seagull") then {deleteVehicle _x;}; } forEach (nearestObjects [player, [], 250]);
};

// Switch to a virtual unit so draw3D continues to work
private _grp = createGroup [sideLogic, true];
private _virtual = _grp createUnit [QGVAR(virtual),[0,0,0],[],0,"NONE"];

// Prevent unit falling into water (compatibility for some addons)
_virtual enableSimulation false;

// Transfer assigned zeus if applicable
private _zeus = getAssignedCuratorLogic player;
if !(isNull _zeus) then {
    [QGVAR(transferZeus), [_virtual,_zeus]] call CBA_fnc_serverEvent;
};

selectPlayer _virtual;
