#include "..\script_component.hpp"
/*
 * Author: drofseh
 * Barrel Type statement.
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
TRACE_1("statTextStatement_allowSwapBarrel",_config);

if ((getNumber (_config >> QGVAR(allowSwapBarrel))) == 1) exitWith {LLSTRING(statBarrelType_removeable)};

LLSTRING(statBarrelType_nonRemoveable)
