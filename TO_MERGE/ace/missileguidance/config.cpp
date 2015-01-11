#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { "uo_main", "uo_sys_laser", "a3_ui_f" };
		version = VERSION;
	};
};

#include "CfgEventhandlers.hpp"
#include "CfgAmmo.hpp"
#include "CfgWeapons.hpp"