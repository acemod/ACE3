#include "..\script_component.hpp"
/*
 * Author: Timi007
 * Return cached information about given throwable.
 *
 * Arguments:
 * 0: Throwable classname <STRING>
 *
 * Return Value:
 * Throwable information in format [explosive <NUMBER>, displayName <STRING>, picture <STRING>] <ARRAY>
 *
 * Example:
 * array = ["HandGrenade"] call ace_interaction_fnc_getThrowableInfo
 *
 * Public: No
 */

params [["_throwable", "", [""]]];

if (_throwable isEqualTo "") exitWith {[]};

if !(_throwable in GVAR(throwablesCache)) then {
    private _config = configFile >> "CfgMagazines" >> _throwable;
    private _ammo = getText (_config >> "ammo");
    private _explosive = getNumber (configFile >> "CfgAmmo" >> _ammo >> "explosive");

    private _name = getText (_config >> "displayName");
    private _picture = getText (_config >> "picture");

    GVAR(throwablesCache) set [_throwable, [_explosive, _name, _picture]];
};

// return
GVAR(throwablesCache) get _throwable
