/*
 * Author: Garth 'L-H' de Wet
 * Gets the types of triggers associated with the explosive
 *
 * Arguments:
 * 0: Explosive magazine <STRING>
 *
 * Return Value:
 * Supported triggers as ACE_Triggers config entries <ARRAY>
 *
 * Example:
 * _supports = ["SatchelCharge_Remote_Mag"] call ACE_Explosives_fnc_TriggerType
 *
 * Public: Yes
 */
#include "script_component.hpp"

private["_result", "_config", "_count", "_index", "_supports"];
// IGNORE_PRIVATE_WARNING(_supports);

_result = [];
_config = getArray (ConfigFile >> "CfgMagazines" >> (_this select 0) >> "ACE_Triggers" >> "SupportedTriggers");
_count = count _config;

for "_index" from 0 to (_count - 1) do {
    _result set [_index, ConfigFile >> "ACE_Triggers" >> (_config select _index)];
};
_result
