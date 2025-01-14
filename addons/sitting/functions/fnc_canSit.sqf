#include "..\script_component.hpp"
/*
 * Author: Jonpas, vabene1111
 * Check if the player can sit down.
 *
 * Arguments:
 * 0: Seat <OBJECT>
 * 1: Player <OBJECT>
 * 2: Seat Position <NUMBER> (default: 0)
 *
 * Return Value:
 * Can Sit Down <BOOL>
 *
 * Example:
 * [cursorObject, player] call ace_sitting_fnc_canSit
 *
 * Public: No
 */

params ["_seat", "_player", ["_seatPos", 0]];

// Sitting enabled, not occupied and standing up (or not on a big slope)
XGVAR(enable) &&
{isNil {_player getVariable QGVAR(sittingStatus)}} &&
{round (vectorUp _seat select 0) == 0 && {round (vectorUp _seat select 1) == 0} && {round (vectorUp _seat select 2) == 1}} && {
    private _seatsClaimed = _seat getVariable [QGVAR(seatsClaimed), []];

    (_seatsClaimed isEqualTo [] || {isNull (_seatsClaimed select _seatPos)}) && {
        ([_player, _seat] call EFUNC(common,canInteractWith)) ||  // not claimed (common case)
        // Can self-interact and chair claimed by another sitter
        {([_player, objNull] call EFUNC(common,canInteractWith)) && {(_seatsClaimed findIf {!isNull _x}) != -1}}
    }
}
