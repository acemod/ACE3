/*
 * Author: PabstMirror
 * Checks the conditions for being able to disarm
 *
 * Arguments:
 * 0: RscListBox <CONTROL>
 * 1: ItemArray [["items"],[counts]] <ARRAY>
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

{
    _displayName = "";
    _picture = "";
    _count = (_itemsCountArray select 1) select _forEachIndex;

    switch (true) do {
    case (isClass (configFile >> "CfgWeapons" >> _x)): {
            _displayName = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
            _picture = getText (configFile >> "CfgWeapons" >> _x >> "picture");
        };
    case (isClass (configFile >> "CfgMagazines" >> _x)): {
            _displayName = getText (configFile >> "CfgMagazines" >> _x >> "displayName");
            _picture = getText (configFile >> "CfgMagazines" >> _x >> "picture");
        };
    case (isClass (configFile >> "CfgVehicles" >> _x)): {
            _displayName = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
            _picture = getText (configFile >> "CfgVehicles" >> _x >> "picture");
        };
    case (isClass (configFile >> "CfgGlasses" >> _x)): {
            _displayName = getText (configFile >> "CfgGoggles" >> _x >> "displayName");
            _picture = getText (configFile >> "CfgGoggles" >> _x >> "picture");
        };
    };

    _listBoxCtrl lbAdd format ["%1", _displayName];
    _listBoxCtrl lbSetData [_forEachIndex, _x];
    _listBoxCtrl lbSetPicture [_forEachIndex, _picture];
    _listBoxCtrl lbSetTextRight [_forEachIndex, str _count];
} forEach (_itemsCountArray select 0);
