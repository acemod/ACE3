class CfgWeapons {
    class RifleCore;
    class Rifle: RifleCore {
        //Mean Rounds Between Stoppages (this will be scaled based on the barrel temp)
        GVAR(mrbs) = 3000;

        //Dispersion Factor (this will be scaled based on the barrel temp)
        GVAR(dispersion) = 1;

        //Slowdown Factor (this will be scaled based on the barrel temp)
        GVAR(slowdownFactor) = 1;
    };
    class Rifle_Base_F : Rifle {};
    class Rifle_Long_Base_F : Rifle_Base_F {
        GVAR(dispersion) = 0.75;
    };

    class arifle_MX_Base_F : Rifle_Base_F {
        // Custom jam clearing action. Default uses reload animation.
        ACE_clearJamAction = "GestureReloadMX";
    };
    class arifle_MX_SW_F : arifle_MX_Base_F {
        // Custom jam clearing action. Use empty string to undefine.
        ACE_clearJamAction = "";
        // 1 to enable barrel swap. 0 to disable. Meant for machine guns where you can easily swap the barrel without dismantling the whole weapon.
        GVAR(allowSwapBarrel) = 1;
        GVAR(dispersion) = 0.75;
    };
    class MMG_01_base_F: Rifle_Long_Base_F {
        GVAR(allowSwapBarrel) = 1;
    };
    class MMG_02_base_F: Rifle_Long_Base_F {
        GVAR(allowSwapBarrel) = 1;
    };
    class LMG_Zafir_F : Rifle_Long_Base_F {
        GVAR(allowSwapBarrel) = 1;
    };
    class LMG_Mk200_F : Rifle_Long_Base_F {
        GVAR(allowSwapBarrel) = 1;
    };
};
