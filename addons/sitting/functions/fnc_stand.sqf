#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Makes the player stand up.
 *
 * Arguments:
 * Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_sitting_fnc_stand
 *
 * Public: No
 */

params ["_player"];
TRACE_1("stand",_player);

(_player getVariable QGVAR(sittingStatus)) params ["_seat", "_actionID", ["_seatPos", 0]];
TRACE_3("sittingStatus",_seat,_actionID,_seatPos);

// Remove scroll-wheel action
_player removeAction _actionID;

// Restore animation
private _animation = switch (currentWeapon _player) do {
    case "": {"amovpercmstpsnonwnondnon"};
    case (primaryWeapon _player): {"amovpercmstpslowwrfldnon"};
    case (handgunWeapon _player): {"amovpercmstpslowwpstdnon"};
    default {"amovpercmstpsnonwnondnon"};
};

[_player, _animation, 2] call EFUNC(common,doAnimation);

// Set sitting status to nil
_player setVariable [QGVAR(sittingStatus), nil];

["ace_stoodUp", [_player, _seat, _seatPos]] call CBA_fnc_localEvent;

if (!alive _seat) exitWith {};

// Allow sitting on this seat again
private _seatsClaimed = _seat getVariable [QGVAR(seatsClaimed), []];
_seatsClaimed set [_seatPos, objNull];
_seat setVariable [QGVAR(seatsClaimed), _seatsClaimed, true];

// Unclaim if no one else sitting on it, but pass ownership if someone remains
private _newOwner = _seatsClaimed param [_seatsClaimed findIf {!isNull _x}, objNull];
[_newOwner, _seat] call EFUNC(common,claim);
