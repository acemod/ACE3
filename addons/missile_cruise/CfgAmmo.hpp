class CfgAmmo {
    class ammo_Missile_CruiseBase;
    class ammo_Missile_Cruise_01: ammo_Missile_CruiseBase {
        class ace_missileguidance {
            enabled = 1;

            pitchRate = 15;
            yawRate = 15;

            canVanillaLock = 0;

            // Guidance type for munitions
            defaultSeekerType = "Waypoint";
            seekerTypes[] = { "Waypoint" };

            defaultNavigationType = "Waypoint";
            navigationTypes[] = { "Waypoint" };

            seekLastTargetPos = 0;
            seekerAngle = 5;
            seekerAccuracy = 1;

            defaultAttackProfile = "DIR";
            attackProfiles[] = {"DIR"};
        };
    };
};