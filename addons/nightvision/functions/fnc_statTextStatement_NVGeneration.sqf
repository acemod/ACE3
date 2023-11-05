#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Text statement for the NV Generation stat.
 *
 * Arguments:
 * 0: Not used
 * 1: Item config path <CONFIG>
 *
 * Return Value:
 * Stat Text <STRING>
 *
 * Public: No
 */

params ["", "_config"];
TRACE_1("statTextStatement_nvGeneration",_config);

private _gen = 3; // Default
if (isNumber (_config >> QGVAR(generation))) then {
    _gen = getNumber (_config >> QGVAR(generation));
};

format [localize LSTRING(statGen), _gen];
