#include "script_component.hpp"
/*
 * Author: CBA Team
 * Throws Fired XEH.
 *
 * Arguments:
 * 0: unit - Object the event handler is assigned to <OBJECT>
 * 1: weapon - Fired weapon <STRING>
 * 2: muzzle - Muzzle that was used <STRING>
 * 3: mode - Current mode of the fired weapon <STRING>
 * 4: ammo - Ammo used <STRING>
 * 5: magazine - magazine name which was used <STRING>
 * 6: projectile - Object of the projectile that was shot <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, "weapon", "muzle", "mode", "ammo", "magazine", projectile] call ace_advanced_throwing_fnc_throwFiredXEH
 *
 * Public: No
 */

TRACE_1("Fired",_this);

{
    _this call _x;
} forEach ((_this select 0) getVariable "cba_xeh_fired");
