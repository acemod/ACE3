

CSE_ICON_PATH = "cse\cse_gui\radialmenu\data\icons\";

_entries = [
	["Medical (SELF)", {!([player] call cse_fnc_inWater_f)}, CSE_ICON_PATH + "icon_open_dialog.paa", {closeDialog 0; [player] call cse_fnc_openMenu_CMS; }, "Open Medical Menu (SELF)"],
	["Medical", {((_this select 1) != (_this select 0)) && {(((_this select 0) distance (_this select 1) < 10) && {(_this select 1) isKindOf "CaManBase"} && {!([player] call cse_fnc_inWater_f)})}}, CSE_ICON_PATH + "icon_open_dialog.paa", {closeDialog 0; [_this select 1] call cse_fnc_openMenu_CMS; }, "Open Medical Menu"]
];
["ActionMenu","medical_menu", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;


_entries = [
	["Unload (Cas)", {((_this call cse_fnc_interactWithVehicle_Crew_Condition) && (count ((_this select 1) getvariable ["cse_loaded_casualties_CMS",[]]) > 0))}, CSE_ICON_PATH + "icon_open_dialog.paa",
		{
			closeDialog 0;
			_loaded = ((_this select 1) getvariable ["cse_loaded_casualties_CMS",[]]);
			{
				[player,_x,false] call cse_fnc_unload_CMS;
			}foreach _loaded
		}, "Unload Casualties"]
];
["ActionMenu","interaction", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;


_conditionDrag = {
	private ["_caller", "_unit", "_return"];
	_caller = _this select 0;
	_unit = _this select 1;
	_return = false;
	if (([_caller] call cse_fnc_canInteract) && {_caller != _unit} && {!([_unit] call cse_fnc_isAwake)}) then {
		if !([player] call cse_fnc_inWater_f) then {
			if (!isNull _unit) then {
				if (_unit != player && (_unit isKindOf "CaManBase")) then {
					if (vehicle _unit == _unit) then {
						if (vehicle _caller == _caller) then {
							if (isNull ([player] call cse_fnc_getCarriedObj)) then {
								_return = true;
							};
						};
					};
				};
			};
		};
	};
	_return
};

_entries = [
	["Drag", _conditionDrag, CSE_ICON_PATH + "icon_hand.paa", {closeDialog 0; CSE_SYS_MEDICAL_INTERACTION_TARGET = _this select 1;[_this select 0, _this select 1] spawn CSE_fnc_drag_CMS; }, "Drag"],
	["Carry", _conditionDrag, CSE_ICON_PATH + "icon_hand.paa", {closeDialog 0; CSE_SYS_MEDICAL_INTERACTION_TARGET = _this select 1; [_this select 0, _this select 1] spawn cse_fnc_carry_CMS; }, "Carry"],
	["Drop", {(([player] call cse_fnc_getCarriedObj) == (_this select 1))}, CSE_ICON_PATH + "icon_hand.paa", {closeDialog 0; CSE_SYS_MEDICAL_INTERACTION_TARGET = _this select 1; [_this select 0, _this select 1] spawn cse_fnc_drop_CMS; }, "Drop"]
];
["ActionMenu","medical_menu", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;