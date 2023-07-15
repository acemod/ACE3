#include "script_component.hpp"
/*
 * Author: commy2, johnb43, based on BIS_fnc_errorMsg and BIS_fnc_guiMessage by Karel Moricky (BI)
 * Stops simulation and opens a textbox with error message.
 *
 * Arguments:
 * 0: Header <STRING>
 * 1: Text <STRING, TEXT>
 * 2: Code that is executed when 'Ok' is pressed <CODE> (default: {})
 * 3: Code that is executed when 'Cancel' is pressed <CODE> (default: {})
 * 4: Display <DISPLAY> (default: call BIS_fnc_displayMission)
 * 5: Show buttons <ARRAY of BOOLS>
 *  5.0: Show ok button if ok has code <BOOL> (default: true)
 *  5.1: Show cancel button if cancel has code <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["[ACE] ERROR", text "Test", {findDisplay 46 closeDisplay 0}] call ace_common_fnc_errorMessage
 *
 * Public: No
 */

disableSerialization;

// Force stop any loading screens
endLoadingScreen;

// No message without player possible
if (!hasInterface) exitWith {};

// Wait for display
if (isNull (call BIS_fnc_displayMission)) exitWith {
    [{
        if (isNull (call BIS_fnc_displayMission)) exitWith {};

        (_this select 0) call FUNC(errorMessage);
        [_this select 1] call CBA_fnc_removePerFrameHandler;

    }, 1, _this] call CBA_fnc_addPerFrameHandler;
};

params ["_textHeader", "_textMessage", ["_onOK", {}, [{}]], ["_onCancel", {}, [{}]], ["_mainDisplay", call BIS_fnc_displayMission, [displayNull]], ["_showButtons", [true, true]]];
_showButtons params [["_showOkButton", true, [false]], ["_showCancelButton", true, [false]]];

if (_textMessage isEqualType "") then {
    _textMessage = parseText _textMessage;
};

_mainDisplay createDisplay "RscDisplayCommonMessagePause";

private _display = uiNamespace getVariable "RscDisplayCommonMessage_display";
private _ctrlRscMessageBox =          _display displayCtrl 2351;
private _ctrlBcgCommonTop =           _display displayCtrl 235100;
private _ctrlBcgCommon =              _display displayCtrl 235101;
private _ctrlText =                   _display displayCtrl 235102;
private _ctrlBackgroundButtonOK =     _display displayCtrl 235103;
private _ctrlBackgroundButtonMiddle = _display displayCtrl 235104;
private _ctrlBackgroundButtonCancel = _display displayCtrl 235105;
private _ctrlButtonOK =               _display displayCtrl 235106;
private _ctrlButtonCancel =           _display displayCtrl 235107;

_ctrlBcgCommonTop ctrlSetText _textHeader;

private _ctrlButtonOKPos = ctrlPosition _ctrlButtonOK;
private _ctrlBcgCommonPos = ctrlPosition _ctrlBcgCommon;
private _bottomSpaceY = (_ctrlButtonOKPos select 1) - ((_ctrlBcgCommonPos select 1) + (_ctrlBcgCommonPos select 3));

private _ctrlTextPos = ctrlPosition _ctrlText;
private _marginX = (_ctrlTextPos select 0) - (_ctrlBcgCommonPos select 0);
private _marginY = (_ctrlTextPos select 1) - (_ctrlBcgCommonPos select 1);

_ctrlText ctrlSetStructuredText _textMessage;
private _ctrlTextPosH = ctrlTextHeight _ctrlText;

_ctrlBcgCommon ctrlSetPosition [
    _ctrlBcgCommonPos select 0,
    _ctrlBcgCommonPos select 1,
    _ctrlBcgCommonPos select 2,
    _ctrlTextPosH + _marginY * 2
];
_ctrlBcgCommon ctrlCommit 0;

_ctrlText ctrlSetPosition [
    (_ctrlBcgCommonPos select 0) + _marginX,
    (_ctrlBcgCommonPos select 1) + _marginY,
    (_ctrlBcgCommonPos select 2) - _marginX * 2,
    _ctrlTextPosH
];
_ctrlText ctrlCommit 0;

private _bottomPosY = (_ctrlBcgCommonPos select 1) + _ctrlTextPosH + (_marginY * 2) + _bottomSpaceY;

{
    private _xPos = ctrlPosition _x;

    _xPos set [1, _bottomPosY];
    _x ctrlSetPosition _xPos;
    _x ctrlCommit 0;
} forEach [
    _ctrlBackgroundButtonOK,
    _ctrlBackgroundButtonMiddle,
    _ctrlBackgroundButtonCancel,
    _ctrlButtonOK,
    _ctrlButtonCancel
];

private _ctrlRscMessageBoxPos = ctrlPosition _ctrlRscMessageBox;
private _ctrlRscMessageBoxPosH = _bottomPosY + (_ctrlButtonOKPos select 3);

_ctrlRscMessageBox ctrlSetPosition [
    0.5 - (_ctrlBcgCommonPos select 2) / 2,
    0.5 - _ctrlRscMessageBoxPosH / 2,
    (_ctrlBcgCommonPos select 2) + 0.5,
    _ctrlRscMessageBoxPosH
];

_ctrlRscMessageBox ctrlEnable true;
_ctrlRscMessageBox ctrlCommit 0;

if (!_showOkButton || {_onOK isEqualTo {}}) then {
    _ctrlButtonOK ctrlEnable false;
    _ctrlButtonOK ctrlSetFade 0;
    _ctrlButtonOK ctrlSetText "";
    _ctrlButtonOK ctrlCommit 0;
} else {
    _ctrlButtonOK ctrlEnable true;
    _ctrlButtonOK ctrlSetFade 0;
    _ctrlButtonOK ctrlSetText localize "STR_DISP_OK";
    _ctrlButtonOK ctrlCommit 0;

    ctrlSetFocus _ctrlButtonOK;
};

if (!_showCancelButton || {_onCancel isEqualTo {}}) then {
    _ctrlButtonCancel ctrlEnable false;
    _ctrlButtonCancel ctrlSetFade 0;
    _ctrlButtonCancel ctrlSetText "";
    _ctrlButtonCancel ctrlCommit 0;
} else {
    _ctrlButtonCancel ctrlEnable true;
    _ctrlButtonCancel ctrlSetFade 0;
    _ctrlButtonCancel ctrlSetText localize "STR_DISP_CANCEL";
    _ctrlButtonCancel ctrlCommit 0;

    ctrlSetFocus _ctrlButtonCancel;
};

_ctrlButtonOK ctrlAddEventHandler ["buttonClick", {(ctrlParent (_this select 0)) closeDisplay 1; true}];
_ctrlButtonCancel ctrlAddEventHandler ["buttonClick", {(ctrlParent (_this select 0)) closeDisplay 2; true}];

[_display, "unload", {call (_thisArgs select (_this select 1))}, [{}, _onOK, _onCancel]] call CBA_fnc_addBISEventHandler;
_display displayAddEventHandler ["keyDown", {_this select 1 == 1}];
