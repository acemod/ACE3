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
        class ace_unc_1: DeadState {
            file = QPATHTO_T(anims\ace_unc_1.rtm);
        };
        class ace_unc_2: ace_unc_1 {
            file = QPATHTO_T(anims\ace_unc_2.rtm);
        };
        class ace_unc_3: ace_unc_1 {
            file = QPATHTO_T(anims\ace_unc_3.rtm);
        };
        class ace_unc_4: ace_unc_1 {
            file = QPATHTO_T(anims\ace_unc_4.rtm);
        };
        class ace_unc_5: ace_unc_1 {
            file = QPATHTO_T(anims\ace_unc_5.rtm);
        };
        class ace_unc_6: ace_unc_1 {
            file = QPATHTO_T(anims\ace_unc_6.rtm);
        };
        class ace_unc_7: ace_unc_1 {
            file = QPATHTO_T(anims\ace_unc_7.rtm);
        };
        class ace_unc_8: ace_unc_1 {
            file = QPATHTO_T(anims\ace_unc_8.rtm);
        };
        class ace_unc_1_1: ace_unc_1 {
            file = QPATHTO_T(anims\ace_unc_1_1.rtm);
        };
        class ace_unc_2_1: ace_unc_1 {
            file = QPATHTO_T(anims\ace_unc_2_1.rtm);
        };
        class ace_unc_3_1: ace_unc_1 {
            file = QPATHTO_T(anims\ace_unc_3_1.rtm);
        };
        class ace_unc_4_1: ace_unc_1 {
            file = QPATHTO_T(anims\ace_unc_4_1.rtm);
        };
        class ace_unc_5_1: ace_unc_1 {
            file = QPATHTO_T(anims\ace_unc_5_1.rtm);
        };
        class ace_unc_6_1: ace_unc_1 {
            file = QPATHTO_T(anims\ace_unc_6_1.rtm);
        };
        class ace_unc_7_1: ace_unc_1 {
            file = QPATHTO_T(anims\ace_unc_7_1.rtm);
        };
        class ace_unc_8_1: ace_unc_1 {
            file = QPATHTO_T(anims\ace_unc_8_1.rtm);
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
