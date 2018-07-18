/*
 * Author: SilentSpike
 * Initalises the `group side` zeus module display
 *
 * Arguments:
 * 0: groupSide controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL] call ace_zeus_fnc_ui_groupSide
 *
 * Public: No
 */
#include "script_component.hpp"
#define IDCs [31201,31200,31202,31203]

params ["_control"];

//Generic Init:
private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1; //IDC_OK
private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
TRACE_1("logicObject",_logic);

_control ctrlRemoveAllEventHandlers "setFocus";

//Validate the module target:
private _unit = effectiveCommander (attachedTo _logic);
private _side = side _unit;

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
    case (_side in [west,east,independent,civilian]): {
        [LSTRING(OnlySpecificSide)] call _fnc_errorAndClose;
    };
};

//Specific on-load stuff:
private _idcActive = 31200 + ([west,east,independent,civilian] find _side);
SETVAR(_display,oldSide,_idcActive - 31200);
SETVAR(_display,newSide,_idcActive - 31200);

private _fnc_onSelection = {
    params [["_activeCtrl", controlNull, [controlNull]]];

    private _display = ctrlParent _activeCtrl;
    if (isNull _display) exitWith {};

    // Update the button scales and colours on selection
    {
        private _ctrl = _display displayCtrl _x;
        private _color = _ctrl getVariable "color";
        private _scale = 1;

        if (ctrlIDC _activeCtrl == _x) then {
            _color set [3,1];
            _scale = 1.2
        } else {
            _color set [3,0.5];
        };

        _ctrl ctrlSetTextColor _color;
        [_ctrl,_scale,0.1] call BIS_fnc_ctrlSetScale;
    } forEach IDCs;

    // Store selected button index for confirmation
    SETVAR(_display,newSide,(ctrlIDC _activeCtrl) - 31200);
};

// Initalize buttons with colour and scale
{
    private _ctrl = _display displayCtrl _x;
    private _color = [_forEachIndex] call BIS_fnc_sideColor;
    _ctrl setVariable ["color", _color];
    _ctrl ctrlSetActiveColor _color;
    _color set [3,0.5];

    if (ctrlIDC _ctrl == _idcActive) then {
        [_ctrl,1.2,0] call BIS_fnc_ctrlSetScale;
        _color set [3,1];
    };

    _ctrl ctrlSetTextColor _color;

    _ctrl ctrlAddEventHandler ["buttonclick", _fnc_onSelection];
} forEach IDCs;

private _fnc_onUnload = {
    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objnull);
    if (isNull _logic) exitWith {};

    if (_this select 1 == 2) then {
        deleteVehicle _logic;
    };
};

private _fnc_onConfirm = {
    params ["_ctrlButtonOK"];

    private _display = ctrlparent _ctrlButtonOK;
    if (isNull _display) exitWith {};

    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objnull);
    if (isNull _logic) exitWith {};

    private _unit = effectiveCommander (attachedTo _logic);
    private _side = [west,east,independent,civilian] select (GETVAR(_display,newSide,GETVAR(_display,oldSide,0)));

    [_unit, _side] call FUNC(moduleGroupSide);
    deleteVehicle _logic;
};

_display displayAddEventHandler ["unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["buttonClick", _fnc_onConfirm];
