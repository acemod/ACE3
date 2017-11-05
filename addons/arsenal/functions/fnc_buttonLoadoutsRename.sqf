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

private _data = [profileNamespace getVariable [QGVAR(saved_loadouts), []], GVAR(defaultLoadoutsList)] select (GVAR(currentLoadoutsTab) == IDC_buttonDefaultLoadouts && {is3DEN});

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
private _curSelRow = lnbCurSelRow _contentPanelCtrl;
private _loadoutName = _contentPanelCtrl lnbText [_curSelRow, 1];
private _loadout = _contentPanelCtrl getVariable (_loadoutName + str GVAR(currentLoadoutsTab));

private _editBoxCtrl = _display displayCtrl IDC_textEditBox;
private _editBoxContent = ctrlText _editBoxCtrl;

private _similarLoadouts = _data select {_x select 0 == _editBoxContent};

if (count _similarLoadouts > 0) exitWith {
    [(findDisplay IDD_ace_arsenal), format ["A loadout named %1 already exist", _editBoxContent]] call FUNC(message); // TBL
};

// Update loadout info in profile and list namespaces
_data set [_data find ((_data select {_x select 0 == _loadoutName}) select 0), [_editBoxContent, _loadout]];
_contentPanelCtrl setVariable [_loadoutName + str GVAR(currentLoadoutsTab), nil];
_contentPanelCtrl setVariable [_editBoxContent + str GVAR(currentLoadoutsTab), _loadout];

_contentPanelCtrl lnbDeleteRow _curSelRow;

// Add new row
private _newRow = _contentPanelCtrl lnbAddRow ["",_editBoxContent];
_contentPanelCtrl lnbSetPicture [[_newRow, 2], getText (configFile >> "cfgWeapons" >> ((_loadout select 0) select 0) >> "picture")];
_contentPanelCtrl lnbSetPicture [[_newRow, 3], getText (configFile >> "cfgWeapons" >> ((_loadout select 1) select 0) >> "picture")];
_contentPanelCtrl lnbSetPicture [[_newRow, 4], getText (configFile >> "cfgWeapons" >> ((_loadout select 2) select 0) >> "picture")];
_contentPanelCtrl lnbSetPicture [[_newRow, 5], getText (configFile >> "cfgWeapons" >> ((_loadout select 3) select 0) >> "picture")];
_contentPanelCtrl lnbSetPicture [[_newRow, 6], getText (configFile >> "cfgWeapons" >> ((_loadout select 4) select 0) >> "picture")];
_contentPanelCtrl lnbSetPicture [[_newRow, 7], getText (configFile >> "cfgVehicles" >> ((_loadout select 5) select 0) >> "picture")];
_contentPanelCtrl lnbSetPicture [[_newRow, 8], getText (configFile >> "cfgWeapons" >> (_loadout select 6) >> "picture")];
_contentPanelCtrl lnbSetPicture [[_newRow, 9], getText (configFile >> "cfgGlasses" >> (_loadout select 7) >> "picture")];
_contentPanelCtrl setVariable [_editBoxContent + str GVAR(currentLoadoutsTab), _loadout];

// Sort and select the current row
_contentPanelCtrl lnbSort [1, false];
for '_i' from 0 to (((lnbsize _contentPanelCtrl) select 0) - 1) do {
    if ((_contentPanelCtrl lnbText [_i, 1]) == _editBoxContent) exitwith {_contentPanelCtrl lnbSetCurSelRow _i};
};

if (is3DEN && {GVAR(currentLoadoutsTab) == IDC_buttonDefaultLoadouts}) then {
    set3DENMissionAttributes [[QGVAR(DummyCategory), QGVAR(DefaultLoadoutsListAttribute), GVAR(defaultLoadoutsList)]];
};

[(findDisplay IDD_ace_arsenal), format ["Loadout '%1' was renamed to '%2'", _loadoutName, _editBoxContent]] call FUNC(message); // TBL
