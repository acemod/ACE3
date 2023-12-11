#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, Dedmen, Brett Mayson, johnb43
 * Sort an arsenal panel.
 *
 * Arguments:
 * 0: Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_control"];

// When filling the sorting panel, FUNC(sortPanel) is called twice, so ignore first call
if (GVAR(ignoreFirstSortPanelCall)) exitWith {
    GVAR(ignoreFirstSortPanelCall) = false;
};

private _display = ctrlParent _control;
private _rightSort = (ctrlIDC _control) in [IDC_sortRightTab, IDC_sortRightTabDirection];
private _right = _rightSort && {GVAR(currentLeftPanel) in [IDC_buttonUniform, IDC_buttonVest, IDC_buttonBackpack]};
private _sortCtrl = _display displayCtrl ([IDC_sortLeftTab, IDC_sortRightTab] select _rightSort);
private _sortDirectionCtrl = _display displayCtrl ([IDC_sortLeftTabDirection, IDC_sortRightTabDirection] select _rightSort);

private _cfgMagazines = configFile >> "CfgMagazines";
private _cfgFaces = configFile >> "CfgFaces";
private _cfgUnitInsignia = configFile >> "CfgUnitInsignia";
private _cfgUnitInsigniaMission = missionConfigFile >> "CfgUnitInsignia";

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
            case IDC_buttonMagALL: {_cfgMagazines};
            default {configFile >> "CfgWeapons"};
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
            case IDC_buttonBackpack: {configFile >> "CfgVehicles"};
            case IDC_buttonGoggles: {configFile >> "CfgGlasses"};
            case IDC_buttonFace: {_cfgFaces};
            case IDC_buttonVoice: {configFile >> "CfgVoice"};
            case IDC_buttonInsignia: {_cfgUnitInsignia};
            default {configFile >> "CfgWeapons"};
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

// Get sort & sort direction
private _sortName = _sortCtrl lbData (0 max lbCurSel _sortCtrl);
private _sortDirection = _sortDirectionCtrl lbValue (0 max lbCurSel _sortDirectionCtrl);
(_sorts select (0 max (_sorts findIf {(_x select 0) == _sortName}))) params ["", "_displayName", "_statement"];

// Update last sort & sort direction
missionNamespace setVariable [
    [QGVAR(lastSortLeft), QGVAR(lastSortRight)] select _rightSort,
    _displayName
];

missionNamespace setVariable [
    [QGVAR(lastSortDirectionLeft), QGVAR(lastSortDirectionRight)] select _rightSort,
    _sortDirection
];

// Get currently selected item
private _curSel = if (_right) then {
    lnbCurSelRow _panel
} else {
    lbCurSel _panel
};

private _selected = if (_right) then {
    _panel lnbData [_curSel, 0]
} else {
    _panel lbData _curSel
};

private _originalNames = createHashMap;
private _item = "";
private _quantity = "";
private _itemCfg = configNull;
private _value = "";
private _name = "";
private _fillerChar = toString [1];

private _magazineMiscItems = uiNamespace getVariable QGVAR(magazineMiscItems);
private _sortCache = uiNamespace getVariable QGVAR(sortCache);

private _faceCache = if (_cfgClass == _cfgFaces) then {
    uiNamespace getVariable [QGVAR(faceCache), createHashMap]
} else {
    createHashMap
};

private _countColumns = if (_right) then {
    count lnbGetColumnsPosition _panel
} else {
    0
};

private _for = if (_right) then {
    for '_i' from 0 to (lnbSize _panel select 0) - 1
} else {
    for '_i' from 0 to (lbSize _panel) - 1
};

_for do {
    // Get item
    _item = if (_right) then {
        _panel lnbData [_i, 0]
    } else {
        _panel lbData _i
    };

    // Get item's count
    _quantity = if (_right) then {
        parseNumber (_panel lnbText [_i, 2])
    } else {
        0
    };

    // "Misc. items" magazines (e.g. spare barrels, intel, photos)
    if (_item in _magazineMiscItems) then {
        _cfgClass = _cfgMagazines;
    };

    // Check item's config
    _itemCfg = if !(_cfgClass in [_cfgFaces, _cfgUnitInsignia]) then {
        _cfgClass >> _item
    } else {
        // If insignia, check both config and mission file
        if (_cfgClass == _cfgUnitInsignia) then {
            _itemCfg = _cfgClass >> _item;

            if (isNull _itemCfg) then {
                _itemCfg = _cfgUnitInsigniaMission >> _item;
            };

            _itemCfg
        } else {
            // If face, check correct category
            _cfgClass >> (_faceCache get _item) param [2, "Man_A3"] >> _item
        };
    };

    // Some items may not belong to the config class for the panel (e.g. misc. items panel can have unique items)
    if (isNull _itemCfg) then {
        _itemCfg = _item call CBA_fnc_getItemConfig;
    };

    // Value can be any type
    _value = _sortCache getOrDefaultCall [format ["%1_%2_%3", _sortName, _item, _quantity], {
        private _value = [_itemCfg, _item, _quantity] call _statement;

        // If number, convert to string (keep 2 decimal after comma; Needed for correct weight sorting)
        if (_value isEqualType 0) then {
            _value = [_value, 8, 2] call CBA_fnc_formatNumber;
        };

        // If empty string, add alphabetically small char at beginning to make it sort correctly
        if (_value isEqualTo "") then {
            _value = "_";
        };

        _value
    }, true];

    // Save the current row's item's name in a cache and set text to it's sorting value
    if (_right) then {
        _name = _panel lnbText [_i, 1];
        _originalNames set [_item, _name];

        // Use value, display name and classname to sort, which means a fixed alphabetical order is guaranteed
        // Filler char has lowest lexicographical order possible
        _panel lnbSetText [[_i, 1], format ["%1%2%4%3", _value, _name, _item, _fillerChar]];
    } else {
        if (_item != "") then {
            _name = _panel lbText _i;
            _originalNames set [_item, _name];

            // Use value, display name and classname to sort, which means a fixed alphabetical order is guaranteed
            // Filler char has lowest lexicographical order possible
            _panel lbSetText [_i, format ["%1%2%4%3", _value, _name, _item, _fillerChar]];
        };
    };
};

// Sort alphabetically, find the previously selected item, select it again and reset text to original text
if (_right) then {
    _panel lnbSort [1, _sortDirection == ASCENDING];

    _for do {
        _item = _panel lnbData [_i, 0];

        _panel lnbSetText [[_i, 1], _originalNames get _item];

        // Set selection after text, otherwise item info box on the right side shows invalid name
        if (_curSel != -1 && {_item == _selected}) then {
            _panel lnbSetCurSelRow _i;

            // To avoid unnecessary checks after previsouly selected item was found
            _curSel = -1;
        };
    };
} else {
    lbSort [_panel, ["DESC", "ASC"] select _sortDirection];

    _for do {
        _item = _panel lbData _i;

        // Check if valid item (problems can be caused when searching)
        if (_item != "") then {
            _panel lbSetText [_i, _originalNames get _item];
        };

        // Set selection after text, otherwise item info box on the right side shows invalid name
        if (_curSel != -1 && {_item == _selected}) then {
            _panel lbSetCurSel _i;

            // To avoid unnecessary checks after previsouly selected item was found
            _curSel = -1;
        };
    };
};
