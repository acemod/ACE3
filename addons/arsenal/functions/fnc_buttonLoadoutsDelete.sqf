#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

if !(ctrlEnabled _control) exitWith {};

private _data = profileNamespace getVariable [QGVAR(saved_loadouts), []];

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
private _contentPanelCursSel = lnbCurSelRow _contentPanelCtrl;
private _loadoutName = _contentPanelCtrl lnbText [_contentPanelCursSel, 1];

_data deleteAt (_data find ((_data select {_x select 0 == _loadoutName}) select 0));

[_display, _display displayCtrl GVAR(currentLoadoutsTab)] call FUNC(fillLoadoutsList);
_contentPanelCtrl lnbSetCurSelRow (_contentPanelCursSel);

[(findDisplay IDD_ace_arsenal), format ["Loadout '%1' was deleted", _loadoutName]] call FUNC(message); // TBL