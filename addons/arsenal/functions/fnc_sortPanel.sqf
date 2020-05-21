#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, Dedmen, SynixeBrett
 * Sort arsenal panel.
 *
 * Arguments:
 * 0: Panel's control to sort <CONTROL>
 * 1: Sorting mode <SCALAR>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_control", "_mode"];

private _display = ctrlParent _control;
private ["_panel", "_curSel", "_selected"];

private _to_string = {
    switch true do {
        case (_this < 10): {
            format ["00000%1", _this]
        };
        case (_this < 100): {
            format ["0000%1", _this]
        };
        case (_this < 1000): {
            format ["000%1", _this]
        };
        case (_this < 10000): {
            format ["00%1", _this]
        };
        case (_this < 100000): {
            format ["0%1", _this]
        };
        default { _this };
    }
};

// Right panel
if (ctrlIDC _control == 17 && {GVAR(currentLeftPanel) in [IDC_buttonUniform ,IDC_buttonVest, IDC_buttonBackpack]}) then {
    _panel = _display displayCtrl IDC_rightTabContentListnBox;
    _curSel = lnbCurSelRow _panel;
    _selected = _panel lnbData [_curSel, 0];

    switch (_mode) do {
        // Alphabetically
        case 0: {
            _panel lnbSort [1, false];
        };

        // Weight
        case 1: {
            _panel lnbSortByValue [0, false];
        };

        // Amount
        case 2: {
            for "_i" from 0 to (((lnbsize _panel) select 0) - 1) do {
                _panel lnbSetText [[_i, 2], str (parseNumber (_panel lnbText [_i, 2]) / 1000)];
            };

            _panel lnbSort [2, true];


            for "_i" from 0 to (((lnbsize _panel) select 0) - 1) do {
                _panel lnbSetText [[_i, 2], str (parseNumber (_panel lnbText [_i, 2]) * 1000)];
            };
        };
    };

    if (_cursel >= 0) then {
        for '_i' from 0 to (((lnbsize _panel) select 0) - 1) do {
            if ((_panel lnbdata [_i, 0]) == _selected) exitwith {_panel lnbSetCurSelRow _i};
        };
    };
// Left panel
} else {
    _panel = _display displayCtrl ([IDC_leftTabContent, IDC_rightTabContent] select (ctrlIDC _control == 17));
    _curSel = lbCurSel _panel;
    _selected = _panel lbData _curSel;

    private _cfgClass = switch (GVAR(currentLeftPanel)) do {
        case IDC_buttonBackpack: {"CfgVehicles"};
        case IDC_buttonGoggles: {"CfgGlasses"};
        default {"CfgWeapons"};
    };
    private _statement = (GVAR(sortListLeftPanel) select ([
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
            IDC_buttonWatch
        ] find GVAR(currentLeftPanel))) select _mode select 2;

    for '_i' from 1 to (lbsize _panel - 1) do {
        private _item = _panel lbData _i;
        private _itemCfg = (configFile >> _cfgClass >> _item);
        private _value = _itemCfg call _statement;
        if (typeName _value isEqualTo "SCALAR") then {
            _value = _value call _to_string;
        };
        if (_value isEqualTo "") then {
            _value = "_";
        };
        _panel lbSetText [_i, _value];
    };

    lbSort [_panel, "ASC"];

    for '_i' from 1 to (lbSize _panel - 1) do {
        private _data = _panel lbData _i;
        if (_cursel >= 0) then {
            if (_data == _selected) then {_panel lbSetCurSel _i};
        };
        _panel lbSetText [_i, getText (configFile >> _cfgClass >> _data >> "displayName")];
    };
};
