class CfgWeapons {
    class ItemCore;
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_Item_FMRadio: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_FMradio_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Electronics\FMradio_F.p3d);
        picture = PATHTOF(UI\FMRadio_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 20;
        };
    };
    
    class ACE_Item_ExtensionCord: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_ExtensionCord_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Electronics\ExtensionCord_F.p3d);
        picture = PATHTOF(UI\ExtensionCord_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 20;
        };
    }; 

    class ACE_Item_HandyCam: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_HandyCam_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Electronics\Handycam_F.p3d);
        picture = PATHTOF(UI\Handycam_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 20;
        };
    };

    class ACE_Item_Laptop: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Laptop_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Electronics\Laptop_F.p3d);
        picture = PATHTOF(UI\Laptop_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 60;
        };
    };

    class ACE_Item_MobilePhone_Old: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_MobilePhone_old_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Electronics\MobilePhone_old_F.p3d);
        picture = PATHTOF(UI\MobilePhone_old_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 7;
        };
    };

    class ACE_Item_MobilePhone_Smart: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_MobilePhone_smart_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Electronics\MobilePhone_smart_F.p3d);
        picture = PATHTOF(UI\MobilePhone_smart_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 7;
        };
    };

    class ACE_Item_PortableLongRangeRadio: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_PortableLongRangeRadio_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Electronics\PortableLongRangeRadio_F.p3d);
        picture = PATHTOF(UI\PortableLongRangeRadio_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };

    class ACE_Item_SatellitePhone: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_SatellitePhone_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Electronics\SatellitePhone_F.p3d);
        picture = PATHTOF(UI\SatellitePhone_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 150;
        };
    };

    class ACE_Item_SurvivalRadio: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_SurvivalRadio_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Electronics\SurvivalRadio_F.p3d);
        picture = PATHTOF(UI\SurvivalRadio_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 50;
        };
    };

    class ACE_Item_File1: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_File1_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Documents\File1_F.p3d);
        picture = PATHTOF(UI\File1_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };

    class ACE_Item_File2: ACE_ItemCore {
        displayName = QUOTE($STR_A3_CFGVEHICLES_LAND_FILE_RESEARCH_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Documents\File2_F.p3d);
        picture = PATHTOF(UI\File2_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };

    class ACE_Item_FilePhotos: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_FilePhotos_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Documents\FilePhotos_F.p3d);
        picture = PATHTOF(UI\FilePhotos_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };

    class ACE_Item_Map: ACE_ItemCore {
        displayName = QUOTE($STR_A3_sleeved_map_0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Documents\Map_F.p3d);
        picture = PATHTOF(UI\Map_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };

    class ACE_Item_Notepad: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Notepad_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Documents\Notepad_F.p3d);
        picture = PATHTOF(UI\Notepad_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };

    class ACE_Item_Photos_V1: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Photos_V1_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Documents\Photos_V1_F.p3d);
        picture = PATHTOF(UI\Photos_V1_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };

    class ACE_Item_BottlePlastic_V1: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_BottlePlastic_V1_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Food\BottlePlastic_V1_F.p3d);
        picture = PATHTOF(UI\BottlePlastic_V1_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 12;
        };
    };

    class ACE_Item_Can_Dented: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Can_Dented_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Food\Can_Dented_F.p3d);
        picture = PATHTOF(UI\Can_Dented_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };

    class ACE_Item_Can_Rusty: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Can_Rusty_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Food\Can_Rusty_F.p3d);
        picture = PATHTOF(UI\Can_Rusty_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };

    class ACE_Item_Can_V1: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Can_V1_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Food\Can_V1_F.p3d);
        picture = PATHTOF(UI\Can_V1_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 9;
        };
    };

    class ACE_Item_Can_V2: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Can_V2_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Food\Can_V2_F.p3d);
        picture = PATHTOF(UI\Can_V2_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 9;
        };
    };

    class ACE_Item_Can_V3: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Can_V3_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Food\Can_V3_F.p3d);
        picture = PATHTOF(UI\Can_V3_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 9;
        };
    };

    class ACE_Item_TacticalBacon: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_TacticalBacon_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Food\TacticalBacon_F.p3d);
        picture = PATHTOF(UI\TacticalBacon_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };

    class ACE_Item_Suitcase: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Suitcase_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Luggage\Suitcase_F.p3d);
        picture = PATHTOF(UI\Suitcase_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            allowedSlots[] = {901};
            mass = 150;
        };
    };

    class ACE_Item_PenBlack: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_PenBlack_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Stationery\PenBlack_F.p3d);
        picture = PATHTOF(UI\PenBlack_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 0.5;
        };
    };

    class ACE_Item_PenRed: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_PenRed_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Stationery\PenRed_F.p3d);
        picture = PATHTOF(UI\PenRed_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 0.5;
        };
    };

    class ACE_Item_PencilBlue: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_PencilBlue_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Stationery\PencilBlue_F.p3d);
        picture = PATHTOF(UI\PencilBlue_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 0.5;
        };
    };

    class ACE_Item_PencilGreen: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_PencilGreen_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Stationery\PencilGreen_F.p3d);
        picture = PATHTOF(UI\PencilGreen_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 0.5;
        };
    };

    class ACE_Item_PencilRed: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_PencilRed_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Stationery\PencilRed_F.p3d);
        picture = PATHTOF(UI\PencilRed_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 0.5;
        };
    };

    class ACE_Item_PencilYellow: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_PencilYellow_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Stationery\PencilYellow_F.p3d);
        picture = PATHTOF(UI\PencilYellow_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 0.5;
        };
    };

    class ACE_Item_PensAndPencils: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_PensAndPencils_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Stationery\PensAndPencils_F.p3d);
        picture = PATHTOF(UI\PensAndPencils_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };

    class ACE_Item_Axe: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Axe_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Tools\Axe_F.p3d);
        picture = PATHTOF(UI\Axe_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            allowedSlots[] = {901};
            mass = 120;
        };
    };

    class ACE_Item_Axe_fire: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Axe_fire_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Tools\Axe_fire_F.p3d);
        picture = PATHTOF(UI\Axe_fire_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            allowedSlots[] = {901};
            mass = 120;
        };
    };

    class ACE_Item_DrillAku: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_DrillAku_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Tools\DrillAku_F.p3d);
        picture = PATHTOF(UI\DrillAku_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 50;
        };
    };

    class ACE_Item_DustMask: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_DustMask_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Tools\DustMask_F.p3d);
        picture = PATHTOF(UI\DustMask_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 0.5;
        };
    };

    class ACE_Item_File_Tool: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_File_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Tools\File_F.p3d);
        picture = PATHTOF(UI\File_Tool_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };

    class ACE_Item_Gloves: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Gloves_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Tools\Gloves_F.p3d);
        picture = PATHTOF(UI\Gloves_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };

    class ACE_Item_Grinder: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Grinder_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Tools\Grinder_F.p3d);
        picture = PATHTOF(UI\Grinder_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 90;
        };
    };

    class ACE_Item_Hammer: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Hammer_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Tools\Hammer_F.p3d);
        picture = PATHTOF(UI\Hammer_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };

    class ACE_Item_Meter3m: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Meter3m_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Tools\Meter3m_F.p3d);
        picture = PATHTOF(UI\Meter3m_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 6;
        };
    };

    class ACE_Item_MultiMeter: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_MultiMeter_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Tools\MultiMeter_F.p3d);
        picture = PATHTOF(UI\MultiMeter_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 7;
        };
    };

    class ACE_Item_Pliers: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Pliers_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Tools\Pliers_F.p3d);
        picture = PATHTOF(UI\Pliers_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };

    class ACE_Item_Saw: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Saw_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Tools\Saw_F.p3d);
        picture = PATHTOF(UI\Saw_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 8;
        };
    };

    class ACE_Item_Screwdriver_V1: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Screwdriver_V1_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Tools\Screwdriver_V1_F.p3d);
        picture = PATHTOF(UI\Screwdriver_V1_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };

    class ACE_Item_Screwdriver_V2: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Screwdriver_V2_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Tools\Screwdriver_V2_F.p3d);
        picture = PATHTOF(UI\Screwdriver_V2_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };

    class ACE_Item_Wrench: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Wrench_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Tools\Wrench_F.p3d);
        picture = PATHTOF(UI\Wrench_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };

    class ACE_Item_Money: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Money_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f\Items\Valuables\Money_F.p3d);
        picture = PATHTOF(UI\Money_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };
    
    class ACE_Item_Battery: ACE_ItemCore {
        displayName = QUOTE($STR_A3_batteries);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Electronics\Battery_F.p3d);
        picture = PATHTOF(UI\Battery_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
    
    class ACE_Item_BakedBeans: ACE_ItemCore {
        displayName = QUOTE($STR_A3_baked_beens);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Food\BakedBeans_F.p3d);
        picture = PATHTOF(UI\BakedBeans_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };
    
    class ACE_Item_BottlePlastic_V2: ACE_ItemCore {
        displayName = QUOTE($STR_A3_water_bottle);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Food\BottlePlastic_V2_F.p3d);
        picture = PATHTOF(UI\BottlePlastic_V2_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 12;
        };
    };
    
    class ACE_Item_Canteen: ACE_ItemCore {
        displayName = QUOTE($STR_A3_canteen);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Food\Canteen_F.p3d);
        picture = PATHTOF(UI\Canteen_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };
    
    class ACE_Item_CerealsBox: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cereal_box);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Food\CerealsBox_F.p3d);
        picture = PATHTOF(UI\CerealsBox_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 8;
        };
    };
    
    class ACE_Item_PowderedMilk: ACE_ItemCore {
        displayName = QUOTE($STR_A3_powdered_milk);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Food\PowderedMilk_F.p3d);
        picture = PATHTOF(UI\PowderedMilk_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 7;
        };
    };
    
    class ACE_Item_RiceBox: ACE_ItemCore {
        displayName = QUOTE($STR_A3_rice);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Food\RiceBox_F.p3d);
        picture = PATHTOF(UI\RiceBox_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 7;
        };
    };
    
    class ACE_Item_Antibiotic: ACE_ItemCore {
        displayName = QUOTE($STR_A3_antibiotics);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d);
        picture = PATHTOF(UI\Antibiotic_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };
    
    class ACE_Item_Bandage: ACE_ItemCore {
        displayName = QUOTE($STR_A3_bandages);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Medical\Bandage_F.p3d);
        picture = PATHTOF(UI\Bandage_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };
    
    class ACE_Item_Bloodbag: ACE_ItemCore {
        displayName = QUOTE($STR_A3_blood_bag);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Medical\Bloodbag_F.p3d);
        picture = PATHTOF(UI\Bloodbag_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 6;
        };
    };
    
    class ACE_Item_Defibrillator: ACE_ItemCore {
        displayName = QUOTE($STR_A3_defibrillator);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Medical\Defibrillator_F.p3d);
        picture = PATHTOF(UI\Defibrillator_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 30;
        };
    };
    
    class ACE_Item_DisinfectantSpray: ACE_ItemCore {
        displayName = QUOTE($STR_A3_disinfectant_spray);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Medical\DisinfectantSpray_F.p3d);
        picture = PATHTOF(UI\DisinfectantSpray_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 9;
        };
    };
    
    class ACE_Item_HeatPack: ACE_ItemCore {
        displayName = QUOTE($STR_A3_heatpack);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Medical\HeatPack_F.p3d);
        picture = PATHTOF(UI\HeatPack_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 4;
        };
    };
    
    class ACE_Item_PainKillers: ACE_ItemCore {
        displayName = QUOTE($STR_A3_pain_killers);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Medical\PainKillers_F.p3d);
        picture = PATHTOF(UI\PainKillers_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };
    
    class ACE_Item_VitaminBottle: ACE_ItemCore {
        displayName = QUOTE($STR_A3_vitamin_bottle);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Medical\VitaminBottle_F.p3d);
        picture = PATHTOF(UI\VitaminBottle_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };
    
    class ACE_Item_WaterPurificationTablets: ACE_ItemCore {
        displayName = QUOTE($STR_A3_water_purification_tablets);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Medical\WaterPurificationTablets_F.p3d);
        picture = PATHTOF(UI\WaterPurificationTablets_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };
    
    class ACE_Item_ButaneCanister: ACE_ItemCore {
        displayName = QUOTE($STR_A3_butane_canister);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Tools\ButaneCanister_F.p3d);
        picture = PATHTOF(UI\ButaneCanister_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };
    
    class ACE_Item_ButaneTorch: ACE_ItemCore {
        displayName = QUOTE($STR_A3_butane_torch);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Tools\ButaneTorch_F.p3d);
        picture = PATHTOF(UI\ButaneTorch_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };
    
    class ACE_Item_CanOpener: ACE_ItemCore {
        displayName = QUOTE($STR_A3_can_opener);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Tools\CanOpener_F.p3d);
        picture = PATHTOF(UI\CanOpener_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 4;
        };
    };
    
    class ACE_Item_DuctTape: ACE_ItemCore {
        displayName = QUOTE($STR_A3_duct_tape);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Tools\DuctTape_F.p3d);
        picture = PATHTOF(UI\DuctTape_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };
    
    class ACE_Item_FireExtinguisher: ACE_ItemCore {
        displayName = QUOTE($STR_A3_fire_extinguisher);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Tools\FireExtinguisher_F.p3d);
        picture = PATHTOF(UI\FireExtinguisher_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 200;
        };
    };
    
    class ACE_Item_GasCanister: ACE_ItemCore {
        displayName = QUOTE($STR_A3_gas_canister);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Tools\GasCanister_F.p3d);
        picture = PATHTOF(UI\GasCanister_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 20;
        };
    };
    
    class ACE_Item_GasCooker: ACE_ItemCore {
        displayName = QUOTE($STR_A3_gas_cooker);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Tools\GasCooker_F.p3d);
        picture = PATHTOF(UI\GasCooker_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 25;
        };
    };
    
    class ACE_Item_Matches: ACE_ItemCore {
        displayName = QUOTE($STR_A3_box_of_matches);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Tools\Matches_F.p3d);
        picture = PATHTOF(UI\Matches_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };
    
    class ACE_Item_MetalWire: ACE_ItemCore {
        displayName = QUOTE($STR_A3_metal_wire);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Tools\MetalWire_F.p3d);
        picture = PATHTOF(UI\MetalWire_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };
    
    class ACE_Item_Shovel: ACE_ItemCore {
        displayName = QUOTE($STR_A3_shovel);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epa\Items\Tools\Shovel_F.p3d);
        picture = PATHTOF(UI\Shovel_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 200;
        };
    };
    
    class ACE_Item_Map_Altis: ACE_ItemCore {
        displayName = QUOTE($STR_A3_map_altis0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epb\Items\Documents\Map_Altis_F.p3d);
        picture = PATHTOF(UI\Map_Altis_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 4;
        };
    };
    
    class ACE_Item_Map_Blank: ACE_ItemCore {
        displayName = QUOTE($STR_A3_MAP1);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epb\Items\Documents\Map_Blank_F.p3d);
        picture = PATHTOF(UI\Map_Blank_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 4;
        };
    };
    
    class ACE_Item_Map_Stratis: ACE_ItemCore {
        displayName = QUOTE($STR_A3_cfgVehicles_Land_Map_F0);
        descriptionShort = "";
        model = QUOTE(a3\structures_f_epb\Items\Documents\Map_Stratis_F.p3d);
        picture = PATHTOF(UI\Map_Stratis_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 4;
        };
    };
};