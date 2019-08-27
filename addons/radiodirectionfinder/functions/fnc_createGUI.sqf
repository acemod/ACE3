#include "script_component.hpp"
/*
 * Author: PabstMirror
 *
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_attach_fnc_createGUI
 *
 * Public: No
 */

params ["_display"];
TRACE_1("createGUI",_display);

private _ctrlScreenGroup = _display displayCtrl IDC_SCREEN_GROUP;

// Common:
private _ctrlBackground = _display ctrlCreate ["RscPicture", -1, _ctrlScreenGroup];
_ctrlBackground ctrlSetText "#(argb,8,8,3)color(0.1,0.1,0.1,1)";
_ctrlBackground ctrlSetPosition [0,0,1,1];
_ctrlBackground ctrlCommit 0;

private _ctrlTime = _display ctrlCreate [QGVAR(text5right), IDC_CLOCK_TEXT, _ctrlScreenGroup];
_ctrlTime ctrlSetPosition [0.75,0,0.25,0.05];
_ctrlTime ctrlCommit 0;

private _fnc_menuButton = {
    TRACE_1("menu button",backpackContainer ace_player);
    (backpackContainer ace_player) setVariable [QGVAR(currentMode), ctrlIDC (_this select 0)];
    GVAR(nextGuiUpate) = -1;
};

private _ctrlMenuBackground1 = _display ctrlCreate ["RscPicture", IDC_MENU_BG1, _ctrlScreenGroup];
_ctrlMenuBackground1 ctrlSetPosition [0.01,0,0.23,0.05];
_ctrlMenuBackground1 ctrlCommit 0;
private _ctrlMenuButton1 = _display ctrlCreate [QGVAR(menuButton), IDC_MENU_BUTTON1, _ctrlScreenGroup];
_ctrlMenuButton1 ctrlSetText "Scan";
_ctrlMenuButton1 ctrlAddEventHandler ["ButtonClick", _fnc_menuButton];
_ctrlMenuButton1 ctrlSetPosition [0,0,0.25,0.05];
_ctrlMenuButton1 ctrlCommit 0;

private _ctrlMenuBackground2 = _display ctrlCreate ["RscPicture", IDC_MENU_BG2, _ctrlScreenGroup];
_ctrlMenuBackground2 ctrlSetPosition [0.26,0,0.23,0.05];
_ctrlMenuBackground2 ctrlCommit 0;
private _ctrlMenuButton2 = _display ctrlCreate [QGVAR(menuButton), IDC_MENU_BUTTON2, _ctrlScreenGroup];
_ctrlMenuButton2 ctrlSetText "Frequency Selection";
_ctrlMenuButton2 ctrlAddEventHandler ["ButtonClick", _fnc_menuButton];
_ctrlMenuButton2 ctrlSetPosition [0.25,0,0.25,0.05];
_ctrlMenuButton2 ctrlCommit 0;

private _ctrlMenuBackground3 = _display ctrlCreate ["RscPicture", IDC_MENU_BG3, _ctrlScreenGroup];
_ctrlMenuBackground3 ctrlSetPosition [0.51,0,0.23,0.05];
_ctrlMenuBackground3 ctrlCommit 0;
private _ctrlMenuButton3 = _display ctrlCreate [QGVAR(menuButton), IDC_MENU_BUTTON3, _ctrlScreenGroup];
_ctrlMenuButton3 ctrlSetText "Signal List";
_ctrlMenuButton3 ctrlAddEventHandler ["ButtonClick", _fnc_menuButton];
_ctrlMenuButton3 ctrlSetPosition [0.5,0,0.25,0.05];
_ctrlMenuButton3 ctrlCommit 0;


// Mode 1:
private _ctrlModeGroup1 = _display ctrlCreate ["RscControlsGroupNoScrollbars", IDC_MODE1_GROUP, _ctrlScreenGroup];
_ctrlModeGroup1 ctrlSetPosition [0,0.05,1,0.95];
_ctrlModeGroup1 ctrlCommit 0;

private _circleY = 0;
private _circleH = 0.861-.05; // Magic number from aspect ratio of p3d mem points
private _circleW = 3/4 * _circleH;
private _circleX = 1 - _circleW;

private _ctrlCircleBase = _display ctrlCreate ["RscPicture", -1, _ctrlModeGroup1];
// _ctrlCircleBase ctrlSetTextColor [0.5, 0.5, 0.5, 1];
_ctrlCircleBase ctrlSetText QPATHTOF(UI\base_ca.paa);
_ctrlCircleBase ctrlSetTextColor [0.75, 0.75, 0.75, 1];
_ctrlCircleBase ctrlSetPosition [_circleX,_circleY,_circleW,_circleH];
_ctrlCircleBase ctrlCommit 0;

private _ctrlCircleDot = _display ctrlCreate ["RscPicture", IDC_MODE1_CIRCLE_DOT, _ctrlModeGroup1];
_ctrlCircleDot ctrlSetText QPATHTOF(UI\dot_ca.paa);
_ctrlCircleDot ctrlSetPosition [_circleX,_circleY,_circleW,_circleH];
_ctrlCircleDot ctrlCommit 0;

private _ctrlCircleArrow = _display ctrlCreate ["RscPicture", IDC_MODE1_CIRCLE_ARROW, _ctrlModeGroup1];
_ctrlCircleArrow ctrlSetText QPATHTOF(UI\arrow_ca.paa);
_ctrlCircleArrow ctrlSetTextColor [0.75, 0.75, 0.75, 1];
_ctrlCircleArrow ctrlSetPosition [_circleX,_circleY,_circleW,_circleH];
_ctrlCircleArrow ctrlCommit 0;

private _lines = [];
for "_i" from 0 to 9 do {
    private _ctrlLine = _display ctrlCreate ["RscPicture", -1, _ctrlModeGroup1];
    _ctrlLine ctrlSetText QPATHTOF(UI\line_ca.paa);
    _ctrlLine ctrlSetTextColor [0.75, 0.75, 0.75, 1];
    _ctrlLine ctrlSetPosition [_circleX,_circleY,_circleW,_circleH];
    _ctrlLine ctrlCommit 0;
    _lines pushBack _ctrlLine;
};
_display setVariable [QGVAR(lines), _lines];

private _ctrlText = _display ctrlCreate [QGVAR(structuredText), IDC_MODE1_SCAN_INFO_TEXT, _ctrlModeGroup1];
_ctrlText ctrlSetPosition [0,_circleY+_circleH/4,1-_circleW,_circleH/2];
_ctrlText ctrlCommit 0;
// _ctrlText ctrlSetBackgroundColor [0.1,0.1,0.1,0.5];

// Mode 2:
private _ctrlModeGroup2 = _display ctrlCreate ["RscControlsGroupNoScrollbars", IDC_MODE2_GROUP, _ctrlScreenGroup];
_ctrlModeGroup2 ctrlSetPosition [0,0.05,1,0.95];
_ctrlModeGroup2 ctrlCommit 0;

private _ctrlFreqSelectionText = _display ctrlCreate [QGVAR(structuredText), IDC_MODE2_FREQ_TEXT, _ctrlModeGroup2];
_ctrlFreqSelectionText ctrlSetPosition [0.05,0.05,0.9,0.2];
_ctrlFreqSelectionText ctrlCommit 0;

private _currentTargetFreq = (backpackContainer ace_player) getVariable [QGVAR(targetFreq), 0]; // Get Current Value
private _ctrlSlider = _display ctrlCreate ["ctrlXSliderH", IDC_MODE2_FREQ_SLIDER, _ctrlModeGroup2];
_ctrlSlider sliderSetRange [0, 3000];
_ctrlSlider sliderSetSpeed [10, 3];
_ctrlSlider sliderSetPosition _currentTargetFreq;
_ctrlSlider ctrlAddEventHandler ["SliderPosChanged", {
    params ["_ctrlSlider", "_sliderPos"];
    _sliderPos = ((10 * (round (_sliderPos / 10))) min 3000) max 0;
    _ctrlSlider sliderSetPosition _sliderPos;
    (backpackContainer ace_player) setVariable [QGVAR(targetFreq), _sliderPos];
    GVAR(nextGuiUpate) = -1;
    TRACE_1("setting targetFreq",_sliderPos);
}];
_ctrlSlider ctrlSetPosition [0,0.275,1, 0.1];
_ctrlSlider ctrlCommit 0;



private _ctrlResetBackground = _display ctrlCreate ["RscPicture", IDC_MODE2_RESET_BACKGROUND, _ctrlModeGroup2];
_ctrlResetBackground ctrlSetPosition [0.75,0.45,0.2,0.1];
_ctrlResetBackground ctrlCommit 0;
private _ctrlResetButton = _display ctrlCreate [QGVAR(menuButton), -1, _ctrlModeGroup2];
_ctrlResetButton ctrlAddEventHandler ["ButtonClick", {
    private _ctrlSlider = (ctrlParent (_this select 0)) displayCtrl IDC_MODE2_FREQ_SLIDER;
    _ctrlSlider sliderSetPosition 0;
    (backpackContainer ace_player) setVariable [QGVAR(targetFreq), 0];
    GVAR(nextGuiUpate) = -1;
    TRACE_1("clearing targetFreq",0);
}];
_ctrlResetButton ctrlSetText "Remove Filter";
_ctrlResetButton ctrlSetPosition [0.75,0.45,0.2,0.1];
_ctrlResetButton ctrlCommit 0;

private _ctrlSignalCount = _display ctrlCreate [QGVAR(text15), IDC_MODE2_SIGNAL_COUNT, _ctrlModeGroup2];
_ctrlSignalCount ctrlSetPosition [0.05,0.45,0.7,0.1];
_ctrlSignalCount ctrlCommit 0;

// Mode 3:
private _ctrlModeGroup3 = _display ctrlCreate ["RscControlsGroupNoScrollbars", IDC_MODE3_GROUP, _ctrlScreenGroup];
_ctrlModeGroup3 ctrlSetPosition [0,0.05,1,0.95];
_ctrlModeGroup3 ctrlCommit 0;

private _ctrlSignalList = _display ctrlCreate ["RscListBox", IDC_MODE3_LIST, _ctrlModeGroup3];
_ctrlSignalList ctrlSetPosition [0,0,1,_circleH];
_ctrlSignalList ctrlCommit 0;
