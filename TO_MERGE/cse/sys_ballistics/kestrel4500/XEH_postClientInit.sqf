if (!hasInterface) exitwith{};

call compile preprocessFile "cse\cse_sys_ballistics\kestrel4500\init.sqf";


[] spawn {
	waituntil {!isnil "cse_gui"};
	// TODO seperate config entry for this, outside module space.
	["cse_sys_ballistics_Kestrel4500_open", (["cse_sys_ballistics_Kestrel4500_open","menu",[70, 0,0,0]] call cse_fnc_getKeyBindingFromProfile_F), { _this call cse_ab_kestrel4500_fnc_create_dialog; }, 790542] call cse_fnc_addKeyBindingForMenu_F;
	["cse_sys_ballistics_Kestrel4500_open","menu", "Open Kestrel4500", "Opens the Kestrel4500 dialog"] call cse_fnc_settingsDefineDetails_F;

	["cse_sys_ballistics_Kestrel4500_show", (["cse_sys_ballistics_Kestrel4500_show","action",[70, 1,0,0]] call cse_fnc_getKeyBindingFromProfile_F), { _this call cse_ab_kestrel4500_fnc_display_kestrel; }] call cse_fnc_addKeyBindingForAction_F;
	["cse_sys_ballistics_Kestrel4500_show","action", "Show Kestrel4500", "Show the Kestrel4500 without mouse."] call cse_fnc_settingsDefineDetails_F;
	
	_entries = [
		["Kestrel 4500", {([player, 'cse_ab_Kestrel4500'] call cse_fnc_hasItem_CC)}, "cse\cse_sys_ballistics\kestrel4500\data\Kestrel4500_Icon.paa", { closeDialog 0; call cse_ab_Kestrel4500_fnc_create_dialog; }, "Use Kestrel 4500"]
	];
	["ActionMenu", "equipment", _entries] call cse_fnc_addMultipleEntriesToRadialCategory_F;
};
