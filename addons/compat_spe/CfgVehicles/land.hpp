// fuel objects

class SPE_Fuel_Barrel_base;
class SPE_Fuel_Barrel_German_01: SPE_Fuel_Barrel_base {
    transportFuel = 0;
    EGVAR(refuel,hooks)[] = {{0, 0, 0.5}}; // reference is Land_FlexibleTank_01_F
    EGVAR(refuel,fuelCargo) = 300; // reference is Land_FlexibleTank_01_F
};
class SPE_Fuel_Barrel_US_01: SPE_Fuel_Barrel_base {
    transportFuel = 0;
    EGVAR(refuel,hooks)[] = {{0, 0, 0.5}}; // reference is Land_FlexibleTank_01_F
    EGVAR(refuel,fuelCargo) = 300; // reference is Land_FlexibleTank_01_F
};
