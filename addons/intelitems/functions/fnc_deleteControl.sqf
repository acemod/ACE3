#include "script_component.hpp"
/*
 * Author: PabstMirror, mharis001
 * Deletes an intel controls group.
 *
 * Arguments:
 * 0: Controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL] call ace_intelitems_fnc_deleteControl
 *
 * Public: No
 */

params ["_controlsGroup"];

private _index = _controlsGroup getVariable QGVAR(index);

// Save position of controls group
ctrlPosition _controlsGroup params ["_posX", "_posY"];
[GVAR(controlsData), _index, [_posX, _posY]] call CBA_fnc_hashSet;

// Update data if modified
private _ctrlContent = _controlsGroup controlsGroupCtrl IDC_CONTENT;
private _data = ctrlText _ctrlContent;

if !(_data isEqualTo GET_DATA(_index)) then {
    SET_DATA(_index,_data);
};

// Delete the controls group
GVAR(controlsGroups) deleteAt (GVAR(controlsGroups) find _controlsGroup);
ctrlDelete _controlsGroup;
