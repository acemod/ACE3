#include "..\script_component.hpp"
/*
 * Author: PabstMirror, mharis001
 * Initializes the Zeus attributes display for intel objects.
 *
 * Arguments:
 * 0: Controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL] call ace_intelitems_fnc_attributeFocus
 *
 * Public: No
 */

params ["_control"];

private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1; // IDC_OK
private _object = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);

_control ctrlRemoveAllEventHandlers "SetFocus";
private _index = _object getVariable [QGVAR(index), -1];

if (_index != -1) then {
    (GET_DATA(_index)) params ["_ctrlEditText", "_labelText"];
    private _ctrlEdit = _display displayCtrl IDC_ATTRIBUTE_EDIT;
    _ctrlEdit ctrlSetText _ctrlEditText;
    private _ctrlLabel = _display displayCtrl IDC_ATTRIBUTE_LABEL;
    _ctrlLabel ctrlSetText _labelText;
};

private _fnc_onConfirm = {
    params ["_ctrlButtonOK"];
    private _display = ctrlParent _ctrlButtonOK;
    private _object = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
    private _data = ctrlText (_display displayCtrl IDC_ATTRIBUTE_EDIT);
    private _header = ctrlText (_display displayCtrl IDC_ATTRIBUTE_LABEL);
    [QGVAR(setObjectData), [_object, _data, _header]] call CBA_fnc_serverEvent;
};

_ctrlButtonOK ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
