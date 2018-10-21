#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Removes the specified speed dial from unit's speed dial.
 *
 * Arguments:
 * 0: Speed dial name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["IED 1"] call ACE_explosives_fnc_removeFromSpeedDial;
 *
 * Public: Yes
 */

private _speedDial = ace_player getVariable [QGVAR(SpeedDial), []];
if (count _speedDial == 0) exitWith {};
{
    if ((_x select 0) == (_this select 0)) exitWith {
        _speedDial set [_forEachIndex, "x"];
        _speedDial = _speedDial - ["x"];
        ace_player setVariable [QGVAR(SpeedDial),_speedDial];
    };
} forEach _speedDial;
