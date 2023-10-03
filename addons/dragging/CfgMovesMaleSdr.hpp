class CfgMovesMaleSdr: CfgMovesBasic {
    class InjuredMovedBase;
    class AgonyBaseRfl;
    class StandBase;

    class States {
        class AcinPknlMstpSnonWnonDnon_AcinPercMrunSnonWnonDnon: InjuredMovedBase {
            speed = -10; // 1/10
        };

        class AinjPfalMstpSnonWrflDnon_carried_Up: AgonyBaseRfl {
            speed = -10; // 1/10
        };

        // For dragging with rifles
        class AmovPercMstpSlowWrflDnon;
        class AmovPercMstpSrasWrflDnon: AmovPercMstpSlowWrflDnon {
            ConnectTo[] += {
                "ace_dragging_rifle_limpB",
                0.1
            };
        };

        class AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_1;
        class AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2: AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_1 {
            aiming = "aimingDefault";
            aimingBody = "aimingUpDefault";
            aimPrecision = 5; // default: 1
            ConnectTo[] += {
                "ace_dragging_rifle_limpB",
                0.1
            };
            InterpolateTo[] += {
                "ace_dragging_rifle_limpB",
                0.1
            };
        };

        class AcinPknlMstpSrasWrflDnon: AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_1 {
            ConnectTo[] += {
                "ace_dragging_rifle_limpB",
                0.1
            };
            InterpolateTo[] += {
                "ace_dragging_rifle_limpB",
                0.1
            };
        };

        class AcinPknlMwlkSrasWrflDb: AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_1 {
            ConnectTo[] += {
                "ace_dragging_rifle_limpB",
                0.1
            };
            InterpolateTo[] += {
                "ace_dragging_rifle_limpB",
                0.1
            };
        };

        class ace_dragging_rifle_limpB: AcinPknlMwlkSrasWrflDb {
            speed = 0.5;
        };

        // For dragging with pistols
        class AmovPercMstpSrasWpstDnon: StandBase {
            ConnectTo[] += {
                "ace_dragging",
                0.1,
                "ace_dragging_limpB",
                0.1,
                "ace_dragging_static",
                0.1
            };
        };

        class DraggerBase;
        class ace_dragging: DraggerBase {
            actions = "ACE_MoveWithInjuredManDraggerPst";
            aiming = "aimingPistol";
            aimingBody = "aimingPistol";
            aimPrecision = 2; // default: 1
            canPullTrigger = 1;
            canReload = 0;
            ConnectTo[] = {
                "ace_dragging",
                0.1,
                "ace_dragging_limpB",
                0.1,
                "ace_dragging_drop",
                0.2,
                "ace_dragging_static",
                0.1
            };
            disableWeapons = 0;
            duty = 0.6;
            enableBinocular = 0;
            file = QPATHTO_T(anim\ace_dragging.rtm);
            InterpolateTo[] = {
                "ace_dragging",
                0.1,
                "ace_dragging_limpB",
                0.1,
                "ace_dragging_drop",
                0.2,
                "ace_dragging_static",
                0.1
            };
            interpolationSpeed = 5;
            limitGunMovement = 0.2;
            looped = 1;
            showHandGun = 1;
            turnSpeed = 0.5;
        };

        class ace_dragging_limpB: ace_dragging {
            speed = 0.5;
        };

        class ace_dragging_static: ace_dragging {
            speed = 0;
        };

        class ace_dragging_drop: ace_dragging {
            ConnectTo[] = {
                "AmovPknlMstpSrasWpstDnon",
                0.1
            };
            file = QPATHTO_T(anim\ace_dragging_drop.rtm);
            InterpolateTo[] = {
                "Unconscious",
                0.02
            };
            interpolationSpeed = 5;
            looped = 0;
        };
    };
};
