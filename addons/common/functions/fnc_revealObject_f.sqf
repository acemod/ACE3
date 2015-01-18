/**
 * fnc_revealObject_f.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

if (hasInterface) then {
    player reveal (_this select 0);
};