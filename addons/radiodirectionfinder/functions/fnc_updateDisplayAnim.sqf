#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Updates the display's position (several times a second) called from the pfeh
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_radiodirectionfinder_fnc_updateDisplayAnim
 *
 * Public: No
 */
params ["_display", "_desiredPhase", "_deltaTime"];
// TRACE_3("updateDisplayAnim",_display,_desiredPhase,_deltaTime);

private _ctrlPhoneObject = _display displayCtrl IDC_OBJECT_SCREEN;
private _currentShown = _display getVariable [QGVAR(currentShown), 0];

if (_desiredPhase > _currentShown) then {
    _currentShown = (_currentShown + (_deltaTime / 0.5)) min _desiredPhase;
} else {
    _currentShown = (_currentShown - (_deltaTime / 0.5)) max _desiredPhase;
};
_display setVariable [QGVAR(currentShown), _currentShown];

_ctrlPhoneObject ctrlSetModelScale 0.5;

if (_currentShown <= 0) then {
    _ctrlPhoneObject ctrlShow false;
    false
} else {
    _ctrlPhoneObject ctrlShow true;
    private _xPos = linearConversion [0.9, 1, _currentShown, 0.3, 0.5, true];
    private _yPos = linearConversion [0.9, 1, _currentShown, 0.12, 0.08, true];
    private _zPos = linearConversion [0, 1, _currentShown, 1.25, 0.75] + linearConversion [0, 0.1, _currentShown, 0.5, 0, true];
    private _yAngle = linearConversion [0, 1, _currentShown, 30, 80] + linearConversion [0, 0.75, _currentShown, -30, 0, true];
    // [xScreen, dist, yScreen] x/y extents are based on UI scaling
    _ctrlPhoneObject ctrlSetPosition [_xPos, _yPos, _zPos];
    _ctrlPhoneObject ctrlSetModelDirAndUp [[0,cos _yAngle, sin _yAngle], [0,-1,0]];
    true
};
