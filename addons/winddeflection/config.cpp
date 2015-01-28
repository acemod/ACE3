#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"ACE_common"};
		versionDesc = "ACE Wind Deflection";
		version = VERSION;
		author[] = {$STR_ACE_Core_ACETeam, "Glowbal", "Ruthberg"};
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