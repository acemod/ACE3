#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Fill loadouts list.
 *
 * Arguments:
 * 0: Loadouts display <DISPLAY>
 * 1: Tab control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_control"];

(_display displayCtrl IDC_textEditBox) ctrlSetText "";

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;

// Force a "refresh" animation of the panel
_contentPanelCtrl ctrlSetFade 1;
_contentPanelCtrl ctrlCommit 0;
_contentPanelCtrl ctrlSetFade 0;
_contentPanelCtrl ctrlCommit FADE_DELAY;

_contentPanelCtrl lnbSetCurSelRow -1;
lnbClear _contentPanelCtrl;

private _sharedLoadoutsVars = GVAR(sharedLoadoutsNamespace) getVariable QGVAR(sharedLoadoutsVars);
private _cfgWeapons = configFile >> "CfgWeapons";
private _newRow = -1;

if (GVAR(currentLoadoutsTab) != IDC_buttonSharedLoadouts) then {
    private _loadoutNameAndTab = "";
    private _loadoutCachedInfo = "";
    private _sharingEnabled = GVAR(allowSharedLoadouts) && {isMultiplayer};

    // Add all loadouts to loadout list
    {
        _x params ["_loadoutName", "_loadoutData"];

        _loadoutNameAndTab = _loadoutName + str GVAR(currentLoadoutsTab);
        _loadoutCachedInfo = _contentPanelCtrl getVariable _loadoutNameAndTab;

        // If not in cache, get info and cache it
        if (isNil "_loadoutCachedInfo") then {
            _loadoutCachedInfo = [_loadoutData] call FUNC(verifyLoadout);
            _contentPanelCtrl setVariable [_loadoutNameAndTab, _loadoutCachedInfo];

            _loadoutCachedInfo params ["", "_nullItemsAmount", "_unavailableItemsAmount", "_nullItemsList", "_unavailableItemsList"];

            // Log missing / nil items to RPT (only once per arsenal session)
            if (GVAR(EnableRPTLog) && {(_nullItemsAmount > 0) || {_unavailableItemsAmount > 0}}) then {
                private _printComponent = "ACE_Arsenal - Loadout:";
                private _printNullItemsList = ["Missing items:", str _nullItemsList] joinString " ";
                private _printUnavailableItemsList = ["Unavailable items:", str _unavailableItemsList] joinString " ";

                diag_log text (format ["%1%5    %2%5    %3%5    %4", _printComponent, "Name: " + _loadoutName, _printNullItemsList, _printUnavailableItemsList, endl]);
            };
        };

        // Set position of loadouts different if in default loadout tab or if sharing is disabled
        if (GVAR(currentLoadoutsTab) == IDC_buttonDefaultLoadouts || {!_sharingEnabled}) then {
            _contentPanelCtrl lnbSetColumnsPos [0, 0, 0.40, 0.50, 0.60, 0.70, 0.75, 0.80, 0.85, 0.90];
        } else {
            _contentPanelCtrl lnbSetColumnsPos [0, 0.05, 0.40, 0.50, 0.60, 0.70, 0.75, 0.80, 0.85, 0.90];
        };

        _loadoutCachedInfo params ["_extendedLoadout", "_nullItemsAmount", "_unavailableItemsAmount"];
        _extendedLoadout params ["_loadout"];

        _newRow = _contentPanelCtrl lnbAddRow ["", _loadoutName];

        ADD_LOADOUTS_LIST_PICTURES

        // Change color on loadout lines that have items that aren't available or don't exist
        if (_nullItemsAmount > 0) then {
            _contentPanelCtrl lnbSetColor [[_newRow, 1], [1, 0, 0, 0.8]]; // Red
        } else {
            if (_unavailableItemsAmount > 0) then {
                _contentPanelCtrl lnbSetColor [[_newRow, 1], [1, 1, 1, 0.25]]; // Gray
            };
        };

        // If it's a shared loadout and player is in the private loadouts tab, add icon
        if (((profileName + _loadoutName) in _sharedLoadoutsVars) && {GVAR(currentLoadoutsTab) == IDC_buttonMyLoadouts}) then {
            _contentPanelCtrl lnbSetPicture [[_newRow, 0], QPATHTOF(data\iconPublic.paa)];
            _contentPanelCtrl lnbSetValue [[_newRow, 0], 1];
        };
    } forEach ([profileNamespace getVariable [QGVAR(saved_loadouts), []], GVAR(defaultLoadoutsList)] select (ctrlIDC _control == IDC_buttonDefaultLoadouts));
} else {
    private _allPlayerNames = allPlayers apply {name _x};
    private _loadoutVar = "";

    {
        _x params ["_playerName", "_loadoutName", "_loadoutData"];

        _loadoutVar = _playerName + _loadoutName;

        // If player who shared loadout doesn't exist anymore, unshare loadout
        if !(_playerName in _allPlayerNames) then {
            GVAR(sharedLoadoutsNamespace) setVariable [_loadoutVar, nil, true];
            GVAR(sharedLoadoutsNamespace) setVariable [QGVAR(sharedLoadoutsNamespace), _sharedLoadoutsVars - [_loadoutVar], true];

            [QGVAR(loadoutUnshared), [_contentPanelCtrl, profileName, _loadoutName]] call CBA_fnc_remoteEvent;
        } else {
            ([_loadoutData] call FUNC(verifyLoadout)) params ["_extendedLoadout", "_nullItemsAmount", "_unavailableItemsAmount"];
            _extendedLoadout params ["_loadout"];

            _contentPanelCtrl lnbSetColumnsPos [0, 0.15, 0.40, 0.50, 0.60, 0.70, 0.75, 0.80, 0.85, 0.90];
            _newRow = _contentPanelCtrl lnbAddRow [_playerName, _loadoutName];

            ADD_LOADOUTS_LIST_PICTURES

            _contentPanelCtrl lnbSetData [[_newRow, 1], _loadoutVar];

            // Change color on loadout lines that have items that aren't available or don't exist
            if (_nullItemsAmount > 0) then {
                _contentPanelCtrl lnbSetColor [[_newRow, 1], [1, 0, 0, 0.8]]; // Red
            } else {
                if (_unavailableItemsAmount > 0) then {
                    _contentPanelCtrl lnbSetColor [[_newRow, 1], [1, 1, 1, 0.25]]; // Gray
                };
            };
        };
    } forEach (_sharedLoadoutsVars apply {GVAR(sharedLoadoutsNamespace) getVariable _x});
};

[QGVAR(loadoutsListFilled), [_display, _control]] call CBA_fnc_localEvent;

// Sort loadouts alphabetically
_contentPanelCtrl lnbSort [1, false];
