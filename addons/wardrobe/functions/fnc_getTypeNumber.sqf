#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Returns typenumber of item based on config. Simplified for Wardrobe.
 *
 * Arguments:
 * 0: Item Config <CONFIG>
 *
 * Return Value:
 * TypeNumber <NUMBER>
 *
 * Example:
 * [configFile >> "CfgWeapons" >> "U_B_CTRG_1", configFile >> "CfgWeapons" >> "U_B_CTRG_3"] call ace_wardrobe_fnc_getTypeNumber;
 *
 * Public: No
 */

params ["_itemConfig"];

private _typeNumber = getNumber (_itemConfig >> "ItemInfo" >> "type");


// Handle Edgecases
if (_typeNumber isEqualTo 0) then {
    private _className = configName _itemConfig;

    _typeNumber = switch (true) do {
        case (isClass (configFile >> "CfgGlasses" >> _className)): { TYPE_GOGGLE }; // CfgGlasses items do not have ItemInfo subclass
        case (getNumber (configFile >> "CfgVehicles" >> _className >> "isBackpack") isEqualTo 1): { TYPE_BACKPACK }; // Backpacks
        default { 0 };
    };
};

//return
_typeNumber
