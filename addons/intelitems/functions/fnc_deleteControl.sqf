#include "..\script_component.hpp"
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
GVAR(controlsData) set [_index, [_posX, _posY]];

// Update data if modified
private _ctrlContent = _controlsGroup controlsGroupCtrl IDC_CONTENT;
private _data = ctrlText _ctrlContent;
private _savedData = GET_DATA(_index) select 0;

if (_data isNotEqualTo _savedData) then {
    private _ctrlHeader = _controlsGroup controlsGroupCtrl IDC_HEADER;
    private _header = ctrlText _ctrlHeader;
    SET_DATA(_index,_data,_header);
};

// Delete the controls group
GVAR(controlsGroups) deleteAt (GVAR(controlsGroups) find _controlsGroup);
ctrlDelete _controlsGroup;
