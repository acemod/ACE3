class EGVAR(missileguidance,type_Sidewinder);
class EGVAR(missileguidance,type_ASRAAM);
class EGVAR(missileguidance,type_R74);
class CfgAmmo {
    class Missile_AA_04_F;
    class GVAR(m): Missile_AA_04_F {
        missileLockCone = 3; // caged lock
        missileKeepLockedCone = 45;
        missileLockMaxDistance = 5000;
        missileLockMinDistance = 250;

        author = "tcvm";
        maneuvrability = 0;

        class ace_missileguidance: EGVAR(missileguidance,type_Sidewinder) {
            enabled = 1;
        };
    };

    class ammo_Missile_BIM9X;
    class GVAR(x): ammo_Missile_BIM9X {
        missileLockCone = 3; // caged lock
        missileKeepLockedCone = 120;
        missileLockMaxDistance = 5000;
        missileLockMinDistance = 250;

        author = "tcvm";
        maneuvrability = 0;

        class ace_missileguidance: EGVAR(missileguidance,type_Sidewinder) {
            enabled = 1;
            pitchRate = 90;
            yawRate = 90;
            flareDistanceFilter = 50;
            flareAngleFilter = 0.8; // can filter out flares that are >= flareAngleFilter to known target velocity
            defaultNavigationType = "ZeroEffortMiss";
            navigationTypes[] = { "ZeroEffortMiss" };
            seekerAngle = 120;
            seekerAccuracy = 0.95;
        };
    };

    // AIM-132
    class M_Air_AA;
    class GVAR(aim132): M_Air_AA {
        missileLockCone = 3; // caged lock
        missileKeepLockedCone = 120;
        missileLockMaxDistance = 8000;
        missileLockMinDistance = 250;

        author = "tcvm";
        maneuvrability = 0;

        class ace_missileguidance: EGVAR(missileguidance,type_ASRAAM) {
            enabled = 1;
        };
    };

    // R-73
    class ammo_Missile_AA_R73;
    class GVAR(r73): ammo_Missile_AA_R73 {
        missileLockCone = 3; // caged lock
        missileKeepLockedCone = 40;
        missileLockMaxDistance = 5000;
        missileLockMinDistance = 250;

        author = "tcvm";
        maneuvrability = 0;

        class ace_missileguidance: EGVAR(missileguidance,type_Sidewinder) {
            enabled = 1;
        };
    };

    class Missile_AA_03_F;
    class GVAR(r74): Missile_AA_03_F {
        missileLockCone = 3; // caged lock
        missileKeepLockedCone = 75;
        missileLockMaxDistance = 8000;
        missileLockMinDistance = 250;

        author = "tcvm";
        maneuvrability = 0;

        class ace_missileguidance: EGVAR(missileguidance,type_R74) {
            enabled = 1;
        };
    };
};

