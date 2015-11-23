/*
 * Author: Jonpas
 * Stands up the player.
 *
 * Arguments:
 * Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_sitting_fnc_stand;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player"];
private ["_animation"];

(_player getVariable QGVAR(isSitting)) params ["_seat", "_actionID"];

// Remove scroll-wheel action
_player removeAction _actionID;

// Restore animation
_animation = switch (currentWeapon _player) do {
    case "": {"amovpercmstpsnonwnondnon"};
    case (primaryWeapon _player): {"amovpercmstpslowwrfldnon"};
    case (handgunWeapon _player): {"amovpercmstpslowwpstdnon"};
    default {"amovpercmstpsnonwnondnon"};
};

[_player, _animation, 2] call EFUNC(common,doAnimation);

// Set variables to nil
_player setVariable [QGVAR(isSitting), nil];
if (isNull _seat) exitWith {};
_seat setVariable [QGVAR(seatOccupied), nil, true];
