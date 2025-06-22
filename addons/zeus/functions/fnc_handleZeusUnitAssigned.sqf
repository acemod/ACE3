#include "..\script_component.hpp"
/*
 * Author: kymckay
 * Contextually removes addons (given in ACE_Curator) from zeus based on their required addon(s)
 *
 * ACE_Curator format:
 * ModuleAddon = "RequiredAddon";
 * OR
 * ModuleAddon[] = {"RequiredAddon1","RequiredAddon2",...}
 *
 * Arguments:
 * 0: The zeus logic <LOGIC>
 * 1: The zeus player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, bob] call ace_zeus_fnc_handleZeusUnitAssigned
 *
 * Public: No
 */

if !(isClass (configFile >> "ACE_Curator")) exitWith { ERROR("The ACE_Curator class does not exist") };

params ["_logic"];

private _removeAddons = [];
{
    private _addon = _x;
    if (isArray _addon) then {
        {
            if !([_x] call EFUNC(common,isModLoaded)) exitWith {
                _removeAddons pushBack (configName _addon);
            };
        } forEach (getArray _addon);
    };

    if (isText _addon) then {
        if !([getText _addon] call EFUNC(common,isModLoaded)) then {
            _removeAddons pushBack (configName _addon);
        };
    };
} forEach configProperties [configFile >> "ACE_Curator"];

_logic removeCuratorAddons _removeAddons;
