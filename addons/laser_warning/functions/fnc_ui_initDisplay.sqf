#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Initialises LWS display, given the state of some LWS
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [displayNull] call ace_laser_warning_fnc_ui_initDisplay
 *
 * Public: No
 */
params ["_display"];

private _object = _display getVariable [QGVAR(object), objNull];
if (isNull _object) exitWith {};

private _boxState = _object getVariable [QGVAR(state_box), false call FUNC(default_boxState)];
_boxState params ["_powerState", "", "_menuState"];
[_display] call FUNC(ui_initScreen);
if (_powerState != POWER_STATE_OFF) then {
    private _box = _display displayCtrl 100;
    _box ctrlAnimateModel ["PowerSwitch", 1.0];
    [_display] call FUNC(ui_initMenu);
};
