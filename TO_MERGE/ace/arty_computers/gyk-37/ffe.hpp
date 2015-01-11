class ace_arty_bcs_ffe:ace_arty_bcs_ControlGroup {
    idc = FFE_ID;
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
			idc = IDC_FFE_lowDisplay;
			style = ST_MULTI;
            text = "low low low low";
            x = COLPOS(1);
            y = ROWPOS(2);
			w = COLPOS(18);
			h = COLPOS(1.2);
        };
		
		class GVAR(SolutionUp):ace_arty_bcs_RscButton {
			text = "PREV.";
			x = COLPOS(1);
			y = ROWPOS(4);
			w = COLPOS(2);
			h = ROWPOS(1);
			action = QUOTE([ARR_2(-1,false)] call FUNC(changeSolution));
		};
		
		class GVAR(SolutionDown):ace_arty_bcs_RscButton {
			text = "NEXT";
			x = COLPOS(4);
			y = ROWPOS(4);
			w = COLPOS(2);
			h = ROWPOS(1);
			action = QUOTE([ARR_2(1,false)] call FUNC(changeSolution));
		};
		
		// MESSAGE TO OBSERVER
		class GVAR(MTOlow):ace_arty_bcs_RscText {
            text = "MESSAGE TO OBSERVER";
            x = COLPOS(0);
            y = ROWPOS(5);
			w = COLPOS(5);
        };
		
		class GVAR(MTODisplayLow):ace_arty_bcs_RscText {
			idc = IDC_FFE_MTODisplayLow;
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
			action = QUOTE([ARR_2(0,IDC_FFE_TTIDisplay)] call FUNC(callShot));
		};
		
		class GVAR(TTI):ace_arty_bcs_RscText {
            text = "TTI:";
            x = COLPOS(7);
            y = ROWPOS(9);
			w = COLPOS(1);
        };
		class GVAR(TTIDisplay):ace_arty_bcs_RscText {
			idc = IDC_FFE_TTIDisplay;
            text = "00.0";
            x = COLPOS(8);
            y = ROWPOS(9);
			w = COLPOS(2);
        };
		
		// ADJUST
		class GVAR(BDA):ace_arty_bcs_RscText {
            text = "BATTLE DAMAGE ASSESSMENT";
            x = COLPOS(0);
            y = ROWPOS(15);
			w = COLPOS(5);
        };
		
		class GVAR(BDAInput):ace_arty_bcs_RscTextBox {
			idc = IDC_FFE_BDAInput;
			style = ST_MULTI;
			x = COLPOS(1);
			y = ROWPOS(16);
			w = COLPOS(18);
			h = ROWPOS(3);
		};
		
		class GVAR(Adjust):ace_arty_bcs_RscText {
            text = "NOTES";
            x = COLPOS(0);
            y = ROWPOS(19);
			w = COLPOS(5);
        };
		
		class GVAR(EngageNotesInput):ace_arty_bcs_RscTextBox {
			idc = IDC_FFE_Notes;
			style = ST_MULTI;
			x = COLPOS(1);
			y = ROWPOS(20);
			w = COLPOS(18);
			h = ROWPOS(2);
		};
		
		class GVAR(CloseMissionButton):ace_arty_bcs_RscButton {
			text = "CLOSE MISSION";
			x = COLPOS(16);
            y = ROWPOS(23);
			w = COLPOS(3);
			h = ROWPOS(2);
			action = QUOTE([] call FUNC(endMission));
		};
		
		class GVAR(FFEBackButton):ace_arty_bcs_RscButton {
			text = "BACK";
			x = COLPOS(1);
            y = ROWPOS(23);
			w = COLPOS(3);
			h = ROWPOS(2);
			action = QUOTE([] call FUNC(ffeBack));
		};
		
    };
};