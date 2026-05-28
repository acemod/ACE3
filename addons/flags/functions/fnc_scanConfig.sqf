#include "..\script_component.hpp"
/*
 * Author: Timi007
 * Caches config values of flags.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_flags_fnc_scanConfig
 *
 * Public: No
 */

private _flagItems = QUOTE(isText (_x >> QQGVAR(texture))) configClasses (configFile >> "CfgWeapons");
private _flagItemCache = createHashMap;
private _carrierItemMapping = createHashMap;

{
    private _name = configName _x;
    private _displayName = getText (_x >> "displayName");
    private _texture = getText (_x >> QGVAR(texture));
    private _carrier = getText (_x >> QGVAR(carrier));
    private _actionIconPlace = getText (_x >> QGVAR(actionIconPlace));
    private _actionIconCarry = getText (_x >> QGVAR(actionIconCarry));
    private _mass = getNumber (_x >> "ItemInfo" >> "mass");

    _flagItemCache set [_name, [_displayName, _texture, _carrier, _actionIconPlace, _actionIconCarry, _mass]];
    _carrierItemMapping set [_carrier, _name];
} forEach _flagItems;

uiNamespace setVariable [QGVAR(flagItemCache), compileFinal _flagItemCache];
uiNamespace setVariable [QGVAR(carrierItemMapping), compileFinal _carrierItemMapping];
