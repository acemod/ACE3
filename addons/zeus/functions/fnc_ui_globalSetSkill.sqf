#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Initalises the `global skill` zeus module display
 *
 * Arguments:
 * 0: globalSetSkill controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL] call ace_zeus_fnc_ui_globalSetSkill
 *
 * Public: No
 */

params ["_control"];
TRACE_1("params",_control);

//Generic Init:
private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1; //IDC_OK
private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
TRACE_1("logicObject",_logic);

_control ctrlRemoveAllEventHandlers "setFocus";

//Specific on-load stuff:
private _fnc_sliderMove = {
    params ["_slider"];
    private _idc = ctrlIDC _slider; // IDCs ∈ [16184,16187]
    private _curVal = GVAR(GlobalSkillAI) select (_idc - 16184); // [0,3]
    _slider ctrlSetTooltip format ["%1%3 (was %2%3)", round(sliderPosition _slider * 100), round(_curVal * 100), "%"];
};

{
    private _slider = _display displayCtrl _x;
    _slider sliderSetRange [0, 1];
    _slider sliderSetSpeed [0.01,0.1];
    _slider sliderSetPosition (GVAR(GlobalSkillAI) select _forEachIndex);
    _slider ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderMove];
    _slider call _fnc_sliderMove;
} forEach [16184,16185,16186,16187];

(_display displayCtrl 16188) cbSetChecked (GVAR(GlobalSkillAI) select 4);
(_display displayCtrl 16189) cbSetChecked (GVAR(GlobalSkillAI) select 5);

private _fnc_onUnload = {
    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objnull);
    if (isNull _logic) exitWith {};

    deleteVehicle _logic;
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];
    TRACE_1("_fnc_onConfirm params",_this);

    private _display = ctrlparent _ctrlButtonOK;
    if (isNull _display) exitWith {};

    GVAR(GlobalSkillAI) = [
        sliderPosition (_display displayCtrl 16184), // General
        sliderPosition (_display displayCtrl 16185), // Accuracy
        sliderPosition (_display displayCtrl 16186), // Handling
        sliderPosition (_display displayCtrl 16187), // Spotting
        cbChecked (_display displayCtrl 16188), // Seek cover
        cbChecked (_display displayCtrl 16189) // Autocombat
    ];
    publicVariable QGVAR(GlobalSkillAI); // Values should persist for future use

    // PV EH won't run on local machine
    [QGVAR(GlobalSkillAI),GVAR(GlobalSkillAI)] call FUNC(moduleGlobalSetSkill);
};

_display displayAddEventHandler ["unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", _fnc_onConfirm];
