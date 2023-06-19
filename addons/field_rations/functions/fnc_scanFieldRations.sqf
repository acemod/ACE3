#include "script_component.hpp"
/*
 * Author: Salluci
 * Caches all item classnames used as field rations, their thirst/hunger values, and whether they are treated as magazines
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call acex_field_rations_fnc_scanFieldRations
 *
 * Public: No
 */

private _list = createHashMap;
private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgMagazines = configFile >> "CfgMagazines";

private _fnc_isFieldRationItem = {
    ((getNumber (_x >> QXGVAR(thirstQuenched))) > 0) || {(getNumber (_x >> QXGVAR(hungerSatiated))) > 0}
};

{
    _list set [configName _x, ""];
} forEach (configProperties [_cfgWeapons, toString _fnc_isFieldRationItem, true]);

{
    _list set [configName _x, ""];
} forEach (configProperties [_cfgMagazines, toString _fnc_isFieldRationItem, true]);

uiNamespace setVariable [QXGVAR(fieldRationItems), _list];
