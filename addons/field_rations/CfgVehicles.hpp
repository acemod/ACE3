class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ADDON {
                displayName = CSTRING(MainInteractionText);
                condition = QUOTE(XGVAR(enabled));
                exceptions[] = {"isNotInside"};
                statement = QUOTE(GVAR(hudInteractionHover) = true; [] call FUNC(handleHUD));
                runOnHover = 1;
                insertChildren = QUOTE(_player call FUNC(getConsumableChildren));
                icon = QPATHTOF(ui\icon_survival.paa);
            };
        };
    };

    class ACE_LogicDummy;
    class GVAR(helper): ACE_LogicDummy {};

    class Items_base_F;
    class Land_WaterBarrel_F: Items_base_F {
        XGVAR(waterSupply) = 200;
        XGVAR(offset)[] = {0, 0, 0.6};
    };
    class Land_BarrelWater_F: Items_base_F {
        XGVAR(waterSupply) = 160;
        XGVAR(offset)[] = {0, 0, 0.25};
    };
    class Land_BarrelWater_grey_F: Items_base_F {
        XGVAR(waterSupply) = 160;
        XGVAR(offset)[] = {0, 0, 0.25};
    };
    class Land_WaterTank_F: Items_base_F {
        XGVAR(waterSupply) = 600;
        XGVAR(offset)[] = {1.15, 0, 0.65};
    };
    class Land_WaterCooler_01_new_F: Items_base_F {
        XGVAR(waterSupply) = 20;
        XGVAR(offset)[] = {0, -0.13, 0.1};
    };

    class Infrastructure_base_F;
    class Land_WaterTank_01_F: Infrastructure_base_F {
        XGVAR(waterSupply) = 2400;
        XGVAR(offset)[] = {0, -1.42, -0.78};
    };
    class Land_WaterTank_02_F: Infrastructure_base_F {
        XGVAR(waterSupply) = 2400;
        XGVAR(offset)[] = {-0.09, -1.45, 0.53};
    };
    class Land_WaterTank_03_F: Infrastructure_base_F {
        XGVAR(waterSupply) = 200;
        XGVAR(offset)[] = {0, 0, 0.44};
    };
    class Land_WaterTank_04_F: Infrastructure_base_F {
        XGVAR(waterSupply) = 200;
        XGVAR(offset)[] = {-0.155, -0.72, 0.37};
    };

    class Stall_base_F;
    class Land_StallWater_F: Stall_base_F {
        XGVAR(waterSupply) = 250;
        XGVAR(offset)[] = {0, -0.33, 0.4};
    };

    class StorageBladder_base_F;
    class Land_StorageBladder_02_F: StorageBladder_base_F {
        XGVAR(offset)[] = {-2.02, 1.47, -0.02};
    };
    class StorageBladder_02_water_forest_F: Land_StorageBladder_02_F {
        XGVAR(waterSupply) = 10000;
    };
    class StorageBladder_02_water_sand_F: Land_StorageBladder_02_F {
        XGVAR(waterSupply) = 10000;
    };

    class NonStrategic;
    class Land_Water_source_F: NonStrategic {
        XGVAR(waterSupply) = REFILL_WATER_INFINITE;
        XGVAR(offset)[] = {0, -0.12, -0.25};
    };

    class Land_WaterPump_01_F;
    class WaterPump_01_forest_F: Land_WaterPump_01_F {
        XGVAR(waterSupply) = REFILL_WATER_INFINITE;
        XGVAR(offset)[] = {0, -1.8, 0.06};
    };
    class WaterPump_01_sand_F: Land_WaterPump_01_F {
        XGVAR(waterSupply) = REFILL_WATER_INFINITE;
        XGVAR(offset)[] = {0, -1.8, 0.06};
    };

    class Truck_02_water_base_F;
    class C_IDAP_Truck_02_water_F: Truck_02_water_base_F {
        XGVAR(waterSupply) = 10000;
        XGVAR(offset)[] = {-0.03, -3.72, -1.05};
    };

    class Item_Base_F;
    class ACE_WaterBottle_Item: Item_Base_F {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(WaterBottle_DisplayName);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_WaterBottle,1);
        };
    };
    class ACE_WaterBottle_Half_Item: Item_Base_F {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(WaterBottleHalf_DisplayName);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_WaterBottle_Half,1);
        };
    };
    class ACE_WaterBottle_Empty_Item: Item_Base_F {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(WaterBottleEmpty_DisplayName);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_WaterBottle_Empty,1);
        };
    };
    class ACE_Canteen_Item: Item_Base_F {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Canteen_DisplayName);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_Canteen,1);
        };
    };
    class ACE_Canteen_Half_Item: Item_Base_F {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(CanteenHalf_DisplayName);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_Canteen_Half,1);
        };
    };
    class ACE_Canteen_Empty_Item: Item_Base_F {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(CanteenEmpty_DisplayName);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_Canteen_Empty,1);
        };
    };
    class ACE_Can_Spirit_Item: Item_Base_F {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = "$STR_a3_cfgvehicles_land_can_v1_f0";
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_Can_Spirit,1);
        };
    };
    class ACE_Can_Franta_Item: Item_Base_F {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = "$STR_a3_cfgvehicles_land_can_v2_f0";
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_Can_Franta,1);
        };
    };
    class ACE_Can_RedGull_Item: Item_Base_F {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = "$STR_a3_cfgvehicles_land_can_v3_f0";
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_Can_RedGull,1);
        };
    };
    class ACE_MRE_LambCurry_Item: Item_Base_F {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(MRE_LambCurry_DisplayName);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_MRE_LambCurry,1);
        };
    };
    class ACE_MRE_BeefStew_Item: Item_Base_F {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(MRE_BeefStew_DisplayName);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_MRE_BeefStew,1);
        };
    };
    class ACE_MRE_CreamTomatoSoup_Item: Item_Base_F {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(MRE_CreamTomatoSoup_DisplayName);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_MRE_CreamTomatoSoup,1);
        };
    };
    class ACE_MRE_CreamChickenSoup_Item: Item_Base_F {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(MRE_CreamChickenSoup_DisplayName);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_MRE_CreamChickenSoup,1);
        };
    };
    class ACE_MRE_ChickenTikkaMasala_Item: Item_Base_F {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(MRE_ChickenTikkaMasala_DisplayName);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_MRE_ChickenTikkaMasala,1);
        };
    };
    class ACE_MRE_SteakVegetables_Item: Item_Base_F {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(MRE_SteakVegetables_DisplayName);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_MRE_SteakVegetables,1);
        };
    };
    class ACE_MRE_MeatballsPasta_Item: Item_Base_F {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(MRE_MeatballsPasta_DisplayName);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_MRE_MeatballsPasta,1);
        };
    };
    class ACE_MRE_ChickenHerbDumplings_Item: Item_Base_F {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(MRE_ChickenHerbDumplings_DisplayName);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_MRE_ChickenHerbDumplings,1);
        };
    };
    class ACE_Humanitarian_Ration_Item: Item_Base_F {
        author = ACECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Humanitarian_Ration_DisplayName);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_Humanitarian_Ration,1);
        };
    };
};
