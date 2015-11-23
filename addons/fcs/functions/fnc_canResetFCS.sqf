/*
 * Author: KoffeinFlummi
 * Called from config. Can player reset FCS?
 *
 * Argument:
 * Nothing
 *
 * Return Value:
 * Boolean <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

count ((vehicle _unit) getVariable [format ["%1_%2", QGVAR(Magazines), [_unit] call EFUNC(common,getTurretIndex)], []]) > 1 // return
