class CfgWeapons {
    class CannonCore;
    // REPLAY BULLETS!
    class Gatling_30mm_Plane_CAS_01_F: CannonCore {
        magazines[] += {"ACE_1000Rnd_Gatling_30mm_Plane_DEBUG"};
   };

    class mortar_82mm: CannonCore {
        class Single1;
        magazines[] += {"8Rnd_82mm_Mo_DEBUG"};
    };
    
    class weapon_VLSBase;
    class weapon_VLS_01: weapon_VLSBase {
        magazines[] += {"magazine_Missiles_Cruise_DEBUG"};
    };

    class Launcher_Base_F; 
    class launch_MRAWS_base_F: Launcher_Base_F {
        magazines[] += {"MRAWS_DEBUG_F"};
    };
};
