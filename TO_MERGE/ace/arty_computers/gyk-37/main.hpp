#include "script_component.hpp"
class ace_arty_bcs_main:ace_arty_bcs_ControlGroup {
    idc = MAIN_ID;
    class controls {
        class GVAR(welcome):ace_arty_bcs_RscText {
            text = "AN/GYK-37 Battery Computer System (BCS)";
            x = 0;
            y = ROWPOS(0);
        };
		class GVAR(title):ace_arty_bcs_RscText {
            text = "Main Screen";
            x = 0;
            y = ROWPOS(1);
        };
		
		// Battery Name
		class GVAR(BatteryName):ace_arty_bcs_RscText {
            text = "Battery Name";
            x = 0;
            y = ROWPOS(3);
        };
		class GVAR(BatteryNameInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Main_BatteryNameInput;
            x = COLPOS(4);
            y = ROWPOS(3);
			w = COLPOS(3);
			ACE_BCS_InputName = "Battery Name";
			ACE_BCS_Require = BCS_REQUIRE_FALSE;
			text = "";
        };
		
		// FDC Name
		class GVAR(FDCCallsign):ace_arty_bcs_RscText {
            text = "FDC Callsign";
            x = 0;
            y = ROWPOS(4);
        };
		class GVAR(FDCCallsignInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Main_FDCCallsignInput;
            x = COLPOS(4);
            y = ROWPOS(4);
			w = COLPOS(3);
			ACE_BCS_InputName = "FDC Callsign";
			ACE_BCS_Require = BCS_REQUIRE_FALSE;
			text = "";
        };
		
		// Battery Location
		class GVAR(BatteryLocation):ace_arty_bcs_RscText {
            text = "Battery Type:";
            x = 0;
            y = ROWPOS(5);
        };
		
		class GVAR(BatteryType):ace_arty_bcs_RscComboBox {
			idc = IDC_Main_BatteryType;
			x = COLPOS(4);
            y = ROWPOS(5);
			w = COLPOS(5);
			h = ROWPOS(1);
			ACE_BCS_InputName = "Battery Type";
			ACE_BCS_Require = BCS_REQUIRE_TRUE;
		};
		
		// Battery Grid
		class GVAR(BatteryGrid):ace_arty_bcs_RscText {
            text = "GRID";
            x = COLPOS(1);
            y = ROWPOS(6);
			w = COLPOS(3);
        };
		class GVAR(BatteryGridInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Main_BatteryGridInput;
            x = COLPOS(4);
            y = ROWPOS(6);
			w = COLPOS(3);
			ACE_BCS_InputName = "Battery Grid";
			ACE_BCS_Require = BCS_REQUIRE_TRUE;
			ACE_BCS_Type = BCS_FIELD_GRID;
			text = "";
        };
		
		// Battery Altitude
		class GVAR(BatteryAlt):ace_arty_bcs_RscText {
            text = "ALT";
            x = COLPOS(1);
            y = ROWPOS(7);
			w = COLPOS(1);
        };
		class GVAR(BatteryAltInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Main_BatteryAltInput;
            x = COLPOS(4);
            y = ROWPOS(7);
			w = COLPOS(2);
			ACE_BCS_InputName = "Battery Altitude";
			ACE_BCS_Require = BCS_REQUIRE_TRUE;
			ACE_BCS_Type = BCS_FIELD_NUMBER;
			text = "";
        };
		
		// Battery DOF
		class GVAR(BatteryDOF):ace_arty_bcs_RscText {
            text = "Dir. of Fire";
            x = COLPOS(1);
            y = ROWPOS(8);
			w = COLPOS(3);
        };
		class GVAR(BatteryDOFInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Main_BatteryDOFInput;
            x = COLPOS(4);
            y = ROWPOS(8);
			w = COLPOS(2);
			ACE_BCS_InputName = "Battery Direction of Fire";
			ACE_BCS_Require = BCS_REQUIRE_TRUE;
			ACE_BCS_Type = BCS_FIELD_NUMBER;
			ACE_BCS_MinNumber = 0;
			ACE_BCS_MaxNumber = 6400;
			text = "";
        };
		
		// Target Prefix
		class GVAR(TargetPrefix):ace_arty_bcs_RscText {
            text = "Target Prefix";
            x = 0;
            y = ROWPOS(9);
        };
		class GVAR(TargetPrefixInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Main_TargetPrefix;
            x = COLPOS(4);
            y = ROWPOS(9);
			w = COLPOS(1);
			ACE_BCS_InputName = "Target Prefix";
			ACE_BCS_Require = BCS_REQUIRE_TRUE;
			text = "";
        };
		
		// Target Num Start
		class GVAR(TargetNumStart):ace_arty_bcs_RscText {
            text = "Target # Start";
            x = 0;
            y = ROWPOS(10);
        };
		class GVAR(TargetNumStartInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Main_TargetNumStart;
            x = COLPOS(4);
            y = ROWPOS(10);
			w = COLPOS(2);
			ACE_BCS_InputName = "Targeting Start Number";
			ACE_BCS_Require = BCS_REQUIRE_TRUE;
			ACE_BCS_Type = BCS_FIELD_NUMBER;
			ACE_BCS_MinNumber = 0;
			text = "";
        };
		
		class GVAR(ObserverInformation):ace_arty_bcs_RscText {
			text = "OBSERVER INFORMATION";
			x = COLPOS(12);
			y = ROWPOS(3);
		};
		
		class GVAR(ObserverSelect):ace_arty_bcs_RscText {
			text = "Select:";
			x = COLPOS(12);
			y = ROWPOS(4);
			w = COLPOS(2);
		};
		class GVAR(ObserverSelectInput):ace_arty_bcs_RscComboBox {
			idc = IDC_Main_ObserverSelect;
			x = COLPOS(15);
			y = ROWPOS(4);
			w = COLPOS(5);
			h = ROWPOS(1);
			onLBSelChanged = QUOTE([ARR_4(IDC_Main_ObserverSelect,IDC_Main_Observer,IDC_Main_ObserverPosInput,IDC_Main_ObserverAltInput)] call FUNC(selectObserver));
		};
		
		// Observer Callsign
		class GVAR(Observer):ace_arty_bcs_RscText {
			text = "Observer:";
			x = COLPOS(12);
			y = ROWPOS(5);
			w = COLPOS(2);
		};
		class GVAR(ObserverInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Main_Observer;
			x = COLPOS(15);
			y = ROWPOS(5);
			w = COLPOS(2);
		};
		
		// Observer Pos
		class GVAR(ObserverPos):ace_arty_bcs_RscText {
			text = "Observer Grid:";
			x = COLPOS(12);
			y = ROWPOS(6);
			w = COLPOS(3);
		};
		class GVAR(ObserverPosInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Main_ObserverPosInput;
			x = COLPOS(15);
			y = ROWPOS(6);
			w = COLPOS(3);
			ACE_BCS_InputName = "Observer Grid";
			ACE_BCS_Type = BCS_FIELD_GRID;
		};
		
		// Observer Alt
		class GVAR(ObserverAlt):ace_arty_bcs_RscText {
			text = "Observer Alt:";
			x = COLPOS(12);
			y = ROWPOS(7);
			w = COLPOS(3);
		};
		class GVAR(ObserverAltInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Main_ObserverAltInput;
			x = COLPOS(15);
			y = ROWPOS(7);
			w = COLPOS(2);
			ACE_BCS_InputName = "Observer Altitude";
			ACE_BCS_Type = BCS_FIELD_NUMBER;
		};
		
		class GVAR(UpdateAddObserver):ace_arty_bcs_RscButton {
			text = "Add/Update";
			x = COLPOS(12.5);
			y = ROWPOS(8);
			w = COLPOS(2);
			h = ROWPOS(1);
			action = QUOTE([ARR_5(IDC_Main_ObserverSelect,IDC_Main_Observer,IDC_Main_ObserverPosInput,IDC_Main_ObserverAltInput,true)] call FUNC(modifyObserver));
		};
		
		// Known Points
		class GVAR(KnowPointInformation):ace_arty_bcs_RscText {
			text = "KNOWN POINTS";
			x = COLPOS(12);
			y = ROWPOS(10);
		};
		
		class GVAR(KnownPointsSelect):ace_arty_bcs_RscText {
			text = "Select:";
			x = COLPOS(12);
			y = ROWPOS(11);
			w = COLPOS(2);
		};
		class GVAR(KnownPointsSelectInput):ace_arty_bcs_RscComboBox {
			idc = IDC_Main_KnownPointSelect;
			x = COLPOS(15);
			y = ROWPOS(11);
			w = COLPOS(5);
			h = ROWPOS(1);
			onLBSelChanged = QUOTE([ARR_4(IDC_Main_KnownPointSelect,IDC_Main_KnownPoint,IDC_Main_KnownPointPosInput,IDC_Main_KnownPointAltInput)] call FUNC(selectKnownPoint));
		};
		
		class GVAR(KnownPoint):ace_arty_bcs_RscText {
			text = "Name:";
			x = COLPOS(12);
			y = ROWPOS(12);
			w = COLPOS(2);
		};
		class GVAR(KnownPointInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Main_KnownPoint;
			x = COLPOS(15);
			y = ROWPOS(12);
			w = COLPOS(2);
			ACE_BCS_InputName = "Know Point Name";
		};
		
		class GVAR(KnownPointPos):ace_arty_bcs_RscText {
			text = "Grid:";
			x = COLPOS(12);
			y = ROWPOS(13);
			w = COLPOS(3);
		};
		class GVAR(KnownPointPosInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Main_KnownPointPosInput;
			x = COLPOS(15);
			y = ROWPOS(13);
			w = COLPOS(3);
			ACE_BCS_InputName = "Known Point Grid";
			ACE_BCS_Type = BCS_FIELD_GRID;
		};

		class GVAR(KnownPointAlt):ace_arty_bcs_RscText {
			text = "Alt:";
			x = COLPOS(12);
			y = ROWPOS(14);
			w = COLPOS(3);
		};
		class GVAR(KnownPointAltInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Main_KnownPointAltInput;
			x = COLPOS(15);
			y = ROWPOS(14);
			w = COLPOS(2);
			ACE_BCS_InputName = "Known Point Altitude";
			ACE_BCS_Type = BCS_FIELD_NUMBER;
		};
		
		class GVAR(UpdateAddKnownPoint):ace_arty_bcs_RscButton {
			text = "Add/Update";
			x = COLPOS(12.5);
			y = ROWPOS(15);
			w = COLPOS(2);
			h = ROWPOS(1);
			action = QUOTE([ARR_5(IDC_Main_KnownPointSelect,IDC_Main_KnownPoint,IDC_Main_KnownPointPosInput,IDC_Main_KnownPointAltInput,true)] call FUNC(modifyKnownPoint));
		};
		
		
		// FFE
		class GVAR(MissionGridButton):ace_arty_bcs_RscButton {
			text = "GRID";
			x = COLPOS(1);
            y = ROWPOS(12);
			w = COLPOS(3);
			h = ROWPOS(2);
			action = "['grid', false] call ace_sys_arty_computers_gyk37_fnc_startMission";
		};
		
		class GVAR(MissionPolarButton):ace_arty_bcs_RscButton {
			text = "POLAR";
			x = COLPOS(5);
            y = ROWPOS(12);
			w = COLPOS(3);
			h = ROWPOS(2);
			action = "['polar', false] call ace_sys_arty_computers_gyk37_fnc_startMission;";
		};
		
		class GVAR(MissionShiftButton):ace_arty_bcs_RscButton {
			text = "SHIFT";
			x = COLPOS(9);
            y = ROWPOS(12);
			w = COLPOS(3);
			h = ROWPOS(2);
			action = "['shift', false] call ace_sys_arty_computers_gyk37_fnc_startMission;";
		};
		/*
		// Adjust
		class GVAR(MissionAdjustGridButton):ace_arty_bcs_RscButton {
			text = "ADJUST GRID";
			x = COLPOS(1);
            y = ROWPOS(15);
			w = COLPOS(3);
			h = ROWPOS(2);
			action = "['grid', true] call ace_sys_arty_computers_gyk37_fnc_startMission;";
		};
		
		class GVAR(MissionAdjustPolarButton):ace_arty_bcs_RscButton {
			text = "ADJUST POLAR";
			x = COLPOS(5);
            y = ROWPOS(15);
			w = COLPOS(3);
			h = ROWPOS(2);
			action = "['polar', true] call ace_sys_arty_computers_gyk37_fnc_startMission;";
		};
		
		class GVAR(MissionAdjustShiftButton):ace_arty_bcs_RscButton {
			text = "ADJUST SHIFT";
			x = COLPOS(9);
            y = ROWPOS(15);
			w = COLPOS(3);
			h = ROWPOS(2);
			action = "['shift', true] call ace_sys_arty_computers_gyk37_fnc_startMission;";
		};
		*/
		// Special
		// class GVAR(MissionImmediateSupressionButton):ace_arty_bcs_RscButton {
			// text = "IMMED. SUPRESS.";
			// x = COLPOS(1);
            // y = ROWPOS(18);
			// w = COLPOS(3);
			// h = ROWPOS(2);
			// action = "['supress', false] call ace_sys_arty_computers_gyk37_fnc_startMission;";
		// };
		
		// class GVAR(MissionImmediateSmokeButton):ace_arty_bcs_RscButton {
			// text = "IMMED. SMOKE";
			// x = COLPOS(5);
            // y = ROWPOS(18);
			// w = COLPOS(3);
			// h = ROWPOS(2);
			// action = "['supressSmoke', false] call ace_sys_arty_computers_gyk37_fnc_startMission;";
		// };
		
		// class GVAR(MissionRepeatButton):ace_arty_bcs_RscButton {
			// text = "REPEAT";
			// x = COLPOS(9);
            // y = ROWPOS(18);
			// w = COLPOS(3);
			// h = ROWPOS(2);
			// action = "['repeat', false] call ace_sys_arty_computers_gyk37_fnc_startMission;";
		// };
    };
};