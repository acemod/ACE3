// fuel objects

class SPE_items_base;
class Land_SPE_Fuel_Barrel_German: SPE_items_base {
    transportFuel = 0;
    EGVAR(refuel,hooks)[] = {{0, 0, 0.5}}; // reference is Land_FlexibleTank_01_F
    EGVAR(refuel,fuelCargo) = 300; // reference is Land_FlexibleTank_01_F
};
class Land_SPE_Fuel_Barrel_US: SPE_items_base {
    transportFuel = 0;
    EGVAR(refuel,hooks)[] = {{0, 0, 0.5}}; // reference is Land_FlexibleTank_01_F
    EGVAR(refuel,fuelCargo) = 300; // reference is Land_FlexibleTank_01_F
};
