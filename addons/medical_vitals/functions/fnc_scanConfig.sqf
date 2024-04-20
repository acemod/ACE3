#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Cache a hashmap of all oxygen-providing items for SpO2 simulation
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
*/

private _filter = toString {getText (_x >> QGVAR(oxygenSupply)) != ""};

{
    private _cfgRoot = configFile >> _x;
    {
        private _condition = compile getText (_x >> QGVAR(oxygenSupply));
        GVAR(oxygenSupplyConditionCache) set [configName _x, _condition];
    } forEach (_filter configClasses _cfgRoot);
} forEach ["CfgWeapons", "CfgGoggles"];
