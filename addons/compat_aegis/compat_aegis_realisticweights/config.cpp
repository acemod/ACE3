#include "script_component.hpp"

class CfgPatches {
	class SUBADDON {
		name = COMPONENT NAME;
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"ace_realisticweights",
			"A3_Aegis_Weapons_F_Aegis"
		};
		skipWhenMissingDependencies = 1;
		author= ECSTRING(common,ACETeam);
		authors[] = {"PoToo"};
		url = ECSTRING(main,URL);
		VERSION_CONFIG;

        addonRootClass = QUOTE(ADDON);
	};
};

#include "CfgWeapons.hpp"

