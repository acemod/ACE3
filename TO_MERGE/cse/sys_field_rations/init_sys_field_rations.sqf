/**
 * init_sys_field_rations.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


/*
	24 hours:
	- 86400 seconds total

	Run every 10 seconds so:
	- 8640 iterations in 24 hours

	If we want to lower the decent rate from 100% to 0 in 24 hours:
	100% / 8640 = 0.011574% per iteration.

	To increase it, decrease the modifier.
	To decease it, increase the modifier.
*/
#define DEFAULT_DECENT_RATE 	0.011574

private ["_args", "_entries"];
CSE_DESCENT_RATE_WATER_FR = DEFAULT_DECENT_RATE;
CSE_DESCENT_RATE_FOOD_FR = DEFAULT_DECENT_RATE;
CSE_SHOW_UI_ICONS_FR = false;
CSE_SHOW_UI_ICONS_ONACTION_FR = false;
CSE_SHOW_UI_ICONS_SETTING_FR = true;

["cse_drink_status_fr",100,false,"frm", false] call cse_fnc_defineVariable;
["cse_food_status_fr",100,false,"frm", false] call cse_fnc_defineVariable;

if (!hasInterface) exitwith {}; // only want to run this on clients

_args = _this;
{
	if (_x select 0 == "timeWithoutWater") then {
		CSE_DESCENT_RATE_WATER_FR = DEFAULT_DECENT_RATE * (_X select 1);
	};
	if (_x select 0 == "timeWithoutFood") then {
		CSE_DESCENT_RATE_FOOD_FR = DEFAULT_DECENT_RATE * (_X select 1);
	};
}foreach _args;
waituntil{!isnil "cse_gui"};
[format["FRM - Field Rations Module initialised"],2] call cse_fnc_debug;

["itemAdd", ["cse_sys_field_rations_task_loop_CMS", {
	if (alive player) then {
		[player] call cse_fnc_updateFieldRations_FR;
	};
}, 10]] call BIS_fnc_loop;

sleep 1;
101 cutRsc ["CSE_sys_field_rations_PlayerStatusUI","PLAIN"];
[] call cse_fnc_updateUIStatus_FR;

waituntil {!isnil "cse_gui"};

cse_displayEntries_Eat_FRM = {
	private ["_subMenus", "_passedMags", "_magazines"];
		_subMenus = [];
		_passedMags = [];
		_magazines = items player;
		{
			if (!((_x) in _passedMags)) then {
				_passedMags pushback _x;
				if ([(_x)] call cse_fnc_itemIsEatable_FR) then {
					_subMenus set [ count _subMenus,
						call compile format['[getText(configFile >> "CfgWeapons" >> "%1" >> "displayName"),getText(configFile >> "CfgWeapons" >> "%1" >> "picture"), {
								closeDialog 0;
								[player,"%1",10] spawn cse_fnc_actionEat_FR; CSE_SHOW_UI_ICONS_ONACTION_FR = true; [true] call cse_fnc_updateUIStatus_FR;
							}, true, "Eat " + getText(configFile >> "CfgWeapons" >> "%1" >> "displayName")]',(_x)]
					];
				};
			};
		}foreach _magazines;
	[_subMenus] call cse_fnc_debug;
	[ _this select 3, _subMenus, _this select 1, CSE_SELECTED_RADIAL_OPTION_N_GUI, true] call cse_fnc_openRadialSecondRing_GUI;
	CSE_SHOW_UI_ICONS_ONACTION_FR = true; [true] call cse_fnc_updateUIStatus_FR;
};


cse_displayEntries_Drink_FRM = {
	private ["_subMenus", "_passedMags", "_magazines"];
		_subMenus = [];
		_passedMags = [];
		_magazines = items player;
		{
			if (!(_x in _passedMags)) then {
				_passedMags pushback _x;
				if ([_x] call cse_fnc_itemIsDrinkable_FR) then {
					_subMenus set [ count _subMenus,
						call compile format['[getText(configFile >> "CfgWeapons" >> "%1" >> "displayName"),getText(configFile >> "CfgWeapons" >> "%1" >> "picture"), {
								closeDialog 0;
								[player,"%1", 4.5] spawn cse_fnc_actionDrink_FR; CSE_SHOW_UI_ICONS_ONACTION_FR = true; [true] call cse_fnc_updateUIStatus_FR;
							}, true, "Drink " + getText(configFile >> "CfgWeapons" >> "%1" >> "displayName")]',_x]
					];
				};
			};
		}foreach _magazines;
	[ _this select 3, _subMenus, _this select 1, CSE_SELECTED_RADIAL_OPTION_N_GUI, true] call cse_fnc_openRadialSecondRing_GUI;
	CSE_SHOW_UI_ICONS_ONACTION_FR = true;
	[true] call cse_fnc_updateUIStatus_FR;
};

cse_displayEntries_Refill_FRM = {
	private ["_subMenus", "_passedMags", "_magazines"];
		_subMenus = [];
		_passedMags = [];
		_magazines = items player;
		{
			if (!(_x in _passedMags)) then {
				_passedMags pushback _x;
				if ([_x] call cse_fnc_itemIsRefillable_FR) then {
					_subMenus set [ count _subMenus,
						call compile format['[getText(configFile >> "CfgWeapons" >> "%1" >> "displayName"),getText(configFile >> "CfgWeapons" >> "%1" >> "picture"), {
								closeDialog 0;
								[player,"%1",6] spawn cse_fnc_actionRefill_FR; CSE_SHOW_UI_ICONS_ONACTION_FR = true; [true] call cse_fnc_updateUIStatus_FR;
							}, true, "Refill " + getText(configFile >> "CfgWeapons" >> "%1" >> "displayName")]',_x]
					];
				};
			};
		}foreach _magazines;
	[_subMenus] call cse_fnc_debug;
	[ _this select 3, _subMenus, _this select 1, CSE_SELECTED_RADIAL_OPTION_N_GUI, true] call cse_fnc_openRadialSecondRing_GUI;
	CSE_SHOW_UI_ICONS_ONACTION_FR = true;
	[true] call cse_fnc_updateUIStatus_FR;
};

_entries = [
		["Eat", {(([player] call cse_fnc_canEat_FR) && ([player] call cse_fnc_hasEatableItem_FR))}, CSE_ICON_PATH + "icon_survival.paa", cse_displayEntries_Eat_FRM, "Show consume options"],
		["Drink", {(([player] call cse_fnc_canDrink_FR) && ([player] call cse_fnc_hasDrinkableItem_FR))}, "cse\cse_sys_field_rations\data\icons\icon_drinking.paa", cse_displayEntries_Drink_FRM, "Show drink options"],
		["Refill", {(([player, _this select 1] call cse_fnc_canRefill_FR) && ([player] call cse_fnc_hasRefillableItem_FR))}, "cse\cse_sys_field_rations\data\hud_drinkstatus.paa", cse_displayEntries_Refill_FRM, "Show refill actions"],
		["Camelbak", {(([player, _this select 1] call cse_fnc_canRefillCamelbak_FR) && ([player] call cse_fnc_hasCamelbak_FR))}, "cse\cse_sys_field_rations\data\hud_drinkstatus.paa", {[player,10] spawn cse_fnc_actionRefillCamelbak_FR;}, "Refill camelbak"]
	];
["ActionMenu","survival", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;


// This is here for backwards compatability. This code will be removed in the near future.
_showError = false;
{
	_configEntry = (configFile >> "CfgMagazines" >> _x);
	if([_configEntry, "cse_backwardsCompatMagazineBase_FR"] call cse_fnc_inheritsFrom) then {
		player removeMagazine _x;
		player addItem _x;
		diag_log format["WARNING: Outdated Field Rations magazine classname %1 found. Please replace magazine by item variant. Future versions will not support this anymore.", _x];
		_showError = true;
	};
}foreach (magazines player);
if (_showError) then {
	["Outdated Field Rations Classnames have been found. Please replace magazine classname by item variant. Future versions will not support magazine variant"] call BIS_fnc_error;
};