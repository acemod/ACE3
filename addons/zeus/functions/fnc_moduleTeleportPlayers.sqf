/*
 * Author: SilentSpike
 * Zeus module function to teleport players on dialog confirmation
 *
 * Arguments:
 * 0: Teleport to <OBJECT>
 * 1: Player UID <STRING>
 * 2: Teleport group <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "5854854754", false] call ace_zeus_fnc_moduleTeleportPlayers
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_logic","_uid","_group"];

// Get the chosen unit
private _player = [_uid] call BIS_fnc_getUnitByUID;

// Handle if group mode was selected
if (_group) then {
    _player = units _player;
} else {
    _player = [_player];
};

// Handle teleportation
{
    moveOut _x;

    private _attached = attachedTo _logic;
    if (isNull _attached) then {
        // Function takes position AGL and must be ran where local
        [QGVAR(moveToRespawnPosition), [_x, _logic modelToWorld [0,0,0]], _x] call CBA_fnc_targetEvent;
    } else {
        [QGVAR(moveToRespawnPosition), [_x, _attached], _x] call CBA_fnc_targetEvent;
    };
} forEach _player;

deleteVehicle _logic;
