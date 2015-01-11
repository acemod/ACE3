class ace_arty_bcs_adjust:ace_arty_bcs_ControlGroup {
    idc = ADJUST_ID;
    class controls {
        class GVAR(welcome):ace_arty_bcs_RscText {
            text = "AN/GYK-37 Battery Computer System (BCS)";
            x = 0;
            y = ROWPOS(0);
        };
		
		class GVAR(batteryInformation):ace_arty_bcs_RscText {
            text = "BATTERY INFORMATION";
            x = 0;
            y = ROWPOS(1);
        };
		
		class GVAR(LowSolutionDisplay):ace_arty_bcs_RscText {
			idc = IDC_Adjust_lowDisplay;
			style = ST_MULTI;
            text = "low low low low";
            x = COLPOS(1);
            y = ROWPOS(2);
			w = COLPOS(18);
			h = COLPOS(1.2);
        };
		
		class GVAR(adjustSolutionUp):ace_arty_bcs_RscButton {
			text = "PREV.";
			x = COLPOS(1);
			y = ROWPOS(4);
			w = COLPOS(2);
			h = ROWPOS(1);
			action = QUOTE([ARR_2(-1,true)] call FUNC(changeSolution));
		};
		
		class GVAR(adjustSolutionDown):ace_arty_bcs_RscButton {
			text = "NEXT";
			x = COLPOS(4);
			y = ROWPOS(4);
			w = COLPOS(2);
			h = ROWPOS(1);
			action = QUOTE([ARR_2(1,true)] call FUNC(changeSolution));
		};
		
		// MESSAGE TO OBSERVER
		class GVAR(MTOlow):ace_arty_bcs_RscText {
            text = "MESSAGE TO OBSERVER";
            x = COLPOS(0);
            y = ROWPOS(5);
			w = COLPOS(5);
        };
		class GVAR(MTODisplayLow):ace_arty_bcs_RscText {
			idc = IDC_Adjust_MTODisplayLow;
			style = ST_MULTI;
            text = "Message to Observer Message Goes Here Noobs";
            x = COLPOS(1);
            y = ROWPOS(6);
			w = COLPOS(18);
			h = COLPOS(.75);
        };
		
		class GVAR(TTIShotLow):ace_arty_bcs_RscButton {
			text = "SHOT";
			x = COLPOS(1);
			y = ROWPOS(9);
			w = COLPOS(2);
			h = ROWPOS(1);
			action = QUOTE([ARR_2(0,IDC_Adjust_TTIDisplay)] call FUNC(callShot));
		};
		
		class GVAR(TTI):ace_arty_bcs_RscText {
            text = "TTI:";
            x = COLPOS(7);
            y = ROWPOS(9);
			w = COLPOS(2);
        };
		class GVAR(TTIDisplay):ace_arty_bcs_RscText {
			idc = IDC_Adjust_TTIDisplay;
            text = "00.0";
            x = COLPOS(8);
            y = ROWPOS(9);
			w = COLPOS(2);
        };
		
		// ADJUST
		class GVAR(Adjust):ace_arty_bcs_RscText {
            text = "ADJUST";
            x = COLPOS(0);
            y = ROWPOS(15);
			w = COLPOS(5);
        };
		/*
		class GVAR(AdjustObserverSelect):ace_arty_bcs_RscText {
			text = "Select:";
			x = COLPOS(1);
			y = ROWPOS(16);
			w = COLPOS(2);
		};
		class GVAR(AdjustObserverSelectInput):ace_arty_bcs_RscComboBox {
			idc = IDC_Adjust_AdjustObserverSelect;
			x = COLPOS(4);
			y = ROWPOS(16);
			w = COLPOS(5);
			h = ROWPOS(1);
			onLBSelChanged = QUOTE([ARR_4(IDC_Adjust_AdjustObserverSelect,IDC_Adjust_AdjustObserver,IDC_Adjust_AdjustObserverPosInput,IDC_Adjust_AdjustObserverAltInput)] call FUNC(selectObserver));
		};
		
		// Observer Callsign
		class GVAR(AdjustObserver):ace_arty_bcs_RscText {
			text = "Observer:";
			x = COLPOS(1);
			y = ROWPOS(17);
			w = COLPOS(2);
		};
		class GVAR(AdjustObserverInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Adjust_AdjustObserver;
			x = COLPOS(4);
			y = ROWPOS(17);
			w = COLPOS(2);
		};
		
		// Observer Pos
		class GVAR(AdjustObserverPos):ace_arty_bcs_RscText {
			text = "Observer Pos.:";
			x = COLPOS(1);
			y = ROWPOS(18);
			w = COLPOS(3);
		};
		class GVAR(AdjustObserverPosInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Adjust_AdjustObserverPosInput;
			x = COLPOS(4);
			y = ROWPOS(18);
			w = COLPOS(2);
		};
		
		// Observer Alt
		class GVAR(AdjustObserverAlt):ace_arty_bcs_RscText {
			text = "Observer Alt.:";
			x = COLPOS(1);
			y = ROWPOS(19);
			w = COLPOS(3);
		};
		class GVAR(AdjustObserverAltInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Adjust_AdjustObserverAltInput;
			x = COLPOS(4);
			y = ROWPOS(19);
			w = COLPOS(2);
		};
		
		class GVAR(AdjustUpdateAddObserver):ace_arty_bcs_RscButton {
			text = "Add/Update";
			x = COLPOS(7);
			y = ROWPOS(19);
			w = COLPOS(2);
			h = ROWPOS(1);
			action = QUOTE([ARR_5(IDC_Adjust_AdjustObserverSelect,IDC_Adjust_AdjustObserver,IDC_Adjust_AdjustObserverPosInput,IDC_Adjust_AdjustObserverAltInput,true)] call FUNC(modifyObserver));
		};
		*/
		class GVAR(AdjustOTDir):ace_arty_bcs_RscText {
			text = "OT. Dir:";
			x = COLPOS(1);
			y = ROWPOS(16);
			w = COLPOS(2);
		};
		class GVAR(AdjustOTDirInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Adjust_AdjustOTDirInput;
			x = COLPOS(4);
			y = ROWPOS(16);
			w = COLPOS(2);
			ACE_BCS_InputName = "Observer Target Direction";
			ACE_BCS_Require = BCS_REQUIRE_TRUE;
			ACE_BCS_Type = BCS_FIELD_NUMBER;
			ACE_BCS_MinNumber = 0;
			ACE_BCS_MaxNumber = 6400;
		};
		
		// Left/Right
		class GVAR(AdjustLeftRight):ace_arty_bcs_RscText {
			text = "Left/Right:";
			x = COLPOS(1);
			y = ROWPOS(17);
			w = COLPOS(2);
		};
		class GVAR(AdjustLeftRightInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Adjust_AdjustLeftRightInput;
			x = COLPOS(4);
			y = ROWPOS(17);
			w = COLPOS(2);
			text = "0";
			ACE_BCS_InputName = "Adjust left/Right";
			ACE_BCS_Require = BCS_REQUIRE_TRUE;
			ACE_BCS_Type = BCS_FIELD_NUMBER;
		};
		
		// Add/Drop
		class GVAR(AdjustAddDrop):ace_arty_bcs_RscText {
			text = "Add/Drop:";
			x = COLPOS(1);
			y = ROWPOS(18);
			w = COLPOS(2);
		};
		class GVAR(AdjustAddDropInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Adjust_AdjustAddDropInput;
			x = COLPOS(4);
			y = ROWPOS(18);
			w = COLPOS(2);
			text = "0";
			ACE_BCS_InputName = "Adjust Add/Drop";
			ACE_BCS_Require = BCS_REQUIRE_TRUE;
			ACE_BCS_Type = BCS_FIELD_NUMBER;
		};
		
		// Up/Down
		class GVAR(AdjustUpDown):ace_arty_bcs_RscText {
			text = "Up/Down:";
			x = COLPOS(1);
			y = ROWPOS(19);
			w = COLPOS(2);
		};
		class GVAR(AdjustUpDownInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Adjust_AdjustUpDownInput;
			x = COLPOS(4);
			y = ROWPOS(19);
			w = COLPOS(2);
			text = "0";
			ACE_BCS_InputName = "Adjust Up/Down";
			ACE_BCS_Require = BCS_REQUIRE_TRUE;
			ACE_BCS_Type = BCS_FIELD_NUMBER;
		};
		
		/*
		class GVAR(AdjustAmmo):ace_arty_bcs_RscText {
            text = "ADJUST AMMO";
            x = COLPOS(10);
            y = ROWPOS(15);
			w = COLPOS(5);
        };
		
		// Ammo Type
		class GVAR(AdjustAmmunitionType):ace_arty_bcs_RscText {
			text = "Ammunition:";
			x = COLPOS(11);
			y = ROWPOS(16);
			w = COLPOS(3);
		};
		class GVAR(AdjustAmmunitionTypeInput):ace_arty_bcs_RscComboBox {
			idc = IDC_Adjust_AdjustAmmunitionTypeSelect;
			x = COLPOS(14);
			y = ROWPOS(16);
			w = COLPOS(5);
			h = ROWPOS(1);
		};
		
		// Fuze Type
		class GVAR(AdjustFuzeType):ace_arty_bcs_RscText {
			text = "Fuze:";
			x = COLPOS(11);
			y = ROWPOS(17);
			w = COLPOS(3);
		};
		class GVAR(AdjustFuzeTypeInput):ace_arty_bcs_RscComboBox {
			idc = IDC_Adjust_AdjustFuzeTypeSelect;
			x = COLPOS(14);
			y = ROWPOS(17);
			w = COLPOS(5);
			h = ROWPOS(1);
		};
		
		// Fuze Time
		class GVAR(AdjustFuzeTime):ace_arty_bcs_RscText {
			text = "Fuze-Time:";
			x = COLPOS(11);
			y = ROWPOS(18);
			w = COLPOS(3);
		};
		class GVAR(AdjustFuzeTimeInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Adjust_AdjustFuzeTimeInput;
			x = COLPOS(14);
			y = ROWPOS(18);
			w = COLPOS(2);
		};
		
		// Round Count
		class GVAR(AdjustRoundCount):ace_arty_bcs_RscText {
			text = "Round Count:";
			x = COLPOS(11);
			y = ROWPOS(19);
			w = COLPOS(3);
		};
		class GVAR(AdjustRoundCountInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Adjust_AdjustRoundCountInput;
			x = COLPOS(14);
			y = ROWPOS(19);
			w = COLPOS(2);
		};
		
		// Sheaf
		class GVAR(AdjustSheafType):ace_arty_bcs_RscText {
			text = "Sheaf:";
			x = COLPOS(11);
			y = ROWPOS(20);
			w = COLPOS(3);
		};
		class GVAR(AdjustSheafTypeInput):ace_arty_bcs_RscComboBox {
			idc = IDC_Adjust_AdjustSheafTypeSelect;
			x = COLPOS(14);
			y = ROWPOS(20);
			w = COLPOS(5);
			h = ROWPOS(1);
		};*/
		
		class GVAR(AdjustFFEButton):ace_arty_bcs_RscButton {
			text = "FFE";
			x = COLPOS(16);
            y = ROWPOS(23);
			w = COLPOS(3);
			h = ROWPOS(2);
			colorBackground[] = {1, 0, 0, 1};
			action = QUOTE([1] call FUNC(doComputeAdjust));
		};
		
		class GVAR(AdjustAdjustButton):ace_arty_bcs_RscButton {
			text = "ADJUST";
			x = COLPOS(12);
            y = ROWPOS(23);
			w = COLPOS(3);
			h = ROWPOS(2);
			action = QUOTE([0] call FUNC(doComputeAdjust));
		};
		
		class GVAR(AdjustBackButton):ace_arty_bcs_RscButton {
			text = "BACK";
			x = COLPOS(8);
            y = ROWPOS(23);
			w = COLPOS(3);
			h = ROWPOS(2);
			action = QUOTE([] call FUNC(adjustBack));
		};
		
    };
};