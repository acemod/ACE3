#include "script_component.hpp"
/*
 * Authors: Ruthberg
 * Tests if the ATragMX dialog can be shown
 *
 * Arguments:
 * None
 *
 * Return Value:
 * can_show <BOOL>
 *
 * Example:
 * call ace_atragmx_fnc_can_show
 *
 * Public: No
 */

!underwater ACE_player &&
{"ACE_ATragMX" in ([ACE_player] call EFUNC(common,uniqueItems))}
