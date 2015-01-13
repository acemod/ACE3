#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { "ace_common" };
		version = VERSION;
	};
};

#include "CfgEventhandlers.hpp"
#include "CfgVehicles.hpp"