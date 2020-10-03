class CfgMovesMaleSdr: CfgMovesBasic {
        class InjuredMovedBase;
        class AgonyBaseRfl;
        class StandBase;
        class DraggerBase;

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
        class ace_dragging: DraggerBase {
            actions = "ace_MoveWithInjuredManDraggerPst";
            aiming = "aimingPistol";
            aimingBody = "aimingPistol";
            aimPrecision = 5;
            canPullTrigger = 1;
            canReload = 0;
            ConnectTo[]=
            {
                "ace_dragging",
                0.1,
                "ace_dragging_drop",
                0.2
            };
            disableWeapons = 0;
            duty = 0.6;
            enableBinocular = 0;
            file = QPATHTO_T(anim\ace_dragging.rtm);
            InterpolateTo[]=
            {
                "ace_dragging_static",
                0.1
            };
            interpolationSpeed = 5;
            limitGunMovement = 0.2;
            looped = 1;
            showHandGun = 1;
            turnSpeed = 0.5;
        };
        class ace_dragging_static: ace_dragging {
            ConnectTo[]=
            {
                "ace_dragging",
                0.1,
                "ace_dragging_drop",
                0.2
            };
            InterpolateTo[]=
            {
                "ace_dragging",
                0.1,
                "ace_dragging_drop",
                0.2
            };
            looped = 1;
            speed = 0;
        };
        class ace_dragging_drop: ace_dragging {
            ConnectTo[]=
            {
                "AmovPknlMstpSrasWpstDnon",
                0.1
            };
            file = QPATHTO_T(anim\ace_dragging_drop.rtm);
            InterpolateTo[]=
            {
                "Unconscious",
                0.02
            };
            interpolationSpeed = 2;
            looped = 0;
        };
    };
};
