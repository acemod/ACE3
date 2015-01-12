if (!hasInterface) exitwith {};
waituntil{!isnil "cse_gui" && !isnil "cse_main"};

waitUntil {!isNull player};

["put_safety_on", (["put_safety_on","action",[126,0,0,0]] call cse_fnc_getKeyBindingFromProfile_F), {
	// TODO: Find a way to implement weapon safety without the slide of a pistol being locked back
	if (currentWeapon player != "" && (currentWeapon player == primaryWeapon player || currentWeapon player == secondaryWeapon player)) then {
		[player, currentWeapon player, currentMuzzle player] call cse_fnc_safetyOn_ws;
	};
}] call cse_fnc_addKeyBindingForAction_F;
["put_safety_on","action","Safety on","Put weapon on safe."] call cse_fnc_settingsDefineDetails_F;

["put_safety_off", (["put_safety_off","action",[126,1,0,0]] call cse_fnc_getKeyBindingFromProfile_F), {
	[player, currentWeapon player, currentMuzzle player] call cse_fnc_safetyOff_ws;
}] call cse_fnc_addKeyBindingForAction_F;
["put_safety_off","action","Safety off","Put weapon on fire."] call cse_fnc_settingsDefineDetails_F;


cse_sys_weaponSafety = true;
