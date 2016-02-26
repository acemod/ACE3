#include "script_component.hpp"

disableSerialization;

params ["_control"];
TRACE_1("params",_control);

//Generic Init:
private _display = ctrlparent _control;
private _ctrlButtonOK = _display displayctrl 1; //IDC_OK
private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target", objnull];
TRACE_1("logicObject",_logic);

_control ctrlRemoveAllEventHandlers "setFocus";

_fnc_sliderMove = {
    params ["_slider"];
    private _idc = ctrlIDC _slider;
    private _curVal = switch (_idc) do {
    case (16184): {GVAR(aiSkill_general)};
    case (16185): {GVAR(aiSkill_aimingAccuracy)};
    case (16186): {GVAR(aiSkill_weaponHandling)};
    case (16187): {GVAR(aiSkill_spotting)};
    };
    _slider ctrlSetTooltip format ["%1 (was %2)", sliderPosition _slider, _curVal];
};

//Specific on-load stuff:
(_display displayCtrl 16184) sliderSetRange [0, 1];
(_display displayCtrl 16184) sliderSetPosition (GVAR(aiSkill_general) max 0);
(_display displayCtrl 16184) ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderMove];
(_display displayCtrl 16184) call _fnc_sliderMove;

(_display displayCtrl 16185) sliderSetRange [0, 1];
(_display displayCtrl 16185) sliderSetPosition (GVAR(aiSkill_aimingAccuracy) max 0);
(_display displayCtrl 16185) ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderMove];
(_display displayCtrl 16185) call _fnc_sliderMove;

(_display displayCtrl 16186) sliderSetRange [0, 1];
(_display displayCtrl 16186) sliderSetPosition (GVAR(aiSkill_weaponHandling) max 0);
(_display displayCtrl 16186) ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderMove];
(_display displayCtrl 16186) call _fnc_sliderMove;

(_display displayCtrl 16187) sliderSetRange [0, 1];
(_display displayCtrl 16187) sliderSetPosition (GVAR(aiSkill_spotting) max 0);
(_display displayCtrl 16187) ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderMove];
(_display displayCtrl 16187) call _fnc_sliderMove;

(_display displayCtrl 16188) cbSetChecked GVAR(aiSkill_COVER);

(_display displayCtrl 16189) cbSetChecked GVAR(aiSkill_AUTOCOMBAT);



private _fnc_onUnload = {
    params [["_display", displayNull, [displayNull]]];
    TRACE_1("_fnc_onUnload params",_display);

    private _logic = missionnamespace getVariable ["BIS_fnc_initCuratorAttributes_target", objnull];
    if (isNull _logic) exitWith {};

    _logic setVariable ["closed", true];
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];
    TRACE_1("_fnc_onConfirm params",_this);
    private _display = ctrlparent _ctrlButtonOK;
    if (isNull _display) exitWith {};

    private _logic = missionnamespace getvariable ["BIS_fnc_initCuratorAttributes_target", objnull];
    if (isNull _logic) exitWith {diag_log text format ["[POTATO] - ERROR Logic [%1] is null on confirm", _logic];};

    TRACE_2("set",_logic, sliderPosition (_display displayCtrl 16184));
    _logic setVariable ["aiSkill_general", sliderPosition (_display displayCtrl 16184), true];
    _logic setVariable ["aiSkill_aimingAccuracy", sliderPosition (_display displayCtrl 16185), true];
    _logic setVariable ["aiSkill_weaponHandling", sliderPosition (_display displayCtrl 16186), true];
    _logic setVariable ["aiSkill_spotting", sliderPosition (_display displayCtrl 16187), true];
    _logic setVariable ["aiSkill_COVER", cbChecked (_display displayCtrl 16188), true];
    _logic setVariable ["aiSkill_AUTOCOMBAT", cbChecked (_display displayCtrl 16189), true];
    _logic setVariable ["set", true, true];
};

_display displayaddeventhandler ["unload", _fnc_onUnload];
_ctrlButtonOK ctrladdeventhandler ["buttonclick", _fnc_onConfirm];
