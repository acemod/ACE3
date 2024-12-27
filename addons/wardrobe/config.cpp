#include "script_component.hpp"

class CfgPatches {
	class ADDON {

        // Meta information for editor
		name = ADDON_NAME;
		author = "$STR_wardrobe_author";
        authors[] = {"OverlordZorn [CVO]"};
		
        url = "$STR_mod_URL";

		VERSION_CONFIG;

        // Addon Specific Information
        // Minimum compatible version. When the game's version is lower, pop-up warning will appear when launching the game.
        requiredVersion = 2.02;

        // Required addons, used for setting load order.
        // When any of the addons is missing, pop-up warning will appear when launching the game.
        requiredAddons[] = {QPVAR(main),"cba_main", "ace_interact_menu"};

		// Optional. If this is 1, if any of requiredAddons[] entry is missing in your game the entire config will be ignored and return no error (but in rpt) so useful to make a compat Mod (Since Arma 3 2.14)
		skipWhenMissingDependencies = 1;
        
        // List of objects (CfgVehicles classes) contained in the addon. Important also for Zeus content (units and groups)
        units[] = {};

        // List of weapons (CfgWeapons classes) contained in the addon.
        weapons[] = {};

	};
};

#include "CfgFunctions.hpp"
#include "XEH\CfgXEH.hpp"

#include "CfgVehicles.hpp"

#include "Baseclass.hpp"