#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"CAWeapons", "ace_main", "ace_sys_arty"};
		VERSION_CONFIG;
	};
};

#include "cfgEventhandlers.hpp"
#include "dialogs.hpp"
