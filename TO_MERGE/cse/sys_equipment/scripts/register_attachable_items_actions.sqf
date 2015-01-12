if (isDedicated) exitwith{};
CSE_ICON_PATH = "cse\cse_gui\radialmenu\data\icons\";

cse_attachMagazinesDisplaySubMenu = {
	[_this] call cse_fnc_Debug;
	private ["_subMenus","_passedMags","_magsAmmo"];
		_subMenus = [];
		_passedMags = [];
		_magsAmmo = magazinesAmmo player;
		if ([player] call cse_fnc_hasItemAttached_EQ) then {
			_subMenus set [ count _subMenus,
				call compile format['["Detach", getText(configFile >> "CfgMagazines" >> "%1" >> "picture"),
					{
						closeDialog 0;
						[player,"%1",20] spawn cse_fnc_detachItem_EQ;
					}, true, "Detach " + getText(configFile >> "CfgMagazines" >> "%1" >> "displayName")
				]', player getvariable ["cse_attachedItemClassName_EQ", ""]]
			];
		} else {
			{
				if (!((_x select 0) in _passedMags)) then {
					_passedMags set [ count _passedMags, (_x select 0)];
					if ([_x select 0] call cse_fnc_isAttachableItem_EQ) then
					{
						_subMenus set [ count _subMenus,
							call compile format['[getText(configFile >> "CfgMagazines" >> "%1" >> "displayName"), getText(configFile >> "CfgMagazines" >> "%1" >> "picture"),
								{
									closeDialog 0;
									[player, "%1"] call cse_fnc_attachItem_EQ;
								}, true, "Attach " + getText(configFile >> "CfgMagazines" >> "%1" >> "displayName")
							]',(_x select 0)]
						];
					};
				};
			}foreach _magsAmmo;
		};

	[ _this select 3, _subMenus, _this select 1, CSE_SELECTED_RADIAL_OPTION_N_GUI, true] call cse_fnc_openRadialSecondRing_GUI;
};


_entries = [
	["Attach", {(([player] call cse_fnc_hasItemAttached_EQ) || [player] call cse_fnc_hasAttachableItem_EQ)}, CSE_ICON_PATH + "icon_magazines.paa", cse_attachMagazinesDisplaySubMenu, "Attach Item(s)"]
];
["ActionMenu","equipment", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;