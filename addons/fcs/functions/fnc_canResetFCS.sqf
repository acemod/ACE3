/*
 * Author: KoffeinFlummi
 * Called from config. Can player reset FCS?
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Boolean <BOOL>
 *
 * Example:
 * call ace_fcs_fnc_canResetFCS
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

count ((vehicle _unit) getVariable [format ["%1_%2", QGVAR(Magazines), [_unit] call EFUNC(common,getTurretIndex)], []]) > 1 // return
