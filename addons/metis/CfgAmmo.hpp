class ace_missileguidance_type_Metis;
class CfgAmmo {
    class M_Vorona_HEAT;
    class GVAR(HEAT): M_Vorona_HEAT {
        manualControl = 0;
        irLock = 0;
        laserLock = 0;
        airLock = 0;
        lockType = 0;

        class ace_missileguidance: ace_missileguidance_type_Metis {
            enabled = 1;
        };
    };

    class M_Vorona_HE;
    class GVAR(HE): M_Vorona_HE {
        manualControl = 0;
        irLock = 0;
        laserLock = 0;
        airLock = 0;
        lockType = 0;

        class ace_missileguidance: ace_missileguidance_type_Metis {
            enabled = 1;
        };
    };
};
