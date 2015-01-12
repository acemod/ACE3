
		if ((((["CombinedInteractionMenu","menu",[0,0,0,0]] call cse_fnc_getKeyBindingFromProfile_F) select 0) != 0) && (((["radius_menu","menu",[0,0,0,0]] call cse_fnc_getKeyBindingFromProfile_F) select 0) == 0)) then {
			["radius_menu", (["CombinedInteractionMenu","menu",[0,0,0,0]] call cse_fnc_getKeyBindingFromProfile_F)] call cse_fnc_updateMenuKeyBinding_f;
			["CombinedInteractionMenu", [0,0,0,0]] call cse_fnc_updateMenuKeyBinding_f;
		};

