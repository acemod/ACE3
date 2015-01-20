#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		units[] = {};
		//weapons[] = { "ACE_Kestrel4500" };
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"ace_common"
		};
		version = VERSION;
		author[] = {"q1184", "Rocko"};
		/*
		class ACE_Options { 						// ACE Options
			group = "INTERACTION";
			title = " "; 							// Empty (WITH A SPACE IN BETWEEN!!!!!) if no CAPTION TEXT is wanted
			class Toggle_Wind_Info {						// Points to CBA Events, e.g for the keypress registered within CBA
				title = $STR_ACE_MENU_MEASUREWIND;
			};
		};		
		*/
	};
};

#include "CfgEventhandlers.hpp"
#include "CfgAmmo.hpp"
//#include "RscTitles.hpp"
