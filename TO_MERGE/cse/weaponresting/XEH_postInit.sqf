/**
 * XEH_postInit.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

if (!hasInterface) exitwith {};
waituntil{!isnil "cse_gui" && !isnil "cse_main"};

waitUntil {!isNull player};

[QGVAR(isWeaponRested)  , false, false, "wr"] call EFUNC(common,defineVariable);
[QGVAR(isWeaponDeployed), false, false, "wr"] call EFUNC(common,defineVariable);

ADDON = true;
