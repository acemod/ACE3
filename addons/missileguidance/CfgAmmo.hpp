class CfgAmmo {
    class MissileBase;

    class M_PG_AT: MissileBase {};

    class ACE_Hydra70_DAGR: M_PG_AT {
        displayName = CSTRING(Hydra70_DAGR);
        displayNameShort = CSTRING(Hydra70_DAGR_Short);

        description = CSTRING(Hydra70_DAGR_Desc);
        descriptionShort = CSTRING(Hydra70_DAGR_Desc);

        irLock = 0;
        laserLock = 0;
        manualControl = 0;
        maxSpeed = 300;

        EGVAR(rearm,caliber) = 70;

        class ADDON: GVAR(type_Dagr) {
            enabled = 1;
        };
    };

    // Titan
    class M_Titan_AT: MissileBase {};

    class ACE_Javelin_FGM148: M_Titan_AT {
        irLock = 1;
        laserLock = 0;
        airLock = 0;

        // Turn off arma crosshair-guidance
        manualControl = 0;

        // ACE uses these values
        //trackOversteer = 1;
        //trackLead = 0;

        initTime = 0.5;

        // Begin ACE guidance Configs
        class ADDON: GVAR(type_Javelin) {
            enabled = 1;
        };
    };
    class ACE_Javelin_FGM148_static: ACE_Javelin_FGM148 {
        //Take config changes from (M_Titan_AT_static: M_Titan_AT)
        initTime = 0.25;  //"How long (in seconds) the projectile waits before starting it's engine.", - but doesn't seem to do anything
        effectsMissileInit = "RocketBackEffectsStaticRPG";

        //Explicity add guidance config
        class ADDON: ADDON {
            enabled = 1;
        };
    };

#ifdef CREATE_MOCK_PLATFORMS
#include "dev\mock_ammo.hpp"
#endif
};
