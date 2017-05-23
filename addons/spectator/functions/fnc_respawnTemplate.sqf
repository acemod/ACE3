/*
 * Author: SilentSpike
 * The ace_spectator respawn template, handles killed + respawn
 * Can be used via BI's respawn framework, see:
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

// Some environment information can be used for the initial camera attributes
if (isNull _oldKiller) then {_oldKiller = _newCorpse};
private _nvg = [-2,-1] select (sunOrMoon < 1);

// Prepare camera attributes before entering spectator
//[2, _oldKiller, _nvg, eyePos _newCorpse, getDirVisual _newCorpse] call FUNC(setCameraAttributes);

// Enter/exit spectator based on the respawn type and whether killed/respawned
if (alive _newCorpse) then {
    // Handle seagull respawn
    if (_respawn == 1) then {
        private _grp = createGroup [sideLogic, true];
        private _virtual = _grp createUnit [QGVAR(virtual), [0,0,0], [], 0, "NONE"];

        // Switch to virtual spectator unit
        selectPlayer _virtual;

        // Delete the seagull
        deleteVehicle _newCorpse;

        [true] call FUNC(setSpectator);
    } else {
        [false] call FUNC(setSpectator);
    };
} else {
    // Negligible respawn delay can result in entering spectator after respawn
    if (playerRespawnTime <= 1) exitWith {};

    [true] call FUNC(setSpectator);
};
