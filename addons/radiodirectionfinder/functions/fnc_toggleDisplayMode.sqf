#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Changes the display mode between dialog/display.
 *
 * Arguments:
 * 0: Display Mode to show in <NUMBER> (default: -1)
 *
 * Return Value:
 * None
 *
 * Example:
 * [1] call ace_radiodirectionfinder_fnc_toggleDisplayMode
 *
 * Public: No
 */
params [["_newDisplayShowMode", -1, [-1]], ["_currentShown", 0, [0]]];
TRACE_1("toggleDisplayMode",_newDisplayShowMode);

if (_newDisplayShowMode == -1) then { // Toggle
    _newDisplayShowMode = if (GVAR(currentShowMode) != DISPLAY_MODE_DIALOG) then { DISPLAY_MODE_DIALOG } else { DISPLAY_MODE_DISPLAY };
};

private _display = uiNamespace getVariable [QGVAR(display), displayNull];
private _dialog = uiNamespace getVariable [QGVAR(dialog), displayNull];
TRACE_2("",isNull _display,isNull _dialog);
if ((_newDisplayShowMode != DISPLAY_MODE_DIALOG) && {!isNull _dialog}) then {
    _currentShown = _dialog getVariable [QGVAR(currentShown), 0];
    TRACE_1("closing dialog",_dialog);
    closeDialog 0;
};
if ((_newDisplayShowMode != DISPLAY_MODE_DISPLAY) && {!isNull _display}) then {
    _currentShown = _display getVariable [QGVAR(currentShown), 0];
    TRACE_1("closing display",_display);
    QGVAR(display) cutText ["", "PLAIN"];
};
if (_newDisplayShowMode == DISPLAY_MODE_DIALOG) then {
    createDialog QGVAR(dialog);
    _dialog = uiNamespace getVariable [QGVAR(dialog), displayNull];
    _dialog setVariable [QGVAR(currentShown), _currentShown];
    [_dialog] call FUNC(createGUI);
    TRACE_1("created dialog",_display);
};
if (_newDisplayShowMode == DISPLAY_MODE_DISPLAY) then {
    QGVAR(display) cutRsc [QGVAR(display), "PLAIN", 2, false];
    _display = uiNamespace getVariable [QGVAR(display), displayNull];
    _display setVariable [QGVAR(currentShown), _currentShown];
    [_display] call FUNC(createGUI);
    TRACE_1("created display",_display);
};
if (!isNil QGVAR(pfeh)) then {
    TRACE_1("removing PFEH",GVAR(pfeh));
    [GVAR(pfeh)] call CBA_fnc_removePerFrameHandler;
    GVAR(pfeh) = nil;
};

GVAR(currentShowMode) = _newDisplayShowMode;
GVAR(nextGuiUpate) = -1;
GVAR(signalStage) = 0;
GVAR(signalsAccumulator) = [];
if (isNil QGVAR(signalsLast)) then { GVAR(signalsLast) = []; };

if (_newDisplayShowMode != DISPLAY_MODE_CLOSED) then {
    GVAR(pfeh) = [FUNC(updatePFEH), 0, [CBA_missionTime, -1]] call CBA_fnc_addPerFrameHandler;
    TRACE_1("added PFEH",GVAR(pfeh));
};
