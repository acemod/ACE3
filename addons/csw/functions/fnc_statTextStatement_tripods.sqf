#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Text statement for displaying which tripods are needed for a CSW.
 *
 * Arguments:
 * 0: Item config path <CONFIG>
 *
 * Return Value:
 * Stat Text <ARRAY of STRINGS>
 *
 * Public: No
*/

params ["_config"];

private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgVehicles = configFile >> "CfgVehicles";

(configProperties [_cfgWeapons >> configName _config >> QUOTE(ADDON) >> "assembleTo", "true", true]) apply {
    private _tripod = getText (_cfgVehicles >> configName _x >> QUOTE(ADDON) >> "disassembleTo");

    getText (_cfgWeapons >> _tripod >> "displayName")
}
