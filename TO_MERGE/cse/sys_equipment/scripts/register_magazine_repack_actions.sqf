if (isDedicated) exitwith{};
CSE_ICON_PATH = "cse\cse_gui\radialmenu\data\icons\";

cse_fnc_repackableMagazineTypes = {
	private ["_magazines", "_repackableMagazines", "_repackableMagazineTypes", "_className", "_magazineAmmoCount", "_magazineCapacity", "_repackableMagazinesOfTypeX", "_result"];
	_magazines = magazinesAmmo player;
	_result = [];
	_repackableMagazines = [];
	_repackableMagazineTypes = [];
	{
		_className = _x select 0;
		_magazineAmmoCount = _x select 1;
		_magazineCapacity = getNumber(configFile >> "CfgMagazines" >> _className >> "count");
		if (_magazineCapacity - _magazineAmmoCount > 0) then {
			_repackableMagazines pushBack _x;
			if (!(_className in _repackableMagazineTypes)) then {
				_repackableMagazineTypes pushBack _className;
			};
		};
	} forEach _magazines;
	
	{
		_magazineType = _x;
		_repackableMagazinesOfTypeX = {_magazineType == (_x select 0)} count _repackableMagazines;
		if (_repackableMagazinesOfTypeX > 1) then {
			_result pushBack _magazineType;
		};
	} forEach _repackableMagazineTypes;
	
	_result
};

cse_repackMagazinesDisplaySubMenu = {
	[_this] call cse_fnc_Debug;
	
	private ["_subMenus", "_repackableMagazineTypes"];
	_subMenus = [];
	_repackableMagazineTypes = call cse_fnc_repackableMagazineTypes;
	
	{
		_subMenus pushBack
			call compile format['[getText(configFile >> "CfgMagazines" >> "%1" >> "displayName"), getText(configFile >> "CfgMagazines" >> "%1" >> "picture"),
				{
					closeDialog 0;
					[player,"%1",20] spawn cse_fnc_repackMagazines;
				}, true, "Repack " + getText(configFile >> "CfgMagazines" >> "%1" >> "displayName")
			]', _x];
	} forEach _repackableMagazineTypes;
	
	[_this select 3, _subMenus, _this select 1, CSE_SELECTED_RADIAL_OPTION_N_GUI, true] call cse_fnc_openRadialSecondRing_GUI;
};


_entries = [
	["Repack", {count (call cse_fnc_repackableMagazineTypes) > 0}, CSE_ICON_PATH + "icon_magazines.paa", cse_repackMagazinesDisplaySubMenu, "Show magazines that can be repacked"]
];
["ActionMenu","equipment", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;


