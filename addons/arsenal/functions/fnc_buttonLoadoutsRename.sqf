#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

if !(ctrlEnabled _control) exitWith {};

private _data = profileNamespace getVariable [QGVAR(saved_loadouts), []];

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
private _loadoutName = _contentPanelCtrl lnbText [(lnbCurSelRow _contentPanelCtrl), 1];

private _editBoxCtrl = _display displayCtrl IDC_textEditBox;
private _editBoxContent = ctrlText _editBoxCtrl;

private _loadoutData = (_data select {_x select 0 == _loadoutName}) select 0;
private _loadoutIndex = _data find _loadoutData;

_data set [_loadoutIndex, [_editBoxContent, _loadoutData select 1]];

[_display, _display displayCtrl GVAR(currentLoadoutsTab)] call FUNC(fillLoadoutsList);

for '_i' from 0 to (((lnbsize _contentPanelCtrl) select 0) - 1) do {
    if ((_contentPanelCtrl lnbText [_i, 1]) == _editBoxContent) exitwith {_contentPanelCtrl lnbSetCurSelRow _i};
};

[(findDisplay IDD_ace_arsenal), format ["Loadout '%1' was renamed to '%2'", _loadoutName, _editBoxContent]] call FUNC(message); // TBL