
class CfgMovesBasic;
class CfgMovesMaleSdr: CfgMovesBasic {
    class States {
        // fixes hand being stuck at rifle which is on the back
        class AmovPknlMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon;
        class AinvPknlMstpSlayWnonDnon_medicOther: AmovPknlMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon {
            weaponIK = 0;
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
