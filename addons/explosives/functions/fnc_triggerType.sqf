#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Gets the types of triggers associated with the explosive.
 *
 * Arguments:
 * 0: Explosive magazine <STRING>
 *
 * Return Value:
 * Supported triggers as ACE_Triggers config entries <ARRAY>
 *
 * Example:
 * "SatchelCharge_Remote_Mag" call ace_explosives_fnc_triggerType
 *
 * Public: Yes
 */

params [["_magazine", "", [""]]];
TRACE_1("params",_magazine);

if (_magazine == "") exitWith {
    [] // return
};

private _cfgAceTriggers = configFile >> "ACE_Triggers";

getArray (configFile >> "CfgMagazines" >> _magazine >> "ACE_Triggers" >> "SupportedTriggers") apply {_cfgAceTriggers >> _x} // return
