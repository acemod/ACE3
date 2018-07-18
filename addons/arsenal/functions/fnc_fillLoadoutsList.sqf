/*
 * Author: Alganthe
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
#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
private _textEditBoxCtrl= _display displayCtrl IDC_textEditBox;
_textEditBoxCtrl ctrlSetText "";
private _sharingEnabled = (GVAR(allowSharedLoadouts) && {isMultiplayer});
private _sharedLoadoutsVars = GVAR(sharedLoadoutsNamespace) getVariable QGVAR(sharedLoadoutsVars);

// Force a "refresh" animation of the panel
_contentPanelCtrl ctrlSetFade 1;
_contentPanelCtrl ctrlCommit 0;
_contentPanelCtrl ctrlSetFade 0;
_contentPanelCtrl ctrlCommit FADE_DELAY;

_contentPanelCtrl lnbSetCurSelRow -1;
lnbClear _contentPanelCtrl;

private _data = +(profileNamespace getvariable [QGVAR(saved_loadouts),[]]);

if (GVAR(currentLoadoutsTab) != IDC_buttonSharedLoadouts) then {

    {
        _x params ["_loadoutName", "_loadoutData"];

        private _loadoutCachedInfo = _contentPanelCtrl getVariable (_loadoutName + str GVAR(currentLoadoutsTab)); 

        if (isNil "_loadoutCachedInfo") then {
            [_loadoutData] call FUNC(verifyLoadout)
        } else {
            _loadoutCachedInfo
        } params ["_loadout", "_nullItemsAmount", "_unavailableItemsAmount", "_nullItemsList", "_unavailableItemsList"];

        // Log missing / nil items to RPT
        if (GVAR(EnableRPTLog) && {isNil "_loadoutCachedInfo"} && {(_nullItemsAmount > 0) || {_unavailableItemsAmount > 0}}) then {

            private _printComponent = "ACE_Arsenal - Loadout:";
            private _printNullItemsList = ["Missing items:", str _nullItemsList] joinString " ";
            private _printUnavailableItemsList = ["Unavailable items:", str _unavailableItemsList] joinString " ";

            diag_log text (format ["%1%5    %2%5    %3%5    %4", _printComponent, "Name: " + _loadoutName, _printNullItemsList, _printUnavailableItemsList, endl]);
        };

        if (GVAR(currentLoadoutsTab) == IDC_buttonDefaultLoadouts || {!_sharingEnabled}) then {
            _contentPanelCtrl lnbSetColumnsPos [0, 0, 0.40, 0.50, 0.60, 0.70, 0.75, 0.80, 0.85, 0.90];
        } else {
            _contentPanelCtrl lnbSetColumnsPos [0, 0.05, 0.40, 0.50, 0.60, 0.70, 0.75, 0.80, 0.85, 0.90];
        };

        private _newRow = _contentPanelCtrl lnbAddRow ["",_loadoutName];

        ADD_LOADOUTS_LIST_PICTURES

        if (_nullItemsAmount > 0) then {

            _contentPanelCtrl lnbSetColor [[_newRow, 1], [1, 0, 0, 0.8]];
        } else {

            if (_unavailableItemsAmount > 0) then {
                _contentPanelCtrl lnbSetColor [[_newRow, 1], [1, 1, 1, 0.25]];
            };
        };

        _contentPanelCtrl setVariable [_loadoutName + str GVAR(currentLoadoutsTab), [_loadout, _nullItemsAmount, _unavailableItemsAmount, _nullItemsList, _unavailableItemsList]];

        if ((profileName + _loadoutName) in _sharedLoadoutsVars && {GVAR(currentLoadoutsTab) == IDC_buttonMyLoadouts}) then {
            _contentPanelCtrl lnbSetPicture [[_newRow, 0], QPATHTOF(data\iconPublic.paa)];
            _contentPanelCtrl lnbSetValue [[_newRow, 0], 1];
        };
    } foreach ([_data, +GVAR(defaultLoadoutsList)] select (ctrlIDC _control == IDC_buttonDefaultLoadouts));
} else {

    {
        _x params ["_playerName", "_loadoutName", "_loadoutData"];

        if ((allPlayers apply {name _x}) find _playerName == -1) then {

            private _loadoutVar = _playerName + _loadoutName;

            GVAR(sharedLoadoutsNamespace) setVariable [_loadoutVar, nil, true];
            _sharedLoadoutsVars = _sharedLoadoutsVars - [_loadoutVar];
            GVAR(sharedLoadoutsNamespace) setVariable [QGVAR(sharedLoadoutsNamespace), _sharedLoadoutsVars, true];

            [QGVAR(loadoutUnshared), [_contentPanelCtrl, profileName, _loadoutName]] call CBA_fnc_remoteEvent;
        } else {

            ([_loadoutData] call FUNC(verifyLoadout)) params ["_loadout", "_nullItemsAmount", "_unavailableItemsAmount"];

            _contentPanelCtrl lnbSetColumnsPos [0, 0.15, 0.40, 0.50, 0.60, 0.70, 0.75, 0.80, 0.85, 0.90];
            private _newRow = _contentPanelCtrl lnbAddRow [_playerName, _loadoutName];

            ADD_LOADOUTS_LIST_PICTURES

            _contentPanelCtrl lnbSetData [[_newRow, 1], _playerName + _loadoutName];

            if (_nullItemsAmount > 0) then {

                _contentPanelCtrl lnbSetColor [[_newRow, 1], [1, 0, 0, 0.8]];
            } else {

                if (_unavailableItemsAmount > 0) then {
                    _contentPanelCtrl lnbSetColor [[_newRow, 1], [1, 1, 1, 0.25]];
                };
            };
        };
    } foreach (_sharedLoadoutsVars apply {GVAR(sharedLoadoutsNamespace) getVariable _x});
};

[QGVAR(loadoutsListFilled), [_display, _control]] call CBA_fnc_localEvent;

_contentPanelCtrl lnbSort [1, false];
