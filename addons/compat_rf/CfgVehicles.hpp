class CfgVehicles {

    class Offroad_01_unarmed_base_F;
    class Pickup_01_base_rf : Offroad_01_unarmed_base_F
    {
        acex_field_rations_offset[] = {-0.04, -2.45, -0.9};
    };
    
    class C_IDAP_Pickup_rf;
    class C_IDAP_Pickup_water_rf: C_IDAP_Pickup_rf
    {
        acex_field_rations_waterSupply = 500;
        acex_field_rations_offset[] = {-0.04, -2.45, -0.9};
    };
    
    class O_Truck_03_fuel_F;
    class C_Truck_03_water_rf: O_Truck_03_fuel_F
    {
        acex_field_rations_waterSupply = 10000;
        acex_field_rations_offset[] = {0, -5.15, -0.3}; // Rear
        //acex_field_rations_offset[] = {1.25,-1.59,-0.58}; // Right Side Latch
    };

    class B_Truck_01_fuel_F;
    class C_Truck_01_water_rf : B_Truck_01_fuel_F 
    {
        acex_field_rations_waterSupply = 10000;
        acex_field_rations_offset[] = {0, -5.15, -0.3};
    };
};
