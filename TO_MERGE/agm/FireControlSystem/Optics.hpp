
#define MACRO_RANGERFINDER \
	class CA_Distance; \
	class AGM_CA_Distance: CA_Distance { \
		idc = 1713151; \
		text = "----"; \
	}; \
	class AGM_Rangehelper: RscMapControl { \
		onDraw = "((ctrlParent (_this select 0)) displayCtrl 1713151) ctrlShow (cameraView == 'GUNNER');"; \
		w = 0; \
		h = 0; \
	};

class RscControlsGroup;
class RscMapControl;

class RscInGameUI {
	class RscUnitInfo;
	class RscUnitInfo_AH64D_gunner {
		onLoad = "";
		controls[] = {"CA_Distance", "AGM_CA_Distance"};
		MACRO_RANGERFINDER
	};
	class RscWeaponRangeFinder {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0];";
		controls[] = {"CA_Distance", "AGM_CA_Distance"};
		MACRO_RANGERFINDER
	};
	//class RscWeaponRangeArtillery
	//class RscWeaponRangeArtilleryAuto

	class RscWeaponRangeFinderPAS13 {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0];";
		MACRO_RANGERFINDER
	};
	class RscOptics_Rangefinder: RscUnitInfo {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscOptics_LaserDesignator {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0];";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscWeaponRangeFinderMAAWS {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0];";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscWeaponRangeFinderAbramsCom {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0];";
		controls[] = {"CA_Distance", "AGM_CA_Distance"};
		MACRO_RANGERFINDER
	};
	class RscWeaponRangeFinderAbramsGun {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0];";
		controls[] = {"CA_Distance", "AGM_CA_Distance"};
		MACRO_RANGERFINDER
	};
	class RscWeaponRangeFinderStrykerMGSGun {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0];";
		controls[] = {"CA_Distance", "AGM_CA_Distance"};
		MACRO_RANGERFINDER
	};
	class RscOptics_crows: RscUnitInfo {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscOptics_strider_commander {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0];";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};

	class RscWeaponRangeZeroing: RscUnitInfo {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
		controls[] = {"CA_Zeroing", "CA_DistanceText", "CA_Distance", "AGM_CA_Distance", "AGM_Rangehelper"};
		MACRO_RANGERFINDER
	};
	class RscOptics_sos: RscUnitInfo {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscOptics_nightstalker: RscUnitInfo {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscOptics_tws: RscUnitInfo {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscOptics_punisher {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0];";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscOptics_tws_sniper: RscUnitInfo {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscOptics_SDV_periscope {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0];";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscOptics_Heli_Attack_02_gunner: RscUnitInfo {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscOptics_Heli_Attack_01_gunner: RscUnitInfo {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscOptics_UAV_gunner: RscUnitInfo {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscOptics_UGV_gunner: RscUnitInfo {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscOptics_APC_Tracked_01_gunner: RscUnitInfo {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscOptics_APC_Tracked_03_gunner: RscUnitInfo {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscOptics_APC_Wheeled_01_gunner: RscUnitInfo {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscOptics_APC_Wheeled_03_commander: RscUnitInfo {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscOptics_APC_Wheeled_03_gunner: RscUnitInfo {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscOptics_MBT_01_commander: RscUnitInfo {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscOptics_MBT_01_gunner: RscUnitInfo {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscOptics_MBT_02_commander: RscUnitInfo {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscOptics_MBT_02_gunner: RscUnitInfo {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
	class RscOptics_MBT_03_gunner: RscUnitInfo {
		onLoad = "uiNamespace setVariable ['AGM_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
		class CA_IGUI_elements_group: RscControlsGroup {
			class controls {
				MACRO_RANGERFINDER
			};
		};
	};
};
