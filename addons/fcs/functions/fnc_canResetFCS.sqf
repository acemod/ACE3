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

ACE_player == gunner vehicle ACE_player
&& (count ((vehicle ACE_player) getVariable [QGVAR(Magazines), []]) > 1)
