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
    systemChat "sort right";
// Left panel
} else {
    if (ctrlIDC _control == 17) then {
        [
            _display displayCtrl IDC_rightTabContent,
            switch (GVAR(currentRightPanel)) do {
                case IDC_buttonCurrentMag;
                case IDC_buttonCurrentMag2: { "CfgMagazines" };
                default { "CfgWeapons" };
            },
            GVAR(sortListRightPanel) select (
                switch (GVAR(currentLeftPanel)) do {
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
                case IDC_buttonBackpack: { "CfgVehicles" };
                case IDC_buttonGoggles: { "CfgGlasses" };
                default { "CfgWeapons" };
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
                IDC_buttonWatch
            ] find GVAR(currentLeftPanel)))
        ]
    } params ["_panel", "_cfgClass", "_sorts"];

    _curSel = lbCurSel _panel;
    _selected = _panel lbData _curSel;

    private _statement = _sorts select _mode select 2;
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
        // systemChat format ["%1 - %2 = %3", _item, _statement, _value];
        _panel lbSetText [_i, format ["%1%2", _value, _panel lbText _i]];
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
