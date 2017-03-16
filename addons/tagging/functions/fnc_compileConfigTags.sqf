/*
 * Author: Jonpas
 * Compiles and caches tags from ACE_Tags config.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_tagging_fnc_compileConfigTags
 *
 * Public: No
 */
#include "script_component.hpp"

{
    private _failure = false;
    private _class = configName _x;

    private _displayName = getText (_x >> "displayName");
    if (_displayName == "") then {
        ERROR_1("Failed compiling ACE_Tags for tag: %1 - missing displayName",_class);
        _failure = true;
    };

    private _requiredItem = toLower (getText (_x >> "requiredItem"));
    if (_requiredItem == "") then {
        ERROR_1("Failed compiling ACE_Tags for tag: %1 - missing requiredItem",_class);
        _failure = true;
    } else {
        if (!isClass (configFile >> "CfgWeapons" >> _requiredItem)) then {
            ERROR_2("Failed compiling ACE_Tags for tag: %1 - requiredItem %2 does not exist",_class,_requiredItem);
            _failure = true;
        };
    };

    private _textures = getArray (_x >> "textures");
    if (_textures isEqualTo []) then {
        ERROR_1("Failed compiling ACE_Tags for tag: %1 - missing textures",_class);
        _failure = true;
    };

    private _icon = getText (_x >> "icon");

    if (!_failure) then {
        GVAR(cachedTags) pushBack [_class, _displayName, _requiredItem, _textures, _icon];
        GVAR(cachedRequiredItems) pushBackUnique _requiredItem;
    };
} forEach ("true" configClasses (configFile >> "ACE_Tags"));
