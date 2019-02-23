#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe
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

if (_editBoxContent == "") exitWith {
    [(findDisplay IDD_ace_arsenal), localize LSTRING(saveEmptyNameBox)] call FUNC(message);
};

private _data = [+(profileNamespace getVariable [QGVAR(saved_loadouts),[]]), +(GVAR(defaultLoadoutsList))] select (GVAR(currentLoadoutsTab) == IDC_buttonDefaultLoadouts && {is3DEN});
private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
private _cursSelRow = lnbCurSelRow _contentPanelCtrl;

private _loadoutName = _contentPanelCtrl lnbText [_cursSelRow, 1];
private _curSelLoadout = (_contentPanelCtrl getVariable (_loadoutName + str GVAR(currentLoadoutsTab))) select 0;
private _loadout = getUnitLoadout GVAR(center);

private _loadoutIndex = _data findIf {(_x select 0) == _editBoxContent};
private _sharedLoadoutsVars = GVAR(sharedLoadoutsNamespace) getVariable QGVAR(sharedLoadoutsVars);

// Make sure the loadout isn't yours (public tab) or being shared (my loadouts tab)
private _similarSharedLoadout = (profileName + _editBoxContent) in _sharedLoadoutsVars;
if ((_contentPanelCtrl lnbText [_cursSelRow, 0]) == profileName) exitWith {
    [(findDisplay IDD_ace_arsenal), localize LSTRING(saveAuthorError)] call FUNC(message);
};

if (_similarSharedLoadout) exitWith {
    [(findDisplay IDD_ace_arsenal), localize LSTRING(saveSharedError)] call FUNC(message);
};

switch (GVAR(currentLoadoutsTab)) do {
    case IDC_buttonMyLoadouts:{

        for "_dataIndex" from 0 to 10 do {
            switch (_dataIndex) do {

                case 0;
                case 1;
                case 2;
                case 8: {
                    if (count (_loadout select _dataIndex) > 0) then {

                        private _weapon = (_loadout select _dataIndex) select 0;
                        if (_weapon != "") then {

                            private _baseWeapon = _weapon call BIS_fnc_baseWeapon;
                             if (_weapon != _baseWeapon) then {
                                (_loadout select _dataIndex) set [0, _baseWeapon];
                            };
                        };
                    };
                };

                case 3;
                case 4;
                case 5: {
                    if (count (_loadout select _dataIndex) > 0) then {
                        private _containerContents = (_loadout select _dataIndex) select 1;

                        if (count _containerContents > 0) then {

                            {
                                if (count _x == 2) then {

                                        if ((_x select 0) isEqualType "") then {

                                            private _item = (_x select 0);
                                            if (_item != "") then {

                                                private _uniqueBaseCfgText = getText (configFile >> "CfgWeapons" >> _item >> "ace_arsenal_uniqueBase");
                                                if (_uniqueBaseCfgText != "") then {

                                                    _x set [0, _uniqueBaseCfgText];
                                                };
                                            };
                                        } else {
                                            private _weapon = (_x select 0) select 0;
                                            if (_weapon != "") then {

                                                private _baseWeapon = _weapon call BIS_fnc_baseWeapon;
                                                if (_weapon != _baseWeapon) then {
                                                    (_x select 0)set [0, _baseWeapon];
                                                };
                                            };
                                        };
                                    };
                            } foreach _containerContents;
                        };
                    };
                };

                case 9: {
                    for "_subIndex" from 0 to 4 do {
                        private _item = (_loadout select _dataIndex) select _subIndex;

                        if (_item != "") then {

                            private _uniqueBaseCfgText = getText (configFile >> "CfgWeapons" >> _item >> "ace_arsenal_uniqueBase");
                            if (_uniqueBaseCfgText != "") then {

                                (_loadout select _dataIndex) set [_subIndex, _uniqueBaseCfgText];
                            };
                        };
                    };
                };
            };
        };

        if (GVAR(shiftState) && {is3DEN} && {!(_loadoutName isEqualTo "")} && {_cursSelRow != -1} && {!(_loadoutIndex isEqualto -1)}) exitwith {
            private _defaultLoadoutsSearch = GVAR(defaultLoadoutsList) findIf {(_x select 0) == _loadoutName};
            if (_defaultLoadoutsSearch isEqualto -1) then {
                GVAR(defaultLoadoutsList) pushBack [_loadoutName, _curSelLoadout];
            } else {
                GVAR(defaultLoadoutsList) set [_defaultLoadoutsSearch , [ _loadoutName, _curSelLoadout]];
            };
            set3DENMissionAttributes [[QGVAR(DummyCategory), QGVAR(DefaultLoadoutsListAttribute), GVAR(defaultLoadoutsList)]];
        };

        if (_loadoutIndex isEqualto -1) then {
            _data pushBack [_editBoxContent, _loadout];
        } else {
            _data set [_loadoutIndex, [[_editBoxContent, _loadoutName] select (_loadoutName isEqualTo _editBoxContent), _loadout]];
        };

        // Delete "old" loadout row
        for '_i' from 0 to (((lnbsize _contentPanelCtrl) select 0) - 1) do {
            if ((_contentPanelCtrl lnbText [_i, 1]) == _editBoxContent) exitwith {_contentPanelCtrl lnbDeleteRow _i};
        };

        private _newRow = _contentPanelCtrl lnbAddRow ["",_editBoxContent];

        ADD_LOADOUTS_LIST_PICTURES

        _contentPanelCtrl setVariable [_editBoxContent + str GVAR(currentLoadoutsTab), [_loadout] call FUNC(verifyLoadout)];

        _contentPanelCtrl lnbSort [1, false];

        // Select newly saved loadout
        for '_i' from 0 to (((lnbsize _contentPanelCtrl) select 0) - 1) do {
            if ((_contentPanelCtrl lnbText [_i, 1]) == _editBoxContent) exitwith {_contentPanelCtrl lnbSetCurSelRow _i};
        };

        profileNamespace setVariable [QGVAR(saved_loadouts), _data];
    };

    case IDC_buttonDefaultLoadouts:{

        if (is3DEN) then {

            private _loadoutIndex = _data findIf {(_x select 0) == _editBoxContent};

            for "_dataIndex" from 0 to 10 do {
                switch (_dataIndex) do {

                    case 0;
                    case 1;
                    case 2;
                    case 8: {
                        if (count (_loadout select _dataIndex) > 0) then {

                            private _weapon = (_loadout select _dataIndex) select 0;
                            if (_weapon != "") then {

                                private _baseWeapon = _weapon call BIS_fnc_baseWeapon;
                                if (_weapon != _baseWeapon) then {
                                    (_loadout select _dataIndex) set [0, _baseWeapon];
                                };
                            };
                        };
                    };

                    case 3;
                    case 4;
                    case 5: {
                        if (count (_loadout select _dataIndex) > 0) then {
                            private _containerContents = (_loadout select _dataIndex) select 1;

                            if (count _containerContents > 0) then {

                                {
                                    if (count _x == 2) then {

                                        if ((_x select 0) isEqualType "") then {

                                            private _item = (_x select 0);
                                            if (_item != "") then {

                                                private _uniqueBaseCfgText = getText (configFile >> "CfgWeapons" >> _item >> "ace_arsenal_uniqueBase");
                                                if (_uniqueBaseCfgText != "") then {

                                                    _x set [0, _uniqueBaseCfgText];
                                                };
                                            };
                                        } else {
                                            private _weapon = (_x select 0) select 0;
                                            if (_weapon != "") then {

                                                private _baseWeapon = _weapon call BIS_fnc_baseWeapon;
                                                if (_weapon != _baseWeapon) then {
                                                    (_x select 0)set [0, _baseWeapon];
                                                };
                                            };
                                        };
                                    };
                                } foreach _containerContents;
                            };
                        };
                    };

                    case 9: {
                        for "_subIndex" from 0 to 4 do {
                            private _item = (_loadout select _dataIndex) select _subIndex;

                            if (_item != "") then {

                                private _uniqueBaseCfgText = getText (configFile >> "CfgWeapons" >> _item >> "ace_arsenal_uniqueBase");
                                if (_uniqueBaseCfgText != "") then {

                                    (_loadout select _dataIndex) set [_subIndex, _uniqueBaseCfgText];
                                };
                            };
                        };
                    };
                };
            };

            if (_loadoutIndex == -1) then {
                GVAR(defaultLoadoutsList) pushBack [_editBoxContent, _loadout];
            } else {
                GVAR(defaultLoadoutsList) set [_loadoutIndex, [[_editBoxContent, _loadoutName] select (_loadoutName isEqualTo _editBoxContent), _loadout]];
            };

            for '_i' from 0 to (((lnbsize _contentPanelCtrl) select 0) - 1) do {
                if ((_contentPanelCtrl lnbText [_i, 1]) == _editBoxContent) exitwith {_contentPanelCtrl lnbDeleteRow _i};
            };

            private _newRow = _contentPanelCtrl lnbAddRow ["",_editBoxContent];

            ADD_LOADOUTS_LIST_PICTURES

            _contentPanelCtrl setVariable [_editBoxContent + str GVAR(currentLoadoutsTab), [_loadout] call FUNC(verifyLoadout)];

            _contentPanelCtrl lnbSort [1, false];

            // Select newly saved loadout
            for '_i' from 0 to (((lnbsize _contentPanelCtrl) select 0) - 1) do {
                if ((_contentPanelCtrl lnbText [_i, 1]) == _editBoxContent) exitwith {_contentPanelCtrl lnbSetCurSelRow _i};
            };

            set3DENMissionAttributes [[QGVAR(DummyCategory), QGVAR(DefaultLoadoutsListAttribute), GVAR(defaultLoadoutsList)]];
        } else {

            if (_loadoutIndex == -1) then {
                _data pushBack [_editBoxContent, _curSelLoadout];
            } else {
                _data set [_loadoutIndex, [[_editBoxContent, _loadoutName] select (_loadoutName isEqualTo _editBoxContent), _curSelLoadout]];
                _contentPanelCtrl setVariable [_editBoxContent + str IDC_buttonMyLoadouts, [_curSelLoadout] call FUNC(verifyLoadout)];
            };

            profileNamespace setVariable [QGVAR(saved_loadouts), _data];
        };
    };

    case IDC_buttonSharedLoadouts :{

        _loadout = (GVAR(sharedLoadoutsNamespace) getVariable ((_contentPanelCtrl lnbText [_cursSelRow, 0]) + (_contentPanelCtrl lnbText [_cursSelRow, 1]))) select 2;

        if (_loadoutIndex == -1) then {
            _data pushBack [_editBoxContent, _loadout];
        } else {
            _data set [_loadoutIndex, [[_editBoxContent, _loadoutName] select (_loadoutName isEqualTo _editBoxContent), _loadout]];
            _contentPanelCtrl setVariable [_editBoxContent + str IDC_buttonMyLoadouts, [_loadout] call FUNC(verifyLoadout)];
        };

        profileNamespace setVariable [QGVAR(saved_loadouts), _data];
    };
};
[(findDisplay IDD_ace_arsenal), [localize LSTRING(loadoutSaved), _editBoxContent] joinString " "] call FUNC(message);
private _savedLoadout = (_data select {_x select 0 == _editBoxContent}) select 0;
[QGVAR(onLoadoutSave), [_data find _savedLoadout, _savedLoadout]] call CBA_fnc_localEvent;
