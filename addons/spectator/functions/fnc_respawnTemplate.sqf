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

// These respawn types use engine driven magic we don't want to mess with here
// Compatibility handled via spectator display XEH
if (_respawn in [0,1,4,5]) exitWith {};

// Negligible respawn delay can result in entering spectator after respawn
if (playerRespawnTime <= 1) exitWith {};

// Some environment information can be used for the initial camera attributes
private _nvg = [VISION_NORM, VISION_NVG] select (sunOrMoon < 1);

// Prepare camera attributes before entering spectator
[nil, nil, _nvg, nil, nil] call FUNC(setCameraAttributes);

// Enter/exit spectator based on whether killed/respawned
[!alive _newCorpse] call FUNC(setSpectator);
