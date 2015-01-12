#include "script_component.hpp"

class CfgPatches {
	class ADDON	{
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"ACE_gui","ACE_main"};
		version = VERSION;
		author[] = {$STR_ACE_Core_ACETeam};
		authorUrl = "http://ACEmod.com"; // TODO website link?
	};
};

class CfgAddons {
    class PreloadAddons {
		class ADDON {
			list[] = {QUOTE(ADDON)};
		};
    };
};

#include "CfgVehicles.hpp"
#include "CfgEventHandlers.hpp"