/*
 * Author: mharis001
 * Initializes the "Suicide Bomber" Zeus module display.
 *
 * Arguments:
 * 0: suicideBomber controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL] call ace_zeus_fnc_ui_suicideBomber
 *
 * Public: No
 */
#include "script_component.hpp"

#define SIDE_IDCs [83580, 83581, 83582, 83583]

params ["_control"];

// Generic init
private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1; // IDC_OK
private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
TRACE_1("Logic Object",_logic);

_control ctrlRemoveAllEventHandlers "SetFocus";

// Validate module target
private _unit = attachedTo _logic;
TRACE_1("Unit",_unit);

scopeName "Main";
private _fnc_errorAndClose = {
    params ["_msg"];
    _display closeDisplay 0;
    deleteVehicle _logic;
    [_msg] call FUNC(showMessage);
    breakOut "Main";
};

switch (false) do {
    case !(isNull _unit): {
        [LSTRING(NothingSelected)] call _fnc_errorAndClose;
    };
    case (_unit isKindOf "CAManBase"): {
        [LSTRING(OnlyInfantry)] call _fnc_errorAndClose;
    };
    case (alive _unit): {
        [LSTRING(OnlyAlive)] call _fnc_errorAndClose;
    };
    case !([_unit] call EFUNC(common,isPlayer)): {
        ["str_a3_cfgvehicles_moduleremotecontrol_f_errorPlayer"] call _fnc_errorAndClose;
    };
    case !(_unit getVariable [QGVAR(suicideBomber), false]): {
        [LSTRING(ModuleSuicideBomber_AlreadyBomber)] call _fnc_errorAndClose;
    };
};

// Specific onLoad stuff

// Activation side
private _fnc_onSelection = {
    params [["_activeCtrl", controlNull, [controlNull]]];

    private _display = ctrlParent _activeCtrl;
    if (isNUll _display) exitWith {};

    // Update button colours and scales
    {
        private _ctrl = _display displayCtrl _x;
        private _color = _ctrl getVariable "color";
        private _scale = 1;

        if (ctrlIDC _activeCtrl == _x) then {
            _color set [3, 1];
            _scale = 1.2;
        } else {
            _color set [3, 0.5];
        };

        _ctrl ctrlSetTextColor _color;
        [_ctrl, _scale, 0.1] call BIS_fnc_ctrlSetScale;
    } forEach SIDE_IDCs;

    // Save selected side
    SETVAR(_display,activationSide,(ctrlIDC _activeCtrl) - 83580);
};

// Init side buttons
{
    private _ctrl = _display displayCtrl _x;
    private _color = [_x - 83580] call BIS_fnc_sideColor;
    _ctrl setVariable ["color", _color];
    _ctrl ctrlSetActiveColor _color;

    _color set [3, 0.5];
    _ctrl ctrlSetTextColor _color;

    _ctrl ctrlAddEventHandler ["ButtonClick", _fnc_onSelection];
} forEach SIDE_IDCs;

// Activation radius
private _fnc_onSliderMove = {
    params ["_slider"];

    private _display = ctrlParent _slider;
    (_display displayCtrl 83573) ctrlSetText (str round sliderPosition _slider);
};

private _slider = _display displayCtrl 83572;
private _edit = _display displayCtrl 83573;

_slider sliderSetRange [5, 50];
_slider sliderSetSpeed [1, 1];
_slider sliderSetPosition 10;
_edit ctrlSetText "10";

_slider ctrlAddEventHandler ["SliderPosChanged", _fnc_onSliderMove];

// Confirm and Cancel
private _fnc_onUnload = {
    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
    if (isNull _logic) exitWith {};

    deleteVehicle _logic;
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];

    private _display = ctrlParent _ctrlButtonOK;
    if (isNull _display) exitWith {};

    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
    if (isNull _logic) exitWith {};

    private _unit = attachedTo _logic;
    private _side = [GETVAR(_display,activationSide,1)] call BIS_fnc_sideType;
    private _radius = round sliderPosition (_display displayCtrl 83572);
    private _expSize = lbCurSel (_display displayCtrl 83574);
    private _autoSeek = lbCurSel (_display displayCtrl 83575) > 0;

    [_unit, _side, _radius, _expSize, _autoSeek] call FUNC(moduleSuicideBomber);

    deleteVehicle _logic;
};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
