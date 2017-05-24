/*
 * Author: SilentSpike
 * The ace_spectator respawn template, compatible with types 2 & 3
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
 * Public: No
 */

#include "script_component.hpp"

params [["_newCorpse",objNull,[objNull]], ["_oldKiller",objNull,[objNull]], ["_respawn",0,[0]], ["_respawnDelay",0,[0]]];

// Compatibility handled via spectator display XEH
if (_respawn in [0,1,4,5]) exitWith {

    // This only applies to respawn type 1 (BIRD/SPECTATOR)
    // Remove the seagull (not actually the player, a CfgNonAIVehicles object)
    if (typeOf _newCorpse == "seagull") then { deleteVehicle _newCorpse; };
};

// Negligible respawn delay can result in entering spectator after respawn
if (playerRespawnTime <= 1) exitWith {};

// Enter/exit spectator based on whether killed/respawned
[!alive _newCorpse] call FUNC(setSpectator);
