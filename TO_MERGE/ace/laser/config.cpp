#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { "uo_main", "a3_ui_f" };
		version = VERSION;
	};
};

#include "CfgEventhandlers.hpp"
#include "CfgVehicles.hpp"