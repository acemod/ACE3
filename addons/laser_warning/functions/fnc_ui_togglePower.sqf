#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Toggle power of the laser warning system
 *
 * Arguments:
 * 0: LWS object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player] call ace_laser_warning_fnc_ui_togglePower
 *
 * Public: No
 */
params ["_args", "_pfhId"];

private _state = _object getVariable [QGVAR(state_box), false call FUNC(default_boxState)];
private _box = _display displayCtrl 100;

_state params ["_powered"];
if (_powered == POWER_STATE_OFF) then {
    _box ctrlAnimateModel ["PowerSwitch", 1.0];
    _state set [0, POWER_STATE_STARTING];
    _state set [2, MENU_STATE_MAIN];
    if ((_display getVariable [QGVAR(pfh), -1]) < 0) then {
        private _pfh = [LINKFUNC(ui_pfh), 0, [_display]] call CBA_fnc_addPerFrameHandler;
        _display setVariable [QGVAR(pfh), _pfh];
    };
} else {
    _box ctrlAnimateModel ["PowerSwitch", 0.0];
    _state set [0, POWER_STATE_OFF];
    private _pfh = _display getVariable [QGVAR(pfh), -1];
    if (_pfh >= 0) then {
        [_pfh] call CBA_fnc_removePerFrameHandler;
    };
};
_object setVariable [QGVAR(state_box), _state, true];

