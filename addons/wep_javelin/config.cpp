#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { "ace_main", "ace_common", "ace_laser" };
		version = VERSION;
	};
};

#include "CfgEventhandlers.hpp"
#include "CfgOptics.hpp"