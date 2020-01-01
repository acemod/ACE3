#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Main PFEH, runs while display or dialog is open
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

private _unit = ace_player;
private _backpackObject = backpackContainer _unit;

if (!([_unit] call FUNC(displayCondition))) exitWith {
    TRACE_2("displayCondition failed",_unit,typeOf _backpackObject);
    [DISPLAY_MODE_CLOSED] call FUNC(toggleDisplayMode);
};

params ["_args"];
_args params ["_deltaTime"];
_deltaTime = CBA_missionTime - _deltaTime;
_args set [0, CBA_missionTime];

private _canInteract = [_unit, objNull, ["notOnMap", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith);
private _display = displayNull;
private _shown = false;

if (GVAR(currentShowMode) == DISPLAY_MODE_DISPLAY) then {
    _display = uiNamespace getVariable [QGVAR(display), displayNull];
    private _desiredPhase = if (_canInteract && {cameraView != "GUNNER"} && {EGVAR(interact_menu,openedMenuType) < 0}) then {
        // Can interact, not in gunner view and don't have interaction menu open - show more if weapon lowered
        if (weaponLowered _unit) then { 0.9 } else { 0.75 };
    } else {
        0 // hide it
    };
    _shown = [_display, _desiredPhase, _deltaTime] call FUNC(updateDisplayAnim);
} else {
    _display = uiNamespace getVariable [QGVAR(dialog), displayNull];
    if ((!_canInteract) || {isNull _display}) exitWith { [DISPLAY_MODE_DISPLAY, 1] call FUNC(toggleDisplayMode); };
    _shown = [_display, 1, _deltaTime] call FUNC(updateDisplayAnim);
};
if (!_shown) exitWith {};

if (GVAR(nextGuiUpate) > CBA_missionTime) exitWith {};
GVAR(nextGuiUpate) = CBA_missionTime + 0.25;

BEGIN_COUNTER(hudUpdate);

private _currentTargetFreq = _backpackObject getVariable [QGVAR(targetFreq), 0];
private _menuTab = _backpackObject getVariable [QGVAR(currentMode), IDC_MENU_BUTTON1];

// Update clock:
private _ctrlTime = _display displayCtrl IDC_CLOCK_TEXT;
_ctrlTime ctrlSetText ([daytime, "HH:MM"] call bis_fnc_timeToString);

// Update Menus:
(_display displayCtrl IDC_MODE1_GROUP) ctrlShow (_menuTab == IDC_MENU_BUTTON1);
(_display displayCtrl IDC_MODE2_GROUP) ctrlShow (_menuTab == IDC_MENU_BUTTON2);
(_display displayCtrl IDC_MODE3_GROUP) ctrlShow (_menuTab == IDC_MENU_BUTTON3);
(_display displayCtrl IDC_MENU_BG1) ctrlSetText (["#(argb,8,8,3)color(0.15,0.15,0.15,1)", "#(argb,8,8,3)color(0.5,0.5,0.5,1)"] select (_menuTab == IDC_MENU_BUTTON1));
(_display displayCtrl IDC_MENU_BG2) ctrlSetText (["#(argb,8,8,3)color(0.15,0.15,0.15,1)", "#(argb,8,8,3)color(0.5,0.5,0.5,1)"] select (_menuTab == IDC_MENU_BUTTON2));
(_display displayCtrl IDC_MENU_BG3) ctrlSetText (["#(argb,8,8,3)color(0.15,0.15,0.15,1)", "#(argb,8,8,3)color(0.5,0.5,0.5,1)"] select (_menuTab == IDC_MENU_BUTTON3));

switch (_menuTab) do {
case (IDC_MENU_BUTTON1): { // Compas view
        private _signals = [getPosASL _unit, _currentTargetFreq, 10] call FUNC(getSignals);
        private _baseDir = getDir _unit;
        // re-sort by relative dir
        _signals = _signals apply {
            _x params ["_rtx", "_freqMhz", "_bearing"];
            private _relDir = (_bearing - getDir _unit) call CBA_fnc_simplifyAngle180;
            [abs _relDir, _rtx, _freqMhz, _relDir, _bearing];
        };
        _signals sort true;

        // Update compass
        private _ctrlCircleArrow = _display displayCtrl IDC_MODE1_CIRCLE_ARROW;
        _ctrlCircleArrow ctrlSetAngle [-_baseDir, 0.5, 0.5, true];
        // Update dot for most front aligned signal
        private _ctrlCircleDot = _display displayCtrl IDC_MODE1_CIRCLE_DOT;
        private _primarySignalInfo = [];
        if (_signals isEqualTo []) then {
            _primarySignalInfo pushBack format ["<t size='2'><t align='center'>Nothing</t></t>"];
            _ctrlCircleDot ctrlShow false;
        } else {
            _ctrlCircleDot ctrlShow true;
            (_signals select 0) params ["", "_rtx", "_freqMhz", "_relDir", "_bearing"];
            _ctrlCircleDot ctrlSetAngle [_relDir, 0.5, 0.5, true];
            _primarySignalInfo pushBack format ["<t size='1.25' align='left'>Center Frequency</t><t align='right'>%1 MHz</t>", _freqMhz toFixed 1];
            _primarySignalInfo pushBack format ["<t size='1.25' align='left'>Recieved Power</t><t align='right'>%1 dBm</t>", _rtx toFixed 1];
            _primarySignalInfo pushBack format ["<t size='1.25' align='left'>Bearing</t><t align='right'>%1°</t>", _bearing toFixed 0];
        };
        private _ctrlText = _display displayCtrl IDC_MODE1_SCAN_INFO_TEXT;
        _ctrlText ctrlSetStructuredText parseText (_primarySignalInfo joinString "<br/>");

        // Update lines
        private _lines = _display getVariable [QGVAR(lines), []];
        {
            if (_forEachIndex < (count _signals)) then {
                _x ctrlShow true;
                (_signals select _forEachIndex) params ["", "", "", "_relDir"];
                _x ctrlSetAngle [_relDir, 0.5, 0.5, true];
            } else {
                _x ctrlShow false;
            };
        } forEach _lines;
    };
case (IDC_MENU_BUTTON2): { // Frequency Selections
        private _signals = [getPosASL _unit, _currentTargetFreq, 10] call FUNC(getSignals);
        private _ctrlFreqSelectionText = _display displayCtrl IDC_MODE2_FREQ_TEXT;
        private _currentTargetFreqText = if (_currentTargetFreq > 0) then { format ["%1 MHz",_currentTargetFreq] } else { "Any" };
        _ctrlFreqSelectionText ctrlSetStructuredText parseText format ["<t size='2'>Target Frequency: %1", _currentTargetFreqText];

        private _ctrlSignalCount = _display displayCtrl IDC_MODE2_SIGNAL_COUNT;
        _ctrlSignalCount ctrlSetText format ["Signal Count: %1", count _signals];

        private _ctrlResetBackground = _display displayCtrl IDC_MODE2_RESET_BACKGROUND;
        _ctrlResetBackground ctrlSetText (["#(argb,8,8,3)color(0.2,0.2,0.2,1)", "#(argb,8,8,3)color(0.9,0.1,0.1,1)"] select (_currentTargetFreq > 0));
    };
case (IDC_MENU_BUTTON3): { // List View
        private _signals = [getPosASL _unit, 0, 20] call FUNC(getSignals); // no freq filter
        _signals = _signals apply {
            _x params ["_rtx", "_freqMhz", "_bearing"];
            [_freqMhz, _rtx, _bearing]
        };
        _signals sort true;
        private _ctrlSignalList = _display displayCtrl IDC_MODE3_LIST;
        lnbClear _ctrlSignalList;
        {
            _x params ["_freqMhz", "_rtx", "_bearing"];
            _ctrlSignalList lbAdd format ["%1 MHz (%2 dBm)", _freqMhz toFixed 0, _rtx toFixed 2];
            _ctrlSignalList lbSetTextRight [_forEachIndex, format ["%1°", _bearing toFixed 0]];
        } forEach _signals;
    };
    default {
        ERROR_1("bad enum %1",_menuTab);
        _backpackObject setVariable [QGVAR(currentMode), nil];
    };
};
END_COUNTER(hudUpdate);
