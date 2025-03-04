class EGVAR(missileguidance,type_AMRAAM);
class EGVAR(missileguidance,type_R77);
class CfgAmmo {
    class ammo_Missile_AMRAAM_C;
    class M_Zephyr;
    // AIM-120
    class GVAR(a): M_Zephyr {
        missileLockCone = 30;
        missileKeepLockedCone = 30;
        missileLockMaxDistance = 16000;
        missileLockMinDistance = 500;

        author = "Dani (TCVM)";
        maneuvrability = 0;
        flightProfiles[] = {"Direct", "Loft"};
        class Direct {}; // dummy to allow for F cycling of missile mode
        class Loft {
            textureType = "topDown";
        };
        class ace_missileguidance: EGVAR(missileguidance,type_AMRAAM) {
            enabled = 1;
        };
    };

    class GVAR(c): ammo_Missile_AMRAAM_C {
        missileLockCone = 30;
        missileKeepLockedCone = 30;
        missileLockMaxDistance = 16000;
        missileLockMinDistance = 500;

        author = "Dani (TCVM)";
        maneuvrability = 0;
        flightProfiles[] = {"Direct", "Loft"};
        class Direct {}; // dummy to allow for F cycling of missile mode
        class Loft {
            textureType = "topDown";
        };
        class ace_missileguidance: EGVAR(missileguidance,type_AMRAAM) {
            enabled = 1;
        };
    };
    
    class ammo_Missile_AMRAAM_D;
    class GVAR(d): ammo_Missile_AMRAAM_D {
        missileLockCone = 45;
        missileKeepLockedCone = 45;
        missileLockMaxDistance = 16000;
        missileLockMinDistance = 500;

        model = "\A3\Weapons_F_Jets\Ammo\Missile_AA_10_fly_F.p3d";
        proxyShape = "\A3\Weapons_F_Jets\Ammo\Missile_AA_10_F.p3d";

        author = "Dani (TCVM)";
        maneuvrability = 0;
        flightProfiles[] = {"Direct", "TopDown"};
        class Direct {}; // dummy to allow for F cycling of missile mode
        class TopDown {
            textureType = "topDown";
        };
        class ace_missileguidance: EGVAR(missileguidance,type_AMRAAM) {
            enabled = 1;
            pitchRate = 45;
            yawRate = 45;
            minimumSpeedFilter = 15;    // filter out targets that have a closing velocity less than this
            minimumTimeFilter = 0.00005; // filter out targets that are this close to the ground (speed of light)
            maxTerrainCheck = 16000;    // How far we should check for terrain
        };
    };

    // R-77
    class ammo_Missile_AA_R77;
    class GVAR(r77): ammo_Missile_AA_R77 {
        missileLockCone = 50;
        missileKeepLockedCone = 50;
        missileLockMaxDistance = 16000;
        missileLockMinDistance = 500;

        author = "Dani (TCVM)";
        maneuvrability = 0;
        flightProfiles[] = {"Direct", "TopDown"};
        class Direct {}; // dummy to allow for F cycling of missile mode
        class TopDown {
            textureType = "topDown";
        };
        class ace_missileguidance: EGVAR(missileguidance,type_R77) {
            enabled = 1;
        };
    };
};

