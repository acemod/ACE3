#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"ACE_main"};
		versionDesc = "ACE Wind Deflection";
		version = VERSION;
		author[] = {$STR_ACE_Core_ACETeam};
		authorUrl = "http://csemod.com";
	};
};

class ADDON {
    class PreloadAddons {
       class ADDON {
          list[] = {QUOTE(ADDON)};
       };
    };
};

#include "CfgVehicles.h"