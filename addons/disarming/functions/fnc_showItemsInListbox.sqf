/*
 * Author: PabstMirror
 * Shows a list of inventory items in a listBox control.
 *
 * Arguments:
 * 0: RscListBox <CONTROL>
 * 1: ItemArray [["itemClassnames"],[counts]] <ARRAY>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [theListBox, [["ace_bandage"],[2]]] call ace_disarming_fnc_showItemsInListbox
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;
PARAMS_2(_listBoxCtrl,_itemsCountArray);

private ["_classname", "_count", "_displayName", "_picture"];

{
    _displayName = "";
    _picture = "";

    _classname = _x;
    _count = (_itemsCountArray select 1) select _forEachIndex;

    if ((_classname != DUMMY_ITEM) && {_classname != "ACE_FakePrimaryWeapon"}) then { //Don't show the dummy potato or fake weapon

        switch (true) do {
        case (isClass (configFile >> "CfgWeapons" >> _classname)): {
                _displayName = getText (configFile >> "CfgWeapons" >> _classname >> "displayName");
                _picture = getText (configFile >> "CfgWeapons" >> _classname >> "picture");
            };
        case (isClass (configFile >> "CfgMagazines" >> _classname)): {
                _displayName = getText (configFile >> "CfgMagazines" >> _classname >> "displayName");
                _picture = getText (configFile >> "CfgMagazines" >> _classname >> "picture");
            };
        case (isClass (configFile >> "CfgVehicles" >> _classname)): {
                _displayName = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
                _picture = getText (configFile >> "CfgVehicles" >> _classname >> "picture");
            };
        case (isClass (configFile >> "CfgGlasses" >> _classname)): {
                _displayName = getText (configFile >> "CfgGlasses" >> _classname >> "displayName");
                _picture = getText (configFile >> "CfgGlasses" >> _classname >> "picture");
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
