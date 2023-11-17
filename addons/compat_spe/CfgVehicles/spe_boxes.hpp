
// dragging carrying items
class ReammoBox_F;
class SPE_ReammoBox_base: ReammoBox_F {
    EGVAR(cargo,size) = 1;
    EGVAR(cargo,canLoad) = 1;

    EGVAR(dragging,canCarry) = 1;
    EGVAR(dragging,carryPosition)[] = {0,1,1};
    EGVAR(dragging,carryDirection) = 0;

    EGVAR(dragging,canDrag) = 1;
    EGVAR(dragging,dragPosition)[] = {0,1.2,0};
    EGVAR(dragging,dragDirection) = 0;
};

class SPE_Fuel_Barrel_base;
class SPE_Fuel_Barrel_US_01: SPE_Fuel_Barrel_base {
    EGVAR(cargo,size) = 2;
    EGVAR(cargo,canLoad) = 1;

    EGVAR(dragging,canCarry) = 1;
    EGVAR(dragging,carryPosition)[] = {0,1,1};
    EGVAR(dragging,carryDirection) = 0;

    EGVAR(dragging,canDrag) = 1;
    EGVAR(dragging,dragPosition)[] = {0,1.2,0};
    EGVAR(dragging,dragDirection) = 0;

    EGVAR(refuel,fuelCargo) = 208;
    EGVAR(refuel,hooks)[] = {{0.2,0,0.22}};
};
class SPE_Fuel_Barrel_German_01: SPE_Fuel_Barrel_base {
    EGVAR(cargo,size) = 2; //reference SPE_Fuel_Barrel_US_01
    EGVAR(cargo,canLoad) = 1; //reference SPE_Fuel_Barrel_US_01

    EGVAR(dragging,canCarry) = 1; //reference SPE_Fuel_Barrel_US_01
    EGVAR(dragging,carryPosition)[] = {0,1,1}; //reference SPE_Fuel_Barrel_US_01
    EGVAR(dragging,carryDirection) = 0; //reference SPE_Fuel_Barrel_US_01

    EGVAR(dragging,canDrag) = 1; //reference SPE_Fuel_Barrel_US_01
    EGVAR(dragging,dragPosition)[] = {0,1.2,0}; //reference SPE_Fuel_Barrel_US_01
    EGVAR(dragging,dragDirection) = 0; //reference SPE_Fuel_Barrel_US_01

    EGVAR(refuel,fuelCargo) = 208; //reference SPE_Fuel_Barrel_US_01
    EGVAR(refuel,hooks)[] = {{0.32,0,-0.3}};
};
