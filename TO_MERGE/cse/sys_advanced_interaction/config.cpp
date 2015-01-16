#define _ARMA_
class CfgPatches
{
	class cse_sys_advanced_interaction
	{
		units[] = {"cse_advancedInteractionItems", "cse_KeycuffsItem", "cse_HIIDEItem", "cse_oldphoneItem", "cse_oldphone_foldedItem", "cse_watch_expensiveItem", "cse_walletItem", "cse_9v_batteryItem", "cse_notebookItem", "cse_scissorsItem", "cse_wiresItem"};
		weapons[] = {"cse_Keycuffs", "cse_HIIDE", "cse_oldphone", "cse_oldphone_folded", "cse_watch_expensive", "cse_wallet", "cse_9v_battery", "cse_notebook", "cse_scissors", "cse_wires"};
		requiredVersion = 0.1;
		requiredAddons[] = {"cse_gui","cse_main"};
		version = "0.10.0";
		author[] = {"Combat Space Enhancement"};
		authorUrl = "http://csemod.com";
	};
	class cse_moduleAmbientCivilians
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"cse_gui","cse_main"};
		version = "0.10.0";
		author[] = {"Combat Space Enhancement"};
		authorUrl = "http://csemod.com";
	};	
};

#include "CfgAddOns.h"
#include "CfgVehicles.h"
#include "Combat_Space_Enhancement.h"
#include "GUI.h"

// Here for backwards compatability. To be removed at a later moment.
// #include "CfgMagazines.h"

#include "CfgWeapons.h"
#include "CfgFunctions.h"
#include "CfgSounds.h"

// EOF