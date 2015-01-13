if (!hasInterface) exitWith {};
waitUntil {!isNil "cse_gui" && !isNil "cse_main"};
waitUntil {!isNull player};

player addEventHandler ["Fired", {_this call cse_fnc_handleWeaponHeat_wh}];
player addEventHandler ["Take", {_this call cse_fnc_take_wh}];
player addEventHandler ["Put", {_this call cse_fnc_put_wh}];

cse_sys_weaponheat = true;
cse_genericSpareBarrel_wh = true;
 
_args = _this;
{
	_value = _x select 1;
	if (!isNil "_value") then {
		_name = _x select 0;
		if (_name == "genericSpareBarrel") exitWith {
			cse_genericSpareBarrel_wh = _value;
		};
	};
} forEach _args;

// Clear Malfunction
["cse_weaponheat_clear_malfunction", (["cse_weaponheat_clear_malfunction","action",[20, 0,1,0]] call cse_fnc_getKeyBindingFromProfile_F),
	{
		[player, currentWeapon player, currentMuzzle player] call cse_fnc_clearMalfunction_wh;
	}] call cse_fnc_addKeyBindingForAction_F;
	
["cse_weaponheat_clear_malfunction","action", "Clear Malfunction", "Clear Malfunction"] call cse_fnc_settingsDefineDetails_F;

call cse_fnc_registerBarrelExchangeActions_wh;
