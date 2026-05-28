#include "../script_component.hpp"
/*
 * Author: PabstMirror
 * call compile preprocessFileLineNumbers "z\ace\addons\wardrobe\dev\check.sqf";
 */
private _all = "true" configClasses (configFile >> QUOTE(ADDON));

private _cfgW = configFile >> "CfgWeapons";
private _cfgG = configFile >> "CfgGlasses";

{
    private _wardName = configName _x;
    private _modifiableTo = "true" configClasses (configFile >> QUOTE(ADDON) >> _wardName >> "modifiableTo");
    if (_modifiableTo isEqualTo []) then {
        if (_wardName select [0, 17] != "ace_wardrobe_base") then {
            diag_log format ["[ACE3][Wardrobe] WARNING: Wardrobe item '%1' has no modifiableTo entries", _wardName];
        };
        continue;
    };
    private _itemName = switch true do {
        case (isClass (_cfgW >> _wardName)): { configName (_cfgW >> _wardName) };
        case (isClass (_cfgG >> _wardName)): { configName (_cfgG >> _wardName) };
        default { "" };
    };
    if (_itemName == "") then {
        diag_log format ["[ACE3][Wardrobe] WARNING: Wardrobe item '%1' does not exist in CfgWeapons or CfgGlasses!", _wardName];
        continue;
    };

    {
        private _xClass = configName _x;
        private _xMod = ("true" configClasses (configFile >> QUOTE(ADDON) >> _xClass >> "modifiableTo")) apply { toLower configName _x };
        if !((toLower _wardName) in _xMod) then {
            diag_log format ["[ACE3][Wardrobe] WARNING: Wardrobe item '%1' is not reversable to '%2'", _wardName, _xClass];
        };
    } forEach _modifiableTo;
} forEach _all;
