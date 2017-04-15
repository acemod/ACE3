/*
 * Author: SilentSpike
 * Initalises the `search area` zeus module display
 *
 * Arguments:
 * 0: dummy controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

//Generic Init:
params ["_control"];
private _display = ctrlParent _control;
private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);

_control ctrlRemoveAllEventHandlers "setFocus";

//Validate the module target:
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
};

private _fnc_onUnload = {
    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objnull);
    if (isNull _logic) exitWith {};

    if (_this select 1 == 2) then {
        deleteVehicle _logic;
    };
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];

    private _display = ctrlparent _ctrlButtonOK;
    if (isNull _display) exitWith {};

    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objnull);
    if (isNull _logic) exitWith {};

    private _unit = effectiveCommander (attachedTo _logic);
    private _radius = GETVAR(_display,GVAR(radius),50);
    private _position = GETVAR(_display,GVAR(position),getPos _logic);
    private _marker = QGVAR(ModuleSearchArea) + str(_unit);

    createMarker [_marker, _position];
    _marker setMarkerAlpha 0;
    _marker setMarkerShape "ELLIPSE";
    _marker setMarkerSize [_radius,_radius];

    [QGVAR(moduleSearchArea), [_unit,_marker], _unit] call CBA_fnc_targetEvent;
    deleteVehicle _logic;
};

_display displayAddEventHandler ["unload", _fnc_onUnload];
_control ctrlAddEventHandler ["buttonClick", _fnc_onConfirm];
