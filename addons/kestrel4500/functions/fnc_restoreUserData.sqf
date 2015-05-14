/*
 * Author: Ruthberg
 * Reads user data from profileNamespace
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_kestrel4500_fnc_restore_user_data
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(Menu) = 0 max (profileNamespace getVariable ["ACE_Kestrel4500_menu", 0]) min ((count GVAR(Menus)) - 1);
