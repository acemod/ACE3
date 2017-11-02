#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

if !(ctrlEnabled _control) exitWith {};

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
private _contentPanelCursSel = lnbCurSelRow _contentPanelCtrl;
private _loadoutName = _contentPanelCtrl lnbText [_contentPanelCursSel, 1];

if (GVAR(currentLoadoutsTab) != IDC_buttonSharedLoadouts) then {

    private _data = profileNamespace getVariable [QGVAR(saved_loadouts), []];
    _data deleteAt (_data find ((_data select {_x select 0 == _loadoutName}) select 0));

    _contentPanelCtrl setVariable [_loadoutName, nil];
    _contentPanelCtrl lnbDeleteRow _contentPanelCursSel;
    _contentPanelCtrl lnbSetCurSelRow (_contentPanelCursSel);

    [(findDisplay IDD_ace_arsenal), format ["Loadout '%1' was deleted", _loadoutName]] call FUNC(message); // TBL
} else {

    private _profileName = profileName; // GVAR(center) could be a remote unit
    private _loadoutVar = _profileName + _loadoutName;

    GVAR(sharedLoadoutsNamespace) setVariable [_loadoutVar, nil, true];
    GVAR(sharedLoadoutsVars) = GVAR(sharedLoadoutsVars) - [_loadoutVar];

    _contentPanelCtrl lnbDeleteRow _contentPanelCursSel;
    _contentPanelCtrl lnbSetCurSelRow (_contentPanelCursSel);

    [QGVAR(sharedLoadoutDeleted), [_contentPanelCtrl, _loadoutName]] call CBA_fnc_remoteEvent;

    publicVariable QGVAR(sharedLoadoutsVars);
    [(findDisplay IDD_ace_arsenal), format ["Loadout '%1' was unshared", _loadoutName]] call FUNC(message); // TBL
};

