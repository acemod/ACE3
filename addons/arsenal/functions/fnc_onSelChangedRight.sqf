/*
 * Author: Alganthe
 * Handles selection changes on the right panel.
 *
 * Arguments:
 * 0: Right panel control <CONTROL>
 * 1: Right panel selection <SCALAR>
 *
 * Return Value:
 * None
 *
 * Public: No
*/
#include "script_component.hpp"
#include "..\defines.hpp"

params ["_control", "_curSel"];

if (_curSel < 0) exitwith {};

private _ctrlIDC = ctrlIDC _control;
private _display = ctrlParent _control;
private _item = _control lbData _curSel;


private _fnc_selectItem = {
    params ["_item", "_currentItemsIndex", "_itemIndex"];

    switch (_currentItemsIndex) do {
        case 18: {
            if (_item == "") then {
                GVAR(center) removePrimaryWeaponItem ((GVAR(currentItems) select 18) select _itemIndex);
                private _primaryMags = primaryWeaponMagazine GVAR(center);
                GVAR(currentItems) set [18, (primaryWeaponItems GVAR(center)) + ([_primaryMags + [""], _primaryMags] select (count _primaryMags > 1))];
            } else {
                GVAR(center) addPrimaryWeaponItem _item;
                private _primaryMags = primaryWeaponMagazine GVAR(center);
                GVAR(currentItems) set [18, (primaryWeaponItems GVAR(center)) + ([_primaryMags + [""], _primaryMags] select (count _primaryMags > 1))];
            };
            [_display, _control, _curSel, (configFile >> (["CfgWeapons", "CfgMagazines"] select (_itemIndex in [4, 5]))>> _item)] call FUNC(itemInfo);
        };

        case 19: {
            if (_item == "") then {
                GVAR(center) removeSecondaryWeaponItem ((GVAR(currentItems) select 19) select _itemIndex);
                private _secondaryMags = secondaryWeaponMagazine GVAR(center);
                GVAR(currentItems) set [19, (secondaryWeaponItems GVAR(center)) + ([_secondaryMags + [""], _secondaryMags] select (count _secondaryMags > 1))];
            } else {
                GVAR(center) addSecondaryWeaponItem _item;
                private _secondaryMags = secondaryWeaponMagazine GVAR(center);
                GVAR(currentItems) set [19, (secondaryWeaponItems GVAR(center)) + ([_secondaryMags + [""], _secondaryMags] select (count _secondaryMags > 1))];
            };
            [_display, _control, _curSel, (configFile >> (["CfgWeapons", "CfgMagazines"] select (_itemIndex in [4, 5]))>> _item)] call FUNC(itemInfo);
        };

        case 20: {
            if (_item == "") then {
                GVAR(center) removeHandgunItem ((GVAR(currentItems) select 20) select _itemIndex);
                private _handgunMags = handgunMagazine GVAR(center);
                GVAR(currentItems) set [20, (handgunItems GVAR(center)) + ([_handgunMags + [""], _handgunMags] select (count _handgunMags > 1))];
            } else {
                GVAR(center) addHandgunItem _item;
                private _handgunMags = handgunMagazine GVAR(center);
                GVAR(currentItems) set [20, (handgunItems GVAR(center)) + ([_handgunMags + [""], _handgunMags] select (count _handgunMags > 1))];
            };
            [_display, _control, _curSel, (configFile >> (["CfgWeapons", "CfgMagazines"] select (_itemIndex in [4, 5]))>> _item)] call FUNC(itemInfo);
        };
    };
};

[
    _item,
    18 + ([IDC_buttonPrimaryWeapon, IDC_buttonSecondaryWeapon, IDC_buttonHandgun] find GVAR(currentLeftPanel)), 
    [IDC_buttonMuzzle, IDC_buttonItemAcc, IDC_buttonOptic, IDC_buttonBipod, IDC_buttonCurrentMag, IDC_buttonCurrentMag2] find GVAR(currentRightPanel)
] call _fnc_selectItem;

(_display displayCtrl IDC_totalWeightText) ctrlSetText (format ["%1 (%2)", [GVAR(center), 2] call EFUNC(common,getWeight), [GVAR(center), 1] call EFUNC(common,getWeight)]);
