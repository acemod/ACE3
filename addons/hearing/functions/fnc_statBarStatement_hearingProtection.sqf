#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Bar statement for hearing protection.
 *
 * Arguments:
 * 0: Stats <ARRAY>
 * 1: Item config path <CONFIG>
 * 2: Args for configExtreme <ARRAY>
 *
 * Return Value:
 * Bar statement <NUMBER>
 *
 * Public: No
*/

params ["_stats", "_config", "_args"];

if (getNumber (_config >> (_stats # 1)) == 1) exitWith {
    1
};

[_stats select 0, _config, _args] call EFUNC(arsenal,statBarStatement_default)
