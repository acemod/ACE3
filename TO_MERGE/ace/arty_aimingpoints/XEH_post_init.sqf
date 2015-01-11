// #define DEBUG_MODE_FULL
#include "script_component.hpp"

ADDON = false;

["player", [ace_sys_interaction_key], 1, [QPATHTO_F(fnc_menuDef_stake), "main"]] call CBA_ui_fnc_add;
["player", [ace_sys_interaction_key_self], 9, [QPATHTO_F(fnc_menuDef_stake_self), "main"]] call CBA_ui_fnc_add;
[QGVAR(aimingCircleLightEvent), { _this call FUNC(aimingCircleHandleLight); }] call CBA_fnc_addEventHandler;

ADDON = true;