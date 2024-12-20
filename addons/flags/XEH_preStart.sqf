#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _flagItems = configProperties [configFile >> "CfgWeapons", QUOTE(isClass _x && {isText (_x >> QQGVAR(texture))}), true];
private _flagItemCache = createHashMap;

{
    private _name = configName _x;
    private _displayName = getText (_x >> "displayName");
    private _texture = getText (_x >> QGVAR(texture));
    private _actionIconPlace = getText (_x >> QGVAR(actionIconPlace));
    private _actionIconCarry = getText (_x >> QGVAR(actionIconCarry));

    _flagItemCache set [_name, [_displayName, _texture, _actionIconPlace, _actionIconCarry]];
} forEach _flagItems;

uiNamespace setVariable [QGVAR(flagItemCache), _flagItemCache];
