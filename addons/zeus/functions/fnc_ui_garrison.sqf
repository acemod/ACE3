/*
 * Author: alganthe
 * Initalises the "Garrison" zeus module display.
 *
 * Arguments:
 * 0: Garrison controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * onSetFocus = "_this call ace_zeus_fnc_ui_garrison"
 *
 * Public: No
*/
#include "script_component.hpp"

disableSerialization;

params ["_control"];

//Generic Init:
private _display = ctrlparent _control;
private _ctrlButtonOK = _display displayctrl 1; //IDC_OK
private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objnull);
TRACE_1("logicObject",_logic);

_control ctrlRemoveAllEventHandlers "setFocus";

// Handles errors
private _unit = effectiveCommander (attachedTo _logic);

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
    case !(isPlayer _unit): {
        ["str_a3_cfgvehicles_moduleremotecontrol_f_errorPlayer"] call _fnc_errorAndClose;
    };
};

//Specific on-load stuff:
private _listbox = _display displayCtrl 73063;
{
    _listbox lbSetValue  [_listbox lbAdd (_x select 0), _x select 1];
} forEach [
    [localize LSTRING(ModuleGarrison_FillingModeEven), 0],
    [localize LSTRING(ModuleGarrison_FillingModeBuilding), 1],
    [localize LSTRING(ModuleGarrison_FillingModeRandom), 2]
];

_listbox lbSetCurSel 0;

//Specific on-load stuff:
(_display displayCtrl 73061) cbSetChecked (_logic getVariable ["TopDownFilling",false]);
(_display displayCtrl 73062) cbSetChecked (_logic getVariable ["Teleport",false]);

private _fnc_onUnload = {
    params ["_display"];

    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objnull);
    if (isNull _logic) exitWith {};

    deleteVehicle _logic;
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];

    private _display = ctrlparent _ctrlButtonOK;
    if (isNull _display) exitWith {};

    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objnull);
    if (isNull _logic) exitWith {};

    private _lb = _display displayCtrl 73063;

    private _radius = GETVAR(_display,GVAR(radius),50);
    private _position = GETVAR(_display,GVAR(position),getPos _logic);
    private _mode = _lb lbValue (lbCurSel _lb);
    private _TopDownFilling = cbChecked (_display displayCtrl 73061);
    private _teleport = cbChecked (_display displayCtrl 73062);

    [_logic, _position ,_radius, _mode, _TopDownFilling, _teleport] call FUNC(moduleGarrison);
};

_display displayAddEventHandler ["unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", _fnc_onConfirm];
