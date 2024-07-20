#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
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

params ["_display", "_control"];

if !(ctrlEnabled _control) exitWith {};

// Retrieve panel data
private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
private _curSelRow = lnbCurSelRow _contentPanelCtrl;
private _loadoutName = _contentPanelCtrl lnbText [_curSelRow, 1];

// Get text from text edit box
private _editBoxContent = ctrlText (_display displayCtrl IDC_textEditBox);

// If it's the exact same name, don't do anything
if (_editBoxContent isEqualTo _loadoutName) exitWith {};

private _data = [profileNamespace getVariable [QGVAR(saved_loadouts), []], GVAR(defaultLoadoutsList)] select (call FUNC(canEditDefaultLoadout) && {GVAR(currentLoadoutsTab) == IDC_buttonDefaultLoadouts});

// If there is a loadout with a similar name and it's not chosen to be renamed, don't rename and exit
if (_editBoxContent != _loadoutName && {_data findIf {(_x select 0) == _editBoxContent} != -1}) exitWith {
    [findDisplay IDD_ace_arsenal, LLSTRING(renameExistError)] call FUNC(message);
};

// Update loadout info in profile / 3DEN and list namespaces
private _loadoutIndex = _data findIf {(_x select 0) == _loadoutName};

// Set new name
(_data select _loadoutIndex) set [0, _editBoxContent];

if (GVAR(currentLoadoutsTab) == IDC_buttonDefaultLoadouts) then {
    set3DENMissionAttributes [[QGVAR(DummyCategory), QGVAR(DefaultLoadoutsListAttribute), GVAR(defaultLoadoutsList)]];
};

private _currentLoadoutsTab = str GVAR(currentLoadoutsTab);

_contentPanelCtrl setVariable [_editBoxContent + _currentLoadoutsTab, _contentPanelCtrl getVariable [_loadoutName + _currentLoadoutsTab, []]];
_contentPanelCtrl setVariable [_loadoutName + _currentLoadoutsTab, nil];

// Update the current row's loadout name
_contentPanelCtrl lnbSetText [[_curSelRow, 1], _editBoxContent];

// Sort loadouts alphabetically
_contentPanelCtrl lnbSort [1, false];

// Select the newly renamed loadout
for "_lbIndex" from 0 to (lnbSize _contentPanelCtrl select 0) - 1 do {
    if ((_contentPanelCtrl lnbText [_lbIndex, 1]) == _editBoxContent) exitWith {
        _contentPanelCtrl lnbSetCurSelRow _lbIndex;
    };
};

[findDisplay IDD_ace_arsenal, [_loadoutName, LLSTRING(loadoutRenamed), _editBoxContent] joinString " "] call FUNC(message);
