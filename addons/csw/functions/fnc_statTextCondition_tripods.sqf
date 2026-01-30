#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Text condition for displaying which tripods are needed for a CSW.
 *
 * Arguments:
 * 0: Item config path <CONFIG>
 *
 * Return Value:
 * Whether to display stat or not <BOOL>
 *
 * Public: No
*/

params ["_config"];

(configProperties [configFile >> "CfgWeapons" >> configName _config >> QUOTE(ADDON) >> "assembleTo", "true", true]) isNotEqualTo []
