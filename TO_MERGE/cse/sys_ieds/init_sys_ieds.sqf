/**
 * init_sys_ieds.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define IED_ICON "\A3\Weapons_F\Data\UI\gear_c4_charge_small_CA.paa"

if (isServer) then {
	call cse_fnc_monitorIEDS_IEDS;
};

if (hasInterface) then {
	CSE_THOR_III_PACK_ENABLED_IEDS = true;
	call cse_fnc_thor3_detection_IEDS;
	call cse_fnc_monitorPlayerIEDS_IEDS;
};

waituntil{!isnil "cse_gui"};

_entries = [
	["Pressure Plate (S)", {([player,"cse_ied_pressureplate_small"] call cse_fnc_hasItem)}, IED_ICON, {closeDialog 0; [0, 1, 0] call cse_fnc_placeDownIED_IEDS; player removeItem "cse_ied_pressureplate_small";}, "Place Pressure plate IED (Small)"],

	["Pressure Plate (M)", {([player,"cse_ied_pressureplate_large"] call cse_fnc_hasItem)}, IED_ICON, {closeDialog 0; [0, 0, 0] call cse_fnc_placeDownIED_IEDS; player removeItem "cse_ied_pressureplate_large";}, "Place Pressure plate IED (Large)"],

	["Radio (S)", {([player,"cse_ied_radio_small"] call cse_fnc_hasItem)}, IED_ICON, {closeDialog 0; [0, 1, 1] call cse_fnc_placeDownIED_IEDS; player removeItem "cse_ied_radio_small";}, "Place Radio IED (Small)"],
	["Radio (M)", {([player,"cse_ied_radio_large"] call cse_fnc_hasItem)}, IED_ICON, {closeDialog 0; [0, 0, 1] call cse_fnc_placeDownIED_IEDS; player removeItem "cse_ied_radio_large";}, "Place Radio IED (Large)"],
	["Cell Phone", {([player,"cse_oldphone"] call cse_fnc_hasItem)}, "cse\cse_sys_ieds\data\icon_cellphone.paa", {closeDialog 0; createDialog "cse_ied_cellphone";}, "Use Cell Phone Trigger"]
];

["ActionMenu","equipment", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;

true;