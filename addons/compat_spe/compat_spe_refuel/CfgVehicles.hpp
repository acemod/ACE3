class CfgVehicles {
    class SPE_Halftrack_base;
    class SPE_US_M3_Halftrack_Fuel: SPE_Halftrack_base {
        transportFuel = 0;
        EGVAR(refuel,hooks)[] = {{-0.23,-2.58,-0.59}};
        EGVAR(refuel,fuelCargo) = 2000;
    };
    class SPE_OpelBlitz_base;
    class SPE_OpelBlitz_Fuel: SPE_OpelBlitz_base {
        transportFuel = 0;
        EGVAR(refuel,hooks)[] = {{-0.23,-2.58,-0.59}};
        EGVAR(refuel,fuelCargo) = 2000;
    };
};
