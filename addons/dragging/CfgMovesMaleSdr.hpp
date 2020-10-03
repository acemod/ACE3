class CfgMovesMaleSdr: CfgMovesBasic {
    class InjuredMovedBase;
    class AgonyBaseRfl;
    class DraggerBase;
    class StandBase;

    class States {
        class AcinPknlMstpSnonWnonDnon_AcinPercMrunSnonWnonDnon: InjuredMovedBase {
            speed = -10; // 1/10
        };
        class AinjPfalMstpSnonWrflDnon_carried_Up: AgonyBaseRfl {
            speed = -10; // 1/10
        };
        class AmovPercMstpSrasWpstDnon: StandBase {
            ConnectTo[] = {
				"AmovPercMstpSrasWpstDnon",
				0.02,
				"AovrPercMstpSrasWpstDf",
				0.025,
				"AmovPercMstpSrasWpstDnon_AidlPercMstpSlowWpstDnon",
				0.0099999998,
				"PistolMagazineReloadStand",
				0.1,
				"AmovPercMstpSrasWpstDnon_AmovPercMstpSlowWpstDnon",
				0.02,
				"AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWrflDnon",
				0.02,
				"AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon",
				0.02,
				"AmovPercMstpSrasWpstDnon_AmovPercMstpSnonWnonDnon",
				0.02,
				"AmovPercMstpSrasWpstDnon_SaluteIn",
				0.02,
				"AwopPercMstpSgthWpstDnon_Part1",
				0.1,
				"AmovPercMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon",
				0.02,
				"AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWlnrDnon",
				0.02,
				"AmovPercMstpSrasWpstDnon_AadjPercMstpSrasWpstDup",
				0.02,
				"AmovPercMstpSrasWpstDnon_AadjPercMstpSrasWpstDdown",
				0.02,
				"AmovPercMstpSrasWpstDnon_AadjPercMstpSrasWpstDleft",
				0.02,
				"AmovPercMstpSrasWpstDnon_AadjPercMstpSrasWpstDright",
				0.02,
				"AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWpstDnon_gear",
				0.02,
				"Acts_starterPistol_in",
				0.001,
				"Acts_PistolRaisedStand_Default",
				1,
                "ace_dragging",
                0.1
			};
        };
		/*class RifleBaseStandActions;
		class RifleStandActions: RifleBaseStandActions
			ConnectTo[]=
			{
				"AcinPknlMstpSrasWrflDnon_AmovPpneMstpSrasWrflDnon",
				0.1,
				"ace_dragging",
				0.2
			};
		}*/
        /*class AmovPknlMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon {
			InterpolateTo[] = {
				"AidlPknlMstpSrasWpstDnon_AI",
				0.02,
				"AinvPknlMstpSlayWpstDnon_medicIn",
				0.02,
				"AinvPknlMstpSlayWpstDnon_medicOtherIn",
				0.02,
				"AmovPknlMstpSrasWpstDnon_turnL",
				0.02,
				"AmovPknlMstpSrasWpstDnon_turnR",
				0.02,
				"AmovPknlMwlkSrasWpstDf",
				0.02,
				"AmovPknlMwlkSrasWpstDfl",
				0.02,
				"AmovPknlMwlkSrasWpstDl",
				0.02,
				"AmovPknlMwlkSrasWpstDbl",
				0.02,
				"AmovPknlMwlkSrasWpstDb",
				0.02,
				"AmovPknlMwlkSrasWpstDbr",
				0.02,
				"AmovPknlMwlkSrasWpstDr",
				0.02,
				"AmovPknlMwlkSrasWpstDfr",
				0.02,
				"AmovPknlMrunSrasWpstDf",
				0.02,
				"AmovPknlMrunSrasWpstDfl",
				0.02,
				"AmovPknlMrunSrasWpstDl",
				0.02,
				"AmovPknlMrunSrasWpstDbl",
				0.02,
				"AmovPknlMrunSrasWpstDb",
				0.02,
				"AmovPknlMrunSrasWpstDbr",
				0.02,
				"AmovPknlMrunSrasWpstDr",
				0.02,
				"AmovPknlMrunSrasWpstDfr",
				0.02,
				"Unconscious",
				0.02,
				"AovrPercMstpSrasWpstDf",
				0.029999999,
				"AmovPercMstpSrasWpstDnon_AcinPknlMwlkSnonWpstDb_2",
				0.2,
				"AmovPknlMstpSrasWpstDnon_relax",
				0.2,
				"AinvPercMstpSrasWrflDnon",
				0.050000001,
				"AmovPknlMstpSrasWpstDnon_AinvPknlMstpSrasWpstDnon",
				0.02,
				"AmovPknlMstpSrasWpstDnon_AinvPknlMstpSrasWpstDnon_Putdown",
				0.02,
				"AmovPknlMstpSrasWpstDnon_AmovPercMstpSrasWpstDnon",
				0.02,
				"AmovPknlMstpSrasWpstDnon_AmovPercMsprSrasWpstDf",
				0.0099999998,
				"AmovPknlMstpSrasWpstDnon_AmovPpneMstpSrasWpstDnon",
				0.02,
				"AfalPknlMstpSrasWpstDnon",
				0.025,
				"Campaign_Base",
				0.0099999998,
				"AmovPknlMlmpSrasWpstDfl",
				0.050000001,
				"AmovPknlMlmpSrasWpstDf",
				0.050000001,
				"AmovPknlMlmpSrasWpstDl",
				0.050000001,
				"AmovPknlMlmpSrasWpstDbl",
				0.050000001,
				"AmovPknlMlmpSrasWpstDb",
				0.050000001,
				"AmovPknlMlmpSrasWpstDbr",
				0.050000001,
				"AmovPknlMlmpSrasWpstDr",
				0.050000001,
				"AmovPknlMlmpSrasWpstDfr",
				0.050000001,
				"UnconsciousMedicFromPistolKneel",
				0.2,
                "ace_dragging",
                0.1,
                "ace_dragging_static",
                0.1
			};
        };*/
        class ace_dragging: DraggerBase {
            actions = "ace_MoveWithInjuredManDraggerPst";
            file = QPATHTO_T(anim\ace_dragging.rtm);
            enableDirectControl = 1;
            showHandGun = 1;
            looped = 1;
            duty = 0.6;
            interpolationSpeed = 5;
            disableWeapons = 0;
            enableBinocular = 0;
            canPullTrigger = 1;
            limitGunMovement = 0.2;
            canReload = 0;
            aimingBody = "aimingPistol";
            aiming = "aimingPistol";
            aimPrecision = 5;
            turnSpeed = 0.5;
            ConnectTo[]=
            {
                "ace_dragging",
                0.1,
                "ace_dragging_drop",
                0.2
            };
            InterpolateTo[]=
            {
                "ace_dragging_static",
                0.1/*,
                "AcinPknlMwlkSnonWpstDb_death",
                0.2,
                "AcinPknlMwlkSnonWpstDb_agony",
                0.2*/
            };
        };
        class ace_dragging_static: ace_dragging {
            looped = 1;
            speed = 0;
            ConnectTo[]=
            {
                "ace_dragging",
                0.1,
                "ace_dragging_drop",
                0.2
            };
            InterpolateTo[]=
            {
                /*"AcinPknlMwlkSnonWpstDb_AmovPercMstpSrasWpstDnon",
                0.15000001,*/
                /*"AcinPknlMstpSnonWpstDnon_AmovPknlMstpSrasWpstDnon",
                0.1,*/
                "ace_dragging",
                0.1,
                "ace_dragging_drop",
                0.2/*,
                "AcinPknlMwlkSnonWpstDb_death",
                0.2,
                "AcinPknlMwlkSnonWpstDb_agony",
                0.2,
                "Helper_SwitchToCarrynon_pst",
                0.1*/
            };
        };
        class ace_dragging_drop: ace_dragging {
            file = QPATHTO_T(anim\ace_dragging_drop.rtm);
            looped = 0;
            interpolationSpeed = 1;
            ConnectTo[]=
            {
                "AmovPknlMstpSrasWpstDnon",
				0.1
            };
            InterpolateTo[]=
            {
				"Unconscious",
				0.02
            };
        };
    };
};
