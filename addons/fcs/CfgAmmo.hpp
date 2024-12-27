
class CfgAmmo {
    class B_35mm_AA;
    class ACE_B_35mm_ABM: B_35mm_AA {
        GVAR(Airburst) = 1;
        deflecting = 0;
    };

    class B_35mm_AA_Tracer_Red;
    class ACE_B_35mm_ABM_Tracer_Red: B_35mm_AA_Tracer_Red {
        GVAR(Airburst) = 1;
        deflecting = 0;
    };

    class B_35mm_AA_Tracer_Green;
    class ACE_B_35mm_ABM_Tracer_Green: B_35mm_AA_Tracer_Green {
        GVAR(Airburst) = 1;
        deflecting = 0;
    };

    class B_35mm_AA_Tracer_Yellow;
    class ACE_B_35mm_ABM_Tracer_Yellow: B_35mm_AA_Tracer_Yellow {
        GVAR(Airburst) = 1;
        deflecting = 0;
    };

    class ACE_B_35mm_ABM_Helper: B_35mm_AA {
        indirectHitRange = 6;
        simulation = "shotRocket";
        timeToLive = 0;
    };
};
