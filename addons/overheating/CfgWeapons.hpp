class CfgWeapons {
    class PistolCore;
    class Pistol : PistolCore {
        //Closed Bolt (Closed Bolt will cook off if too hot)
        //Pistols are nearly universally closed bolt.
        GVAR(closedBolt) = 1;
    };

    class Pistol_Base_F : Pistol {};
    class hgun_Pistol_heavy_02_F : Pistol_Base_F {
        GVAR(jamTypesAllowed) = ["Fire","Dud"];
    };
   class hgun_Pistol_Signal_F : Pistol_Base_F {
        GVAR(jamTypesAllowed) = ["Fire","Dud"];
    };

    class RifleCore;
    class Rifle: RifleCore {
        //Mean Rounds Between Stoppages (this will be scaled based on the barrel temp)
        GVAR(mrbs) = 3000;

        //Dispersion Factor (this will be scaled based on the barrel temp)
        GVAR(dispersion) = 1;

        //Slowdown Factor (this will be scaled based on the barrel temp)
        GVAR(slowdownFactor) = 1;

        //Closed Bolt, most weapons are closed bolt
        GVAR(closedBolt) = 1;
    };
    class Rifle_Base_F;
    class Rifle_Long_Base_F: Rifle_Base_F {
        GVAR(dispersion) = 0.75;

        // Open Bolt, most machine guns are open bolt, which cannot normally cook off, and use this as a parent class
        // A lot of sniper rifles also use this as a parent class, they will need to be indivisually set to closed bolt, but it's probably not an issue as they are unlikely to overheat
        GVAR(closedBolt) = 0;
    };

    class arifle_MX_Base_F: Rifle_Base_F {
        // Custom jam clearing action. Default uses reload animation.
        ACE_clearJamAction = "GestureReloadMX";
    };
    class arifle_MX_SW_F: arifle_MX_Base_F {
        // Custom jam clearing action. Use empty string to undefine.
        ACE_clearJamAction = "";
        // 1 to enable barrel swap. 0 to disable. Meant for machine guns where you can easily swap the barrel without dismantling the whole weapon.
        GVAR(allowSwapBarrel) = 1;
        GVAR(dispersion) = 0.75;
    };
    class DMR_01_base_F : Rifle_Long_Base_F {
        GVAR(closedBolt) = 1;
    };
    class DMR_02_base_F : Rifle_Long_Base_F {
        GVAR(closedBolt) = 1;
    };
    class DMR_03_base_F : Rifle_Long_Base_F {
        GVAR(closedBolt) = 1;
    };
    class DMR_04_base_F : Rifle_Long_Base_F {
        GVAR(closedBolt) = 1;
    };
    class DMR_05_base_F : Rifle_Long_Base_F {
        GVAR(closedBolt) = 1;
    };
    class DMR_06_base_F : Rifle_Long_Base_F {
        GVAR(closedBolt) = 1;
    };
    class DMR_07_base_F : Rifle_Long_Base_F {
        GVAR(closedBolt) = 1;
    };
    class EBR_base_F : Rifle_Long_Base_F {
        GVAR(closedBolt) = 1;
    };
    class GM6_base_F : Rifle_Long_Base_F {
        GVAR(closedBolt) = 1;
    };
    class LRR_base_F : Rifle_Long_Base_F {
        GVAR(closedBolt) = 1;
    };
    class MMG_01_base_F: Rifle_Long_Base_F {
        GVAR(allowSwapBarrel) = 1;
    };
    class MMG_02_base_F: Rifle_Long_Base_F {
        GVAR(allowSwapBarrel) = 1;
    };
    class LMG_Zafir_F: Rifle_Long_Base_F {
        GVAR(allowSwapBarrel) = 1;
    };
    class LMG_Mk200_F: Rifle_Long_Base_F {
        GVAR(allowSwapBarrel) = 1;
    };
    class LMG_03_Base_F: Rifle_Long_Base_F {
        GVAR(allowSwapBarrel) = 1;
    };
    class sgun_HunterShotgun_01_base_F : Rifle_Long_Base_F {
        GVAR(closedBolt) = 1;
        GVAR(jamTypesAllowed) = ["Fire","Dud"];
    };
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;
    class ACE_SpareBarrel_Item: ACE_ItemCore {
        displayName = CSTRING(SpareBarrelName);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        descriptionshort = CSTRING(SpareBarrelDescription);
        picture = QUOTE(PATHTOF(UI\spare_barrel_ca.paa));
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 60;
        };
    };
};
