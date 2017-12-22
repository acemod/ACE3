if !(_this select 1) then {
	{
		{
			if (_x iskindof "VR_CoverObject_base_F") then {
				[_x,0] call bis_fnc_setheight;
			} else {
				_x enablesimulation true;
				_x hideobject false;
			};
		} foreach ([_x] + crew _x);
	} foreach (allmissionobjects "All");
	{
		_unit = _x;
		removevest _unit;
		removebackpack _unit;
		removeheadgear _unit;
		removegoggles _unit;
		removeallweapons _unit;
		_unit addvest vest player;
		_unit addbackpack backpack player;
		_unit addheadgear headgear player;
		_unit addgoggles goggles player;
		_unit addweapon primaryweapon player;
		_unit addweapon secondaryweapon player;
		_unit addweapon handgunweapon player;
		{_unit addprimaryweaponitem _x;} foreach (primaryweaponitems player);
		{_unit addsecondaryweaponitem _x;} foreach (secondaryweaponitems player);
		{_unit addhandgunitem _x;} foreach (handgunitems player);
	} foreach (entities "B_Soldier_VR_F" + entities "O_Soldier_VR_F" + entities "I_Soldier_VR_F");

	("RscVRMeta" call bis_fnc_rscLayer) cutrsc ["RscVRMeta","plain"];
};
player setvariable ["BIS_drawLines",true];