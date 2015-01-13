if (isDedicated) exitwith{};
CSE_ICON_PATH = "cse\cse_gui\radialmenu\data\icons\";

cse_exchangeBarrelDisplaySubMenu = {
	[_this] call cse_fnc_Debug;

	private ["_subMenus"];
	_subMenus = [];

	if ([player, currentWeapon player, currentMuzzle player] call cse_fnc_canSwapBarrel_wh) then {
		_subMenus pushBack ["Swap barrel", CSE_ICON_PATH + "icon_swap_barrels.paa", {
			closeDialog 0;
			[player, currentWeapon player, currentMuzzle player] spawn cse_fnc_swapBarrel_wh;
		}, true, "Swaps out the barrel"];
	};

	[_this select 3, _subMenus, _this select 1, CSE_SELECTED_RADIAL_OPTION_N_GUI, true] call cse_fnc_openRadialSecondRing_GUI;
};


_entries = [
	["Weapon", {([player, currentWeapon player, currentMuzzle player] call cse_fnc_canSwapBarrel_wh)}, CSE_ICON_PATH + "icon_lines_horizontal_s.paa", cse_exchangeBarrelDisplaySubMenu, "Shows available weapon interactions"]
];
["ActionMenu","equipment", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;


