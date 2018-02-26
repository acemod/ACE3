/*
 * Author: Fisher, SilentSpike
 * Updated all/local curator with objects in the module radius.
 *
 * Arguments:
 * 0: editableObjects controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL] call ace_zeus_fnc_ui_editableObjects
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_control"];

//Generic Init:
private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1; //IDC_OK
private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
TRACE_1("logicObject",_logic);

_control ctrlRemoveAllEventHandlers "setFocus";

//Specific on-load stuff:
(_display displayCtrl 16188) cbSetChecked true;

private _fnc_onUnload = {
    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
    if (isNull _logic) exitWith {};

    if (_this select 1 == 2) then {
        deleteVehicle _logic;
    };
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];

    private _display = ctrlParent _ctrlButtonOK;
    if (isNull _display) exitWith {};

    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
    if (isNull _logic) exitWith {};

    private _radius = GETVAR(_display,GVAR(radius),50);
    private _position = GETVAR(_display,GVAR(position),getPos _logic);
    private _allCurators = cbChecked (_display displayCtrl 16188);
    private _removeObjects = cbChecked (_display displayCtrl 16189);

    private _objects = nearestObjects [_position, ["All"], _radius];
    private _localCurator = [getAssignedCuratorLogic player, objNull] select _allCurators;

    if (_removeObjects) then {
        [QGVAR(removeObjects), [_objects, _localCurator]] call CBA_fnc_serverEvent;
    } else {
        [QGVAR(addObjects), [_objects, _localCurator]] call CBA_fnc_serverEvent;
    };

    deleteVehicle _logic;
};

_display displayAddEventHandler ["unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["buttonClick", _fnc_onConfirm];
