/*
 * Author: SilentSpike
 * The ace_spectator respawn template, compatible with types 1,2,3,4 & 5
 *
 * Handles killed and respawned events as per BI's respawn framework:
 * https://community.bistudio.com/wiki/Arma_3_Respawn
 *
 * Arguments:
 * 0: Corpse/New Unit <OBJECT>
 * 1: Killer/Old Unit <OBJECT>
 * 2: Respawn Type <NUMBER>
 * 3: Respawn Delay <NUMBER>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [bob, kevin, 3, 6] call ace_spectator_fnc_respawnTemplate
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_newCorpse",objNull,[objNull]], ["_oldKiller",objNull,[objNull]], ["_respawn",0,[0]], ["_respawnDelay",0,[0]]];
TRACE_4("respawnTemplate",_newCorpse,_oldKiller,_respawn,_respawnDelay);

// Compatibility handled via spectator display XEH
if (_respawn in [0,1,4,5]) exitWith {
    // This only applies to respawn type 1 (BIRD/SPECTATOR)
    // Remove the seagull (not actually the player, a CfgNonAIVehicles object)
    if (typeOf _newCorpse == "seagull") then { deleteVehicle _newCorpse; };
};

// Virtual spectators should be ignored by the template (otherwise they break)
if (_newCorpse isKindOf QGVAR(virtual)) exitWith {};

// If player died while already in spectator, ignore
if (!GVAR(isSet) || {alive _newCorpse}) then {
    // Negligible respawn delay can result in entering spectator after respawn
    // So we just use this value rather than living state of the unit
    [playerRespawnTime > 1] call FUNC(setSpectator);
};
