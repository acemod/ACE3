#include "script_component.hpp"
/*
 * Author: PabstMirror, mharis001
 * Creates an intel controls group.
 *
 * Arguments:
 * 0: Control type <STRING>
 * 1: Intel index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["RscNotepad", 1] call ace_intelitems_fnc_createControl
 *
 * Public: No
 */

params ["_controlType", "_index"];

private _display = findDisplay IDD_MAIN_MAP;
private _controlsGroup = _display ctrlCreate [_controlType, -1];
_controlsGroup setVariable [QGVAR(index), _index];

GVAR(controlsGroups) pushBack _controlsGroup;

// Add event handlers to header to allow moving controls group
private _ctrlHeader = _controlsGroup controlsGroupCtrl IDC_HEADER;
_ctrlHeader ctrlAddEventHandler ["MouseButtonDown", {call FUNC(onMouseButtonDown)}];
_ctrlHeader ctrlAddEventHandler ["MouseButtonUp", {call FUNC(onMouseButtonUp)}];
_ctrlHeader ctrlAddEventHandler ["MouseMoving", {call FUNC(onMouseMoving)}];

// Add event handler to close controls group
private _ctrlClose = _controlsGroup controlsGroupCtrl IDC_CLOSE;
_ctrlClose ctrlAddEventHandler ["ButtonClick", {
    params ["_ctrlClose"];

    private _controlsGroup = ctrlParentControlsGroup _ctrlClose;
    [_controlsGroup] call FUNC(deleteControl);
}];

// Set data in content control
private _ctrlContent = _controlsGroup controlsGroupCtrl IDC_CONTENT;
_ctrlContent ctrlSetText GET_DATA(_index);

// Restore position of controls group (center if not saved)
private _position = [GVAR(controlsData), _index] call CBA_fnc_hashGet;

if (isNil "_position") then {
    ctrlPosition _controlsGroup params ["", "", "_posW", "_posH"];
    _position = [0.5 - _posW / 2, 0.5 - _posH / 2];
};

_controlsGroup ctrlSetPosition _position;
_controlsGroup ctrlCommit 0;
