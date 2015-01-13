#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { "ace_common", "ace_laser" };
		version = VERSION;
	};
};

#include "CfgEventhandlers.hpp"
#include "CfgAmmo.hpp"
#include "CfgWeapons.hpp"