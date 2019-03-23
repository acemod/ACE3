#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Reads user data from profileNamespace
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_kestrel4500_fnc_restore_user_data
 *
 * Public: No
 */

GVAR(Menu) = 0 max (profileNamespace getVariable ["ACE_Kestrel4500_menu", 0]) min ((count GVAR(Menus)) - 1);
GVAR(RefHeading) = 0 max (profileNamespace getVariable ["ACE_Kestrel4500_RefHeading", 0]) min 359;
