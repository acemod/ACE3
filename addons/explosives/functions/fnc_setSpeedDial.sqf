#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Sets the speed dial for the UI.
 *
 * Arguments:
 * 0: Whether to increase or decrease speed dial index <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * true call ace_explosives_fnc_setSpeedDial; // increase
 * false call ace_explosives_fnc_setSpeedDial; // decrease
 *
 * Public: No
 */

params ["_increase"];

private _speedDial = ACE_player getVariable [QGVAR(speedDial), []];
private _count = count _speedDial;

if (_count == 0) exitWith {};

private _amount = [-1, 1] select _increase;

GVAR(currentSpeedDial) = (GVAR(currentSpeedDial) + _amount + _count) % _count;

ctrlSetText [1400, (_speedDial select GVAR(currentSpeedDial)) select 1];
ctrlSetText [1401, (_speedDial select GVAR(currentSpeedDial)) select 0];
