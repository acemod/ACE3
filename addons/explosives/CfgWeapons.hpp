class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_f;

    class ACE_ExplosiveItem: InventoryItem_Base_f {
        allowedSlots[] = {801,701,901};
        //type = 201;
    };

    class ACE_Clacker: ACE_ItemCore {
        scope = 2;
        displayName = CSTRING(clacker_displayName);
        descriptionShort = CSTRING(clacker_description);
        picture = QPATHTOF(Data\UI\Clacker.paa);
        model = QPATHTOF(data\ace_m57.p3d);
        GVAR(Range) = 250;
        GVAR(Detonator) = 1;
        GVAR(triggerType) = "Command";

        class ItemInfo: ACE_ExplosiveItem {
            mass = 3;
            uniformModel = "\A3\weapons_F\ammo\mag_univ.p3d";
        };
    };
    class ACE_M26_Clacker: ACE_Clacker {
        displayName = CSTRING(M152_Clacker_displayName);
        picture = QPATHTOF(Data\UI\MK26_Transmitter_ca.paa);
        GVAR(Range) = 5000;
        GVAR(triggerType) = "MK16_Transmitter";
    };
    class ACE_DefusalKit: ACE_ItemCore {
        scope = 2;
        displayName = CSTRING(DefusalKit_displayName);
        descriptionShort = CSTRING(DefusalKit_description);
        picture = QPATHTOF(Data\UI\Pliers.paa);
        model = "\A3\Structures_F\Items\Tools\Pliers_F.p3d";

        class ItemInfo: ACE_ExplosiveItem {
            mass = 5;
            uniformModel = "\A3\Structures_F\Items\Tools\Pliers_F.p3d";
        };
    };
    class ACE_DeadManSwitch: ACE_ItemCore {
        scope = 2;
        displayName = CSTRING(DeadManSwitch_displayName);
        descriptionShort = CSTRING(DeadManSwitch_description);
        picture = QPATHTOF(Data\UI\DeadmanSwitch.paa);
        model = "\A3\weapons_F\ammo\mag_univ.p3d";
        GVAR(Range) = 100;
        GVAR(Detonator) = 1;
        GVAR(triggerType) = "DeadManSwitch";

        class ItemInfo: ACE_ExplosiveItem {
            mass = 2;
            uniformModel = "\A3\weapons_F\ammo\mag_univ.p3d";
        };
    };
    class ACE_Cellphone: ACE_ItemCore {
        scope = 2;
        displayName = CSTRING(cellphone_displayName);
        descriptionShort = CSTRING(cellphone_description);
        picture = QPATHTOF(Data\UI\Cellphone_UI.paa);
        model = "\A3\weapons_F\ammo\mag_univ.p3d";
        GVAR(Range) = 15000;
        GVAR(Detonator) = 1;
        GVAR(triggerType) = "Cellphone";

        class ItemInfo: ACE_ExplosiveItem {
            mass = 2;
            uniformModel = "\A3\weapons_F\ammo\mag_univ.p3d";
        };
    };
};
