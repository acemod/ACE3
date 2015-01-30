// CODE BELOW TAKEN FROM TMR, PREFIXES EDITED FOR COMPATABILITY

#define ACE_SWAY_DEPLOY       0.02
#define ACE_SWAY_DEPLOYPRONE  0.01
#define ACE_SWAY_RESTED       0.04  //0.08
#define ACE_SWAY_RESTEDPRONE  0.02  //0.04
#define ACE_DEPLOY_TURNSPEED  0.1

// Arma 3 doesn't respect turnSpeed.

class CfgMovesBasic {
    class Default;

    class Actions {
        class RifleStandActions;
        class RifleStandActions_ace_deploy : RifleStandActions {
            stop =    "AmovPercMstpSrasWrflDnon_ace_deploy";
            default = "AmovPercMstpSrasWrflDnon_ace_deploy";
            turnL =   "AmovPercMstpSrasWrflDnon_ace_deploy";
            turnR =   "AmovPercMstpSrasWrflDnon_ace_deploy";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustLStandActions;
        class RifleAdjustLStandActions_ace_deploy : RifleAdjustLStandActions {
            stop =    "AadjPercMstpSrasWrflDleft_ace_deploy";
            default = "AadjPercMstpSrasWrflDleft_ace_deploy";
            AdjustL = "AadjPercMstpSrasWrflDleft_ace_deploy";
            turnL =   "AadjPercMstpSrasWrflDleft_ace_deploy";
            turnR =   "AadjPercMstpSrasWrflDleft_ace_deploy";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustRStandActions;
        class RifleAdjustRStandActions_ace_deploy : RifleAdjustRStandActions {
            stop =    "AadjPercMstpSrasWrflDright_ace_deploy";
            default = "AadjPercMstpSrasWrflDright_ace_deploy";
            AdjustRight = "AadjPercMstpSrasWrflDright_ace_deploy";
            turnL =   "AadjPercMstpSrasWrflDright_ace_deploy";
            turnR =   "AadjPercMstpSrasWrflDright_ace_deploy";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustFStandActions;
        class RifleAdjustFStandActions_ace_deploy : RifleAdjustFStandActions {
            stop =    "AadjPercMstpSrasWrflDup_ace_deploy";
            default = "AadjPercMstpSrasWrflDup_ace_deploy";
            AdjustF = "AadjPercMstpSrasWrflDup_ace_deploy";
            turnL =   "AadjPercMstpSrasWrflDup_ace_deploy";
            turnR =   "AadjPercMstpSrasWrflDup_ace_deploy";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustBStandActions;
        class RifleAdjustBStandActions_ace_deploy : RifleAdjustBStandActions {
            stop =    "AadjPercMstpSrasWrflDdown_ace_deploy";
            default = "AadjPercMstpSrasWrflDdown_ace_deploy";
            AdjustB = "AadjPercMstpSrasWrflDdown_ace_deploy";
            turnR =   "AadjPercMstpSrasWrflDdown_ace_deploy";
            turnL =   "AadjPercMstpSrasWrflDdown_ace_deploy";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleKneelActions;
        class RifleKneelActions_ace_deploy : RifleKneelActions {
            stop =    "AmovPknlMstpSrasWrflDnon_ace_deploy";
            default = "AmovPknlMstpSrasWrflDnon_ace_deploy";
            crouch =  "AmovPknlMstpSrasWrflDnon_ace_deploy"; // TODO: this might cause issues
            turnL =   "AmovPknlMstpSrasWrflDnon_ace_deploy";
            turnR =   "AmovPknlMstpSrasWrflDnon_ace_deploy";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustLKneelActions;
        class RifleAdjustLKneelActions_ace_deploy : RifleAdjustLKneelActions {
            stop =    "AadjPknlMstpSrasWrflDleft_ace_deploy";
            default = "AadjPknlMstpSrasWrflDleft_ace_deploy";
            turnL =   "AadjPknlMstpSrasWrflDleft_ace_deploy";
            turnR =   "AadjPknlMstpSrasWrflDleft_ace_deploy";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustRKneelActions;
        class RifleAdjustRKneelActions_ace_deploy : RifleAdjustRKneelActions {
            stop =    "AadjPknlMstpSrasWrflDright_ace_deploy";
            default = "AadjPknlMstpSrasWrflDright_ace_deploy";
            turnL =   "AadjPknlMstpSrasWrflDright_ace_deploy";
            turnR =   "AadjPknlMstpSrasWrflDright_ace_deploy";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustFKneelActions;
        class RifleAdjustFKneelActions_ace_deploy : RifleAdjustFKneelActions {
            stop =    "AadjPknlMstpSrasWrflDup_ace_deploy";
            default = "AadjPknlMstpSrasWrflDup_ace_deploy";
            turnL =   "AadjPknlMstpSrasWrflDup_ace_deploy";
            turnR =   "AadjPknlMstpSrasWrflDup_ace_deploy";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustBKneelActions;
        class RifleAdjustBKneelActions_ace_deploy : RifleAdjustBKneelActions {
            stop =    "AadjPknlMstpSrasWrflDdown_ace_deploy";
            default = "AadjPknlMstpSrasWrflDdown_ace_deploy";
            turnL =   "AadjPknlMstpSrasWrflDdown_ace_deploy";
            turnR =   "AadjPknlMstpSrasWrflDdown_ace_deploy";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleProneActions;
        class RifleProneActions_ace_deploy : RifleProneActions {
            stop =    "AmovPpneMstpSrasWrflDnon_ace_deploy";
            default = "AmovPpneMstpSrasWrflDnon_ace_deploy";
            turnL =   "AmovPpneMstpSrasWrflDnon_ace_deploy";
            turnR =   "AmovPpneMstpSrasWrflDnon_ace_deploy";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustLProneActions;
        class RifleAdjustLProneActions_ace_deploy : RifleAdjustLProneActions {
            stop =    "AadjPpneMstpSrasWrflDleft_ace_deploy";
            default = "AadjPpneMstpSrasWrflDleft_ace_deploy";
            turnL =   "AadjPpneMstpSrasWrflDleft_ace_deploy";
            turnR =   "AadjPpneMstpSrasWrflDleft_ace_deploy";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustRProneActions;
        class RifleAdjustRProneActions_ace_deploy : RifleAdjustRProneActions {
            stop =    "AadjPpneMstpSrasWrflDright_ace_deploy";
            default = "AadjPpneMstpSrasWrflDright_ace_deploy";
            turnL =   "AadjPpneMstpSrasWrflDright_ace_deploy";
            turnR =   "AadjPpneMstpSrasWrflDright_ace_deploy";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustFProneActions;
        class RifleAdjustFProneActions_ace_deploy : RifleAdjustFProneActions {
            stop =    "aadjppnemstpsraswrfldup_ace_deploy";
            default = "aadjppnemstpsraswrfldup_ace_deploy";
            turnL =   "aadjppnemstpsraswrfldup_ace_deploy";
            turnR =   "aadjppnemstpsraswrfldup_ace_deploy";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustBProneActions;
        class RifleAdjustBProneActions_ace_deploy : RifleAdjustBProneActions {
            stop =    "AadjPpneMstpSrasWrflDdown_ace_deploy";
            default = "AadjPpneMstpSrasWrflDdown_ace_deploy";
            turnL =   "AadjPpneMstpSrasWrflDdown_ace_deploy";
            turnR =   "AadjPpneMstpSrasWrflDdown_ace_deploy";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        //////////////////////////////////////////////////////////////////////

        class RifleStandActions_ace_rested : RifleStandActions {
            stop =    "AmovPercMstpSrasWrflDnon_ace_rested";
            default = "AmovPercMstpSrasWrflDnon_ace_rested";
            turnL =   "AmovPercMstpSrasWrflDnon_ace_rested";
            turnR =   "AmovPercMstpSrasWrflDnon_ace_rested";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustLStandActions_ace_rested : RifleAdjustLStandActions {
            stop =    "AadjPercMstpSrasWrflDleft_ace_rested";
            default = "AadjPercMstpSrasWrflDleft_ace_rested";
            AdjustL = "AadjPercMstpSrasWrflDleft_ace_rested";
            turnL =   "AadjPercMstpSrasWrflDleft_ace_rested";
            turnR =   "AadjPercMstpSrasWrflDleft_ace_rested";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustRStandActions_ace_rested : RifleAdjustRStandActions {
            stop =    "AadjPercMstpSrasWrflDright_ace_rested";
            default = "AadjPercMstpSrasWrflDright_ace_rested";
            AdjustRight = "AadjPercMstpSrasWrflDright_ace_rested";
            turnL =   "AadjPercMstpSrasWrflDright_ace_rested";
            turnR =   "AadjPercMstpSrasWrflDright_ace_rested";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustFStandActions_ace_rested : RifleAdjustFStandActions {
            stop =    "AadjPercMstpSrasWrflDup_ace_rested";
            default = "AadjPercMstpSrasWrflDup_ace_rested";
            AdjustF = "AadjPercMstpSrasWrflDup_ace_rested";
            turnL =   "AadjPercMstpSrasWrflDup_ace_rested";
            turnR =   "AadjPercMstpSrasWrflDup_ace_rested";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustBStandActions_ace_rested : RifleAdjustBStandActions {
            stop =    "AadjPercMstpSrasWrflDdown_ace_rested";
            default = "AadjPercMstpSrasWrflDdown_ace_rested";
            AdjustB = "AadjPercMstpSrasWrflDdown_ace_rested";
            turnR =   "AadjPercMstpSrasWrflDdown_ace_rested";
            turnL =   "AadjPercMstpSrasWrflDdown_ace_rested";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleKneelActions_ace_rested : RifleKneelActions {
            stop =    "AmovPknlMstpSrasWrflDnon_ace_rested";
            default = "AmovPknlMstpSrasWrflDnon_ace_rested";
            crouch =  "AmovPknlMstpSrasWrflDnon_ace_rested";
            turnL =   "AmovPknlMstpSrasWrflDnon_ace_rested";
            turnR =   "AmovPknlMstpSrasWrflDnon_ace_rested";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustLKneelActions_ace_rested : RifleAdjustLKneelActions {
            stop =    "AadjPknlMstpSrasWrflDleft_ace_rested";
            default = "AadjPknlMstpSrasWrflDleft_ace_rested";
            turnL =   "AadjPknlMstpSrasWrflDleft_ace_rested";
            turnR =   "AadjPknlMstpSrasWrflDleft_ace_rested";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustRKneelActions_ace_rested : RifleAdjustRKneelActions {
            stop =    "AadjPknlMstpSrasWrflDright_ace_rested";
            default = "AadjPknlMstpSrasWrflDright_ace_rested";
            turnL =   "AadjPknlMstpSrasWrflDright_ace_rested";
            turnR =   "AadjPknlMstpSrasWrflDright_ace_rested";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustFKneelActions_ace_rested : RifleAdjustFKneelActions {
            stop =    "AadjPknlMstpSrasWrflDup_ace_rested";
            default = "AadjPknlMstpSrasWrflDup_ace_rested";
            turnL =   "AadjPknlMstpSrasWrflDup_ace_rested";
            turnR =   "AadjPknlMstpSrasWrflDup_ace_rested";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustBKneelActions_ace_rested : RifleAdjustBKneelActions {
            stop =    "AadjPknlMstpSrasWrflDdown_ace_rested";
            default = "AadjPknlMstpSrasWrflDdown_ace_rested";
            turnL =   "AadjPknlMstpSrasWrflDdown_ace_rested";
            turnR =   "AadjPknlMstpSrasWrflDdown_ace_rested";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleProneActions_ace_rested : RifleProneActions {
            stop =    "AmovPpneMstpSrasWrflDnon_ace_rested";
            default = "AmovPpneMstpSrasWrflDnon_ace_rested";
            turnL =   "AmovPpneMstpSrasWrflDnon_ace_rested";
            turnR =   "AmovPpneMstpSrasWrflDnon_ace_rested";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustLProneActions_ace_rested : RifleAdjustLProneActions {
            stop =    "AadjPpneMstpSrasWrflDleft_ace_rested";
            default = "AadjPpneMstpSrasWrflDleft_ace_rested";
            turnL =   "AadjPpneMstpSrasWrflDleft_ace_rested";
            turnR =   "AadjPpneMstpSrasWrflDleft_ace_rested";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustRProneActions_ace_rested : RifleAdjustRProneActions {
            stop =    "AadjPpneMstpSrasWrflDright_ace_rested";
            default = "AadjPpneMstpSrasWrflDright_ace_rested";
            turnL =   "AadjPpneMstpSrasWrflDright_ace_rested";
            turnR =   "AadjPpneMstpSrasWrflDright_ace_rested";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustFProneActions_ace_rested : RifleAdjustFProneActions {
            stop =    "aadjppnemstpsraswrfldup_ace_rested";
            default = "aadjppnemstpsraswrfldup_ace_rested";
            turnL =   "aadjppnemstpsraswrfldup_ace_rested";
            turnR =   "aadjppnemstpsraswrfldup_ace_rested";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class RifleAdjustBProneActions_ace_rested : RifleAdjustBProneActions {
            stop =    "AadjPpneMstpSrasWrflDdown_ace_rested";
            default = "AadjPpneMstpSrasWrflDdown_ace_rested";
            turnL =   "AadjPpneMstpSrasWrflDdown_ace_rested";
            turnR =   "AadjPpneMstpSrasWrflDdown_ace_rested";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        //////////////////////////////////////////////////////////////////////
        // FFV
        //////////////////////////////////////////////////////////////////////

        class passenger_inside_1Actions;
        class passenger_inside_1Actions_ace_deploy : passenger_inside_1Actions {
            stop =    "passenger_inside_1_Aim_ace_deploy";
            default = "passenger_inside_1_Aim_ace_deploy";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_inside_2Actions;
        class passenger_inside_2Actions_ace_deploy : passenger_inside_2Actions {
            stop =    "passenger_inside_2_Aim_ace_deploy";
            default = "passenger_inside_2_Aim_ace_deploy";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_inside_3Actions;
        class passenger_inside_3Actions_ace_deploy : passenger_inside_3Actions {
            stop =    "passenger_inside_3_Aim_ace_deploy";
            default = "passenger_inside_3_Aim_ace_deploy";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_inside_4Actions;
        class passenger_inside_4Actions_ace_deploy : passenger_inside_4Actions {
            stop =    "passenger_inside_4_Aim_ace_deploy";
            default = "passenger_inside_4_Aim_ace_deploy";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_bench_1Actions;
        class passenger_bench_1Actions_ace_deploy : passenger_bench_1Actions {
            stop =    "passenger_bench_1_Aim_ace_deploy";
            default = "passenger_bench_1_Aim_ace_deploy";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_boat_1Actions;
        class passenger_boat_1Actions_ace_deploy : passenger_boat_1Actions {
            stop =    "passenger_boat_1_Aim_ace_deploy";
            default = "passenger_boat_1_Aim_ace_deploy";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_boat_2Actions;
        class passenger_boat_2Actions_ace_deploy : passenger_boat_2Actions {
            stop =    "passenger_boat_2_Aim_ace_deploy";
            default = "passenger_boat_2_Aim_ace_deploy";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_boat_3Actions;
        class passenger_boat_3Actions_ace_deploy : passenger_boat_3Actions {
            stop =    "passenger_boat_3_Aim_ace_deploy";
            default = "passenger_boat_3_Aim_ace_deploy";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_boat_4Actions;
        class passenger_boat_4Actions_ace_deploy : passenger_boat_4Actions {
            stop =    "passenger_boat_4_Aim_ace_deploy";
            default = "passenger_boat_4_Aim_ace_deploy";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_flatground_1Actions;
        class passenger_flatground_1Actions_ace_deploy : passenger_flatground_1Actions {
            stop =    "passenger_flatground_1_Aim_ace_deploy";
            default = "passenger_flatground_1_Aim_ace_deploy";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_flatground_2Actions;
        class passenger_flatground_2Actions_ace_deploy : passenger_flatground_2Actions {
            stop =    "passenger_flatground_2_Aim_ace_deploy";
            default = "passenger_flatground_2_Aim_ace_deploy";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_flatground_3Actions;
        class passenger_flatground_3Actions_ace_deploy : passenger_flatground_3Actions {
            stop =    "passenger_flatground_3_Aim_ace_deploy";
            default = "passenger_flatground_3_Aim_ace_deploy";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_flatground_4Actions;
        class passenger_flatground_4Actions_ace_deploy : passenger_flatground_4Actions {
            stop =    "passenger_flatground_4_Aim_ace_deploy";
            default = "passenger_flatground_4_Aim_ace_deploy";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        //////////////////////////////////////////////////////////////////////

        class passenger_inside_1Actions_ace_rested : passenger_inside_1Actions {
            stop =    "passenger_inside_1_Aim_ace_rested";
            default = "passenger_inside_1_Aim_ace_rested";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_inside_2Actions_ace_rested : passenger_inside_2Actions {
            stop =    "passenger_inside_2_Aim_ace_rested";
            default = "passenger_inside_2_Aim_ace_rested";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_inside_3Actions_ace_rested : passenger_inside_3Actions {
            stop =    "passenger_inside_3_Aim_ace_rested";
            default = "passenger_inside_3_Aim_ace_rested";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_inside_4Actions_ace_rested : passenger_inside_4Actions {
            stop =    "passenger_inside_4_Aim_ace_rested";
            default = "passenger_inside_4_Aim_ace_rested";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_bench_1Actions_ace_rested : passenger_bench_1Actions {
            stop =    "passenger_bench_1_Aim_ace_rested";
            default = "passenger_bench_1_Aim_ace_rested";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_boat_1Actions_ace_rested : passenger_boat_1Actions {
            stop =    "passenger_boat_1_Aim_ace_rested";
            default = "passenger_boat_1_Aim_ace_rested";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_boat_2Actions_ace_rested : passenger_boat_2Actions {
            stop =    "passenger_boat_2_Aim_ace_rested";
            default = "passenger_boat_2_Aim_ace_rested";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_boat_3Actions_ace_rested : passenger_boat_3Actions {
            stop =    "passenger_boat_3_Aim_ace_rested";
            default = "passenger_boat_3_Aim_ace_rested";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_boat_4Actions_ace_rested : passenger_boat_4Actions {
            stop =    "passenger_boat_4_Aim_ace_rested";
            default = "passenger_boat_4_Aim_ace_rested";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_flatground_1Actions_ace_rested : passenger_flatground_1Actions {
            stop =    "passenger_flatground_1_Aim_ace_rested";
            default = "passenger_flatground_1_Aim_ace_rested";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_flatground_2Actions_ace_rested : passenger_flatground_2Actions {
            stop =    "passenger_flatground_2_Aim_ace_rested";
            default = "passenger_flatground_2_Aim_ace_rested";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_flatground_3Actions_ace_rested : passenger_flatground_3Actions {
            stop =    "passenger_flatground_3_Aim_ace_rested";
            default = "passenger_flatground_3_Aim_ace_rested";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };

        class passenger_flatground_4Actions_ace_rested : passenger_flatground_4Actions {
            stop =    "passenger_flatground_4_Aim_ace_rested";
            default = "passenger_flatground_4_Aim_ace_rested";
            turnL =   "";
            turnR =   "";
            turnSpeed = ACE_DEPLOY_TURNSPEED;
            limitFast = 1;
        };
    };
};

class CfgMovesMaleSdr : CfgMovesBasic {
    class States {
        class AmovPercMstpSrasWrflDnon;
        class AmovPercMstpSrasWrflDnon_ace_deploy : AmovPercMstpSrasWrflDnon {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "RifleStandActions_ace_deploy";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"AmovPercMstpSrasWrflDnon_ace_deploy", 0.02};
            ConnectFrom[] = {"AmovPercMstpSrasWrflDnon_ace_deploy", 0.02};
            InterpolateFrom[] = {"AmovPercMstpSrasWrflDnon", 0.02};
            InterpolateTo[] = {"AmovPercMstpSrasWrflDnon", 0.02};
        };

        class aadjpercmstpsraswrfldup;
        class aadjpercmstpsraswrfldup_ace_deploy : aadjpercmstpsraswrfldup {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "RifleAdjustFStandActions_ace_deploy";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjpercmstpsraswrfldup_ace_deploy", 0.02};
            ConnectFrom[] = {"aadjpercmstpsraswrfldup_ace_deploy", 0.02};
            InterpolateFrom[] = {"aadjpercmstpsraswrfldup", 0.02};
            InterpolateTo[] = {"aadjpercmstpsraswrfldup", 0.02};
        };

        class aadjpercmstpsraswrflddown;
        class aadjpercmstpsraswrflddown_ace_deploy : aadjpercmstpsraswrflddown {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "RifleAdjustBStandActions_ace_deploy";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjpercmstpsraswrflddown_ace_deploy", 0.02};
            ConnectFrom[] = {"aadjpercmstpsraswrflddown_ace_deploy", 0.02};
            InterpolateFrom[] = {"aadjpercmstpsraswrflddown", 0.02};
            InterpolateTo[] = {"aadjpercmstpsraswrflddown", 0.02};
        };

        class aadjpercmstpsraswrfldright;
        class aadjpercmstpsraswrfldright_ace_deploy : aadjpercmstpsraswrfldright {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "RifleAdjustRStandActions_ace_deploy";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjpercmstpsraswrfldright_ace_deploy", 0.02};
            ConnectFrom[] = {"aadjpercmstpsraswrfldright_ace_deploy", 0.02};
            InterpolateFrom[] = {"aadjpercmstpsraswrfldright", 0.02};
            InterpolateTo[] = {"aadjpercmstpsraswrfldright", 0.02};
        };

        class aadjpercmstpsraswrfldleft;
        class aadjpercmstpsraswrfldleft_ace_deploy : aadjpercmstpsraswrfldleft {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "RifleAdjustLStandActions_ace_deploy";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjpercmstpsraswrfldleft_ace_deploy", 0.02};
            ConnectFrom[] = {"aadjpercmstpsraswrfldleft_ace_deploy", 0.02};
            InterpolateFrom[] = {"aadjpercmstpsraswrfldleft", 0.02};
            InterpolateTo[] = {"aadjpercmstpsraswrfldleft", 0.02};
        };

        class aadjpknlmstpsraswrfldup;
        class aadjpknlmstpsraswrfldup_ace_deploy : aadjpknlmstpsraswrfldup {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "RifleAdjustFKneelActions_ace_deploy";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjpknlmstpsraswrfldup_ace_deploy", 0.02};
            ConnectFrom[] = {"aadjpknlmstpsraswrfldup_ace_deploy", 0.02};
            InterpolateFrom[] = {"aadjpknlmstpsraswrfldup", 0.02};
            InterpolateTo[] = {"aadjpknlmstpsraswrfldup", 0.02};
        };

        class amovpknlmstpsraswrfldnon;
        class amovpknlmstpsraswrfldnon_ace_deploy : amovpknlmstpsraswrfldnon {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "RifleKneelActions_ace_deploy";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"amovpknlmstpsraswrfldnon_ace_deploy", 0.02};
            ConnectFrom[] = {"amovpknlmstpsraswrfldnon_ace_deploy", 0.02};
            InterpolateFrom[] = {"amovpknlmstpsraswrfldnon", 0.02};
            InterpolateTo[] = {"amovpknlmstpsraswrfldnon", 0.02};
        };

        class aadjpknlmstpsraswrflddown;
        class aadjpknlmstpsraswrflddown_ace_deploy : aadjpknlmstpsraswrflddown {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "RifleAdjustBKneelActions_ace_deploy";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjpknlmstpsraswrflddown_ace_deploy", 0.02};
            ConnectFrom[] = {"aadjpknlmstpsraswrflddown_ace_deploy", 0.02};
            InterpolateFrom[] = {"aadjpknlmstpsraswrflddown", 0.02};
            InterpolateTo[] = {"aadjpknlmstpsraswrflddown", 0.02};
        };

        class aadjpknlmstpsraswrfldleft;
        class aadjpknlmstpsraswrfldleft_ace_deploy : aadjpknlmstpsraswrfldleft {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "RifleAdjustLKneelActions_ace_deploy";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjpknlmstpsraswrfldleft_ace_deploy", 0.02};
            ConnectFrom[] = {"aadjpknlmstpsraswrfldleft_ace_deploy", 0.02};
            InterpolateFrom[] = {"aadjpknlmstpsraswrfldleft", 0.02};
            InterpolateTo[] = {"aadjpknlmstpsraswrfldleft", 0.02};
        };

        class aadjpknlmstpsraswrfldright;
        class aadjpknlmstpsraswrfldright_ace_deploy : aadjpknlmstpsraswrfldright {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "RifleAdjustRKneelActions_ace_deploy";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjpknlmstpsraswrfldright_ace_deploy", 0.02};
            ConnectFrom[] = {"aadjpknlmstpsraswrfldright_ace_deploy", 0.02};
            InterpolateFrom[] = {"aadjpknlmstpsraswrfldright", 0.02};
            InterpolateTo[] = {"aadjpknlmstpsraswrfldright", 0.02};
        };

        class aadjppnemstpsraswrfldup;
        class aadjppnemstpsraswrfldup_ace_deploy : aadjppnemstpsraswrfldup {
            aimPrecision = ACE_SWAY_DEPLOYPRONE;
            actions = "RifleAdjustFProneActions_ace_deploy";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjppnemstpsraswrfldup_ace_deploy", 0.02};
            ConnectFrom[] = {"aadjppnemstpsraswrfldup_ace_deploy", 0.02};
            InterpolateFrom[] = {"aadjppnemstpsraswrfldup", 0.02};
            InterpolateTo[] = {"aadjppnemstpsraswrfldup", 0.02};
        };

        class amovppnemstpsraswrfldnon;
        class amovppnemstpsraswrfldnon_ace_deploy : amovppnemstpsraswrfldnon {
            aimPrecision = ACE_SWAY_DEPLOYPRONE;
            actions = "RifleProneActions_ace_deploy";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"amovppnemstpsraswrfldnon_ace_deploy", 0.02};
            ConnectFrom[] = {"amovppnemstpsraswrfldnon_ace_deploy", 0.02};
            InterpolateFrom[] = {"amovppnemstpsraswrfldnon", 0.02};
            InterpolateTo[] = {"amovppnemstpsraswrfldnon", 0.02};
        };

        class aadjppnemstpsraswrflddown;
        class aadjppnemstpsraswrflddown_ace_deploy : aadjppnemstpsraswrflddown {
            aimPrecision = ACE_SWAY_DEPLOYPRONE;
            actions = "RifleAdjustBKneelActions_ace_deploy";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjppnemstpsraswrflddown_ace_deploy", 0.02};
            ConnectFrom[] = {"aadjppnemstpsraswrflddown_ace_deploy", 0.02};
            InterpolateFrom[] = {"aadjppnemstpsraswrflddown", 0.02};
            InterpolateTo[] = {"aadjppnemstpsraswrflddown", 0.02};
        };

        class aadjppnemstpsraswrfldleft;
        class aadjppnemstpsraswrfldleft_ace_deploy : aadjppnemstpsraswrfldleft {
            aimPrecision = ACE_SWAY_DEPLOYPRONE;
            actions = "RifleAdjustLKneelActions_ace_deploy";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjppnemstpsraswrfldleft_ace_deploy", 0.02};
            ConnectFrom[] = {"aadjppnemstpsraswrfldleft_ace_deploy", 0.02};
            InterpolateFrom[] = {"aadjppnemstpsraswrfldleft", 0.02};
            InterpolateTo[] = {"aadjppnemstpsraswrfldleft", 0.02};
        };

        class aadjppnemstpsraswrfldright;
        class aadjppnemstpsraswrfldright_ace_deploy : aadjppnemstpsraswrfldright {
            aimPrecision = ACE_SWAY_DEPLOYPRONE;
            actions = "RifleAdjustRKneelActions_ace_deploy";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjppnemstpsraswrfldright_ace_deploy", 0.02};
            ConnectFrom[] = {"aadjppnemstpsraswrfldright_ace_deploy", 0.02};
            InterpolateFrom[] = {"aadjppnemstpsraswrfldright", 0.02};
            InterpolateTo[] = {"aadjppnemstpsraswrfldright", 0.02};
        };

        /////////////////////////////////////////////////////////////////////////////

        class AmovPercMstpSrasWrflDnon_ace_rested : AmovPercMstpSrasWrflDnon {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "RifleStandActions_ace_rested";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"AmovPercMstpSrasWrflDnon_ace_rested", 0.02};
            ConnectFrom[] = {"AmovPercMstpSrasWrflDnon_ace_rested", 0.02};
            InterpolateFrom[] = {"AmovPercMstpSrasWrflDnon", 0.02};
            InterpolateTo[] = {"AmovPercMstpSrasWrflDnon", 0.02};
        };

        class aadjpercmstpsraswrfldup_ace_rested : aadjpercmstpsraswrfldup {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "RifleAdjustFStandActions_ace_rested";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjpercmstpsraswrfldup_ace_rested", 0.02};
            ConnectFrom[] = {"aadjpercmstpsraswrfldup_ace_rested", 0.02};
            InterpolateFrom[] = {"aadjpercmstpsraswrfldup", 0.02};
            InterpolateTo[] = {"aadjpercmstpsraswrfldup", 0.02};
        };

        class aadjpercmstpsraswrflddown_ace_rested : aadjpercmstpsraswrflddown {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "RifleAdjustBStandActions_ace_rested";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjpercmstpsraswrflddown_ace_rested", 0.02};
            ConnectFrom[] = {"aadjpercmstpsraswrflddown_ace_rested", 0.02};
            InterpolateFrom[] = {"aadjpercmstpsraswrflddown", 0.02};
            InterpolateTo[] = {"aadjpercmstpsraswrflddown", 0.02};
        };

        class aadjpercmstpsraswrfldright_ace_rested : aadjpercmstpsraswrfldright {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "RifleAdjustRStandActions_ace_rested";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjpercmstpsraswrfldright_ace_rested", 0.02};
            ConnectFrom[] = {"aadjpercmstpsraswrfldright_ace_rested", 0.02};
            InterpolateFrom[] = {"aadjpercmstpsraswrfldright", 0.02};
            InterpolateTo[] = {"aadjpercmstpsraswrfldright", 0.02};
        };

        class aadjpercmstpsraswrfldleft_ace_rested : aadjpercmstpsraswrfldleft {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "RifleAdjustLStandActions_ace_rested";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjpercmstpsraswrfldleft_ace_rested", 0.02};
            ConnectFrom[] = {"aadjpercmstpsraswrfldleft_ace_rested", 0.02};
            InterpolateFrom[] = {"aadjpercmstpsraswrfldleft", 0.02};
            InterpolateTo[] = {"aadjpercmstpsraswrfldleft", 0.02};
        };

        class aadjpknlmstpsraswrfldup_ace_rested : aadjpknlmstpsraswrfldup {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "RifleAdjustFKneelActions_ace_rested";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjpknlmstpsraswrfldup_ace_rested", 0.02};
            ConnectFrom[] = {"aadjpknlmstpsraswrfldup_ace_rested", 0.02};
            InterpolateFrom[] = {"aadjpknlmstpsraswrfldup", 0.02};
            InterpolateTo[] = {"aadjpknlmstpsraswrfldup", 0.02};
        };

        class amovpknlmstpsraswrfldnon_ace_rested : amovpknlmstpsraswrfldnon {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "RifleKneelActions_ace_rested";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"amovpknlmstpsraswrfldnon_ace_rested", 0.02};
            ConnectFrom[] = {"amovpknlmstpsraswrfldnon_ace_rested", 0.02};
            InterpolateFrom[] = {"amovpknlmstpsraswrfldnon", 0.02};
            InterpolateTo[] = {"amovpknlmstpsraswrfldnon", 0.02};
        };

        class aadjpknlmstpsraswrflddown_ace_rested : aadjpknlmstpsraswrflddown {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "RifleAdjustBKneelActions_ace_rested";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjpknlmstpsraswrflddown_ace_rested", 0.02};
            ConnectFrom[] = {"aadjpknlmstpsraswrflddown_ace_rested", 0.02};
            InterpolateFrom[] = {"aadjpknlmstpsraswrflddown", 0.02};
            InterpolateTo[] = {"aadjpknlmstpsraswrflddown", 0.02};
        };

        class aadjpknlmstpsraswrfldleft_ace_rested : aadjpknlmstpsraswrfldleft {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "RifleAdjustLKneelActions_ace_rested";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjpknlmstpsraswrfldleft_ace_rested", 0.02};
            ConnectFrom[] = {"aadjpknlmstpsraswrfldleft_ace_rested", 0.02};
            InterpolateFrom[] = {"aadjpknlmstpsraswrfldleft", 0.02};
            InterpolateTo[] = {"aadjpknlmstpsraswrfldleft", 0.02};
        };

        class aadjpknlmstpsraswrfldright_ace_rested : aadjpknlmstpsraswrfldright {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "RifleAdjustRKneelActions_ace_rested";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjpknlmstpsraswrfldright_ace_rested", 0.02};
            ConnectFrom[] = {"aadjpknlmstpsraswrfldright_ace_rested", 0.02};
            InterpolateFrom[] = {"aadjpknlmstpsraswrfldright", 0.02};
            InterpolateTo[] = {"aadjpknlmstpsraswrfldright", 0.02};
        };

        class aadjppnemstpsraswrfldup_ace_rested : aadjppnemstpsraswrfldup {
            aimPrecision = ACE_SWAY_RESTEDPRONE;
            actions = "RifleAdjustFProneActions_ace_rested";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjppnemstpsraswrfldup_ace_rested", 0.02};
            ConnectFrom[] = {"aadjppnemstpsraswrfldup_ace_rested", 0.02};
            InterpolateFrom[] = {"aadjppnemstpsraswrfldup", 0.02};
            InterpolateTo[] = {"aadjppnemstpsraswrfldup", 0.02};
        };

        class amovppnemstpsraswrfldnon_ace_rested : amovppnemstpsraswrfldnon {
            aimPrecision = ACE_SWAY_RESTEDPRONE;
            actions = "RifleProneActions_ace_rested";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"amovppnemstpsraswrfldnon_ace_rested", 0.02};
            ConnectFrom[] = {"amovppnemstpsraswrfldnon_ace_rested", 0.02};
            InterpolateFrom[] = {"amovppnemstpsraswrfldnon", 0.02};
            InterpolateTo[] = {"amovppnemstpsraswrfldnon", 0.02};
        };

        class aadjppnemstpsraswrflddown_ace_rested : aadjppnemstpsraswrflddown {
            aimPrecision = ACE_SWAY_RESTEDPRONE;
            actions = "RifleAdjustBKneelActions_ace_rested";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjppnemstpsraswrflddown_ace_rested", 0.02};
            ConnectFrom[] = {"aadjppnemstpsraswrflddown_ace_rested", 0.02};
            InterpolateFrom[] = {"aadjppnemstpsraswrflddown", 0.02};
            InterpolateTo[] = {"aadjppnemstpsraswrflddown", 0.02};
        };

        class aadjppnemstpsraswrfldleft_ace_rested : aadjppnemstpsraswrfldleft {
            aimPrecision = ACE_SWAY_RESTEDPRONE;
            actions = "RifleAdjustLKneelActions_ace_rested";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjppnemstpsraswrfldleft_ace_rested", 0.02};
            ConnectFrom[] = {"aadjppnemstpsraswrfldleft_ace_rested", 0.02};
            InterpolateFrom[] = {"aadjppnemstpsraswrfldleft", 0.02};
            InterpolateTo[] = {"aadjppnemstpsraswrfldleft", 0.02};
        };

        class aadjppnemstpsraswrfldright_ace_rested : aadjppnemstpsraswrfldright {
            aimPrecision = ACE_SWAY_RESTEDPRONE;
            actions = "RifleAdjustRKneelActions_ace_rested";
            aiming = "aimingLying";
            speed = 0.01;
            onLandEnd = true;
            onLandBeg = true;

            ConnectTo[] = {"aadjppnemstpsraswrfldright_ace_rested", 0.02};
            ConnectFrom[] = {"aadjppnemstpsraswrfldright_ace_rested", 0.02};
            InterpolateFrom[] = {"aadjppnemstpsraswrfldright", 0.02};
            InterpolateTo[] = {"aadjppnemstpsraswrfldright", 0.02};
        };

        //////////////////////////////////////////////////////////////////////
        // FFV
        //////////////////////////////////////////////////////////////////////

        class passenger_bench_1_Aim;
        class passenger_bench_1_Aim_ace_deploy : passenger_bench_1_Aim {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "passenger_bench_1Actions_ace_deploy";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_bench_1_Aim_ace_deploy", 0.02};
            ConnectFrom[] = {"passenger_bench_1_Aim_ace_deploy", 0.02};
            InterpolateFrom[] = {"passenger_bench_1_Aim", 0.02};
            InterpolateTo[] = {"passenger_bench_1_Aim", 0.02};
        };

        class passenger_inside_1_Aim;
        class passenger_inside_1_Aim_ace_deploy : passenger_inside_1_Aim {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "passenger_inside_1Actions_ace_deploy";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_inside_1_Aim_ace_deploy", 0.02};
            ConnectFrom[] = {"passenger_inside_1_Aim_ace_deploy", 0.02};
            InterpolateFrom[] = {"passenger_inside_1_Aim", 0.02};
            InterpolateTo[] = {"passenger_inside_1_Aim", 0.02};
        };

        class passenger_inside_2_Aim;
        class passenger_inside_2_Aim_ace_deploy : passenger_inside_2_Aim {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "passenger_inside_2Actions_ace_deploy";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_inside_2_Aim_ace_deploy", 0.02};
            ConnectFrom[] = {"passenger_inside_2_Aim_ace_deploy", 0.02};
            InterpolateFrom[] = {"passenger_inside_2_Aim", 0.02};
            InterpolateTo[] = {"passenger_inside_2_Aim", 0.02};
        };

        class passenger_inside_3_Aim;
        class passenger_inside_3_Aim_ace_deploy : passenger_inside_3_Aim {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "passenger_inside_3Actions_ace_deploy";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_inside_3_Aim_ace_deploy", 0.02};
            ConnectFrom[] = {"passenger_inside_3_Aim_ace_deploy", 0.02};
            InterpolateFrom[] = {"passenger_inside_3_Aim", 0.02};
            InterpolateTo[] = {"passenger_inside_3_Aim", 0.02};
        };

        class passenger_inside_4_Aim;
        class passenger_inside_4_Aim_ace_deploy : passenger_inside_4_Aim {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "passenger_inside_4Actions_ace_deploy";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_inside_4_Aim_ace_deploy", 0.02};
            ConnectFrom[] = {"passenger_inside_4_Aim_ace_deploy", 0.02};
            InterpolateFrom[] = {"passenger_inside_4_Aim", 0.02};
            InterpolateTo[] = {"passenger_inside_4_Aim", 0.02};
        };

        class passenger_boat_1_Aim;
        class passenger_boat_1_Aim_ace_deploy : passenger_boat_1_Aim {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "passenger_boat_1Actions_ace_deploy";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_boat_1_Aim_ace_deploy", 0.02};
            ConnectFrom[] = {"passenger_boat_1_Aim_ace_deploy", 0.02};
            InterpolateFrom[] = {"passenger_boat_1_Aim", 0.02};
            InterpolateTo[] = {"passenger_boat_1_Aim", 0.02};
        };

        class passenger_boat_2_Aim;
        class passenger_boat_2_Aim_ace_deploy : passenger_boat_2_Aim {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "passenger_boat_2Actions_ace_deploy";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_boat_2_Aim_ace_deploy", 0.02};
            ConnectFrom[] = {"passenger_boat_2_Aim_ace_deploy", 0.02};
            InterpolateFrom[] = {"passenger_boat_2_Aim", 0.02};
            InterpolateTo[] = {"passenger_boat_2_Aim", 0.02};
        };

        class passenger_boat_3_Aim;
        class passenger_boat_3_Aim_ace_deploy : passenger_boat_3_Aim {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "passenger_boat_3Actions_ace_deploy";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_boat_3_Aim_ace_deploy", 0.02};
            ConnectFrom[] = {"passenger_boat_3_Aim_ace_deploy", 0.02};
            InterpolateFrom[] = {"passenger_boat_3_Aim", 0.02};
            InterpolateTo[] = {"passenger_boat_3_Aim", 0.02};
        };

        class passenger_boat_4_Aim;
        class passenger_boat_4_Aim_ace_deploy : passenger_boat_4_Aim {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "passenger_boat_4Actions_ace_deploy";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_boat_4_Aim_ace_deploy", 0.02};
            ConnectFrom[] = {"passenger_boat_4_Aim_ace_deploy", 0.02};
            InterpolateFrom[] = {"passenger_boat_4_Aim", 0.02};
            InterpolateTo[] = {"passenger_boat_4_Aim", 0.02};
        };

        class passenger_flatground_1_Aim;
        class passenger_flatground_1_Aim_ace_deploy : passenger_flatground_1_Aim {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "passenger_flatground_1Actions_ace_deploy";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_flatground_1_Aim_ace_deploy", 0.02};
            ConnectFrom[] = {"passenger_flatground_1_Aim_ace_deploy", 0.02};
            InterpolateFrom[] = {"passenger_flatground_1_Aim", 0.02};
            InterpolateTo[] = {"passenger_flatground_1_Aim", 0.02};
        };

        class passenger_flatground_2_Aim;
        class passenger_flatground_2_Aim_ace_deploy : passenger_flatground_2_Aim {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "passenger_flatground_2Actions_ace_deploy";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_flatground_2_Aim_ace_deploy", 0.02};
            ConnectFrom[] = {"passenger_flatground_2_Aim_ace_deploy", 0.02};
            InterpolateFrom[] = {"passenger_flatground_2_Aim", 0.02};
            InterpolateTo[] = {"passenger_flatground_2_Aim", 0.02};
        };

        class passenger_flatground_3_Aim;
        class passenger_flatground_3_Aim_ace_deploy : passenger_flatground_3_Aim {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "passenger_flatground_3Actions_ace_deploy";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_flatground_3_Aim_ace_deploy", 0.02};
            ConnectFrom[] = {"passenger_flatground_3_Aim_ace_deploy", 0.02};
            InterpolateFrom[] = {"passenger_flatground_3_Aim", 0.02};
            InterpolateTo[] = {"passenger_flatground_3_Aim", 0.02};
        };

        class passenger_flatground_4_Aim;
        class passenger_flatground_4_Aim_ace_deploy : passenger_flatground_4_Aim {
            aimPrecision = ACE_SWAY_DEPLOY;
            actions = "passenger_flatground_4Actions_ace_deploy";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_flatground_4_Aim_ace_deploy", 0.02};
            ConnectFrom[] = {"passenger_flatground_4_Aim_ace_deploy", 0.02};
            InterpolateFrom[] = {"passenger_flatground_4_Aim", 0.02};
            InterpolateTo[] = {"passenger_flatground_4_Aim", 0.02};
        };

        //////////////////////////////////////////////////////////////////////

        class passenger_bench_1_Aim_ace_rested : passenger_bench_1_Aim {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "passenger_bench_1Actions_ace_rested";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_bench_1_Aim_ace_rested", 0.02};
            ConnectFrom[] = {"passenger_bench_1_Aim_ace_rested", 0.02};
            InterpolateFrom[] = {"passenger_bench_1_Aim", 0.02};
            InterpolateTo[] = {"passenger_bench_1_Aim", 0.02};
        };

        class passenger_inside_1_Aim_ace_rested : passenger_inside_1_Aim {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "passenger_inside_1Actions_ace_rested";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_inside_1_Aim_ace_rested", 0.02};
            ConnectFrom[] = {"passenger_inside_1_Aim_ace_rested", 0.02};
            InterpolateFrom[] = {"passenger_inside_1_Aim", 0.02};
            InterpolateTo[] = {"passenger_inside_1_Aim", 0.02};
        };

        class passenger_inside_2_Aim_ace_rested : passenger_inside_2_Aim {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "passenger_inside_2Actions_ace_rested";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_inside_2_Aim_ace_rested", 0.02};
            ConnectFrom[] = {"passenger_inside_2_Aim_ace_rested", 0.02};
            InterpolateFrom[] = {"passenger_inside_2_Aim", 0.02};
            InterpolateTo[] = {"passenger_inside_2_Aim", 0.02};
        };

        class passenger_inside_3_Aim_ace_rested : passenger_inside_3_Aim {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "passenger_inside_3Actions_ace_rested";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_inside_3_Aim_ace_rested", 0.02};
            ConnectFrom[] = {"passenger_inside_3_Aim_ace_rested", 0.02};
            InterpolateFrom[] = {"passenger_inside_3_Aim", 0.02};
            InterpolateTo[] = {"passenger_inside_3_Aim", 0.02};
        };

        class passenger_inside_4_Aim_ace_rested : passenger_inside_4_Aim {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "passenger_inside_4Actions_ace_rested";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_inside_4_Aim_ace_rested", 0.02};
            ConnectFrom[] = {"passenger_inside_4_Aim_ace_rested", 0.02};
            InterpolateFrom[] = {"passenger_inside_4_Aim", 0.02};
            InterpolateTo[] = {"passenger_inside_4_Aim", 0.02};
        };

        class passenger_boat_1_Aim_ace_rested : passenger_boat_1_Aim {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "passenger_boat_1Actions_ace_rested";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_boat_1_Aim_ace_rested", 0.02};
            ConnectFrom[] = {"passenger_boat_1_Aim_ace_rested", 0.02};
            InterpolateFrom[] = {"passenger_boat_1_Aim", 0.02};
            InterpolateTo[] = {"passenger_boat_1_Aim", 0.02};
        };

        class passenger_boat_2_Aim_ace_rested : passenger_boat_2_Aim {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "passenger_boat_2Actions_ace_rested";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_boat_2_Aim_ace_rested", 0.02};
            ConnectFrom[] = {"passenger_boat_2_Aim_ace_rested", 0.02};
            InterpolateFrom[] = {"passenger_boat_2_Aim", 0.02};
            InterpolateTo[] = {"passenger_boat_2_Aim", 0.02};
        };

        class passenger_boat_3_Aim_ace_rested : passenger_boat_3_Aim {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "passenger_boat_3Actions_ace_rested";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_boat_3_Aim_ace_rested", 0.02};
            ConnectFrom[] = {"passenger_boat_3_Aim_ace_rested", 0.02};
            InterpolateFrom[] = {"passenger_boat_3_Aim", 0.02};
            InterpolateTo[] = {"passenger_boat_3_Aim", 0.02};
        };

        class passenger_boat_4_Aim_ace_rested : passenger_boat_4_Aim {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "passenger_boat_4Actions_ace_rested";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_boat_4_Aim_ace_rested", 0.02};
            ConnectFrom[] = {"passenger_boat_4_Aim_ace_rested", 0.02};
            InterpolateFrom[] = {"passenger_boat_4_Aim", 0.02};
            InterpolateTo[] = {"passenger_boat_4_Aim", 0.02};
        };

        class passenger_flatground_1_Aim_ace_rested : passenger_flatground_1_Aim {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "passenger_flatground_1Actions_ace_rested";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_flatground_1_Aim_ace_rested", 0.02};
            ConnectFrom[] = {"passenger_flatground_1_Aim_ace_rested", 0.02};
            InterpolateFrom[] = {"passenger_flatground_1_Aim", 0.02};
            InterpolateTo[] = {"passenger_flatground_1_Aim", 0.02};
        };

        class passenger_flatground_2_Aim_ace_rested : passenger_flatground_2_Aim {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "passenger_flatground_2Actions_ace_rested";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_flatground_2_Aim_ace_rested", 0.02};
            ConnectFrom[] = {"passenger_flatground_2_Aim_ace_rested", 0.02};
            InterpolateFrom[] = {"passenger_flatground_2_Aim", 0.02};
            InterpolateTo[] = {"passenger_flatground_2_Aim", 0.02};
        };

        class passenger_flatground_3_Aim_ace_rested : passenger_flatground_3_Aim {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "passenger_flatground_3Actions_ace_rested";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_flatground_3_Aim_ace_rested", 0.02};
            ConnectFrom[] = {"passenger_flatground_3_Aim_ace_rested", 0.02};
            InterpolateFrom[] = {"passenger_flatground_3_Aim", 0.02};
            InterpolateTo[] = {"passenger_flatground_3_Aim", 0.02};
        };

        class passenger_flatground_4_Aim_ace_rested : passenger_flatground_4_Aim {
            aimPrecision = ACE_SWAY_RESTED;
            actions = "passenger_flatground_4Actions_ace_rested";
            aiming = "aimingDefault";
            speed = 0.01;
            onLandEnd = false;
            onLandBeg = false;

            ConnectTo[] = {"passenger_flatground_4_Aim_ace_rested", 0.02};
            ConnectFrom[] = {"passenger_flatground_4_Aim_ace_rested", 0.02};
            InterpolateFrom[] = {"passenger_flatground_4_Aim", 0.02};
            InterpolateTo[] = {"passenger_flatground_4_Aim", 0.02};
        };
    };
};
