#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, Dedmen, Brett Mayson
 * Sort arsenal panel.
 *
 * Arguments:
 * 0: Sort control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_sortControl"];

private _display = ctrlParent _sortControl;

private _rightSort = ctrlIDC _sortControl == 17;
private _right = _rightSort && {GVAR(currentLeftPanel) in [IDC_buttonUniform, IDC_buttonVest, IDC_buttonBackpack]};

if (_rightSort) then {
    [
        if (_right) then {
            _display displayCtrl IDC_rightTabContentListnBox
        } else {
            _display displayCtrl IDC_rightTabContent
        },
        switch (GVAR(currentRightPanel)) do {
            case IDC_buttonCurrentMag;
            case IDC_buttonCurrentMag2;
            case IDC_buttonThrow;
            case IDC_buttonPut;
            case IDC_buttonMag;
            case IDC_buttonMagALL: { configFile >> "CfgMagazines" };
            default { configFile >> "CfgWeapons" };
        },
        GVAR(sortListRightPanel) select (
            switch (GVAR(currentRightPanel)) do {
                case IDC_buttonOptic: { 0 };
                case IDC_buttonItemAcc: { 1 };
                case IDC_buttonMuzzle: { 2 };
                case IDC_buttonBipod: { 3 };
                case IDC_buttonCurrentMag;
                case IDC_buttonCurrentMag2;
                case IDC_buttonMag;
                case IDC_buttonMagALL: { 4 };
                case IDC_buttonThrow: { 5 };
                case IDC_buttonPut: { 6 };
                case IDC_buttonMisc: { 7 };
            }
        )
    ]
} else {
    [
        _display displayCtrl IDC_leftTabContent,
        switch (GVAR(currentLeftPanel)) do {
            case IDC_buttonBackpack: { configFile >> "CfgVehicles" };
            case IDC_buttonGoggles: { configFile >> "CfgGlasses" };
            case IDC_buttonFace: { configFile >> "CfgFaces" >> "Man_A3" };
            case IDC_buttonVoice: { configFile >> "CfgVoice" };
            case IDC_buttonInsignia: { configFile >> "CfgUnitInsignia" };
            default { configFile >> "CfgWeapons" };
        },
        (GVAR(sortListLeftPanel) select ([
            IDC_buttonPrimaryWeapon,
            IDC_buttonHandgun,
            IDC_buttonSecondaryWeapon,
            IDC_buttonUniform,
            IDC_buttonVest,
            IDC_buttonBackpack,
            IDC_buttonHeadgear,
            IDC_buttonGoggles,
            IDC_buttonNVG,
            IDC_buttonBinoculars,
            IDC_buttonMap,
            IDC_buttonGPS,
            IDC_buttonRadio,
            IDC_buttonCompass,
            IDC_buttonWatch,
            IDC_buttonFace,
            IDC_buttonVoice,
            IDC_buttonInsignia
        ] find GVAR(currentLeftPanel)))
    ]
} params ["_panel", "_cfgClass", "_sorts"];

private _curSel = if (_right) then {
    lnbCurSelRow _panel
} else {
    lbCurSel _panel
};
private _selected = if (_right) then {
    _panel lnbData [_curSel, 0];
} else {
    _panel lbData _curSel
};

private _sortName = _sortControl lbData (0 max lbCurSel _sortControl);
private _sortConfig = _sorts select (0 max (_sorts findIf {(_x select 0) isEqualTo _sortName}));
private _statement = _sortConfig select 2;

missionNamespace setVariable [
    [QGVAR(lastSortLeft), QGVAR(lastSortRight)] select _rightSort,
    _sortConfig select 1
];

private _originalNames = createHashMap;

private _for = if (_right) then {
    for '_i' from 0 to ((lnbSize _panel select 0) - 1)
} else {
    for '_i' from 0 to (lbSize _panel - 1)
};

_for do {
    private _item = if (_right) then {
        _panel lnbData [_i, 0]
    } else {
        _panel lbData _i
    };
    private _quantity = if (_right) then {
        parseNumber (_panel lnbText [_i, 2])
    } else {
        0
    };

    private _itemCfg = _cfgClass >> _item;

    // In rare cases, item may not belong to the config class for the panel
    // For example, misc items panel can contain CfgVehicles and CfgGlasses items in addition to the usual CfgWeapons items
    if (isNull _itemCfg) then {
        _itemCfg = _item call CBA_fnc_getItemConfig;
    };

    private _value = [_itemCfg, _item, _quantity] call _statement;
    if (_value isEqualType 0) then {
        _value = [_value, 8] call CBA_fnc_formatNumber;
    };
    if (_value isEqualTo "") then {
        _value = "_";
    };

    if (_right) then {
        private _name = _panel lnbText [_i, 1];
        _originalNames set [_item, _name];

        _panel lnbSetText [[_i, 1], format ["%1%2", _value, _name]];
    } else {
        if (_item isNotEqualTo "") then {
            private _name = _panel lbText _i;
            _originalNames set [_item, _name];

            _panel lbSetText [_i, format ["%1%2", _value, _name]];
        };
    };
};

if (_right) then {
    _panel lnbSort [1, false];

    _for do {
        private _data = _panel lnbData [_i, 0];

        if (_curSel >= 0 && {_data == _selected}) then {
            _panel lnbSetCurSelRow _i;
        };

        _panel lnbSetText [[_i, 1], _originalNames get _data];
    };
} else {
    lbSort [_panel, "ASC"];

    _for do {
        private _data = _panel lbData _i;

        if (_curSel >= 0 && {_data == _selected}) then {
            _panel lbSetCurSel _i;
        };

        if (_data isNotEqualTo "") then {
            _panel lbSetText [_i, _originalNames get _data];
        };
    };
};
