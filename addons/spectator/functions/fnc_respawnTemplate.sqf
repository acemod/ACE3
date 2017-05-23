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

// These respawn types use engine driven magic we don't want to mess with
if (_respawn in [0,1,4,5]) exitWith {
    WARNING(FORMAT_2("Cannot use %1 template with respawn type %2",QUOTE(ADDON),_respawn));
};

// Negligible respawn delay can result in entering spectator after respawn
if (playerRespawnTime <= 1) exitWith {};

// Some environment information can be used for the initial camera attributes
if (isNull _oldKiller) then {_oldKiller = _newCorpse};
private _nvg = [-2,-1] select (sunOrMoon < 1);

// Prepare camera attributes before entering spectator
[2, _oldKiller, _nvg, eyePos _newCorpse, getDirVisual _newCorpse] call FUNC(setCameraAttributes);

// Enter/exit spectator based on whether killed/respawned
[!alive _newCorpse] call FUNC(setSpectator);
