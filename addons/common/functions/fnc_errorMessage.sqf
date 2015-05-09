/*
 * Author: commy2, based on BIS_fnc_errorMsg and BIS_fnc_guiMessage by Karel Moricky (BI)
 * Stops simulation and opens a textbox with error message.
 *
 * Arguments:
 * ?
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;
endLoadingScreen;


// no message without player possible
if (!hasInterface) exitWith {};

// wait for display
if (isNull (call BIS_fnc_displayMission)) exitWith {
    [{
        if (isNull (call BIS_fnc_displayMission)) exitWith {};

        (_this select 0) call FUNC(errorMessage);
        [_this select 1] call CBA_fnc_removePerFrameHandler;

    }, 1, _this] call CBA_fnc_addPerFrameHandler;
};

private ["_textHeader", "_textMessage", "_onOK", "_onCancel"];

_textHeader = _this select 0;
_textMessage = _this select 1;
_onOK = ARR_SELECT(_this,2,{});
_onCancel = ARR_SELECT(_this,3,{});

if (typeName _textMessage == "STRING") then {
    _textMessage = parseText _textMessage;
};

(ARR_SELECT(_this,4,call BIS_fnc_displayMission)) createDisplay "RscDisplayCommonMessagePause";

private ["_display", "_ctrlRscMessageBox", "_ctrlBcgCommonTop", "_ctrlBcgCommon", "_ctrlText", "_ctrlBackgroundButtonOK", "_ctrlBackgroundButtonMiddle", "_ctrlBackgroundButtonCancel", "_ctrlButtonOK", "_ctrlButtonCancel"];

_display = uiNamespace getVariable "RscDisplayCommonMessage_display";
_ctrlRscMessageBox =          _display displayCtrl 2351;
_ctrlBcgCommonTop =           _display displayCtrl 235100;
_ctrlBcgCommon =              _display displayCtrl 235101;
_ctrlText =                   _display displayCtrl 235102;
_ctrlBackgroundButtonOK =     _display displayCtrl 235103;
_ctrlBackgroundButtonMiddle = _display displayCtrl 235104;
_ctrlBackgroundButtonCancel = _display displayCtrl 235105;
_ctrlButtonOK =               _display displayCtrl 235106;
_ctrlButtonCancel =           _display displayCtrl 235107;

_ctrlBcgCommonTop ctrlSetText _textHeader;

private ["_ctrlButtonOKPos", "_ctrlBcgCommonPos", "_bottomSpaceY", "_ctrlTextPos", "_marginX", "_marginY"];

_ctrlButtonOKPos = ctrlPosition _ctrlButtonOK;
_ctrlBcgCommonPos = ctrlPosition _ctrlBcgCommon;
_bottomSpaceY = (_ctrlButtonOKPos select 1) - ((_ctrlBcgCommonPos select 1) + (_ctrlBcgCommonPos select 3));

_ctrlTextPos = ctrlPosition _ctrlText;
_marginX = (_ctrlTextPos select 0) - (_ctrlBcgCommonPos select 0);
_marginY = (_ctrlTextPos select 1) - (_ctrlBcgCommonPos select 1);

private ["_ctrlTextPosH", "_bottomPosY"];

_ctrlText ctrlSetStructuredText _textMessage;
_ctrlTextPosH = ctrlTextHeight _ctrlText;

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

_bottomPosY = (_ctrlBcgCommonPos select 1) + _ctrlTextPosH + (_marginY * 2) + _bottomSpaceY;

{
    private "_xPos";
    _xPos = ctrlPosition _x;

    _xPos set [1, _bottomPosY];
    _x ctrlSetPosition _xPos;
    _x ctrlCommit 0;
} foreach [
    _ctrlBackgroundButtonOK,
    _ctrlBackgroundButtonMiddle,
    _ctrlBackgroundButtonCancel,
    _ctrlButtonOK,
    _ctrlButtonCancel
];

private ["_ctrlRscMessageBoxPos", "_ctrlRscMessageBoxPosH"];

_ctrlRscMessageBoxPos = ctrlPosition _ctrlRscMessageBox;
_ctrlRscMessageBoxPosH = _bottomPosY + (_ctrlButtonOKPos select 3);

_ctrlRscMessageBox ctrlSetPosition [
    0.5 - (_ctrlBcgCommonPos select 2) / 2,
    0.5 - _ctrlRscMessageBoxPosH / 2,
    (_ctrlBcgCommonPos select 2) + 0.5,
    _ctrlRscMessageBoxPosH
];

_ctrlRscMessageBox ctrlEnable true;
_ctrlRscMessageBox ctrlCommit 0;

if (_onOK isEqualTo {}) then {
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

if (_onCancel isEqualTo {}) then {
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

GVAR(errorOnOK) = _onOK;
GVAR(errorOnCancel) = _onCancel;

_display displayAddEventHandler ["unload", {call ([{}, GVAR(errorOnOK), GVAR(errorOnCancel)] select (_this select 1))}];
_display displayAddEventHandler ["keyDown", {_this select 1 == 1}];
