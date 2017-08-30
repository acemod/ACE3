/*
 * Author: SilentSpike
 * Contextually removes addons (given in ACE_Curator) from zeus based on their required addon(s)
 *
 * ACE_Curator format:
 * ModuleAddon = "RequiredAddon";
 * OR
 * ModuleAddon[] = {"RequiredAddon1","RequiredAddon2",...}
 *
 * Arguments:
 * 0: The zeus logic <LOGIC>
 * 1: The zeus player <UNIT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, bob] call ace_zeus_fnc_handleZeusUnitAssigned
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_removeAddons", "_numCfgs", "_cfg", "_requiredAddon"];

if !(isClass (configFile >> "ACE_Curator")) exitWith { ERROR("The ACE_Curator class does not exist") };

params ["_logic"];
_removeAddons = [];

_numCfgs = count (configFile >> "ACE_Curator");
for "_n" from 0 to (_numCfgs - 1) do {
    _cfg = (configFile >> "ACE_Curator") select _n;

    if (isArray _cfg) then {
        _requiredAddon = getArray _cfg;
        {
            if !(isClass (configFile >> "CfgPatches" >> _x)) exitWith {
                _removeAddons pushBack (configName _cfg);
            };
        } forEach _requiredAddon;
    };

    if (isText _cfg) then {
        _requiredAddon = getText _cfg;
        if !(isClass (configFile >> "CfgPatches" >> _requiredAddon)) then {
            _removeAddons pushBack (configName _cfg);
        };
    };
};

_logic removeCuratorAddons _removeAddons;
