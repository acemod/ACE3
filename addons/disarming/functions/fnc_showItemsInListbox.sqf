#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Shows a list of inventory items in a listBox control.
 *
 * Arguments:
 * 0: RscListBox <CONTROL>
 * 1: Items array [["itemClassnames"], [counts]] <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [theListBox, [["ace_bandage"], [2]]] call ace_disarming_fnc_showItemsInListbox
 *
 * Public: No
 */

disableSerialization;

params ["_listBoxCtrl", "_itemsCountArray"];

private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgMagazines = configFile >> "CfgMagazines";
private _cfgVehicles = configFile >> "CfgVehicles";
private _cfgGlasses = configFile >> "CfgGlasses";

{
    private _classname = _x;
    private _count = (_itemsCountArray select 1) select _forEachIndex;

    if ((_classname != DUMMY_ITEM) && {_classname != "ACE_FakePrimaryWeapon"}) then { // Don't show the dummy potato or fake weapon
        private _configPath = configNull;
        private _displayName = "";
        private _picture = "";

        switch (true) do {
            case (isClass (_cfgWeapons >> _classname)): {
                _configPath = _cfgWeapons;
                _displayName = getText (_configPath >> _classname >> "displayName");
                _picture = getText (_configPath >> _classname >> "picture");
            };
            case (isClass (_cfgMagazines >> _classname)): {
                _configPath = _cfgMagazines;
                _displayName = getText (_configPath >> _classname >> "displayName");
                _picture = getText (_configPath >> _classname >> "picture");
            };
            case (isClass (_cfgVehicles >> _classname)): {
                _configPath = _cfgVehicles;
                _displayName = getText (_configPath >> _classname >> "displayName");
                _picture = getText (_configPath >> _classname >> "picture");
            };
            case (isClass (_cfgGlasses >> _classname)): {
                _configPath = _cfgGlasses;
                _displayName = getText (_configPath >> _classname >> "displayName");
                _picture = getText (_configPath >> _classname >> "picture");
            };
            default {
                ERROR_1("[%1] - bad classname",_classname);
            };
        };

        private _index = _listBoxCtrl lbAdd _displayName;
        _listBoxCtrl lbSetData [_index, _classname];
        _listBoxCtrl lbSetPicture [_index, _picture];
        _listBoxCtrl lbSetTextRight [_index, str _count];
    };
} forEach (_itemsCountArray select 0);
