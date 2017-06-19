/*
 * Author: Ruthberg
 * Saves user data into profileNamespace
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_kestrel4500_fnc_store_user_data
 *
 * Public: No
 */
#include "script_component.hpp"

profileNamespace setVariable ["ACE_Kestrel4500_menu", GVAR(menu)];
profileNamespace setVariable ["ACE_Kestrel4500_RefHeading", GVAR(RefHeading)];
