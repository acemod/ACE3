//#define DEBUG_MODE_FULL
#include "script_component.hpp"

ADDON = false;

if (!isDedicated) then {
	[["StaticCannon", "StaticMortar", "ACE_Arty_ShellHolder", "ACE_Arty_OrdnanceBox","ACE_Tbox_Mortar_81mmHE","ACE_Tbox_Mortar_60mmHE","ACE_Tbox_Mortar_82mmHE"], [ace_sys_interaction_key], 2, [QUOTE(PATHTO(fnc_menuDef)), "main"]] call CBA_ui_fnc_add;
};

["ace_arty_ammo_105mmSmokeEvent", { _this call FUNC(attachSmokeEffects) }] call CBA_fnc_addEventHandler;

ADDON = true;
