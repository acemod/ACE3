/*
 * Author: Fisher
 * Removes all objects in given radius for all curators.
 *
 * Arguments:
 * 0: Dummy controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
 
#include "script_component.hpp"

params ["_control"];
private _display = ctrlParent _control;
private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);

_control ctrlRemoveAllEventHandlers "setFocus";

scopeName "Main";
private _fnc_onUnload = {
    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
    if (isNull _logic) exitWith {};

    if (_this select 1 == 2) then {
        deleteVehicle _logic;
    };
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];

    private _display = ctrlparent _ctrlButtonOK;
    if (isNull _display) exitWith {};

    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
    if (isNull _logic) exitWith {};

    private _radius = GETVAR(_display,GVAR(radius),50);
    private _position = GETVAR(_display,GVAR(position),getPos _logic);
    private _objectsToAdd = nearestObjects [_position, ["All"], _radius];

    {
        _x removeCuratorEditableObjects [_objectsToAdd, true]; 
    } forEach allCurators;

    deleteVehicle _logic;
};

_display displayAddEventHandler ["unload", _fnc_onUnload];
_control ctrlAddEventHandler ["buttonClick", _fnc_onConfirm];
