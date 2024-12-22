#include "..\script_component.hpp"
/*
 * Author: drofseh
 * Bolt Type statement.
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
TRACE_1("statTextStatement_boltType",_config);

if ((getNumber (_config >> QGVAR(closedBolt))) == 1) exitWith {LLSTRING(statBoltType_closedBolt)};

LLSTRING(statBoltType_openBolt)
