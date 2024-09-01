test attachTo [cursorObject, ];


acex_field_rations_offset = [-0.04,-2.45,-0.9]


class CfgVehicles {

  

    class C_IDAP_Pickup_rf;
    class C_IDAP_Pickup_water_rf: C_IDAP_Pickup_rf
    {
        acex_field_rations_waterSupply = 1000;
        acex_field_rations_offset[] = {-0.04, -2.45, -0.9};
    };
    
    class Pickup_01_base_rf;
    class B_UN_Pickup_rf: Pickup_01_base_rf
    {
        acex_field_rations_offset[] = {-0.04, -2.45, -0.9};
    };


    class O_Truck_03_fuel_F;
    class C_Truck_03_water_rf: O_Truck_03_fuel_F
    {
        acex_field_rations_waterSupply = 10000;
        acex_field_rations_offset[] = {-0.03, -3.72, -1.05}; // Todo
    };

    class B_Truck_01_fuel_F;
    class C_Truck_01_water_rf : B_Truck_01_fuel_F 
    {
        acex_field_rations_waterSupply = 10000;
        acex_field_rations_offset[] = {-0.03, -3.72, -1.05}; // Todo
    };

};
