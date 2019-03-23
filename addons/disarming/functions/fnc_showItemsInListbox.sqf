#include "script_component.hpp"
/*
 * Author: PabstMirror
 *
 * Shows a list of inventory items in a listBox control.
 *
 * Arguments:
 * 0: RscListBox <CONTROL>
 * 1: ItemArray [["itemClassnames"],[counts]] <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [theListBox, [["ace_bandage"],[2]]] call ace_disarming_fnc_showItemsInListbox
 *
 * Public: No
 */

disableSerialization;

params ["_listBoxCtrl", "_itemsCountArray"];

{
    private _classname = _x;
    private _count = (_itemsCountArray select 1) select _forEachIndex;

    if ((_classname != DUMMY_ITEM) && {_classname != "ACE_FakePrimaryWeapon"}) then { //Don't show the dummy potato or fake weapon
        private _configPath = configNull;
        private _displayName = "";
        private _picture = "";
        switch (true) do {
            case (isClass (configFile >> "CfgWeapons" >> _classname)): {
                _configPath = (configFile >> "CfgWeapons");
                _displayName = getText (_configPath >> _classname >> "displayName");
                _picture = getText (_configPath >> _classname >> "picture");
            };
            case (isClass (configFile >> "CfgMagazines" >> _classname)): {
                _configPath = (configFile >> "CfgMagazines");
                _displayName = getText (_configPath >> _classname >> "displayName");
                _picture = getText (_configPath >> _classname >> "picture");
            };
            case (isClass (configFile >> "CfgVehicles" >> _classname)): {
                _configPath = (configFile >> "CfgVehicles");
                _displayName = getText (_configPath >> _classname >> "displayName");
                _picture = getText (_configPath >> _classname >> "picture");
            };
            case (isClass (configFile >> "CfgGlasses" >> _classname)): {
                _configPath = (configFile >> "CfgGlasses");
                _displayName = getText (_configPath >> _classname >> "displayName");
                _picture = getText (_configPath >> _classname >> "picture");
            };
            default {
                ERROR(format ["[%1] - bad classname", _classname]);
            };
        };

        _listBoxCtrl lbAdd format ["%1", _displayName];
        _listBoxCtrl lbSetData [((lbSize _listBoxCtrl) - 1), _classname];
        _listBoxCtrl lbSetPicture [((lbSize _listBoxCtrl) - 1), _picture];
        _listBoxCtrl lbSetTextRight [((lbSize _listBoxCtrl) - 1), str _count];
    };
} forEach (_itemsCountArray select 0);
