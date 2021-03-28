#include "script_component.hpp"
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
 * call ace_kestrel4500_fnc_storeUserData
 *
 * Public: No
 */

profileNamespace setVariable ["ACE_Kestrel4500_menu", GVAR(menu)];
profileNamespace setVariable ["ACE_Kestrel4500_RefHeading", GVAR(RefHeading)];
