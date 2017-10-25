#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

private _contentListCtrl = _display displayCtrl IDC_contentPanel;
private _textEditBoxCtrl= _display displayCtrl IDC_textEditBox;
_textEditBoxCtrl ctrlSetText "";

_contentListCtrl lnbSetCurSelRow -1;
lnbClear _contentListCtrl;

private _data = +(profileNamespace getvariable [QGVAR(saved_loadouts),[]]);

private _weaponCfg = configFile >> "CfgWeapons";
private _magCfg = configFile >> "CfgMagazines";
private _vehcCfg = configFile >> "CfgVehicles";
private _glassesCfg = configFile >> "CfgGlasses";
private _weaponsArray = GVAR(virtualItems) select 0;
private _accsArray = GVAR(virtualItems) select 1;

GVAR(loadoutsList) = [];

private _weaponCheck = {
    params ["_dataPath"];

    for "_sub_subIndex" from 0 to 6 do {
        switch (_sub_subIndex) do {
            case 0;
            case 1;
            case 2;
            case 3;
            case 6: {
                if ((count _dataPath) != 0) then {

                    private _item = _dataPath select _sub_subIndex;

                    if (_item != "") then {
                        if (isClass (_weaponCfg >> _item)) then {

                            if !(CHECK_WEAPON_OR_ACC) then {

                                _dataPath set [_sub_subIndex, ""];
                                _unavailableItemsAmount = _unavailableItemsAmount + 1;
                            };
                        } else {

                            _dataPath set [_sub_subIndex, ""];
                            _nullItemsAmount = _nullItemsAmount + 1;
                        };
                    };
                };
            };

            case 4;
            case 5: {
                if (((count _dataPath) != 0)) then {

                    private _mag = (_dataPath select _sub_subIndex) select 0;

                    if (isClass (_magCfg >> _mag)) then {

                        if !(_mag in (GVAR(virtualItems) select 2)) then {
                            _dataPath set [_sub_subIndex, []];
                            _unavailableItemsAmount = _unavailableItemsAmount + 1;
                        };
                    } else {
                        _dataPath set [_sub_subIndex, []];
                        _nullItemsAmount = _nullItemsAmount + 1;
                    };
                };
            };
        };
    };
};

private _fnc_handleLoadoutArray = {

    for "_dataIndex" from 0 to 9 do {
        switch (_dataIndex) do {
            case 0;
            case 1;
            case 2;
            case 8: {
                [_loadoutData select _dataIndex] call _weaponCheck;
            };

            case 3;
            case 4;
            case 5: {

            };

            case 6: {
                private _item = _loadoutData select _dataIndex;

                if (_item != "") then {

                    if (isClass (_weaponCfg >> _item)) then {

                        if !(_item in (GVAR(virtualItems) select 3)) then {

                            _loadoutData set [_dataIndex, ""];
                            _unavailableItemsAmount = _unavailableItemsAmount + 1;
                        };
                    } else {

                        _loadoutData set [_dataIndex, ""];
                        _nullItemsAmount = _nullItemsAmount + 1;
                    };
                };
            };

            case 7: {
                private _item = _loadoutData select _dataIndex;

                if (_item != "") then {

                    if (isClass (_glassesCfg >> _item)) then {

                        if !(_item in (GVAR(virtualItems) select 7)) then {

                            _loadoutData set [_dataIndex, ""];
                            _unavailableItemsAmount = _unavailableItemsAmount + 1;
                        };
                    } else {

                        _loadoutData set [_dataIndex, ""];
                        _nullItemsAmount = _nullItemsAmount + 1;
                    };
                };
            };

            case 9: {
                for "_subIndex" from 0 to 4 do {
                    private _item = (_loadoutData select _dataIndex) select _subIndex;

                    if (_item != "") then {

                        if (isClass (_weaponCfg >> _item)) then {

                            if !(CHECK_ASSIGNED_ITEMS) then {

                                (_loadoutData select _dataIndex) set [_subIndex, ""];
                                _unavailableItemsAmount = _unavailableItemsAmount + 1;
                            };
                        } else {

                            (_loadoutData select _dataIndex) set [_subIndex, ""];
                            _nullItemsAmount = _nullItemsAmount + 1;
                        };
                    };
                };
            };
        };
    };
};

switch (ctrlIDC _control) do {
    case IDC_buttonMyLoadouts: {
        {
            _x params ["_loadoutName", "_loadoutData"];

            private _nullItemsAmount = 0;
            private _unavailableItemsAmount = 0;

            call _fnc_handleLoadoutArray;
            GVAR(loadoutsList) pushBack _loadoutData;

            TRACE_3("count", _loadoutName, _nullItemsAmount, _unavailableItemsAmount);

            private _newRow = _contentListCtrl lnbAddRow ["",_loadoutName];

            _contentListCtrl lnbSetPicture [[_newRow, 2], getText (configFile >> "cfgWeapons" >> ((_loadoutData select 0) select 0) >> "picture")];
            _contentListCtrl lnbSetPicture [[_newRow, 3], getText (configFile >> "cfgWeapons" >> ((_loadoutData select 1) select 0) >> "picture")];
            _contentListCtrl lnbSetPicture [[_newRow, 4], getText (configFile >> "cfgWeapons" >> ((_loadoutData select 2) select 0) >> "picture")];
            _contentListCtrl lnbSetPicture [[_newRow, 5], getText (configFile >> "cfgWeapons" >> ((_loadoutData select 3) select 0) >> "picture")];
            _contentListCtrl lnbSetPicture [[_newRow, 6], getText (configFile >> "cfgWeapons" >> ((_loadoutData select 4) select 0) >> "picture")];
            _contentListCtrl lnbSetPicture [[_newRow, 7], getText (configFile >> "cfgVehicles" >> ((_loadoutData select 5) select 0) >> "picture")];
            _contentListCtrl lnbSetPicture [[_newRow, 8], getText (configFile >> "cfgWeapons" >> (_loadoutData select 6) >> "picture")];
            _contentListCtrl lnbSetPicture [[_newRow, 9], getText (configFile >> "cfgGlasses" >> (_loadoutData select 7) >> "picture")];

            if (_nullItemsAmount > 0) then {

                _contentListCtrl lnbSetColor [[_newRow, 1], [1, 0, 0, 0.5]];
            } else {

                if (_unavailableItemsAmount > 0) then {
                    _contentListCtrl lnbSetColor [[_newRow, 1], [1, 1, 1, 0.25]];
                };
            };

            _contentListCtrl lnbSetValue [[_newRow, 1], _forEachIndex];
        } foreach _data;
    };

    case IDC_buttonDefaultLoadouts: {

    };

    case IDC_buttonSharedLoadouts: {

    };
};

_contentListCtrl lnbSort [1, false];