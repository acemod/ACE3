/*
 * Author: Dslyecxi, MikeMatrix
 * Assign readable client ID to unit on the server.
 *
 * Arguments:
 * 0: Unit name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["MikeMatrix"] call ace_map_gestures_fnc_assignClientIDOnServer
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unitName"];

{
    if (name _x == _unitName) then {
        _x setVariable [QGVAR(owner_id), owner _x, true];
    };
} count playableUnits;
