class CfgMovesBasic {
    class ManActions {
        ACE_Climb = "ACE_Climb";
    };

    class Actions {
        class RifleBaseStandActions;
        class RifleKneelActions: RifleBaseStandActions {
            Civil = "AmovPknlMstpSnonWnonDnon";
        };
        class RifleProneActions: RifleBaseStandActions {
            Civil = "AmovPpneMstpSnonWnonDnon";
            SecondaryWeapon = "AmovPpneMstpSrasWlnrDnon";
        };

        class PistolStandActions;
        class PistolProneActions: PistolStandActions {
            SecondaryWeapon = "AmovPpneMstpSrasWlnrDnon";
        };

        class LauncherKneelActions;
        /*class LauncherStandActions: LauncherKneelActions {
            PlayerProne = "AmovPpneMstpSrasWlnrDnon";
            Down = "AmovPpneMstpSrasWlnrDnon";
        };*/

        class LauncherProneActions: LauncherKneelActions {
            TurnL = "AmovPpneMstpSrasWlnrDnon_turnl";
            TurnLRelaxed = "AmovPpneMstpSrasWlnrDnon_turnl";
            TurnR = "AmovPpneMstpSrasWlnrDnon_turnr";
            TurnRRelaxed = "AmovPpneMstpSrasWlnrDnon_turnr";
        };

        // jump animation - WEAPON RAISED - RUNNING
        class RifleStandActionsNoAdjust;
        class RifleStandActionsRunF: RifleStandActionsNoAdjust {
            getOver = "AovrPercMrunSrasWrflDf";
        };
        class RifleStandActionsRunFL: RifleStandActionsNoAdjust {
            getOver = "AovrPercMrunSrasWrflDf";
        };
        class RifleStandActionsRunFR: RifleStandActionsNoAdjust {
            getOver = "AovrPercMrunSrasWrflDf";
        };

        // jump animation - WEAPON RAISED - SPRINTING
        class RifleStandEvasiveActionsF: RifleStandActionsNoAdjust {
            getOver = "AovrPercMrunSrasWrflDf";
        };
        class RifleStandEvasiveActionsFL: RifleStandActionsNoAdjust {
            getOver = "AovrPercMrunSrasWrflDf";
        };
        class RifleStandEvasiveActionsFR: RifleStandActionsNoAdjust {
            getOver = "AovrPercMrunSrasWrflDf";
        };

        // jump animation - WEAPON LOWERED - RUNNING
        class RifleLowStandActionsNoAdjust;
        class RifleLowStandActionsRunF: RifleLowStandActionsNoAdjust {
            getOver = "AovrPercMrunSrasWrflDf";
        };
        class RifleLowStandActionsRunFL: RifleLowStandActionsNoAdjust {
            getOver = "AovrPercMrunSrasWrflDf";
        };
        class RifleLowStandActionsRunFR: RifleLowStandActionsNoAdjust {
            getOver = "AovrPercMrunSrasWrflDf";
        };
    };
};

class CfgMovesMaleSdr: CfgMovesBasic {
    class StandBase;
    class States {
        // jumping. don't force awkward freelook in mid air.
        class AovrPercMstpSrasWrflDf;
        class AovrPercMrunSrasWrflDf: AovrPercMstpSrasWrflDf {
            forceAim = 0;
        };

        // replace link of vault with jump animation
        class AmovPercMstpSrasWrflDnon;
        class AmovPercMrunSrasWrflDf: AmovPercMstpSrasWrflDnon {
            InterpolateTo[] = {"AovrPercMrunSrasWrflDf",0.22,"AmovPercMrunSlowWrflDf",0.025,"AmovPercMwlkSrasWrflDf",0.025,"AmovPknlMrunSrasWrflDf",0.03,"AmovPercMrunSlowWrflDf_AmovPpneMstpSrasWrflDnon",0.02,"AmovPercMevaSrasWrflDf",0.025,"Unconscious",0.01,"AmovPercMtacSrasWrflDf",0.02,"AmovPercMrunSrasWrflDfl",0.02,"AmovPercMrunSrasWrflDfl_ldst",0.02,"AmovPercMrunSrasWrflDfr",0.02,"AmovPercMrunSrasWrflDfr_ldst",0.02,"AmovPercMstpSrasWrflDnon",0.02,"AmovPercMrunSrasWrflDl",0.02,"AmovPercMrunSrasWrflDbl",0.02,"AmovPercMrunSrasWrflDb",0.02,"AmovPercMrunSrasWrflDbr",0.02,"AmovPercMrunSrasWrflDr",0.02,"AmovPknlMstpSlowWrflDnon_relax",0.1,"AmovPercMrunSrasWrflDf_ldst",0.02,"AmovPercMrunSrasWrflDf",0.02};
        };

        // enable optics in prone down stance
        class AadjPpneMstpSrasWrflDup;
        class AadjPpneMstpSrasWrflDdown: AadjPpneMstpSrasWrflDup {
            enableOptics = 1;
        };
        class AadjPpneMstpSrasWpstDup;
        class AadjPpneMstpSrasWpstDdown: AadjPpneMstpSrasWpstDup {
            enableOptics = 2;
        };

        // climb animation
        class AmovPercMstpSnonWnonDnon: StandBase {
            ConnectTo[] += {"ACE_Climb",0.02};
        };

        class AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInMedium;
        class ACE_Climb: AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInMedium {
            canReload = 0;
            forceAim = 1;
        };
    };
};
