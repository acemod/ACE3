#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, Brett Mayson, johnb43
 * Fills the sort menu.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Tab control <CONTROL>
 * 2: Sort control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_control", "_sortCtrl", "_sortDirectionCtrl"];

lbClear _sortCtrl;
lbClear _sortDirectionCtrl;

private _right = false;
private _rightSort = ctrlIDC _sortCtrl == IDC_sortRightTab;

// Handle sorting direction
private _lastSortDirection = [GVAR(lastSortDirectionLeft), GVAR(lastSortDirectionRight)] select _rightSort;
private _sortIndex = 0;
private _index = -1;

{
    _x params ["_sortName", "_displayName", "_direction"];

    _index = _sortDirectionCtrl lbAdd _displayName;
    _sortDirectionCtrl lbSetData [_index, _sortName];
    _sortDirectionCtrl lbSetValue [_index, _direction];

    if (_direction == _lastSortDirection) then {
        _sortIndex = _index;
    };
} forEach [[QGVAR(descending), LLSTRING(sortDescending), DESCENDING], [QGVAR(ascending), LLSTRING(sortAscending), ASCENDING]];

// Prevent FUNC(sortPanel) being called twice in succession
GVAR(ignoreFirstSortPanelCall) = true;
_sortDirectionCtrl lbSetCurSel _sortIndex;

// Handle sorting
private _sorts = if (_rightSort && {GVAR(currentLeftPanel) in [IDC_buttonUniform, IDC_buttonVest, IDC_buttonBackpack]}) then {
    _right = true;

    // Right panel for uniforms, vest and backpacks
    GVAR(sortListRightPanel) select (
        switch (GVAR(currentRightPanel)) do {
            case IDC_buttonOptic: {0};
            case IDC_buttonItemAcc: {1};
            case IDC_buttonMuzzle: {2};
            case IDC_buttonBipod: {3};
            case IDC_buttonCurrentMag;
            case IDC_buttonCurrentMag2;
            case IDC_buttonMag;
            case IDC_buttonMagALL: {4};
            case IDC_buttonThrow: {5};
            case IDC_buttonPut: {6};
            case IDC_buttonMisc: {7};
        }
    )
} else {
    private _idc = ctrlIDC _control;

    switch (true) do {
        // Right panel for weapons
        case (_rightSort): {
            GVAR(sortListRightPanel) select (
                switch (_idc) do {
                    case IDC_buttonOptic: {0};
                    case IDC_buttonItemAcc: {1};
                    case IDC_buttonMuzzle: {2};
                    case IDC_buttonBipod: {3};
                    case IDC_buttonCurrentMag;
                    case IDC_buttonCurrentMag2;
                    case IDC_buttonMag;
                    case IDC_buttonMagALL: {4};
                    case IDC_buttonThrow: {5};
                    case IDC_buttonPut: {6};
                    case IDC_buttonMisc: {7};
                }
            )
        };
        // Left panel
        default {
            GVAR(sortListLeftPanel) select ([
                IDC_buttonPrimaryWeapon,
                IDC_buttonHandgun,
                IDC_buttonSecondaryWeapon,
                IDC_buttonUniform,
                IDC_buttonVest,
                IDC_buttonBackpack,
                IDC_buttonHeadgear,
                IDC_buttonGoggles,
                IDC_buttonNVG,
                IDC_buttonBinoculars,
                IDC_buttonMap,
                IDC_buttonGPS,
                IDC_buttonRadio,
                IDC_buttonCompass,
                IDC_buttonWatch,
                IDC_buttonFace,
                IDC_buttonVoice,
                IDC_buttonInsignia
            ] find _idc)
        };
    }
};

private _lastSort = [GVAR(lastSortLeft), GVAR(lastSortRight)] select _rightSort;
_sortIndex = 0;

{
    if (_x isEqualTo []) then {
        continue;
    };

    _x params ["_sortName", "_displayName", "", "_condition"];

    // Check if sort if available for this panel
    if ([_right] call _condition) then {
        _index = _sortCtrl lbAdd _displayName;
        _sortCtrl lbSetData [_index, _sortName];

        if (_displayName == _lastSort) then {
            _sortIndex = _index;
        };
    };
} forEach _sorts;

_sortCtrl lbSetCurSel _sortIndex;
