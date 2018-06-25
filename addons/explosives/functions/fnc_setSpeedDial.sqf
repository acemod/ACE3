#include "script_component.hpp"
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
 * [true] call ACE_explosives_fnc_setSpeedDial; // increase
 * [false] call ACE_explosives_fnc_setSpeedDial; // decrease
 *
 * Public: No
 */

private _speedDial = ace_player getVariable [QGVAR(SpeedDial), []];
if (_speedDial isEqualTo []) exitWith {};
private _amount = [-1, 1] select (_this select 0);

GVAR(CurrentSpeedDial) = (GVAR(CurrentSpeedDial) + _amount + count _speedDial) mod (count _speedDial);

ctrlSetText [1400, (_speedDial select GVAR(CurrentSpeedDial)) select 1];
ctrlSetText [1401, (_speedDial select GVAR(CurrentSpeedDial)) select 0];
