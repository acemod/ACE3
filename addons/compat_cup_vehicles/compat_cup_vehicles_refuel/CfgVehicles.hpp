class CfgVehicles {
    class CUP_T810_Unarmed_Base;
    class CUP_T810_Refuel_Base: CUP_T810_Unarmed_Base {
        transportFuel = 0;
        EGVAR(refuel,hooks)[] = {{-1.01, 0.21, -0.5},{1.08, 0.2, -0.5}};
        EGVAR(refuel,fuelCargo) = 10000;
    };

    class Truck_02_fuel_base_F;
    class CUP_Kamaz_5350_Refuel_Base: Truck_02_fuel_base_F {
        transportFuel = 0;
        EGVAR(refuel,hooks)[] = {{-0.02, -3.33, -1.05}};
        EGVAR(refuel,fuelCargo) = 10000;
    };

    class CUP_Ural_Support_Base;
    class CUP_Ural_Refuel_Base: CUP_Ural_Support_Base {
        transportFuel = 0;
        EGVAR(refuel,hooks)[] = {{-0.05, -3.65, -0.42}};
        EGVAR(refuel,fuelCargo) = 10000;
    };

    class CUP_V3S_Open_Base;
    class CUP_V3S_Refuel_Base: CUP_V3S_Open_Base {
        transportFuel = 0;
        EGVAR(refuel,hooks)[] = {{-0.35, -3.35, -0.4},{0.40, -3.35, -0.4}};
        EGVAR(refuel,fuelCargo) = 6500;
    };

    class CUP_MTVR_Base;
    class CUP_MTVR_Refuel_Base: CUP_MTVR_Base {
        transportFuel = 0;
        EGVAR(refuel,hooks)[] = {{-1.09, -0.01, -0.5},{1, -0.01, -0.5}};
        EGVAR(refuel,fuelCargo) = 10000;
    };
};
