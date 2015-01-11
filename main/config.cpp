#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"Extended_EventHandlers", "CBA_MAIN"};
		VERSION_CONFIG;
	};
};

class CfgMods {
	class ACE3 {
		dir = "@ACE3";
		picture = "";
		action = "http://www.unitedoperations.net";
		hideName = 0;
		hidePicture = 0;
		name = "UnitedOperations";
	};
};
