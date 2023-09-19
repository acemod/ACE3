#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Save selected loadout.
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

private _editBoxCtrl = _display displayCtrl IDC_textEditBox;
private _editBoxContent = ctrlText _editBoxCtrl;

// If no name given, throw error
if (_editBoxContent == "") exitWith {
    [findDisplay IDD_ace_arsenal, LLSTRING(saveEmptyNameBox)] call FUNC(message);
};

// Get shared loadouts
private _sharedLoadoutsVars = GVAR(sharedLoadoutsNamespace) getVariable [QGVAR(sharedLoadoutsVars), []];

// Make sure the loadout isn't yours (public tab) or being shared (my loadouts tab)
if ((profileName + _editBoxContent) in _sharedLoadoutsVars) exitWith {
    [findDisplay IDD_ace_arsenal, LLSTRING(saveSharedError)] call FUNC(message);
};

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
private _curSelRow = lnbCurSelRow _contentPanelCtrl;

if ((_contentPanelCtrl lnbText [_curSelRow, 0]) == profileName) exitWith {
    [findDisplay IDD_ace_arsenal, LLSTRING(saveAuthorError)] call FUNC(message);
};

// Get currently selected loadout name & loadout
private _loadoutName = _contentPanelCtrl lnbText [_curSelRow, 1];
private _curSelLoadout = (_contentPanelCtrl getVariable (_loadoutName + str GVAR(currentLoadoutsTab))) select 0;

// Get unit's current loadout
private _extendedLoadout = GVAR(center) call CBA_fnc_getLoadout;
_extendedLoadout params ["_loadout"];

private _loadouts = [profileNamespace getVariable [QGVAR(saved_loadouts), []], GVAR(defaultLoadoutsList)] select ((call FUNC(canEditDefaultLoadout)) && {GVAR(currentLoadoutsTab) == IDC_buttonDefaultLoadouts});
private _loadoutIndex = _loadouts findIf {(_x select 0) == _editBoxContent};

// Return what loadout was saved
private _savedLoadout = switch (GVAR(currentLoadoutsTab)) do {
    // Local loadouts tab
    case IDC_buttonMyLoadouts: {
        // If saved to default loadout
        if (GVAR(shiftState) && FUNC(canEditDefaultLoadout) && {_loadoutName != ""} && {_curSelRow != -1} && {_loadoutIndex != -1}) then {
            private _defaultLoadoutsSearch = GVAR(defaultLoadoutsList) findIf {(_x select 0) == _loadoutName};

            [_loadoutName, _curSelLoadout, !is3DEN] call FUNC(addDefaultLoadout);

            if (_defaultLoadoutsSearch == -1) then {
                _loadoutIndex = (count GVAR(defaultLoadoutsList)) - 1;
            };

            _curSelLoadout
        } else {
            // Replace unique items with their bases and replace weapons with their base weapons
            _loadout = [_loadout] call FUNC(replaceUniqueItemsLoadout);

            private _data = profileNamespace getVariable [QGVAR(saved_loadouts), []];

            // Add or overwrite loadout in loadout storage
            if (_loadoutIndex == -1) then {
                _loadoutIndex = _data pushBack [_editBoxContent, _extendedLoadout];
            } else {
                _data set [_loadoutIndex, [_editBoxContent, _extendedLoadout]];
            };

            // Refresh loadout list; Delete previous loadout row
            for "_lbIndex" from 0 to (lnbSize _contentPanelCtrl select 0) - 1 do {
                if ((_contentPanelCtrl lnbText [_lbIndex, 1]) == _editBoxContent) exitWith {
                    _contentPanelCtrl lnbDeleteRow _lbIndex;
                };
            };

            private _newRow = _contentPanelCtrl lnbAddRow ["", _editBoxContent];
            private _cfgWeapons = configFile >> "CfgWeapons";

            ADD_LOADOUTS_LIST_PICTURES

            _contentPanelCtrl setVariable [_editBoxContent + str GVAR(currentLoadoutsTab), [_extendedLoadout] call FUNC(verifyLoadout)];

            // Sort loadouts alphabetically
            _contentPanelCtrl lnbSort [1, false];

            // Select newly saved loadout
            for "_lbIndex" from 0 to (lnbSize _contentPanelCtrl select 0) - 1 do {
                if ((_contentPanelCtrl lnbText [_lbIndex, 1]) == _editBoxContent) exitWith {
                    _contentPanelCtrl lnbSetCurSelRow _lbIndex;
                };
            };

            _extendedLoadout
        };
    };
    // Default loadouts tab
    case IDC_buttonDefaultLoadouts: {
        if (call FUNC(canEditDefaultLoadout)) then {

            [_editBoxContent, _extendedLoadout, !is3DEN] call FUNC(addDefaultLoadout);

            // Get loadout index
            if (_loadoutIndex == -1) then {
                _loadoutIndex = (count GVAR(defaultLoadoutsList)) - 1;
            };

            // Refresh loadout list; Delete previous loadout row
            for "_lbIndex" from 0 to (lnbSize _contentPanelCtrl select 0) - 1 do {
                if ((_contentPanelCtrl lnbText [_lbIndex, 1]) == _editBoxContent) exitWith {
                    _contentPanelCtrl lnbDeleteRow _lbIndex;
                };
            };

            private _newRow = _contentPanelCtrl lnbAddRow ["", _editBoxContent];
            private _cfgWeapons = configFile >> "CfgWeapons";

            ADD_LOADOUTS_LIST_PICTURES

            _contentPanelCtrl setVariable [_editBoxContent + str GVAR(currentLoadoutsTab), [_extendedLoadout] call FUNC(verifyLoadout)];

            // Sort loadouts alphabetically
            _contentPanelCtrl lnbSort [1, false];

            // Select newly saved loadout
            for "_lbIndex" from 0 to (lnbSize _contentPanelCtrl select 0) - 1 do {
                if ((_contentPanelCtrl lnbText [_lbIndex, 1]) == _editBoxContent) exitWith {
                    _contentPanelCtrl lnbSetCurSelRow _lbIndex;
                };
            };

            _extendedLoadout
        } else {
            private _data = profileNamespace getVariable [QGVAR(saved_loadouts), []];

            // Add or overwrite loadout in loadout storage
            if (_loadoutIndex == -1) then {
                _loadoutIndex = _data pushBack [_editBoxContent, _curSelLoadout];
            } else {
                _data set [_loadoutIndex, [_editBoxContent, _curSelLoadout]];
                _contentPanelCtrl setVariable [_editBoxContent + str IDC_buttonMyLoadouts, [_curSelLoadout] call FUNC(verifyLoadout)];
            };

            _curSelLoadout
        };
    };
    // Shared loadouts tab
    case IDC_buttonSharedLoadouts: {
        _loadout = (GVAR(sharedLoadoutsNamespace) getVariable ((_contentPanelCtrl lnbText [_curSelRow, 0]) + (_contentPanelCtrl lnbText [_curSelRow, 1]))) select 2;

        private _data = profileNamespace getVariable [QGVAR(saved_loadouts), []];

        // Add or overwrite loadout in loadout storage
        if (_loadoutIndex == -1) then {
            _loadoutIndex = _data pushBack [_editBoxContent, _loadout];
        } else {
            _data set [_loadoutIndex, [_editBoxContent, _loadout]];
            _contentPanelCtrl setVariable [_editBoxContent + str IDC_buttonMyLoadouts, [_loadout] call FUNC(verifyLoadout)];
        };

        _loadout
    };
};

[findDisplay IDD_ace_arsenal, [LLSTRING(loadoutSaved), _editBoxContent] joinString " "] call FUNC(message);

[QGVAR(onLoadoutSave), [_loadoutIndex, _savedLoadout select 0]] call CBA_fnc_localEvent;
[QGVAR(onLoadoutSaveExtended), [_loadoutIndex, _savedLoadout]] call CBA_fnc_localEvent;
