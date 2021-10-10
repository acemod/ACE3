#include "script_component.hpp"
/*
 * Authors: Ruthberg
 * Tests if the Kestrel 4500 can be shown
 *
 * Arguments:
 * None
 *
 * Return Value:
 * canShow <BOOL>
 *
 * Example:
 * call ace_kestrel4500_fnc_canShow
 *
 * Public: No
 */

"ACE_Kestrel4500" in ([ACE_player] call EFUNC(common,uniqueItems))
