#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

systemChat str [_display, _control];

if !(ctrlEnabled _control) exitWith {};

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
private _contentPanelRow = lnbCurSelRow _contentPanelCtrl;
private _loadoutName = _contentPanelCtrl lnbText [_contentPanelRow, 1];

profileNamespace setVariable [QGVAR(saved_loadouts), [_loadoutName, getUnitLoadout GVAR(center)]];