
class CfgMovesBasic {
    class ManActions {
        ACE_RifleToPistol[] = {"ACE_RifleToPistol","Gesture"};
        ACE_RifleToLauncher[] = {"ACE_RifleToLauncher","Gesture"};
        ACE_PistolToRifle[] = {"ACE_PistolToRifle","Gesture"};
        ACE_PistolLauncher[] = {"ACE_PistolLauncher","Gesture"};
        ACE_LauncherToRifle[] = {"ACE_LauncherToRifle","Gesture"};
        ACE_LauncherToPistol[] = {"ACE_LauncherToPistol","Gesture"};
    };
};

class CfgGesturesMale {
    class Default;
    class States {
        class ACE_RifleToPistol: Default {
            duty = 0.5;
            file = "\A3\anims_f\Data\Anim\Sdr\Mov\erc\stp\ras\rfl\AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWpstDnon";
            mask = "handsWeapon";
            speed = 1.875;
            disableWeapons = 1;
            interpolationRestart = 2;
            soundOverride = "rifle_to_handgun";
            leftHandIKCurve[] = {0.759,1,0.929,0};
            rightHandIKCurve[] = {0.17,1,0.298,0};
            weaponIK = 1;
        };

        class ACE_RifleToLauncher: Default {
            duty = 0.5;
            file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\ras\rfl\AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWlnrDnon";
            mask = "launcher";
            speed = 0.970588;
            disableWeapons = 1;
            interpolationRestart = 2;
            leaningFactorBeg = 1;
            leaningFactorEnd = 0.5;
            soundOverride = "rifle_to_launcher";
            rightHandIKCurve[] = {0.136,1,0.288,0};
            leftHandIKCurve[] = {0.5,1,0.773,0};
            weaponIK = 1;
        };

        class ACE_PistolToRifle: Default {
            duty = 0.5;
            file = "\A3\anims_f\Data\Anim\Sdr\Mov\erc\stp\ras\pst\AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWrflDnon";
            mask = "handsWeapon";
            speed = 1.23288;
            disableWeapons = 1;
            interpolationRestart = 2;
            soundOverride = "handgun_to_rifle";
        };

        class ACE_PistolLauncher: Default {
            duty = 0.5;
            file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\ras\pst\AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWlnrDnon";
            mask = "launcher";
            disableWeapons = 1;
            showHandGun = 1;
            speed = 1.4344;
            interpolationRestart = 2;
            weaponIK = 2;
            leftHandIKEnd = 0;
            leftHandIKBeg = 0;
            leftHandIKCurve[] = {};
            enableOptics = 2;
            soundOverride = "handgun_to_launcher";
        };

        class ACE_LauncherToRifle: Default {
            duty = 0.5;
            file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\ras\lnr\AmovPercMstpSrasWlnrDnon_AmovPercMstpSrasWrflDnon";
            mask = "launcher"
            speed = 0.66;
            disableWeapons = 1;
            interpolationRestart = 2;
            leftHandIKBeg = 0;
            leftHandIKEnd = 0;
            rightHandIKBeg = 0;
            rightHandIKEnd = 0;
            leaningFactorEnd = 1;
            leaningFactorBeg = 0.5;
            soundOverride = "launcher_to_rifle";
            rightHandIKCurve[] = {0.245,1,0.449,0};
            leftHandIKCurve[] = {0.643,1,0.724,0};
            weaponIK = 4;
        };

        class ACE_LauncherToPistol: Default {
            duty = 0.5;
            file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\ras\lnr\AmovPercMstpSrasWlnrDnon_AmovPercMstpSrasWpstDnon";
            mask = "launcher";
            speed = 0.9031;
            disableWeapons = 1;
            interpolationRestart = 2;
            rightHandIKBeg = 0;
            rightHandIKEnd = 0;
            leftHandIKBeg = 0;
            leftHandIKEnd = 0;
            soundOverride = "launcher_to_handgun";
            rightHandIKCurve[] = {0.639,1,0.778,0};
            leftHandIKCurve[] = {0.819,1,0.917,0};
            weaponIK = 4;
            enableOptics = 2;
        };
    };
};
