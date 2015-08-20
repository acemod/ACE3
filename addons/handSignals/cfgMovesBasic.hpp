class CfgMovesBasic {
    class ManActions {
        GVAR(FORWARD) = QGVAR(FORWARD);
        GVAR(STOP) = QGVAR(STOP);
        GVAR(COVER) = QGVAR(COVER);
        GVAR(REGROUP) = QGVAR(REGROUP);
        GVAR(ENGAGE) = QGVAR(ENGAGE);
        GVAR(POINT) = QGVAR(POINT);
        GVAR(HOLD) = QGVAR(HOLD);
        GVAR(WARNINGS) = QGVAR(WARNINGS);

        GVAR(FORWARDStandLowered) = QGVAR(FORWARDStandLowered);
        GVAR(STOPStandLowered) = QGVAR(STOPStandLowered);
        GVAR(COVERtandLowered) = QGVAR(COVERtandLowered);
        GVAR(REGROUPStandLowered) = QGVAR(REGROUPStandLowered);
        GVAR(ENGAGEStandLowered) = QGVAR(ENGAGEStandLowered);
        GVAR(POINTStandLowered) = QGVAR(POINTStandLowered);
        GVAR(HOLDStandLowered) = QGVAR(HOLDStandLowered);
        GVAR(WARNINGStandLowered) = QGVAR(WARNINGStandLowered);
    };

    class Actions {
        class NoActions: ManActions {
            GVAR(FORWARD)[] = {QGVAR(FORWARD), "Gesture"};
            GVAR(STOP)[] = {QGVAR(STOP), "Gesture"};
            GVAR(COVER)[] = {QGVAR(COVER), "Gesture"};
            GVAR(REGROUP)[] = {QGVAR(REGROUP), "Gesture"};
            GVAR(ENGAGE)[] = {QGVAR(ENGAGE), "Gesture"};
            GVAR(POINT)[] = {QGVAR(POINT), "Gesture"};
            GVAR(HOLD)[] = {QGVAR(HOLD), "Gesture"};
            GVAR(WARNINGS)[] = {QGVAR(WARNINGS), "Gesture"};

            GVAR(FORWARDStandLowered)[] = {QGVAR(FORWARDStandLowered), "Gesture"};
            GVAR(STOPStandLowered)[] = {QGVAR(STOPStandLowered), "Gesture"};
            GVAR(COVERtandLowered)[] = {QGVAR(COVERtandLowered), "Gesture"};
            GVAR(REGROUPStandLowered)[] = {QGVAR(REGROUPStandLowered), "Gesture"};
            GVAR(ENGAGEStandLowered)[] = {QGVAR(ENGAGEStandLowered), "Gesture"};
            GVAR(POINTStandLowered)[] = {QGVAR(POINTStandLowered), "Gesture"};
            GVAR(HOLDStandLowered)[] = {QGVAR(HOLDStandLowered), "Gesture"};
            GVAR(WARNINGSStandLowered)[] = {QGVAR(WARNINGSStandLowered), "Gesture"};
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
            file = "\A3\anims_f\Dataanim\Sdr\gst\GestureHi.rtm";
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

        class GVAR(FORWARD): GVAR(Base) {
            file = QUOTE(PATHTOF(anim\ace_forward.rtm));
            speed = 1;
        };

        class GVAR(FORWARDStandLowered): GVAR(FORWARD) {
            file = QUOTE(PATHTOF(anim\ace_forward_stand_lowered.rtm));
        };

        class GVAR(STOP): GVAR(FORWARD) {
            file = QUOTE(PATHTOF(anim\ace_stop.rtm));
            speed = 0.6;
        };

        class GVAR(STOPStandLowered): GVAR(STOP) {
            file = QUOTE(PATHTOF(anim\ace_stop_stand_lowered.rtm));
        };

        class GVAR(COVER): GVAR(FORWARD) {
            file = QUOTE(PATHTOF(anim\ace_cover.rtm));
            speed = 0.8;
        };

        class GVAR(COVERtandLowered): GVAR(COVER) {
            file = QUOTE(PATHTOF(anim\ace_cover_stand_lowered.rtm));
        };

        class GVAR(REGROUP): GVAR(FORWARD) {
            file = QUOTE(PATHTOF(anim\ace_regroup.rtm));
            speed = 0.8;
        };

        class GVAR(REGROUPStandLowered): GVAR(REGROUP) {
            file = QUOTE(PATHTOF(anim\ace_regroup_stand_lowered.rtm));
        };

        class GVAR(ENGAGE): GVAR(FORWARD) {
            file = QUOTE(PATHTOF(anim\ace_engage.rtm));
            speed = 0.9;
        };

        class GVAR(ENGAGEStandLowered): GVAR(ENGAGE) {
            file = QUOTE(PATHTOF(anim\ace_engage_stand_lowered.rtm));
        };

        class GVAR(POINT): GVAR(FORWARD) {
            file = QUOTE(PATHTOF(anim\ace_point.rtm));
            speed = 0.8;
        };

        class GVAR(POINTStandLowered): GVAR(POINT) {
            file = QUOTE(PATHTOF(anim\ace_point_stand_lowered.rtm));
        };

        class GVAR(HOLD): GVAR(FORWARD) {
            file = QUOTE(PATHTOF(anim\ace_hold.rtm));
            speed = 0.8;
        };

        class GVAR(HOLDStandLowered): GVAR(HOLD) {
            file = QUOTE(PATHTOF(anim\ace_hold_stand_lowered.rtm));
        };

        class GVAR(WARNINGS): GVAR(FORWARD) {
            file = QUOTE(PATHTOF(anim\ace_warning.rtm));
            speed = 0.8;
        };

        class GVAR(WARNINGStandLowered): GVAR(WARNINGS) {
            file = QUOTE(PATHTOF(anim\ace_warning_stand_lowered.rtm));
        };
    };
};
