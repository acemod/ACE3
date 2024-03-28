class CfgMovesMaleSdr: CfgMovesBasic {
    class Default;
    class TransAnimBase;
    class AmovPpneMstpSrasWlnrDnon;
    class States {
        //Prone Stopped Launcher
        class ACE_LauncherProne: AmovPpneMstpSrasWlnrDnon {
            variantsAI[] = {};
            variantsPlayer[] = {};
            duty = -1.2;
            showWeaponAim = 0;
            disableWeapons = 0;
            disableWeaponsLong = 0;
            enableMissile = 1;
            canPullTrigger = 1;
            aimPrecision = 0.30000001;
            speed = 1e+010;
            actions = "ACE_LauncherProneActions";
            file = QPATHTOF(anim\ACE_Launcher_Lying.rtm);
            interpolateFrom[] = {
                "AmovPercMstpSrasWlnrDnon", 0.02,
                "AmovPknlMstpSrasWlnrDnon", 0.02,
                "AmovPpneMstpSrasWlnrDnon_turnL", 0.02,
                "AmovPpneMstpSrasWlnrDnon_turnR", 0.02,
                "AmovPpneMrunSrasWlnrDf", 0.02,
                "AmovPpneMrunSrasWlnrDfl", 0.02,
                "AmovPpneMrunSrasWlnrDl", 0.02,
                "AmovPpneMrunSrasWlnrDbl", 0.02,
                "AmovPpneMrunSrasWlnrDb", 0.02,
                "AmovPpneMrunSrasWlnrDbr", 0.02,
                "AmovPpneMrunSrasWlnrDr", 0.02,
                "AmovPpneMrunSrasWlnrDfr", 0.02
            };
            connectTo[] = {};
            interpolateTo[] = {
                "AmovPpneMstpSrasWlnrDnon_turnL", 0.02,
                "AmovPpneMstpSrasWlnrDnon_turnR", 0.02,
                "AmovPpneMstpSrasWlnrDnon_AmovPknlMstpSrasWlnrDnon", 0.02,
                "AmovPpneMrunSrasWlnrDf", 0.02,
                "AmovPpneMrunSrasWlnrDfl", 0.02,
                "AmovPpneMrunSrasWlnrDl", 0.02,
                "AmovPpneMrunSrasWlnrDbl", 0.02,
                "AmovPpneMrunSrasWlnrDb", 0.02,
                "AmovPpneMrunSrasWlnrDbr", 0.02,
                "AmovPpneMrunSrasWlnrDr", 0.02,
                "AmovPpneMrunSrasWlnrDfr", 0.02,
                "AmovPpneMstpSrasWlnrDnon", 0.02,
                "Unconscious", 0.02,
                "Campaign_Base", 0.02
            };
        };
        //Prone Stopped Launcher Turn Left
        class AmovPpneMstpSrasWlnrDnon_turnL: AmovPpneMstpSrasWlnrDnon {
            actions = "ACE_LauncherProneActions";
            aimPrecision = 5;
            connectTo[] += {
                "AmovPpneMstpSrasWlnrDnon_turnL", 0.02
            };
            interpolateTo[] += {
                "AmovPpneMstpSrasWlnrDnon", 0.02
            };
        };
        //Prone Stopped Launcher Turn Right
        class AmovPpneMstpSrasWlnrDnon_turnR: AmovPpneMstpSrasWlnrDnon {
            actions = "ACE_LauncherProneActions";
            aimPrecision = 5;
            connectTo[] += {
                "AmovPpneMstpSrasWlnrDnon_turnR", 0.02
            };
            interpolateTo[] += {
                "AmovPpneMstpSrasWlnrDnon", 0.02
            };
        };
        //Prone Stopped Launcher -> Standing Stopped Launcher
        //class AmovPpneMstpSrasWlnrDnon_AmovPercMstpSrasWlnrDnon: TransAnimBase {
        //    actions = "LauncherStandActions";
        //    duty = 2;
        //    enableOptics = 1;
        //    reverse = "AmovPercMstpSrasWlnrDnon_AmovPpneMstpSrasWlnrDnon";
        //    interpolateTo[] += {
        //        "AmovPercMstpSrasWlnrDnon", 0.02
        //    };
        //};
        class AmovPpneMrunSrasWlnrDf: AmovPpneMstpSrasWlnrDnon {
            speed = 0.600541;
            duty = 0.6;
            disableWeapons = 1;
            disableWeaponsLong = 1;
            enableMissile = 0;
            canPullTrigger = 0;
            actions = "ACE_LauncherProneActions";
        };
        class AmovPpneMrunSrasWlnrDfl: AmovPpneMrunSrasWlnrDf {
            speed = 0.833333;
            duty = 0.6;
            actions = "ACE_LauncherProneActions";
        };
        class AmovPpneMrunSrasWlnrDl: AmovPpneMrunSrasWlnrDf {
            speed = 0.625;
            duty = 0.6;
            actions = "ACE_LauncherProneActions";
        };
        class AmovPpneMrunSrasWlnrDbl: AmovPpneMrunSrasWlnrDf {
            speed = 0.702524;
            duty = 0.6;
            actions = "ACE_LauncherProneActions";
        };
        class AmovPpneMrunSrasWlnrDb: AmovPpneMrunSrasWlnrDf {
            speed = 0.702524;
            duty = 0.6;
            actions = "ACE_LauncherProneActions";
        };
        class AmovPpneMrunSrasWlnrDbr: AmovPpneMrunSrasWlnrDf {
            speed = 0.702524;
            duty = 0.6;
            actions = "ACE_LauncherProneActions";
        };
        class AmovPpneMrunSrasWlnrDr: AmovPpneMrunSrasWlnrDf {
            speed = 0.859341;
            duty = 0.6;
            actions = "ACE_LauncherProneActions";
        };
        class AmovPpneMrunSrasWlnrDfr: AmovPpneMrunSrasWlnrDf {
            speed = 0.9375;
            duty = 0.6;
            actions = "ACE_LauncherProneActions";
        };
        class ProneLauncher_To_ProneRifle: AmovPpneMrunSrasWlnrDl {
            speed = 0.9375;
            duty = 0.6;
            disableWeapons = 1;
            actions = "ACE_LauncherProneActions";
            interpolateFrom[] = {
                "ACE_LauncherProne", 0.015
            };
            interpolateTo[] = {
                "ProneLauncher_To_ProneRifle_End", 0.02
            };
        };
        class ProneLauncher_To_ProneRifle_End: AmovPpneMrunSrasWlnrDf {
            speed = 0.9375;
            duty = 0.6;
            disableWeapons = 1;
            actions = "ACE_LauncherProneActions";
            interpolateTo[] = {
                "AmovPpneMstpSrasWrflDnon", 0.02,
                "amovppnemstpsnonwnondnon", 0.02,
                "AmovPpneMstpSrasWpstDnon", 0.02
            };
        };
        class ProneRifle_To_ProneLauncher: ProneLauncher_To_ProneRifle {
            speed = 0.76;
            duty = 0.6;
            interpolateFrom[] = {
                "AmovPpneMstpSrasWrflDnon", 0.02
            };
            interpolateTo[] = {
                "AmovPpneMrunSrasWlnrDf", 0.015,
                "AmovPpneMrunSrasWlnrDr", 0.015,
                "AmovPpneMrunSrasWlnrDl", 0.015,
                "ACE_LauncherProne", 0.015
            };
        };
        class PronePistol_To_ProneLauncher: ProneLauncher_To_ProneRifle {
            speed = 0.76;
            duty = 0.6;
            interpolateFrom[] = {
                "AmovPpneMstpSrasWpstDnon", 0.015
            };
            interpolateTo[] = {
                "AmovPpneMrunSrasWlnrDf", 0.015,
                "AmovPpneMrunSrasWlnrDr", 0.015,
                "AmovPpneMrunSrasWlnrDl", 0.015,
                "ACE_LauncherProne", 0.015
            };
        };
        class ProneCivil_To_ProneLauncher: ProneLauncher_To_ProneRifle {
            speed = 0.76;
            duty = 0.6;
            interpolateFrom[] = {
                "AmovPpneMstpSnonWnonDnon", 0.015
            };
            interpolateTo[] = {
                "AmovPpneMrunSrasWlnrDf", 0.015,
                "AmovPpneMrunSrasWlnrDr", 0.015,
                "AmovPpneMrunSrasWlnrDl", 0.015,
                "ACE_LauncherProne", 0.015
            };
        };
        class AmovPercMstpSrasWlnrDnon_AmovPpneMstpSrasWlnrDnon: TransAnimBase {
            mask = "weaponSwitching";
        };
        class AmovPpneMstpSrasWlnrDnon_AmovPknlMstpSrasWlnrDnon: TransAnimBase {
            blockMobileSwitching = 0;
            ConnectTo[] = {};
            InterpolateTo[] += {
                "AmovPknlMstpSrasWlnrDnon", 0.02,
                "AmovPercMstpSrasWlnrDnon", 0.02
            };
        };
        class LauncherProne_Reload_Start: AmovPpneMrunSrasWlnrDl {
            actions = "ACE_LauncherProneActions";
            speed = 0.7375;
            duty = 0.6;
            disableWeapons = 1;
            disableWeaponsLong = 1;
            enableMissile = 0;
            canPullTrigger = 0;
            interpolateFrom[] = {
                "ACE_LauncherProne", 0.02
            };
            interpolateTo[] = {
                "LauncherProne_Reload_Mid", 0.005
            };
        };
        class LauncherProne_Reload_Mid: AmovPpneMrunSrasWlnrDr {
            actions = "ACE_LauncherProneActions";
            speed = 0.7375;
            duty = 0.6;
            disableWeapons = 1;
            disableWeaponsLong = 1;
            enableMissile = 0;
            canPullTrigger = 0;
            interpolateTo[] = {
                "LauncherProne_Reload_End", 0.005
            };
        };
        class LauncherProne_Reload_End: AmovPpneMrunSrasWlnrDf {
            actions = "ACE_LauncherProneActions";
            speed = 0.7375;
            duty = 0.6;
            disableWeapons = 1;
            disableWeaponsLong = 1;
            enableMissile = 0;
            canPullTrigger = 0;
            interpolateTo[] = {
                "ACE_LauncherProne", 0.02
            };
        };
    };
};
