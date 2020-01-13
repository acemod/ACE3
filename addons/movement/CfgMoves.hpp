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
            getOver = "ACE_AovrPercMrunSlowWrflDf";
        };
        class RifleLowStandActionsRunFL: RifleLowStandActionsNoAdjust {
            getOver = "ACE_AovrPercMrunSlowWrflDf";
        };
        class RifleLowStandActionsRunFR: RifleLowStandActionsNoAdjust {
            getOver = "ACE_AovrPercMrunSlowWrflDf";
        };

        // jump animation - WEAPON LOWERED - SPRINTING
        class RifleStandLowEvasiveActionsF: RifleLowStandActionsNoAdjust {
            getOver = "ACE_AovrPercMrunSlowWrflDf";
        };
        class RifleStandLowEvasiveActionsFR: RifleLowStandActionsNoAdjust {
            getOver = "ACE_AovrPercMrunSlowWrflDf";
        };
        class RifleStandLowEvasiveActionsFL: RifleLowStandActionsNoAdjust {
            getOver = "ACE_AovrPercMrunSlowWrflDf";
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
        class ACE_AovrPercMrunSlowWrflDf: AovrPercMrunSrasWrflDf { // custom
            actions = "RifleLowStandActionsRunF";

            ConnectTo[] = {
                "AidlPercMstpSlowWrflDnon_G0S",0.02,
                "AmovPercMstpSlowWrflDnon",0.03,
                "WeaponMagazineReloadStand",0.1,
                //"AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWlnrDnon",0.01,
                "AmovPercMstpSlowWrflDnon_AmovPercMstpSrasWrflDnon",0.01,
                //"AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWpstDnon",0.02,
                //"AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon",0.02,
                //"AmovPercMstpSrasWrflDnon_AmovPercMstpSnonWnonDnon",0.02,
                "AwopPercMstpSgthWrflDnon_Start2",0.1,
                "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon",0.02,
              //"AmovPercMstpSrasWrflDnon_AadjPercMstpSrasWrflDup",0.02,
              //"AmovPercMstpSrasWrflDnon_AadjPercMstpSrasWrflDdown",0.02,
              //"AmovPercMstpSrasWrflDnon_AadjPercMstpSrasWrflDleft",0.02,
              //"AmovPercMstpSrasWrflDnon_AadjPercMstpSrasWrflDright",0.02,
                "AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWrflDnon_gear",0.02
            };
            InterpolateTo[] = {
                "AmovPercMstpSlowWrflDnon_turnL",0.02,
                "AmovPercMstpSlowWrflDnon_turnR",0.02,
                "AmovPercMstpSlowWrflDnon_AmovPknlMstpSlowWrflDnon",0.01,
                "AmovPercMstpSlowWrflDnon_AmovPpneMstpSrasWrflDnon",0.01,
                "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_1",0.01,
                "Helper_SwitchToCarryRfl",0.2,
                "AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon",0.02,
                "AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon_Putdown",0.02,
                "AmovPercMwlkSlowWrflDf",0.02,
                "AmovPercMwlkSlowWrflDfl",0.02,
                "AmovPercMwlkSlowWrflDl",0.02,
                "AmovPercMwlkSlowWrflDbl",0.02,
                "AmovPercMwlkSlowWrflDb",0.02,
                "AmovPercMwlkSlowWrflDbr",0.02,
                "AmovPercMwlkSlowWrflDr",0.02,
                "AmovPercMwlkSlowWrflDfr",0.02,
                "AmovPercMrunSlowWrflDf",0.02,
                "AmovPercMrunSlowWrflDfl",0.02,
                "AmovPercMrunSlowWrflDl",0.02,
                "AmovPercMrunSlowWrflDbl",0.02,
                "AmovPercMrunSlowWrflDb",0.02,
                "AmovPercMrunSlowWrflDbr",0.02,
                "AmovPercMrunSlowWrflDr",0.02,
                "AmovPercMrunSlowWrflDfr",0.02,
              //"AmovPercMrunSrasWrflDf_ldst",0.02,
              //"AmovPercMrunSrasWrflDfl_ldst",0.02,
              //"AmovPercMrunSrasWrflDl_ldst",0.02,
              //"AmovPercMrunSrasWrflDbl_ldst",0.02,
              //"AmovPercMrunSrasWrflDb_ldst",0.02,
              //"AmovPercMrunSrasWrflDbr_ldst",0.02,
              //"AmovPercMrunSrasWrflDr_ldst",0.02,
              //"AmovPercMrunSrasWrflDfr_ldst",0.02,
                "AmovPercMstpSlowWrflDnon_AmovPknlMstpSlowWrflDnon",0.02,
                "AmovPercMevaSlowWrflDf",0.02,
                "AmovPercMevaSlowWrflDfl",0.02,
                "AmovPercMevaSlowWrflDfr",0.02,
                "AmovPercMstpSlowWrflDnon_SaluteIn",0.03,
                "Unconscious",0.02,
                "AidlPercMstpSlowWrflDnon_AI",0.02,
                "AidlPercMstpSlowWrflDnon_AI",0.02,
                "AovrPercMstpSlowWrflDf",1.01,
                "AmovPercMtacSlowWrflDfl",0.2,
                "AmovPercMtacSlowWrflDl",0.2,
                "AmovPercMtacSlowWrflDbl",0.2,
                "AmovPercMtacSlowWrflDb",0.2,
                "AmovPercMtacSlowWrflDbr",0.2,
                "AmovPercMtacSlowWrflDr",0.2,
                "AmovPercMtacSlowWrflDfr",0.22,
                "AmovPercMtacSlowWrflDf",0.02,
                "HaloFreeFall_non",10.2,
                "AmovPercMrunSlowWrflDf",0.02,
                "AmovPercMrunSlowWrflDfl",0.02,
                "AmovPercMrunSlowWrflDl",0.02,
                "AmovPercMrunSlowWrflDb",0.02,
                "AmovPercMrunSlowWrflDbr",0.02,
                "AmovPercMrunSlowWrflDr",0.02,
                "AmovPercMrunSlowWrflDbl",0.02,
                "AmovPercMrunSlowWrflDfr",0.02,
                "AmovPercMstpSrasWrflDnon_falling",0.02,
                "AsdvPercMstpSnonWrflDnon",2.02,
                "AdvePercMstpSnonWrflDnon",2.02,
                "AbdvPercMstpSnonWrflDnon",2.02,
                "AinvPercMstpSrasWrflDnon",0.05,
                "AmovPknlMstpSlowWrflDnon_AmovPercMstpSlowWrflDnon",0.02,
              //"AmovPpneMstpSrasWrflDnon_AmovPercMstpSrasWrflDnon",0.02,
              //"AmovPercMstpSlowWrflDnon_AmovPercMstpSrasWrflDnon",0.02,
                "AmovPercMstpSlowWrflDnon_AmovPsitMstpSlowWrflDnon",0.02,
                "AfalPercMstpSrasWrflDnon",0.025,
              //"AmovPercMevaSrasWrflDl",0.025,
              //"AmovPercMevaSrasWrflDr",0.025,
                "Acts_PercMstpSlowWrflDnon_handup2",1,
                "Acts_WalkingChecking",1,
                "Acts_PercMstpSlowWrflDnon_handup1",1,
                "Acts_PercMstpSlowWrflDnon_handup2b",1,
                "Acts_PercMstpSlowWrflDnon_handup2c",1,
                "Acts_PercMstpSlowWrflDnon_handup1b",1,
                "Acts_PercMstpSlowWrflDnon_handup1c",1,
                "HubSpectator_stand",1,
                "HubSpectator_walk",1,
                "HubStanding_idle1",1,
                "HubStanding_idle2",1,
                "HubStanding_idle3",1,
                "Campaign_Base",0.5,
                "CutSceneAnimationBase",0.5,
                "AmovPercMlmpSlowWrflDf",0.05,
                "AmovPercMlmpSlowWrflDfl",0.05,
                "AmovPercMlmpSlowWrflDl",0.05,
                "AmovPercMlmpSlowWrflDbl",0.05,
                "AmovPercMlmpSlowWrflDb",0.05,
                "AmovPercMlmpSlowWrflDbr",0.05,
                "AmovPercMlmpSlowWrflDr",0.05,
                "AmovPercMlmpSlowWrflDfr",0.05,
                "acts_millerDisarming_runToDesk",0.05,
                "CutSceneAnimationSmk",0.1,
                "UnconsciousFaceDown",0.25,
                "UnconsciousMedicFromRifle",0.2
            };
        };

        // rifle raised, replace link of vault with jump animation
        class AmovPercMstpSrasWrflDnon;
        class AmovPercMrunSrasWrflDf: AmovPercMstpSrasWrflDnon {
            InterpolateTo[] = {
                "AovrPercMrunSrasWrflDf",0.22,
                "AmovPercMrunSlowWrflDf",0.025,
                "AmovPercMwlkSrasWrflDf",0.025,
                "AmovPknlMrunSrasWrflDf",0.03,
                "AmovPercMrunSlowWrflDf_AmovPpneMstpSrasWrflDnon",0.02,
                "AmovPercMevaSrasWrflDf",0.025,
                "Unconscious",0.01,
                "AmovPercMtacSrasWrflDf",0.02,
                "AmovPercMrunSrasWrflDfl",0.02,
                "AmovPercMrunSrasWrflDfl_ldst",0.02,
                "AmovPercMrunSrasWrflDfr",0.02,
                "AmovPercMrunSrasWrflDfr_ldst",0.02,
                "AmovPercMstpSrasWrflDnon",0.02,
                "AmovPercMrunSrasWrflDl",0.02,
                "AmovPercMrunSrasWrflDbl",0.02,
                "AmovPercMrunSrasWrflDb",0.02,
                "AmovPercMrunSrasWrflDbr",0.02,
                "AmovPercMrunSrasWrflDr",0.02,
                "AmovPknlMstpSlowWrflDnon_relax",0.1,
                "AmovPercMrunSrasWrflDf_ldst",0.02,
                "AmovPercMrunSrasWrflDf",0.02
            };
        };

        // rifle lowered, add link to jump animation
        class AmovPercMstpSlowWrflDnon;
        class AmovPercMrunSlowWrflDf: AmovPercMstpSlowWrflDnon {
            InterpolateTo[] = {
                "ACE_AovrPercMrunSlowWrflDf",0.22,
                "AmovPercMstpSlowWrflDnon",0.02,
                "AmovPercMwlkSlowWrflDf_ver2",0.025,
                "AmovPercMwlkSlowWrflDf",0.5,
                "AidlPercMrunSrasWrflDf",0.01,
                "AmovPercMrunSlowWrflDfl",0.025,
                "AmovPercMrunSlowWrflDfr",0.025,
                "AmovPercMrunSrasWrflDf",0.025,
                "AmovPknlMrunSlowWrflDf",0.03,
                "AmovPercMrunSlowWrflDf_AmovPpneMstpSrasWrflDnon",0.02,
                "AmovPercMevaSrasWrflDf",0.025,
                "AmovPercMevaSlowWrflDf",0.025,
                "Unconscious",0.02,
                "AmovPercMrunSlowWrflDf_AmovPercMstpSrasWrflDnon_gthStart",0.1,
                "AmovPknlMstpSlowWrflDnon_relax",0.1,
                "AmovPercMtacSlowWrflDf_ver2",0.2,
                "AmovPercMtacSlowWrflDf",0.5,
                "AmovPercMwlkSrasWrflDf",0.02,
                "AmovPercMtacSrasWrflDf",0.02
            };
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
