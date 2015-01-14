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

_player == gunner _vehicle
&& (count (_vehicle getVariable [QGVAR(Magazines), []]) > 1)
