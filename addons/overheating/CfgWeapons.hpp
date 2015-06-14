class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_SpareBarrel: ACE_ItemCore {
        displayname = CSTRING(SpareBarrelName);
        descriptionshort = CSTRING(SpareBarrelDescription);
        //model = "";
        picture = QUOTE(PATHTOF(UI\spare_barrel_ca.paa));
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 50;
        };
    };

    class Rifle;
    class Rifle_Base_F : Rifle {
        // Dispersion, SlowdownFactor and JamChance arrays have 4 values for different temperatures, which are interpolated between.
        // These values correspond to temperatures Converted to real life values: 0: 0°C, 1: 333°C, 2: 666°C, 3: 1000°C.

        // Dispersion in radians. First value is for temp. 0, second for temp. 1 and so on. Values inbetween get interpolated. Negative values get ignored and can be used to move the starting point to hotter temperatures.
        ACE_Overheating_Dispersion[] = {0, 0.001, 0.002, 0.004};
        // How much the projectile gets slowed down before leaving the barrel. 0.9 means the bullet will lose 10% velocity. Values inbetween get interpolated. Numbers greater 1 increase the velocity, smaller 1 decrease it.
        ACE_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
        // Chance to jam the weapon. 0.0003 means 3 malfunctions on 10,000 rounds fired at this temperature. Values inbetween get interpolated. Negative values get ignored and can be used to move the starting point to hotter temperatures.
        // When no reliable data exists for temperature vs. jam chance except MRBS, the following uniform criteria was adopted: [0, 1/MRBS, 5/MRBS, 25/MRBS].
        ACE_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
    };

    class Rifle_Long_Base_F : Rifle_Base_F {
        ACE_Overheating_Dispersion[] = {0, -0.001, 0.001, 0.003};
        ACE_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
        ACE_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
    };

    class arifle_MX_Base_F : Rifle_Base_F {
        ACE_clearJamAction = "GestureReloadMX";   // Custom jam clearing action. Default uses reload animation.
        ACE_checkTemperatureAction = "Gear";      // Custom check temperature action. Default uses gear animation.
        ACE_Overheating_Dispersion[] = {0, 0.001, 0.002, 0.004};
        ACE_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
        ACE_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
    };
    
    class MMG_02_base_F: Rifle_Long_Base_F {
        ACE_Overheating_allowSwapBarrel = 1;
        ACE_Overheating_Dispersion[] = {0, -0.001, 0.001, 0.004};
        ACE_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
        ACE_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
    };

    class MMG_01_base_F: Rifle_Long_Base_F {
        ACE_Overheating_allowSwapBarrel = 1;
        ACE_Overheating_Dispersion[] = {0, -0.001, 0.001, 0.004};
        ACE_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
        ACE_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
    };
    
    class arifle_MX_SW_F : arifle_MX_Base_F {
        ACE_clearJamAction = "";              // Custom jam clearing action. Use empty string to undefine.
        ACE_Overheating_allowSwapBarrel = 1;  // 1 to enable barrel swap. 0 to disable. Meant for machine guns where you can easily swap the barrel without dismantling the whole weapon.
        ACE_Overheating_Dispersion[] = {0, -0.001, 0.001, 0.003};
        ACE_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
        ACE_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
    };

    class arifle_Katiba_Base_F : Rifle_Base_F {
        ACE_Overheating_Dispersion[] = {0, 0.001, 0.002, 0.004};
        ACE_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
        ACE_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
    };

    class mk20_base_F : Rifle_Base_F {
        ACE_Overheating_Dispersion[] = {0, 0.001, 0.002, 0.004};
        ACE_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
        ACE_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
    };

    class Tavor_base_F : Rifle_Base_F {
        ACE_Overheating_Dispersion[] = {0, 0.001, 0.002, 0.004};
        ACE_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
        ACE_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
    };

    class SDAR_base_F : Rifle_Base_F {
        ACE_Overheating_Dispersion[] = {0, 0.001, 0.002, 0.004};
        ACE_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
        ACE_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
    };

    class EBR_base_F : Rifle_Long_Base_F {
        ACE_Overheating_Dispersion[] = {0, -0.001, 0.001, 0.003};
        ACE_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
        ACE_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
    };

    class DMR_01_base_F : Rifle_Long_Base_F {
        ACE_Overheating_Dispersion[] = {0, -0.001, 0.001, 0.003};
        ACE_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
        ACE_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
    };

    class GM6_base_F : Rifle_Long_Base_F {
        ACE_Overheating_Dispersion[] = {0, -0.001, 0.001, 0.003};
        ACE_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
        ACE_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
    };

    class LRR_base_F : Rifle_Long_Base_F {
        ACE_Overheating_Dispersion[] = {0, -0.001, 0.001, 0.003};
        ACE_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
        ACE_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
    };

    class LMG_Mk200_F : Rifle_Long_Base_F {
        ACE_Overheating_allowSwapBarrel = 1;
        ACE_Overheating_Dispersion[] = {0, -0.001, 0.001, 0.003};
        ACE_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
        ACE_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
    };

    class LMG_Zafir_F : Rifle_Long_Base_F {
        ACE_Overheating_allowSwapBarrel = 1;
        ACE_Overheating_Dispersion[] = {0, -0.001, 0.001, 0.003};
        ACE_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
        ACE_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
    };

    class SMG_01_Base : Rifle_Base_F {
        ACE_Overheating_Dispersion[] = {0, 0.001, 0.002, 0.004};
        ACE_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
        ACE_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
    };

    class SMG_02_base_F : Rifle_Base_F {
        ACE_Overheating_Dispersion[] = {0, 0.001, 0.002, 0.004};
        ACE_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
        ACE_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
    };

    class pdw2000_base_F : Rifle_Base_F {
        ACE_Overheating_Dispersion[] = {0, 0.001, 0.002, 0.004};
        ACE_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
        ACE_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
    };
};
