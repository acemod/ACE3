class CfgMovesBasic {
    class ManActions {
        GVAR(forward) = QGVAR(forward);
        GVAR(freeze) = QGVAR(freeze);
        GVAR(cover) = QGVAR(cover);
        GVAR(regroup) = QGVAR(regroup);
        GVAR(engage) = QGVAR(engage);
        GVAR(point) = QGVAR(point);
        GVAR(hold) = QGVAR(hold);
        GVAR(warning) = QGVAR(warningS);

        GVAR(forwardStandLowered) = QGVAR(forwardStandLowered);
        GVAR(freezeStandLowered) = QGVAR(freezeStandLowered);
        GVAR(coverStandLowered) = QGVAR(coverStandLowered);
        GVAR(regroupStandLowered) = QGVAR(regroupStandLowered);
        GVAR(engageStandLowered) = QGVAR(engageStandLowered);
        GVAR(pointStandLowered) = QGVAR(pointStandLowered);
        GVAR(holdStandLowered) = QGVAR(holdStandLowered);
        GVAR(warningStandLowered) = QGVAR(warningStandLowered);
    };

    class Actions {
        class NoActions: ManActions {
            GVAR(forward)[] = {QGVAR(forward), "Gesture"};
            GVAR(freeze)[] = {QGVAR(freeze), "Gesture"};
            GVAR(cover)[] = {QGVAR(cover), "Gesture"};
            GVAR(regroup)[] = {QGVAR(regroup), "Gesture"};
            GVAR(engage)[] = {QGVAR(engage), "Gesture"};
            GVAR(point)[] = {QGVAR(point), "Gesture"};
            GVAR(hold)[] = {QGVAR(hold), "Gesture"};
            GVAR(warning)[] = {QGVAR(warning), "Gesture"};

            GVAR(forwardStandLowered)[] = {QGVAR(forwardStandLowered), "Gesture"};
            GVAR(freezeStandLowered)[] = {QGVAR(freezeStandLowered), "Gesture"};
            GVAR(coverStandLowered)[] = {QGVAR(coverStandLowered), "Gesture"};
            GVAR(regroupStandLowered)[] = {QGVAR(regroupStandLowered), "Gesture"};
            GVAR(engageStandLowered)[] = {QGVAR(engageStandLowered), "Gesture"};
            GVAR(pointStandLowered)[] = {QGVAR(pointStandLowered), "Gesture"};
            GVAR(holdStandLowered)[] = {QGVAR(holdStandLowered), "Gesture"};
            GVAR(warningStandLowered)[] = {QGVAR(warningStandLowered), "Gesture"};
        };
    };
};

class CfgGesturesMale {
    class Default;

    class BlendAnims {
        GVAR(LeftArm)[] = {
            "LeftShoulder", 1,
            "LeftArm", 1,
            "LeftArmRoll", 1,
            "LeftForeArm", 1,
            "LeftForeArmRoll", 1,
            "LeftHand", 1,
            "LeftHandIndex1", 1,
            "LeftHandIndex2", 1,
            "LeftHandIndex3", 1,
            "LeftHandMiddle1", 1,
            "LeftHandMiddle2", 1,
            "LeftHandMiddle3", 1,
            "LeftHandPinky1", 1,
            "LeftHandMiddle2", 1,
            "LeftHandMiddle3", 1,
            "LeftHandPinky1", 1,
            "LeftHandPinky2", 1,
            "LeftHandPinky3", 1,
            "LeftHandRing", 1,
            "LeftHandRing1", 1,
            "LeftHandRing2", 1,
            "LeftHandRing3", 1,
            "LeftHandThumb1", 1,
            "LeftHandThumb2", 1,
            "LeftHandThumb3", 1
        };
    };

    class States {
        class GVAR(Base): Default {
            actions = "NoActions";
            canPullTrigger = 0;
            connectAs = "";
            connectFrom[] = {};
            connectTo[] = {};
            disableWeapons = 0;
            enableBinocular = 1;
            enableMissile = 1;
            enableOptics = 0;
            equivalentTo = "";
            file = "\A3\anims_f\Data\anim\Sdr\gst\GestureHi.rtm";
            forceAim = 0;
            headBobMode = 0;
            headBobStrength = 0;
            interpolateFrom[] = {};
            interpolateTo[] = {};
            interpolateWith[] = {};
            interpolationRestart = 0;
            interpolationSpeed = 6;
            looped = 0;
            mask = QGVAR(LeftArm);
            minPlayTime = 0.5;
            preload = 0;
            ragdoll = 0;
            relSpeedMax = 1;
            relSpeedMin = 1;
            showHandGun = 0;
            showItemInHand = 0;
            showItemInRightHand = 0;
            showWeaponAim = 1;
            soundEdge[] = {0.5,1};
            soundEnabled = 1;
            soundOverride = "";
            speed = -2;
            static = 0;
            terminal = 0;
            Walkcycles = 1;
            weaponIK = 1;

            leftHandIKBeg = 1;
            leftHandIKCurve[] = {0, 1, 0.1, 0, 0.8, 0, 1, 1};
            leftHandIKEnd = 1;

            rightHandIKBeg = 1;
            rightHandIKCurve[] = {1};
            rightHandIKEnd = 1;
        };

        class GVAR(forward): GVAR(Base) {
            file = QPATHTOF(anim\ace_forward.rtm);
            speed = 1;
        };

        class GVAR(forwardStandLowered): GVAR(forward) {
            file = QPATHTOF(anim\ace_forward_stand_lowered.rtm);
        };

        class GVAR(freeze): GVAR(forward) {
            file = QPATHTOF(anim\ace_freeze.rtm);
            speed = 0.6;
        };

        class GVAR(freezeStandLowered): GVAR(freeze) {
            file = QPATHTOF(anim\ace_freeze_stand_lowered.rtm);
        };

        class GVAR(cover): GVAR(forward) {
            file = QPATHTOF(anim\ace_cover.rtm);
            speed = 0.8;
        };

        class GVAR(coverStandLowered): GVAR(cover) {
            file = QPATHTOF(anim\ace_cover_stand_lowered.rtm);
        };

        class GVAR(regroup): GVAR(forward) {
            file = QPATHTOF(anim\ace_regroup.rtm);
            speed = 0.8;
        };

        class GVAR(regroupStandLowered): GVAR(regroup) {
            file = QPATHTOF(anim\ace_regroup_stand_lowered.rtm);
        };

        class GVAR(engage): GVAR(forward) {
            file = QPATHTOF(anim\ace_engage.rtm);
            speed = 0.9;
        };

        class GVAR(engageStandLowered): GVAR(engage) {
            file = QPATHTOF(anim\ace_engage_stand_lowered.rtm);
        };

        class GVAR(point): GVAR(forward) {
            file = QPATHTOF(anim\ace_point.rtm);
            speed = 0.8;
        };

        class GVAR(pointStandLowered): GVAR(point) {
            file = QPATHTOF(anim\ace_point_stand_lowered.rtm);
        };

        class GVAR(hold): GVAR(forward) {
            file = QPATHTOF(anim\ace_hold.rtm);
            speed = 0.8;
        };

        class GVAR(holdStandLowered): GVAR(hold) {
            file = QPATHTOF(anim\ace_hold_stand_lowered.rtm);
        };

        class GVAR(warning): GVAR(forward) {
            file = QPATHTOF(anim\ace_warning.rtm);
            speed = 0.8;
        };

        class GVAR(warningStandLowered): GVAR(warning) {
            file = QPATHTOF(anim\ace_warning_stand_lowered.rtm);
        };
    };
};
