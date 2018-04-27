/*
 * Author: Fisher, SilentSpike, mharis001
 * Initializes the "Editable Objects" Zeus module display.
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

// Generic Init
private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1; //IDC_OK
private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
TRACE_1("Logic Object",_logic);

_control ctrlRemoveAllEventHandlers "SetFocus";

// Specific onLoad stuff
(_display displayCtrl 19181) lbSetCurSel 1;
(_display displayCtrl 19182) lbSetCurSel 1;

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

    private _radius = GETVAR(_display,GVAR(radius),100);
    private _editingMode = lbCurSel (_display displayCtrl 19181) > 0;
    private _allCurators = [getAssignedCuratorLogic player, objNull] select (lbCurSel (_display displayCtrl 19182));
    private _objects = nearestObjects [getPos _logic, ["All"], _radius];

    if (_editingMode) then {
        [QGVAR(addObjects), [_objects, _allCurators]] call CBA_fnc_serverEvent;
    } else {
        [QGVAR(removeObjects), [_objects, _allCurators]] call CBA_fnc_serverEvent;
    };

    deleteVehicle _logic;
};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
