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
		[_x, _logic] call BIS_fnc_moveToRespawnPosition;
    } else {
		[_x, _attached] call BIS_fnc_moveToRespawnPosition;
    };
} forEach _player;

deleteVehicle _logic;
