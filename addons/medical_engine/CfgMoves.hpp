
class CfgMovesBasic;
class CfgMovesMaleSdr: CfgMovesBasic {
    class States {
        // fixes hand being stuck at rifle which is on the back
        class AmovPknlMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon;
        class AinvPknlMstpSlayWnonDnon_medicOther: AmovPknlMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon {
            weaponIK = 0;
        };

        class DeadState;
        class UNCON_ANIM(1): DeadState {
            file = QPATHTO_T(data\ace_unconscious_1.rtm);
        };

        class UNCON_ANIM(2): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_2.rtm);
        };

        class UNCON_ANIM(3): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_3.rtm);
        };

        class UNCON_ANIM(4): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_4.rtm);
        };

        class UNCON_ANIM(5): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_5.rtm);
        };

        class UNCON_ANIM(6): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_6.rtm);
        };

        class UNCON_ANIM(7): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_7.rtm);
        };

        class UNCON_ANIM(8): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_8.rtm);
        };

        class UNCON_ANIM(1_1): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_1_1.rtm);
        };

        class UNCON_ANIM(2_1): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_2_1.rtm);
        };

        class UNCON_ANIM(3_1): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_3_1.rtm);
        };

        class UNCON_ANIM(4_1): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_4_1.rtm);
        };

        class UNCON_ANIM(5_1): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_5_1.rtm);
        };

        class UNCON_ANIM(6_1): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_6_1.rtm);
        };

        class UNCON_ANIM(7_1): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_7_1.rtm);
        };

        class UNCON_ANIM(8_1): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_8_1.rtm);
        };

        /* added for the "ace_unc" part */
        class KIA_passenger_boat_holdleft;
        class UNCON_ANIM(9): KIA_passenger_boat_holdleft {};

        class KIA_driver_boat01;
        class UNCON_ANIM(10): KIA_driver_boat01 {};

        class Unconscious;
        class UNCON_ANIM(faceDown): Unconscious {};

        class UNCON_ANIM(faceLeft): Unconscious {};

        class UNCON_ANIM(faceRight): Unconscious {};

        class UNCON_ANIM(faceUp): Unconscious {};

        class AmovPpneMstpSnonWnonDnon;
        class ACE_UnconsciousOutProne: AmovPpneMstpSnonWnonDnon {
            //file = "\A3\anims_f\Data\Anim\Sdr\dth\pne\stp\ras\Rfl\AdthPpneMstpSrasWrflDnon_1";
            looped = 0;
            canBlendStep = 0;
            blockMobileSwitching = 1;
            forceAim = 1;
            interpolationRestart = 1;
            variantsPlayer[] = {};
            variantsAI[] = {};
            useIdles = 0;
            InterpolateTo[] = {"Unconscious",0.2};
            ConnectTo[] = {"AmovPpneMstpSnonWnonDnon",0.2};
            speed = 100;
        };
    };
};
