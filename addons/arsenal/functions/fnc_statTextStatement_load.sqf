#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Text statement for the load stat.
 *
 * Arguments:
 * 0: Stats <ARRAY>
 * 1: Item config path <CONFIG>
 *
 * Return Value:
 * Stat Text <STRING>
 *
 * Public: No
*/

params ["_stats", "_config"];
TRACE_2("statTextStatement_load",_stats,_config);

if (!isNull (_config >> "ItemInfo" >> "containerClass")) then { // Uniform/Vest
    _config = configFile >> "CfgVehicles" >> getText (_config >> "ItemInfo" >> "containerClass");
};

private _load = getNumber (_config >> (_stats # 0));

if (_load <= 0) exitWith { LELSTRING(common,none) };
format ["%1kg (%2lb)", (_load * 0.1 * (1 / 2.2046)) toFixed 2, (_load * 0.1) toFixed 2]
