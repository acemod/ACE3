
class CfgMovesBasic;
class CfgMovesMaleSdr: CfgMovesBasic {
    class States {
        // fixes hand being stuck at rifle which is on the back
        class AmovPknlMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon;
        class AinvPknlMstpSlayWnonDnon_medicOther: AmovPknlMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon {
            weaponIK = 0;
        };

        class Unconscious;
        class DeadState;
        class ace_unconscious_1: DeadState {
            file = QPATHTO_T(data\ace_unconscious_1.rtm);
        };
        class ace_unconscious_2: ace_unconscious_1 {
            file = QPATHTO_T(data\ace_unconscious_2.rtm);
        };
        class ace_unconscious_3: ace_unconscious_1 {
            file = QPATHTO_T(data\ace_unconscious_3.rtm);
        };
        class ace_unconscious_4: ace_unconscious_1 {
            file = QPATHTO_T(data\ace_unconscious_4.rtm);
        };
        class ace_unconscious_5: ace_unconscious_1 {
            file = QPATHTO_T(data\ace_unconscious_5.rtm);
        };
        class ace_unconscious_6: ace_unconscious_1 {
            file = QPATHTO_T(data\ace_unconscious_6.rtm);
        };
        class ace_unconscious_7: ace_unconscious_1 {
            file = QPATHTO_T(data\ace_unconscious_7.rtm);
        };
        class ace_unconscious_8: ace_unconscious_1 {
            file = QPATHTO_T(data\ace_unconscious_8.rtm);
        };
        class ace_unconscious_1_1: ace_unconscious_1 {
            file = QPATHTO_T(data\ace_unconscious_1_1.rtm);
        };
        class ace_unconscious_2_1: ace_unconscious_1 {
            file = QPATHTO_T(data\ace_unconscious_2_1.rtm);
        };
        class ace_unconscious_3_1: ace_unconscious_1 {
            file = QPATHTO_T(data\ace_unconscious_3_1.rtm);
        };
        class ace_unconscious_4_1: ace_unconscious_1 {
            file = QPATHTO_T(data\ace_unconscious_4_1.rtm);
        };
        class ace_unconscious_5_1: ace_unconscious_1 {
            file = QPATHTO_T(data\ace_unconscious_5_1.rtm);
        };
        class ace_unconscious_6_1: ace_unconscious_1 {
            file = QPATHTO_T(data\ace_unconscious_6_1.rtm);
        };
        class ace_unconscious_7_1: ace_unconscious_1 {
            file = QPATHTO_T(data\ace_unconscious_7_1.rtm);
        };
        class ace_unconscious_8_1: ace_unconscious_1 {
            file = QPATHTO_T(data\ace_unconscious_8_1.rtm);
        };
        /* added for the "ace_unc" part */
        class KIA_passenger_boat_holdleft;
        class ace_unconscious_9: KIA_passenger_boat_holdleft {
        };
        class KIA_driver_boat01;
        class ace_unconscious_10: KIA_driver_boat01 {
        };

        class GVAR(faceDown): Unconscious {
        };

        class GVAR(faceLeft): Unconscious {
        };

        class GVAR(faceRight): Unconscious {
        };

        class GVAR(faceUp): Unconscious {
        };

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
