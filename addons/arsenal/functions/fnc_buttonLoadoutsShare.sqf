#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe
 * Share selected loadout.
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
private _profileName = profileName; // GVAR(center) could be a remote unit
private _loadoutVar = _profileName + _loadoutName;
private _sharedLoadoutsVars = +(GVAR(sharedLoadoutsNamespace) getVariable QGVAR(sharedLoadoutsVars));

private _loadoutIndex = _sharedLoadoutsVars find _loadoutVar;
private _loadoutData = (_contentPanelCtrl getVariable (_loadoutName + str GVAR(currentLoadoutsTab))) select 0;

// Loadout set to private
if (_loadoutIndex > -1) then {
    GVAR(sharedLoadoutsNamespace) setVariable [_loadoutVar, nil, true];
    GVAR(sharedLoadoutsNamespace) setVariable [QGVAR(sharedLoadoutsVars), _sharedLoadoutsVars - [_loadoutVar], true];

    _contentPanelCtrl lnbSetPicture [[_contentPanelCursSel, 0], QPATHTOF(data\iconPublicBlank.paa)];
    _contentPanelCtrl lnbSetValue [[_contentPanelCursSel, 0], 0];
    [QGVAR(loadoutUnshared), [_contentPanelCtrl, profileName, _loadoutName]] call CBA_fnc_remoteEvent;

// Loadout set to public
} else {
    GVAR(sharedLoadoutsNamespace) setVariable [_loadoutVar, [_profileName ,_loadoutName , _loadoutData], true];
    _sharedLoadoutsVars pushBackUnique _loadoutVar;
    GVAR(sharedLoadoutsNamespace) setVariable [QGVAR(sharedLoadoutsVars), _sharedLoadoutsVars, true];

    _contentPanelCtrl lnbSetPicture [[_contentPanelCursSel, 0], QPATHTOF(data\iconPublic.paa)];
    _contentPanelCtrl lnbSetValue [[_contentPanelCursSel, 0], 1];
    [QGVAR(loadoutShared), [_contentPanelCtrl, [_profileName ,_loadoutName , _loadoutData]]] call CBA_fnc_remoteEvent;
};

// Update share button text
_control ctrlSetText ( [
    localize LSTRING(buttonSharePrivateText),
    localize LSTRING(buttonSharePublicText)
] select ((_contentPanelCtrl lnbValue [_contentPanelCursSel, 0]) == 1));
