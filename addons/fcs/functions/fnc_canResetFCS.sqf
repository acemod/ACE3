/*
 * Author: KoffeinFlummi
 *
 * Called from config. Can player reset FCS?
 *
 * Argument:
 * Nothing
 *
 * Return value:
 * Boolean (Bool)
 */

#include "script_component.hpp"

count ((vehicle ACE_player) getVariable [format ["%1_%2", QGVAR(Magazines), [ACE_player] call EFUNC(common,getTurretIndex)], []]) > 1
