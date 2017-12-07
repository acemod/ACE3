/*
 * Author: Alganthe
 * Rename selected loadout.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Button control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/
#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

if !(ctrlEnabled _control) exitWith {};

// Retrieve panel data
private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
private _curSelRow = lnbCurSelRow _contentPanelCtrl;
private _loadoutName = _contentPanelCtrl lnbText [_curSelRow, 1];

private _editBoxCtrl = _display displayCtrl IDC_textEditBox;
private _editBoxContent = ctrlText _editBoxCtrl;

private _data = [profileNamespace getVariable [QGVAR(saved_loadouts), []], GVAR(defaultLoadoutsList)] select (GVAR(currentLoadoutsTab) == IDC_buttonDefaultLoadouts && {is3DEN});
private _similarLoadouts = _data select {_x select 0 == _editBoxContent};

if (count _similarLoadouts > 0) exitWith {
    [(findDisplay IDD_ace_arsenal), localize LSTRING(renameExistError)] call FUNC(message);
};

// Update loadout info in profile / 3DEN and list namespaces
private _loadoutToRename = (_data select {_x select 0 == _loadoutName}) select 0;
(_contentPanelCtrl getVariable (_loadoutName + str GVAR(currentLoadoutsTab))) params ["_loadout", "_nullItemsAmount", "_unavailableItemsAmount", "_nullItemsList", "_unavailableItemsList"];

_data set [_data find _loadoutToRename, [_editBoxContent, (_loadoutToRename select 1)]];
_contentPanelCtrl setVariable [_loadoutName + str GVAR(currentLoadoutsTab), nil];
_contentPanelCtrl setVariable [_editBoxContent + str GVAR(currentLoadoutsTab), [_loadout, _nullItemsAmount, _unavailableItemsAmount, _nullItemsList, _unavailableItemsList]];

// Add new row
_contentPanelCtrl lnbDeleteRow _curSelRow;
private _newRow = _contentPanelCtrl lnbAddRow ["",_editBoxContent];

ADD_LOADOUTS_LIST_PICTURES

if (_nullItemsAmount > 0) then {

    _contentPanelCtrl lnbSetColor [[_newRow, 1], [1, 0, 0, 0.8]];
} else {

    if (_unavailableItemsAmount > 0) then {
        _contentPanelCtrl lnbSetColor [[_newRow, 1], [1, 1, 1, 0.25]];
    };
};

// Sort and select the current row
_contentPanelCtrl lnbSort [1, false];
for '_i' from 0 to (((lnbsize _contentPanelCtrl) select 0) - 1) do {
    if ((_contentPanelCtrl lnbText [_i, 1]) == _editBoxContent) exitwith {_contentPanelCtrl lnbSetCurSelRow _i};
};

if (is3DEN && {GVAR(currentLoadoutsTab) == IDC_buttonDefaultLoadouts}) then {
    set3DENMissionAttributes [[QGVAR(DummyCategory), QGVAR(DefaultLoadoutsListAttribute), GVAR(defaultLoadoutsList)]];
};

[(findDisplay IDD_ace_arsenal), [_loadoutName, localize LSTRING(loadoutRenamed) ,_editBoxContent] joinString " "] call FUNC(message);
