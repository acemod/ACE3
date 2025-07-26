#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: ACE Team
 * Handles selection changes on the left panel tree control.
 * 
 * Arguments:
 * 0: Tree control <CONTROL>
 * 1: Tree selection path <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_control", "_selectionPath"];

// Only process item selections (groups have path length 1, items have 2)
if (count _selectionPath != 2) exitWith {};

private _item = _control tvData _selectionPath;

// Ignore group nodes  
if (_item find "GROUP_" == 0) exitWith {};

private _display = ctrlParent _control;
private _isEmpty = _item == "";

// Update current selection tracking
switch (GVAR(currentLeftPanel)) do {
    case IDC_buttonPrimaryWeapon: {GVAR(currentItems) set [IDX_CURR_PRIMARY_WEAPON, _item]};
    case IDC_buttonSecondaryWeapon: {GVAR(currentItems) set [IDX_CURR_SECONDARY_WEAPON, _item]};
    case IDC_buttonHandgun: {GVAR(currentItems) set [IDX_CURR_HANDGUN_WEAPON, _item]};
    case IDC_buttonHeadgear: {GVAR(currentItems) set [IDX_CURR_HEADGEAR, _item]};
    case IDC_buttonUniform: {GVAR(currentItems) set [IDX_CURR_UNIFORM, _item]};
    case IDC_buttonVest: {GVAR(currentItems) set [IDX_CURR_VEST, _item]};
    case IDC_buttonBackpack: {GVAR(currentItems) set [IDX_CURR_BACKPACK, _item]};
    case IDC_buttonGoggles: {GVAR(currentItems) set [IDX_CURR_GOGGLES, _item]};
    case IDC_buttonNVG: {GVAR(currentItems) set [IDX_CURR_NVG, _item]};
    case IDC_buttonBinoculars: {GVAR(currentItems) set [IDX_CURR_BINO, _item]};
    case IDC_buttonMap: {GVAR(currentItems) set [IDX_CURR_MAP, _item]};
    case IDC_buttonCompass: {GVAR(currentItems) set [IDX_CURR_COMPASS, _item]};
    case IDC_buttonRadio: {GVAR(currentItems) set [IDX_CURR_RADIO, _item]};
    case IDC_buttonWatch: {GVAR(currentItems) set [IDX_CURR_WATCH, _item]};
    case IDC_buttonFace: {GVAR(currentFace) = _item};
    case IDC_buttonVoice: {GVAR(currentVoice) = _item};
    case IDC_buttonInsignia: {GVAR(currentInsignia) = _item};
};

// Handle weapon selections - update right panel
if (GVAR(currentLeftPanel) in [IDC_buttonPrimaryWeapon, IDC_buttonHandgun, IDC_buttonSecondaryWeapon, IDC_buttonBinoculars]) then {
    private _currentRightPanel = _display displayCtrl GVAR(currentRightPanel);
    private _selectCorrectPanel = [_display displayCtrl IDC_buttonOptic, _currentRightPanel] select (!isNil QGVAR(currentRightPanel) && {GVAR(currentRightPanel) in [RIGHT_PANEL_ACC_IDCS, IDC_buttonCurrentMag, IDC_buttonCurrentMag2]});
    [_display, _selectCorrectPanel] call FUNC(fillRightPanel);
};

// Update item visualization
call FUNC(showItem);

// Update item info display
private _configClass = if (!_isEmpty) then {
    private _configCategory = switch (true) do {
        case (GVAR(currentLeftPanel) in [IDC_buttonMag, IDC_buttonThrow, IDC_buttonPut, IDC_buttonMisc]): {"CfgMagazines"};
        case (GVAR(currentLeftPanel) == IDC_buttonBackpack): {"CfgVehicles"};
        case (GVAR(currentLeftPanel) == IDC_buttonGoggles): {"CfgGlasses"};
        case (GVAR(currentLeftPanel) == IDC_buttonFace): {"CfgFaces"};
        case (GVAR(currentLeftPanel) == IDC_buttonVoice): {"CfgVoice"};
        case (GVAR(currentLeftPanel) == IDC_buttonInsignia): {"CfgUnitInsignia"};
        default {"CfgWeapons"};
    };
    configFile >> _configCategory >> _item
} else {
    configNull
};

[_display, _control, GVAR(currentRightPanel), _configClass] call FUNC(itemInfo);