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
 * ["SatchelCharge_Remote_Mag"] call ACE_Explosives_fnc_TriggerType
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_magazineClassname"];
TRACE_1("params",_magazineClassname);

private ["_result", "_config", "_count", "_index"];

_result = [];
_config = getArray (ConfigFile >> "CfgMagazines" >> _magazineClassname >> "ACE_Triggers" >> "SupportedTriggers");
_count = count _config;

for "_index" from 0 to (_count - 1) do {
    _result set [_index, ConfigFile >> "ACE_Triggers" >> (_config select _index)];
};
_result
