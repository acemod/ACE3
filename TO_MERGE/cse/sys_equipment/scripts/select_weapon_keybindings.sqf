
["place_Weapon_onBack", (["place_Weapon_onBack","action",[0,0,0,0]] call cse_fnc_getKeyBindingFromProfile_F), {
	if (currentWeapon player != "") then {
		[player] call cse_fnc_putWeaponOnBack_EQ;
	};
}] call cse_fnc_addKeyBindingForAction_F;
["place_Weapon_onBack","action","Weapon on Back","Place rifle on back or holster pistol"] call cse_fnc_settingsDefineDetails_F;

["select_primairy_weapon", (["select_primairy_weapon","action",[0,0,0,0]] call cse_fnc_getKeyBindingFromProfile_F), {
	if (primaryWeapon player != "") then {
		player selectWeapon primaryWeapon player;
	};
}] call cse_fnc_addKeyBindingForAction_F;
["select_primairy_weapon","action","Select Primairy weapon","Select your primary weapon."] call cse_fnc_settingsDefineDetails_F;

["select_secondairy_weapon", (["select_secondairy_weapon","action",[0,0,0,0]] call cse_fnc_getKeyBindingFromProfile_F), {
	if (secondaryWeapon player != "") then {
		player selectWeapon secondaryWeapon player;
	};
}] call cse_fnc_addKeyBindingForAction_F;
["select_secondairy_weapon","action","Select Secondairy Weapon","Select your secondairy weapon."] call cse_fnc_settingsDefineDetails_F;

["select_handgun_weapon", (["select_handgun_weapon","action",[0,0,0,0]] call cse_fnc_getKeyBindingFromProfile_F), {
	if (handgunWeapon player != "") then {
		player selectWeapon handgunWeapon player;
	};
}] call cse_fnc_addKeyBindingForAction_F;
["select_handgun_weapon","action","Select handgun","Select your pistol."] call cse_fnc_settingsDefineDetails_F;
