#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Handles selection changes on the right panel (listnbox).
 *
 * Arguments:
 * 0: Right panel control <CONTROL>
 * 1: Right panel selection <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_control", "_curSel"];

if (_curSel < 0 || {!(GVAR(currentLeftPanel) in [IDC_buttonUniform, IDC_buttonVest, IDC_buttonBackpack])}) exitWith {};

private _hasItems = false;

// Get relevant container
private _container = switch (GVAR(currentLeftPanel)) do {
    case IDC_buttonUniform: {
        _hasItems = (GVAR(currentItems) select IDX_CURR_UNIFORM_ITEMS) isNotEqualTo [];

        uniformContainer GVAR(center)
    };
    case IDC_buttonVest: {
        _hasItems = (GVAR(currentItems) select IDX_CURR_VEST_ITEMS) isNotEqualTo [];

        vestContainer GVAR(center)
    };
    case IDC_buttonBackpack: {
        _hasItems = (GVAR(currentItems) select IDX_CURR_BACKPACK_ITEMS) isNotEqualTo [];

        backpackContainer GVAR(center)
    };
};

// Refresh availibility of items based on space remaining in container
[_control, _container, _hasItems] call FUNC(updateRightPanel);

private _item = _control lnbData [_curSel, 0];
private _cfgEntry = ["CfgWeapons", "CfgMagazines"] select (GVAR(currentRightPanel) in [IDC_buttonMag, IDC_buttonMagALL, IDC_buttonThrow, IDC_buttonPut] || {_item in (uiNamespace getVariable [QGVAR(magazineMiscItems), []])});

_cfgEntry = configFile >> _cfgEntry >> _item;

// If e.g. in misc. items, item could be e.g. a backpack
if (isNull _cfgEntry) then {
    _cfgEntry = _item call CBA_fnc_getItemConfig;
};

// Display item info on the bottom right
[ctrlParent _control, _control, _curSel, _cfgEntry] call FUNC(itemInfo);
