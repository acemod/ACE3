class CfgFunctions {
	class CSE {
		class CC {
			file = "cse\cse_sys_cc\Modules\functions";
			class assignTrackerInfo_CC { recompile = 1; };
			class modulePlaceIntelMarker_CC { recompile = 1; };
		};
		
		class Tablets
		{
			file = "cse\cse_sys_cc\tablets\functions";
			class registerDevice_CC { recompile = 1; };
			class registerApp_CC{ recompile = 1; };
			class getDeviceSettings_CC { recompile = 1; };
			class openDevice_CC { recompile = 1; };
			class openDeviceSmall_CC { recompile = 1; };
			class openLastScreen_CC { recompile = 1; };
			class getLastScreen_CC { recompile = 1; };
			class openScreen_CC { recompile = 1; };
			class getCurrentApplication_CC { recompile = 1; };
			class openIntelMarkersMenu_CC { recompile = 1; };
			class openRouteMarkersMenu_CC { recompile = 1; };
			class openIconSelectMenu_CC { recompile = 1; };
			class isSideBarOpen_CC { recompile = 1; };
			class getCurrentDeviceName_CC { recompile = 1; };
			class clickedOnMap_CC { recompile = 1; };
			class clearDeviceScreen_CC { recompile = 1; };
			class isLoggedIn_CC { recompile = 1; };
			class setLoggedIn_CC { recompile = 1; };
			class placeMarker_CC { recompile = 1; };
			class placeMarkerGlobal_CC { recompile = 1; };
			class manageLayers_CC  { recompile = 1; };
		};
		
		class TabletResources
		{
			file = "cse\cse_sys_cc\TabletResources\functions";
			class setBackground_CC { recompile = 1; };
			class setMap_CC { recompile = 1; };
			class setNavBar_CC { recompile = 1; };
			class setPiP_CC { recompile = 1; };
			class setTitle_CC { recompile = 1; };
			class setSideBar_CC { recompile = 1; };
			class setOptionField_CC { recompile = 1; };
			class getFirstAvailableOptionField_CC { recompile = 1; };
			class removeOptionField_CC { recompile = 1; };
			class getOptionFieldOnPos_CC { recompile = 1; };
			class sideBarHasMap_CC { recompile = 1; };
			class setPopUpMenu_CC { recompile = 1; };
			class setPopUpOptions_CC { recompile = 1; };
			class popUpAccept_CC { recompile = 1; };
			class isPopUpOpen_CC { recompile = 1; };
			class getPopUpRatio_CC { recompile = 1; };
			class setProgramIcons_CC { recompile = 1; };
			class getSideBarOptionFields_CC { recompile = 1; };
			class isMapOpen_CC { recompile = 1; };
			class isPiPOpen_CC { recompile = 1; };
			class getSideBarRatio_CC { recompile = 1; };
			class getNavBarRatio_CC { recompile = 1; };
			class removeSelectMenu_CC { recompile = 1; };
			class isSelectMenuOpen_CC { recompile = 1; };
			class setBottomBar_CC { recompile = 1; };
			class isOpenBottomBar_CC { recompile = 1; };
			class showLoadingScreen_CC { recompile = 1; };
			class editIntelMarker_CC { recompile = 1; };
		};
			
		class tabletScreens 
		{
			file = "cse\cse_sys_cc\tabletScreens\functions";
			class openScreen_cc_app_CC { recompile = 1; };
			class openScreen_home_CC { recompile = 1; };
			class openScreen_login_CC { recompile = 1; };
			class openScreen_notepad_CC { recompile = 1; };
			class openScreen_settings_CC { recompile = 1; };
			class openScreen_startUp_CC { recompile = 1; };
			class openScreen_liveFeed_app_CC { recompile = 1; };
		};

		class BlueForceTracking
		{
			file = "cse\cse_sys_cc\BlueForceTracking\functions";
			class displayBFT_CC { recompile = 1; };
			class displayBFTSymbols_CC { recompile = 1; };
			class displayBFTSymbolOnPerson_CC { recompile = 1; };
			class getAllBFTItems_CC { recompile = 1; };
			class hasTrackerItem_CC { recompile = 1; };
			class hasItem_CC { recompile = 1; };
			class getAllBFTItemsOfType_CC { recompile = 1; };
			class getDeviceSide_CC { recompile = 1; };
			class isBFTItem_CC { recompile = 1; };
			class hideAllBFTSymbols_CC { recompile = 1; };
			class assignTrackerIDs_Server_CC { recompile = 1; };
			class getTrackerInformation_CC { recompile = 1; };
			class setTrackerInformation_CC { recompile = 1; };
			class removeIntelMarker_CC { recompile = 1; };
			class removeRouteMarker_CC { recompile = 1; };
			class drawBFTIcons_CC { recompile = 1; };
			class drawBFTMarker_CC { recompile = 1; };
		};
		
		class LiveFeed {
			file = "cse\cse_sys_cc\LiveFeed\functions";
			class openScreen_LiveFeed_CC { recompile = 1; };
			class viewLiveFeed_CC { recompile = 1; };
			class setLiveFeedTargetObj_CC { recompile = 1; };
			class canViewFeed_CC { recompile = 1; };
			class getAllViewableFeeds_CC { recompile = 1; };
			class takeControlUAV_CC { recompile = 1; };
		};
		
		class VehicleDisplaysBFT {
			file = "cse\cse_sys_cc\vehicles\functions";
			class openFlight_Display_CC;
			class hasFlightDisplay_CC;
			class drawBFTMarker_Vehicles_CC;
			class drawBFTIcons_Vehicles_CC;
			class canUseOnBoard_BFT_Device_CC;
		};
		
		class FutureSoldier {
			file = "cse\cse_sys_cc\FutureSoldier\functions";
			class startFutureSoldierDisplay_CC { recompile = 1; };
		};
	};
};