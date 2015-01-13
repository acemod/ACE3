class CfgFunctions {
	class CSE 
	{
		class GUI 
		{
			file = "cse\cse_gui\functions";
			class gui_keyPressed { recompile = 1; };
			class gui_createInteractionMenu { recompile = 1; };
			class gui_addMenuEntry { recompile = 1; };
			class gui_getMenuEntries { recompile = 1; };
			class gui_displaySubMenuButtons { recompile = 1; };
			class gui_hideSubMenuButtons { recompile = 1; };
			class gui_hideSubSubMenuButtons { recompile = 1; };
			class gui_sortMenuEntries { recompile = 1; };
			class gui_refreshLastSubMenu { recompile = 1; };
			class gui_displayEventHandler { recompile = 1; };
			class gui_loadingBar { recompile = 1; };
			class gui_hasOptionAvailable { recompile = 1; };
			class gui_displayInformation { recompile = 1; };
			class gui_displayMessage { recompile = 1; };
			class gui_blurScreen { recompile = 1; };
			class gui_displayIcon { recompile = 1; };
		};
		class RadialMenu {
			file = "cse\cse_gui\radialmenu";
			class findTargetOfMenu_GUI { recompile = 1; };
			class openRadialMenu_GUI {recompile = 1; };
			class openRadialSubMenu_GUI {recompile = 1; };
			class setRadialMenuOptions_GUI {recompile = 1; };
			class setRadialMenuName_GUI { recompile = 1; };
			class getcurrentRadialTarget_GUI { recompile = 1; };
			class returnToPreviousSubMenu_GUI { recompile = 1; };
			class setRadialSecondRing_GUI { recompile = 1; };
			class openRadialSecondRing_GUI { recompile = 1; };
			class closeRadialSecondRing_GUI { recompile = 1; };
			class setRadialMenuTargetName_GUI { recompile = 1; };
			class findtargetName_GUI { recompile = 1;};
			class setRadialOptionSelected_GUI { recompile = 1; };
			class isRadialOptionSelected_GUI { recompile = 1; };
			class isOpenSecondRing_GUI { recompile = 1; };
			class addEntryToRadialInteraction_F { recompile = 1; };
			class createRadialInteraction_F { recompile = 1; };
			class getRadialInteractionEntries_F { recompile = 1; };
			class openRadialInteractionMenu_F { recompile = 1; };
			class radialUsesSorter_F { recompile = 1; };
			class getEntryToMenuSorter_F { recompile = 1; };
			class addEntryToMenuSorter_F { recompile = 1; };
			class createCategoryRadialMenu_F { recompile = 1; };
			class getAllCategoryEntriesRadialMenu_F { recompile = 1; };
			class addCategoryEntryRadialMenu_F { recompile = 1; };
			class hasEntriesRadialInteraction_F { recompile = 1; };
			class addMultipleEntriesToRadialCategory_F { recompile = 1; };
			class getIcon_F { recompile = 1; };
			class categoryHasActionsAvailable_F { recompile = 1; };
		};
		class WeaponSelector {
			file = "cse\cse_gui\WeaponSelector";
			class onWeaponSelectorOpened_GUI { recompile = 1; };
		};
	};
};