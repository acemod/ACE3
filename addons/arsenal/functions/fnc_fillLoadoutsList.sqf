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

private _contentListCtrl = _display displayCtrl IDC_contentPanel;
private _textEditBoxCtrl= _display displayCtrl IDC_textEditBox;
_textEditBoxCtrl ctrlSetText "";
private _sharingEnabled = (GVAR(allowSharedLoadouts) && {isMultiplayer});

_contentListCtrl lnbSetCurSelRow -1;
lnbClear _contentListCtrl;

private _data = +(profileNamespace getvariable [QGVAR(saved_loadouts),[]]);

if (GVAR(currentLoadoutsTab) != IDC_buttonSharedLoadouts) then {

    {
        _x params ["_loadoutName", "_loadoutData"];

        private _loadoutCachedInfo = _contentListCtrl getVariable (_loadoutName + str GVAR(currentLoadoutsTab)); 

        if (isNil "_loadoutCachedInfo") then {
            [_loadoutData] call FUNC(verifyLoadout)
        } else {
            _loadoutCachedInfo
        } params ["_loadout", "_nullItemsAmount", "_unavailableItemsAmount", "_nullItemsList", "_unavailableItemsList"];

        // Log missing / nil items to RPT
        if (GVAR(allowSharedLoadouts) && {isNil "_loadoutCachedInfo"} && {_nullItemsAmount > 0} || {_unavailableItemsAmount > 0}) then {

            private _printComponent = "ACE_Arsenal - Loadout:";
            private _printNullItemsList = ["Missing items:", str _nullItemsList] joinString " ";
            private _printUnavailableItemsList = ["Unavailable items:", str _unavailableItemsList] joinString " ";

            diag_log text (format ["%1%5    %2%5    %3%5    %4", _printComponent, "Name: " + _loadoutName, _printNullItemsList, _printUnavailableItemsList, endl]);
        };

        if (GVAR(currentLoadoutsTab) == IDC_buttonDefaultLoadouts || {!_sharingEnabled}) then {
            _contentListCtrl lnbSetColumnsPos [0, 0, 0.40, 0.50, 0.60, 0.70, 0.75, 0.80, 0.85, 0.90];
        } else {
            _contentListCtrl lnbSetColumnsPos [0, 0.05, 0.40, 0.50, 0.60, 0.70, 0.75, 0.80, 0.85, 0.90];
        };

        private _newRow = _contentListCtrl lnbAddRow ["",_loadoutName];

        _contentListCtrl lnbSetPicture [[_newRow, 2], getText (configFile >> "cfgWeapons" >> ((_loadout select 0) select 0) >> "picture")];
        _contentListCtrl lnbSetPicture [[_newRow, 3], getText (configFile >> "cfgWeapons" >> ((_loadout select 1) select 0) >> "picture")];
        _contentListCtrl lnbSetPicture [[_newRow, 4], getText (configFile >> "cfgWeapons" >> ((_loadout select 2) select 0) >> "picture")];
        _contentListCtrl lnbSetPicture [[_newRow, 5], getText (configFile >> "cfgWeapons" >> ((_loadout select 3) select 0) >> "picture")];
        _contentListCtrl lnbSetPicture [[_newRow, 6], getText (configFile >> "cfgWeapons" >> ((_loadout select 4) select 0) >> "picture")];
        _contentListCtrl lnbSetPicture [[_newRow, 7], getText (configFile >> "cfgVehicles" >> ((_loadout select 5) select 0) >> "picture")];
        _contentListCtrl lnbSetPicture [[_newRow, 8], getText (configFile >> "cfgWeapons" >> (_loadout select 6) >> "picture")];
        _contentListCtrl lnbSetPicture [[_newRow, 9], getText (configFile >> "cfgGlasses" >> (_loadout select 7) >> "picture")];


        if (_nullItemsAmount > 0) then {

            _contentListCtrl lnbSetColor [[_newRow, 1], [1, 0, 0, 0.5]];
        } else {

            if (_unavailableItemsAmount > 0) then {
                _contentListCtrl lnbSetColor [[_newRow, 1], [1, 1, 1, 0.25]];
            };
        };

        _contentListCtrl setVariable [_loadoutName + str GVAR(currentLoadoutsTab), [_loadout, _nullItemsAmount, _unavailableItemsAmount, _nullItemsList, _unavailableItemsList]];

        if ((profileName + _loadoutName) in GVAR(sharedLoadoutsVars) && {GVAR(currentLoadoutsTab) == IDC_buttonMyLoadouts}) then {
            _contentListCtrl lnbSetPicture [[_newRow, 0], QPATHTOF(data\iconPublic.paa)];
            _contentListCtrl lnbSetValue [[_newRow, 0], 1];
        };
    } foreach ([_data, +GVAR(defaultLoadoutsList)] select (ctrlIDC _control == IDC_buttonDefaultLoadouts));
} else {

    {
        _x params ["_playerName", "_loadoutName", "_loadoutData"];

        if ((allPlayers apply {name _x}) find _playerName == -1) then {

            private _loadoutVar = _playerName + _loadoutName;
            GVAR(sharedLoadoutsNamespace) setVariable [_loadoutVar, nil, true];
            GVAR(sharedLoadoutsVars) = GVAR(sharedLoadoutsVars) - [_loadoutVar];
            [QGVAR(loadoutUnshared), [_contentPanelCtrl, profileName, _loadoutName]] call CBA_fnc_remoteEvent;

        } else {

            ([_loadoutData] call FUNC(verifyLoadout)) params ["_loadout", "_nullItemsAmount", "_unavailableItemsAmount"];

            _contentListCtrl lnbSetColumnsPos [0, 0.15, 0.40, 0.50, 0.60, 0.70, 0.75, 0.80, 0.85, 0.90];
            private _newRow = _contentListCtrl lnbAddRow [_playerName, _loadoutName];

            _contentListCtrl lnbSetPicture [[_newRow, 2], getText (configFile >> "cfgWeapons" >> ((_loadout select 0) select 0) >> "picture")];
            _contentListCtrl lnbSetPicture [[_newRow, 3], getText (configFile >> "cfgWeapons" >> ((_loadout select 1) select 0) >> "picture")];
            _contentListCtrl lnbSetPicture [[_newRow, 4], getText (configFile >> "cfgWeapons" >> ((_loadout select 2) select 0) >> "picture")];
            _contentListCtrl lnbSetPicture [[_newRow, 5], getText (configFile >> "cfgWeapons" >> ((_loadout select 3) select 0) >> "picture")];
            _contentListCtrl lnbSetPicture [[_newRow, 6], getText (configFile >> "cfgWeapons" >> ((_loadout select 4) select 0) >> "picture")];
            _contentListCtrl lnbSetPicture [[_newRow, 7], getText (configFile >> "cfgVehicles" >> ((_loadout select 5) select 0) >> "picture")];
            _contentListCtrl lnbSetPicture [[_newRow, 8], getText (configFile >> "cfgWeapons" >> (_loadout select 6) >> "picture")];
            _contentListCtrl lnbSetPicture [[_newRow, 9], getText (configFile >> "cfgGlasses" >> (_loadout select 7) >> "picture")];

            _contentListCtrl lnbSetData [[_newRow, 1], _playerName + _loadoutName];

            if (_nullItemsAmount > 0) then {

                _contentListCtrl lnbSetColor [[_newRow, 1], [1, 0, 0, 0.5]];
            } else {

                if (_unavailableItemsAmount > 0) then {
                    _contentListCtrl lnbSetColor [[_newRow, 1], [1, 1, 1, 0.25]];
                };
            };
        };
    } foreach (GVAR(sharedLoadoutsVars) apply {GVAR(sharedLoadoutsNamespace) getVariable _x});

    publicVariable QGVAR(sharedLoadoutsVars);
};

_contentListCtrl lnbSort [1, false];