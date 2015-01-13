#include "defines.h"

if (isDedicated) exitwith{};
CSE_ICON_PATH = "cse\cse_gui\radialmenu\data\icons\";

cse_hearingProtectionDisplaySubMenu = {
	[_this] call cse_fnc_Debug;

	private ["_subMenus"];
	_subMenus = [];

	// Put on standard earplugs
	if (player getVariable ["cse_combatdeaf_earplugs", NO_EARPLUGS] == NO_EARPLUGS && [player, "cse_earplugs"] call cse_fnc_hasItem) then {
		_subMenus pushBack ["Use earplugs", CSE_ICON_PATH + "icon_earplugs_standard.paa", {
			closeDialog 0;
			player setVariable ["cse_combatdeaf_earplugs", STANDARD_EARPLUGS, false];
			player removeItem "cse_earplugs";
			[format["earplugsAttenuation_ID_%1", EARPLUGS_ID], 0.125] call cse_fnc_setHearingCapability;
		}, true, "Use standard earplugs"];
	};

	// Put on electronic earplugs
	if (player getVariable ["cse_combatdeaf_earplugs", NO_EARPLUGS] == NO_EARPLUGS && [player, "cse_earplugs_electronic"] call cse_fnc_hasItem) then {
		_subMenus pushBack ["Use earplugs", CSE_ICON_PATH + "icon_earplugs_electronic.paa", {
			closeDialog 0;
			player setVariable ["cse_combatdeaf_earplugs", ELECTRONIC_EARPLUGS, false];
			player removeItem "cse_earplugs_electronic";
		}, true, "Use electronic earplugs"];
	};

	// Remove earplugs
	if (player getVariable ["cse_combatdeaf_earplugs", NO_EARPLUGS] != NO_EARPLUGS) then {
		switch (player getVariable ["cse_combatdeaf_earplugs", NO_EARPLUGS]) do {
			case STANDARD_EARPLUGS: {
				_subMenus pushBack ["Earplugs out", CSE_ICON_PATH + "icon_earplugs_remove.paa", {
					closeDialog 0;
					player setVariable ["cse_combatdeaf_earplugs", NO_EARPLUGS, false];
					player addItem "cse_earplugs";
					[format["earplugsAttenuation_ID_%1", EARPLUGS_ID], 1, false] call cse_fnc_setHearingCapability;
				}, true, "Remove standard earplugs"];
			};
			case ELECTRONIC_EARPLUGS: {
				_subMenus pushBack ["Earplugs out", CSE_ICON_PATH + "icon_earplugs_remove.paa", {
					closeDialog 0;
					player setVariable ["cse_combatdeaf_earplugs", NO_EARPLUGS, false];
					player addItem "cse_earplugs_electronic";
				}, true, "Remove electronic earplugs"];
			};
		};
	};

	[_this select 3, _subMenus, _this select 1, CSE_SELECTED_RADIAL_OPTION_N_GUI, true] call cse_fnc_openRadialSecondRing_GUI;
};


_entries = [
	["Hearing", {((player getVariable ["cse_combatdeaf_earplugs", NO_EARPLUGS] != NO_EARPLUGS) || (([player, "cse_earplugs_electronic"] call cse_fnc_hasItem) || ([player, "cse_earplugs"] call cse_fnc_hasItem)))}, CSE_ICON_PATH + "icon_ear_protection.paa", cse_hearingProtectionDisplaySubMenu, "Show available hearing protections"]
];
["ActionMenu","equipment", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;

