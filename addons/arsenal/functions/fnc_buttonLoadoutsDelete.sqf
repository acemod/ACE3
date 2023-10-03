#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Delete / unshare loadout currently selected.
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

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
private _contentPanelCursSel = lnbCurSelRow _contentPanelCtrl;
private _loadoutName = _contentPanelCtrl lnbText [_contentPanelCursSel, 1];

// If loadout is local or default
if (GVAR(currentLoadoutsTab) != IDC_buttonSharedLoadouts) then {
    // Find loadout and delete from list
    if (GVAR(currentLoadoutsTab) == IDC_buttonDefaultLoadouts) then {
        [_loadoutName, !is3DEN] call FUNC(removeDefaultLoadout);
    } else {
        private _data = profileNamespace getVariable [QGVAR(saved_loadouts), []];

        _data deleteAt (_data findIf {(_x select 0) == _loadoutName});
    };

    _contentPanelCtrl setVariable [_loadoutName + str GVAR(currentLoadoutsTab), nil];
    _contentPanelCtrl lnbDeleteRow _contentPanelCursSel;
    _contentPanelCtrl lnbSetCurSelRow _contentPanelCursSel;

    [findDisplay IDD_ace_arsenal, [LLSTRING(loadoutDeleted), _loadoutName] joinString " "] call FUNC(message);

    [QGVAR(onLoadoutDelete), [_loadoutName]] call CBA_fnc_localEvent;
} else {
    // If loadout is shared
    private _profileName = profileName; // GVAR(center) could be a remote unit
    private _loadoutVar = _profileName + _loadoutName;
    private _sharedLoadoutsVars = GVAR(sharedLoadoutsNamespace) getVariable [QGVAR(sharedLoadoutsVars), []];

    GVAR(sharedLoadoutsNamespace) setVariable [_loadoutVar, nil, true];
    GVAR(sharedLoadoutsNamespace) setVariable [QGVAR(sharedLoadoutsVars), _sharedLoadoutsVars - [_loadoutVar], true];

    _contentPanelCtrl lnbDeleteRow _contentPanelCursSel;
    _contentPanelCtrl lnbSetCurSelRow _contentPanelCursSel;

    [findDisplay IDD_ace_arsenal, [LLSTRING(loadoutUnshared), _loadoutName] joinString " "] call FUNC(message);

    [QGVAR(loadoutUnshared), [_contentPanelCtrl, _profileName, _loadoutName]] call CBA_fnc_remoteEvent;
};
