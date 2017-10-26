#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

if !(ctrlEnabled _control) exitWith {};

private _data = profileNamespace getVariable [QGVAR(saved_loadouts), []];
private _loadout = getUnitLoadout GVAR(center);

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
private _cursSelRow = lnbCurSelRow _contentPanelCtrl;
private _loadoutName = _contentPanelCtrl lnbText [_cursSelRow, 1];

private _editBoxCtrl = _display displayCtrl IDC_textEditBox;
private _editBoxContent = ctrlText _editBoxCtrl;

if (ctrlIDC _control == IDC_buttonSharedLoadouts) then {

} else {
    private _sameNameLoadoutsList = _data select {_x select 0 == _editBoxContent};

    if (count _sameNameLoadoutsList == 0) then {

        _data pushBack [_editBoxContent, _loadout];
    } else {

        _data set [_data find (_sameNameLoadoutsList select 0), [[_editBoxContent, _loadoutName] select (_loadoutName isEqualTo _editBoxContent), _loadout]];
        _contentPanelCtrl lnbDeleteRow _cursSelRow;
    };

    [_display, _display displayCtrl GVAR(currentLoadoutsTab)] call FUNC(fillLoadoutsList);

    for '_i' from 0 to (((lnbsize _contentPanelCtrl) select 0) - 1) do {
        if ((_contentPanelCtrl lnbText [_i, 1]) == _editBoxContent) exitwith {_contentPanelCtrl lnbSetCurSelRow _i};
    };

    [(findDisplay IDD_ace_arsenal), format ["Loadout '%1' was saved", _editBoxContent]] call FUNC(message); // TBL
};

profileNamespace setVariable [QGVAR(saved_loadouts), _data];
