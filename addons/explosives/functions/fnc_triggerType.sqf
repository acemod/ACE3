#include "..\script_component.hpp"
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

params ["_magazineClassname"];
TRACE_1("params",_magazineClassname);

private _result = [];
private _config = getArray (configFile >> "CfgMagazines" >> _magazineClassname >> "ACE_Triggers" >> "SupportedTriggers");
private _count = count _config;

for "_index" from 0 to (_count - 1) do {
    _result set [_index, configFile >> "ACE_Triggers" >> (_config select _index)];
};
_result
