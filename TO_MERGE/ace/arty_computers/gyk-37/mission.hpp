class ace_arty_bcs_mission:ace_arty_bcs_ControlGroup {
    idc = MISSION_ID;
    class controls {
        class GVAR(welcome):ace_arty_bcs_RscText {
            text = "AN/GYK-37 Battery Computer System (BCS)";
            x = 0;
            y = ROWPOS(0);
        };
		
		// GRID FIELDS	
		class ace_arty_bcs_mission_grid:ace_arty_bcs_ControlGroup {
			idc = MAIN_ID_GRID;
			x = 0;
			y = ROWPOS(2);
			h = ROWPOS(8);
			w = COLPOS(10);
			class controls {
				class GVAR(welcome):ace_arty_bcs_RscText {
					text = "MISSION GRID REFERENCE";
					x = 0;
					y = ROWPOS(0);
				};
				// Battery Grid
				class GVAR(MissionGridGrid):ace_arty_bcs_RscText {
					text = "Grid:";
					x = COLPOS(1);
					y = ROWPOS(1);
					w = COLPOS(2);
				};
				class GVAR(MissionGridGridInput):ace_arty_bcs_RscTextBox {
					idc = IDC_Mission_MissionGridGridInput;
					x = COLPOS(4);
					y = ROWPOS(1);
					w = COLPOS(3);
					text = "";
					ACE_BCS_InputName = "Target Grid";
					ACE_BCS_Require = BCS_REQUIRE_TRUE;
					ACE_BCS_Type = BCS_FIELD_GRID;
				};
				
				// Battery Altitude
				class GVAR(MissionGridAlt):ace_arty_bcs_RscText {
					text = "Alt:";
					x = COLPOS(1);
					y = ROWPOS(2);
					w = COLPOS(2);
				};
				class GVAR(MissionGridAltInput):ace_arty_bcs_RscTextBox {
					idc = IDC_Mission_MissionGridAltInput;
					x = COLPOS(4);
					y = ROWPOS(2);
					w = COLPOS(2);
					text = "";
					ACE_BCS_InputName = "Target Altitude";
					ACE_BCS_Require = BCS_REQUIRE_TRUE;
					ACE_BCS_Type = BCS_FIELD_NUMBER;
				};
			};
		};

		// POLAR FIELDS		
		class ace_arty_bcs_mission_polar:ace_arty_bcs_ControlGroup {
			idc = MAIN_ID_POLAR;
			x = 0;
			y = ROWPOS(2);
			h = ROWPOS(8);
			w = COLPOS(10);
			class controls {
				class GVAR(welcome):ace_arty_bcs_RscText {
					text = "MISSION POLAR COORDINATES";
					x = 0;
					y = ROWPOS(0);
				};
				
				class GVAR(MissionPolarObserverSelect):ace_arty_bcs_RscText {
					text = "Select:";
					x = COLPOS(1);
					y = ROWPOS(1);
					w = COLPOS(2);
				};
				class GVAR(MissionPolarObserverSelectInput):ace_arty_bcs_RscComboBox {
					idc = IDC_Mission_MissionPolarObserverSelect;
					x = COLPOS(4);
					y = ROWPOS(1);
					w = COLPOS(5);
					h = ROWPOS(1);
					onLBSelChanged = QUOTE([ARR_4(IDC_Mission_MissionPolarObserverSelect,IDC_Mission_MissionPolarObserverInput,IDC_Mission_MissionPolarObserverPosInput,IDC_Mission_MissionPolarObserverAltInput)] call FUNC(selectObserver));
				};
				
				// Observer Callsign
				class GVAR(MissionPolarObserver):ace_arty_bcs_RscText {
					text = "Observer:";
					x = COLPOS(1);
					y = ROWPOS(2);
					w = COLPOS(2);
				};
				class GVAR(MissionPolarObserverInput):ace_arty_bcs_RscTextBox {
					idc = IDC_Mission_MissionPolarObserverInput;
					x = COLPOS(4);
					y = ROWPOS(2);
					w = COLPOS(2);
				};
				
				// Observer Pos
				class GVAR(MissionPolarObserverPos):ace_arty_bcs_RscText {
					text = "Observer Grid:";
					x = COLPOS(1);
					y = ROWPOS(3);
					w = COLPOS(3);
				};
				class GVAR(MissionPolarObserverPosInput):ace_arty_bcs_RscTextBox {
					idc = IDC_Mission_MissionPolarObserverPosInput;
					x = COLPOS(4);
					y = ROWPOS(3);
					w = COLPOS(3);
					ACE_BCS_InputName = "Observer Grid";
					ACE_BCS_Require = BCS_REQUIRE_TRUE;
					ACE_BCS_Type = BCS_FIELD_GRID;
				};
				
				// Observer Alt
				class GVAR(MissionPolarObserverAlt):ace_arty_bcs_RscText {
					text = "Observer Alt:";
					x = COLPOS(1);
					y = ROWPOS(4);
					w = COLPOS(3);
				};
				class GVAR(MissionPolarObserverAltInput):ace_arty_bcs_RscTextBox {
					idc = IDC_Mission_MissionPolarObserverAltInput;
					x = COLPOS(4);
					y = ROWPOS(4);
					w = COLPOS(2);
					ACE_BCS_InputName = "Observer Altitude";
					ACE_BCS_Require = BCS_REQUIRE_TRUE;
					ACE_BCS_Type = BCS_FIELD_NUMBER;
				};
				
				class GVAR(MissionPolarUpdateAddObserver):ace_arty_bcs_RscButton {
					text = "Add/Update";
					x = COLPOS(7);
					y = ROWPOS(4);
					w = COLPOS(2);
					h = ROWPOS(1);
					action = QUOTE([ARR_4(IDC_Mission_MissionPolarObserverSelect,IDC_Mission_MissionPolarObserverInput,IDC_Mission_MissionPolarObserverPosInput,IDC_Mission_MissionPolarObserverAltInput)] call FUNC(modifyObserver));
				};
				
				// Observer-Target Direction
				class GVAR(MissionPolarOTDir):ace_arty_bcs_RscText {
					text = "OT Dir:";
					x = COLPOS(1);
					y = ROWPOS(5);
					w = COLPOS(2);
				};
				class GVAR(MissionPolarOTDirInput):ace_arty_bcs_RscTextBox {
					idc = IDC_Mission_MissionPolarOTDirInput;
					x = COLPOS(4);
					y = ROWPOS(5);
					w = COLPOS(2);
					ACE_BCS_InputName = "Observer Target Direction";
					ACE_BCS_Require = BCS_REQUIRE_TRUE;
					ACE_BCS_Type = BCS_FIELD_NUMBER;
					ACE_BCS_MinNumber = 0;
					ACE_BCS_MaxNumber = 6400;
				};
				
				// Range
				class GVAR(MissionPolarRange):ace_arty_bcs_RscText {
					text = "Range:";
					x = COLPOS(1);
					y = ROWPOS(6);
					w = COLPOS(2);
				};
				class GVAR(MissionPolarRangeInput):ace_arty_bcs_RscTextBox {
					idc = IDC_Mission_MissionPolarRangeInput;
					x = COLPOS(4);
					y = ROWPOS(6);
					w = COLPOS(2);
					ACE_BCS_InputName = "Target Range";
					ACE_BCS_Require = BCS_REQUIRE_TRUE;
					ACE_BCS_Type = BCS_FIELD_NUMBER;
				};
				
				// Alt
				class GVAR(MissionPolarAlt):ace_arty_bcs_RscText {
					text = "Alt Dif:";
					x = COLPOS(1);
					y = ROWPOS(7);
					w = COLPOS(2);
				};
				class GVAR(MissionPolarAltInput):ace_arty_bcs_RscTextBox {
					idc = IDC_Mission_MissionPolarAltDifInput;
					x = COLPOS(4);
					y = ROWPOS(7);
					w = COLPOS(2);
					ACE_BCS_InputName = "Altitude Difference";
					ACE_BCS_Require = BCS_REQUIRE_TRUE;
					ACE_BCS_Type = BCS_FIELD_NUMBER;
				};
			};
		};

		// SHIFT FIELDS		
		class ace_arty_bcs_mission_shift:ace_arty_bcs_ControlGroup {
			idc = MAIN_ID_SHIFT;
			x = 0;
			y = ROWPOS(2);
			h = ROWPOS(8);
			w = COLPOS(10);
			class controls {
				class GVAR(welcome):ace_arty_bcs_RscText {
					text = "MISSION SHIFT KNOWN POINT";
					x = 0;
					y = ROWPOS(0);
				};
				class GVAR(MissionShiftKnownPointSelect):ace_arty_bcs_RscText {
					text = "Select:";
					x = COLPOS(1);
					y = ROWPOS(1);
					w = COLPOS(2);
				};
				class GVAR(MissionShiftKnowPointSelectInput):ace_arty_bcs_RscComboBox {
					idc = IDC_Mission_MissionShiftKnowPointSelect;
					x = COLPOS(4);
					y = ROWPOS(1);
					w = COLPOS(5);
					h = ROWPOS(1);
				};
				
				// OT Dir
				class GVAR(MissionShiftOTDir):ace_arty_bcs_RscText {
					text = "OT. Dir:";
					x = COLPOS(1);
					y = ROWPOS(2);
					w = COLPOS(2);
				};
				class GVAR(MissionShiftOTDirInput):ace_arty_bcs_RscTextBox {
					idc = IDC_Mission_MissionShiftOTDirInput;
					x = COLPOS(4);
					y = ROWPOS(2);
					w = COLPOS(2);
					ACE_BCS_InputName = "Observer Target Direction";
					ACE_BCS_Require = BCS_REQUIRE_TRUE;
					ACE_BCS_Type = BCS_FIELD_NUMBER;
					ACE_BCS_MinNumber = 0;
					ACE_BCS_MaxNumber = 6400;
				};
				
				// Left/Right
				class GVAR(MissionShiftLeftRight):ace_arty_bcs_RscText {
					text = "Left/Right:";
					x = COLPOS(1);
					y = ROWPOS(3);
					w = COLPOS(2);
				};
				class GVAR(MissionShiftLeftRightInput):ace_arty_bcs_RscTextBox {
					idc = IDC_Mission_MissionShiftLeftRightInput;
					x = COLPOS(4);
					y = ROWPOS(3);
					w = COLPOS(2);
					ACE_BCS_InputName = "Lateral Difference";
					ACE_BCS_Require = BCS_REQUIRE_TRUE;
					ACE_BCS_Type = BCS_FIELD_NUMBER;
				};
				
				// Add/Drop
				class GVAR(MissionShiftAddDrop):ace_arty_bcs_RscText {
					text = "Add/Drop:";
					x = COLPOS(1);
					y = ROWPOS(4);
					w = COLPOS(2);
				};
				class GVAR(MissionShiftAddDropInput):ace_arty_bcs_RscTextBox {
					idc = IDC_Mission_MissionShiftAddDropInput;
					x = COLPOS(4);
					y = ROWPOS(4);
					w = COLPOS(2);
					ACE_BCS_InputName = "Range Difference";
					ACE_BCS_Require = BCS_REQUIRE_TRUE;
					ACE_BCS_Type = BCS_FIELD_NUMBER;
				};
				
				// Up/Down
				class GVAR(MissionShiftUpDown):ace_arty_bcs_RscText {
					text = "Up/Down:";
					x = COLPOS(1);
					y = ROWPOS(5);
					w = COLPOS(2);
				};
				class GVAR(MissionShiftUpDownInput):ace_arty_bcs_RscTextBox {
					idc = IDC_Mission_MissionShiftUpDownInput;
					x = COLPOS(4);
					y = ROWPOS(5);
					w = COLPOS(2);
					ACE_BCS_InputName = "Altitude Difference";
					ACE_BCS_Require = BCS_REQUIRE_TRUE;
					ACE_BCS_Type = BCS_FIELD_NUMBER;
				};
			};
		};
		
		/*
		Target Description:
		TextBox: Target Description
		Field: Radius/Width
		Field: Length (if circular not filled)
		Field: Attitude (that is aTTitude, not altitude)
		*/
		class GVAR(targetDescriptionSection):ace_arty_bcs_RscText {
            text = "TARGET DESCRIPTION";
            x = 0;
            y = ROWPOS(11);
        };
		
		// Target Description
		class GVAR(TargetDesc):ace_arty_bcs_RscText {
			text = "Target Desc.:";
			x = COLPOS(1);
			y = ROWPOS(12);
			w = COLPOS(2);
		};
		class GVAR(TargetDescInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Mission_TargetDescInput;
			style = ST_MULTI;
			x = COLPOS(4);
			y = ROWPOS(12);
			w = COLPOS(5);
			h = ROWPOS(2);
		};
		
		// Radius/Width
		class GVAR(TargetRadiusWidth):ace_arty_bcs_RscText {
			text = "Radius/Width:";
			x = COLPOS(1);
			y = ROWPOS(14);
			w = COLPOS(3);
		};
		class GVAR(TargetRadiusWidthInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Mission_TargetRadiusWidthInput;
			x = COLPOS(4);
			y = ROWPOS(14);
			w = COLPOS(2);
			h = ROWPOS(1);
		};
		
		// Length
		class GVAR(TargetLength):ace_arty_bcs_RscText {
			text = "Length:";
			x = COLPOS(1);
			y = ROWPOS(15);
			w = COLPOS(2);
		};
		class GVAR(TargetLengthInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Mission_TargetLengthInput;
			x = COLPOS(4);
			y = ROWPOS(15);
			w = COLPOS(2);
			h = ROWPOS(1);
		};
		
		// Length
		class GVAR(TargetAttitude):ace_arty_bcs_RscText {
			text = "Attitude:";
			x = COLPOS(1);
			y = ROWPOS(16);
			w = COLPOS(2);
		};
		class GVAR(TargetAttitudeInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Mission_TargetAttitudeInput;
			x = COLPOS(4);
			y = ROWPOS(16);
			w = COLPOS(2);
			h = ROWPOS(1);
		};
		
		/*
		Method of Engagment:
		ToolBox: Danger Close (Yes/No)
		TextBox: Notes (for type of adjustment, desired angle, marking, etc)
		MultiSelect: Ammunition
		MultiSelect: Fuze
		Field: Fuze-Time (ignored for PD/SQ, Prox, and default time fuze rounds)
		Field: Round Count
		MultiSelect: Distribution (Sheaf)
		*/
		class GVAR(methodOfEngagementSection):ace_arty_bcs_RscText {
            text = "METHOD OF ENGAGEMENT";
            x = COLPOS(11);
            y = ROWPOS(2);
        };
		
		// Danger Close
		class GVAR(EngageDangerClose):ace_arty_bcs_RscText {
			text = "Danger Close:";
			x = COLPOS(12);
			y = ROWPOS(3);
			w = COLPOS(3);
		};
		class GVAR(EngageDangerCloseInput):ace_arty_bcs_CheckBox {
			idc = IDC_Mission_EngageDangerCloseInput;
			x = COLPOS(15);
			y = ROWPOS(3);
			w = COLPOS(2);
			h = ROWPOS(1);
		};
		
		// Notes
		class GVAR(EngageNotes):ace_arty_bcs_RscText {
			text = "Notes:";
			x = COLPOS(12);
			y = ROWPOS(4);
			w = COLPOS(3);
		};
		class GVAR(EngageNotesInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Mission_EngageNotesInput;
			style = ST_MULTI;
			x = COLPOS(15);
			y = ROWPOS(4);
			w = COLPOS(5);
			h = ROWPOS(2);
		};
		
		// Ammo Type
		class GVAR(EngageAmmunitionType):ace_arty_bcs_RscText {
			text = "Ammunition:";
			x = COLPOS(12);
			y = ROWPOS(6);
			w = COLPOS(3);
		};
		class GVAR(EngageAmmunitionTypeInput):ace_arty_bcs_RscComboBox {
			idc = IDC_Mission_EngageAmmunitionTypeSelect;
			x = COLPOS(15);
			y = ROWPOS(6);
			w = COLPOS(5);
			h = ROWPOS(1);
			onLBSelChanged = QUOTE(_this call FUNC(ammoSelectChange));
		};
		
		// Fuze Type
		class GVAR(EngageFuzeType):ace_arty_bcs_RscText {
			text = "Fuze:";
			x = COLPOS(12);
			y = ROWPOS(7);
			w = COLPOS(3);
		};
		class GVAR(EngageFuzeTypeInput):ace_arty_bcs_RscComboBox {
			idc = IDC_Mission_EngageFuzeTypeSelect;
			x = COLPOS(15);
			y = ROWPOS(7);
			w = COLPOS(5);
			h = ROWPOS(1);
		};
		
		// Fuze Time
		class GVAR(EngageFuzeTime):ace_arty_bcs_RscText {
			text = "Fuze-Time:";
			x = COLPOS(12);
			y = ROWPOS(8);
			w = COLPOS(3);
		};
		class GVAR(EngageFuzeTimeInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Mission_EngageFuzeTimeInput;
			x = COLPOS(15);
			y = ROWPOS(8);
			w = COLPOS(2);
		};
		
		// Round Count
		class GVAR(EngageRoundCount):ace_arty_bcs_RscText {
			text = "Round Count:";
			x = COLPOS(12);
			y = ROWPOS(9);
			w = COLPOS(3);
		};
		class GVAR(EngageRoundCountInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Mission_EngageRoundCountInput;
			x = COLPOS(15);
			y = ROWPOS(9);
			w = COLPOS(2);
			text = "";
			ACE_BCS_InputName = "Round Count";
			ACE_BCS_Require = BCS_REQUIRE_TRUE;
			ACE_BCS_MinNumber = 0;
			ACE_BCS_Type = BCS_FIELD_NUMBER;
		};
		
		// Adjust Round Count
		class GVAR(EngageAdjustRoundCount):ace_arty_bcs_RscText {
			text = "Adj. Round Count:";
			x = COLPOS(12);
			y = ROWPOS(10);
			w = COLPOS(3);
		};
		class GVAR(EngageRoundAdjustCountInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Mission_EngageAdjustRoundCountInput;
			x = COLPOS(15);
			y = ROWPOS(10);
			w = COLPOS(2);
			text = "1";
			ACE_BCS_InputName = "Adjust Round Count";
			ACE_BCS_Require = BCS_REQUIRE_TRUE;
			ACE_BCS_MinNumber = 0;
			ACE_BCS_Type = BCS_FIELD_NUMBER;
		};
		
		// Adjust Piece
		class GVAR(EngageAdjustPiece):ace_arty_bcs_RscText {
			text = "Adjust Piece:";
			x = COLPOS(12);
			y = ROWPOS(11);
			w = COLPOS(3);
		};
		class GVAR(EngageAdjustPieceInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Mission_EngageAdjustPieceInput;
			x = COLPOS(15);
			y = ROWPOS(11);
			w = COLPOS(2);
			text = "1";
			ACE_BCS_InputName = "Adjust Piece";
			ACE_BCS_Require = BCS_REQUIRE_TRUE;
			ACE_BCS_MinNumber = 1;
			ACE_BCS_Type = BCS_FIELD_NUMBER;
		};
		
		// Sheaf
		class GVAR(EngageSheafType):ace_arty_bcs_RscText {
			text = "Sheaf:";
			x = COLPOS(12);
			y = ROWPOS(12);
			w = COLPOS(3);
		};
		class GVAR(EngageSheafTypeInput):ace_arty_bcs_RscComboBox {
			idc = IDC_Mission_EngageSheafTypeSelect;
			x = COLPOS(15);
			y = ROWPOS(12);
			w = COLPOS(5);
			h = ROWPOS(1);
		};
		
		
		class GVAR(methodOfControlSection):ace_arty_bcs_RscText {
            text = "METHOD OF CONTROL";
            x = COLPOS(11);
            y = ROWPOS(14);
        };
		
		// Method of Control
		class GVAR(ControlMethodOfControl):ace_arty_bcs_RscText {
			text = "Method:";
			x = COLPOS(12);
			y = ROWPOS(15);
			w = COLPOS(3);
		};
		class GVAR(ControlMethodOfControlInput):ace_arty_bcs_RscComboBox {
			idc = IDC_Mission_ControlMethodOfControlSelect;
			x = COLPOS(15);
			y = ROWPOS(15);
			w = COLPOS(5);
			h = ROWPOS(1);
		};
		
		// Time From Now
		class GVAR(ControlTimeFromNow):ace_arty_bcs_RscText {
			text = "Time From Now:";
			x = COLPOS(12);
			y = ROWPOS(16);
			w = COLPOS(3);
		};
		class GVAR(ControlTimeFromNowInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Mission_ControlTimeFromNowInput;
			x = COLPOS(15);
			y = ROWPOS(16);
			w = COLPOS(2);
		};
		
		// Time Clock
		class GVAR(ControlTimeClock):ace_arty_bcs_RscText {
			text = "Clock Time:";
			x = COLPOS(12);
			y = ROWPOS(17);
			w = COLPOS(3);
		};
		class GVAR(ControlTimeClockInput):ace_arty_bcs_RscTextBox {
			idc = IDC_Mission_ControlTimeClockInput;
			x = COLPOS(15);
			y = ROWPOS(17);
			w = COLPOS(2);
		};
		
		class GVAR(MissionFFEButton):ace_arty_bcs_RscButton {
			text = "FIRE FOR EFFECT";
			x = COLPOS(16);
            y = ROWPOS(21);
			w = COLPOS(3);
			h = ROWPOS(2);
			colorBackground[] = {1, 0, 0, 1};
			action = QUOTE([false] call FUNC(doCompute));
		};
		
		class GVAR(MissionAjustButton):ace_arty_bcs_RscButton {
			text = "ADJUST";
			x = COLPOS(12);
            y = ROWPOS(21);
			w = COLPOS(3);
			h = ROWPOS(2);
			action = QUOTE([true] call FUNC(doCompute));
		};
		
		class GVAR(MissionBackButton):ace_arty_bcs_RscButton {
			text = "BACK";
			x = COLPOS(1);
            y = ROWPOS(21);
			w = COLPOS(3);
			h = ROWPOS(2);
			action = QUOTE([] call FUNC(returnMainScreen));
		};
		
    };
};