class CfgVehicles {
    class Truck_01_base_F;
    class B_Truck_01_transport_F: Truck_01_base_F {
        ace_smoke_seats[] = {
            {0}, // Driver is enclosed
            {1, 1}, // Gunners are exposed
            {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
        };
    };

    class Heli_Transport_04_base_F;
    class O_Heli_Transport_04_bench_F: Heli_Transport_04_base_F {
        ace_smoke_seats[] = {
            {0}, // Pilot is enclosed
            {0, 0, 1, 1, 1, 1, 1, 1, 1, 1}, // Crew is enclosed, passengers are exposed
        };
    };

    class Heli_light_03_base_F;
    class Heli_light_03_unarmed_base_F: Heli_light_03_base_F {
        ace_smoke_seats[] = {0}; // All seats are enclosed
    };

    class Heli_Light_02_base_F;
    class Heli_Light_02_dynamicLoadout_base_F: Heli_Light_02_base_F {
        ace_smoke_seats[] = {0}; // All seats are enclosed
    };

    class Heli_Attack_01_base_F;
    class Heli_Attack_01_dynamicLoadout_base_F: Heli_Attack_01_base_F {
        ace_smoke_seats[] = {0}; // All seats are enclosed
    };

    class Helicopter_Base_H;
    class Heli_Transport_02_base_F: Helicopter_Base_H {
        ace_smoke_seats[] = {0}; // All seats are enclosed
    };

    class Car_F;
    class Offroad_01_base_F: Car_F {
        ace_smoke_seats[] = {1}; // All seats are exposed
    };
    class Hatchback_01_base_F: Car_F {
        ace_smoke_seats[] = {1};
    };
    class SUV_01_base_F: Car_F {
        ace_smoke_seats[] = {1};
    };
    class Van_01_base_F: Car_F {
        ace_smoke_seats[] = {1};
    };
    class Van_02_base_F: Car_F {
        ace_smoke_seats[] = {1};
    };
    class Tractor_01_base_F: Car_F {
        ace_smoke_seats[] = {1};
    };

    class Truck_02_base_F;
    class C_Truck_02_covered_F: Truck_02_base_F {
        ace_smoke_seats[] = {
            {0}, // Driver is enclosed
            {1, 1}, // Gunners are exposed
            {0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
        };
    };
};
