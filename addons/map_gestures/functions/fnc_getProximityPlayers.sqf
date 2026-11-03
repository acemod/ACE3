#include "..\script_component.hpp"
/*
 * Author: Dslyecxi, MikeMatrix
 * Returns all players in a given range and in the units vehicle.
 *
 * Arguments:
 * Positions with render range, or briefing mode (0: All, 1: Group, 2: Side, 3: Proximity, 4: Disabled) <ARRAY of ARRAYs or NUMBER>
 * - 0: Object or position AGL <OBJECT or ARRAY>
 * - 1: Range <NUMBER> (default: ace_map_gestures_maxRange)
 *
 * Return Value:
 * Players in proximity <ARRAY of OBJECTs>
 *
 * Example:
 * [[[player, 6]]] call ace_map_gestures_fnc_getProximityPlayers
 *
 * Public: No
 */

private _proximityPlayers = [];

private _fnc_getProximitsPlayers = {
    {
        _x params ["_position", ["_range", GVAR(maxRange)]];
        private _temp = (_position nearEntities [["CAMAnBase"], _range]);
        if (_position isEqualType objNull) then {
            _temp append (crew vehicle _position);
            if (GVAR(onlyShowFriendlys)) then {
                _temp = _temp select { [side group _position, side _x] call BIS_fnc_areFriendly; };
            };
        };
        _proximityPlayers append _temp;
    } forEach _this;
};

switch (_this) do {
    case (0): { // All
        _proximityPlayers append allUnits;
    };
    case (1): { // Players in Group
        _proximityPlayers append units ace_player;
    };
    case (2): { // Players on Side
        _proximityPlayers append (allUnits select {side (group _x) == side (group ace_player)});
    };
    case (3): { // Proximity
        [[ace_player, GVAR(maxRange)]] call _fnc_getProximitsPlayers;
    };
    case (4): {}; // Disabled
    default {
        call _fnc_getProximitsPlayers;
    };
};

_proximityPlayers = _proximityPlayers arrayIntersect _proximityPlayers;
_proximityPlayers = _proximityPlayers select { [_x, false] call EFUNC(common,isPlayer); };
_proximityPlayers
