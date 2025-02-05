// M39 / M54 / M49
class vn_wheeled_truck_base;
class vn_wheeled_m54_base: vn_wheeled_truck_base {
    EGVAR(refuel,fuelCapacity) = 189;
};
class vn_wheeled_m54_cab_base;
class vn_wheeled_m54_fuel_base: vn_wheeled_m54_cab_base {
    EGVAR(refuel,hooks)[] = {{-1.15, -2.3, 0.28}};
    EGVAR(refuel,fuelCargo) = 4542;
};
class vn_wheeled_m54_01_base;
class vn_wheeled_m54_ammo_base: vn_wheeled_m54_01_base {
    EGVAR(rearm,defaultSupply) = 1200;
};

// M151
class vn_wheeled_car_base;
class vn_wheeled_m151_base: vn_wheeled_car_base {
    EGVAR(refuel,fuelCapacity) = 65;
};

// M149
class Slingload_01_Base_F;
class Land_vn_b_prop_m149_01: Slingload_01_Base_F {
    EXGVAR(field_rations,waterSupply) = 1514.16; // 400 US gallons
    EXGVAR(field_rations,offset)[] = {0, -0.3, -0.3};
};
class vn_object_b_base_02;
class Land_vn_b_prop_m149_02: vn_object_b_base_02 {
    EXGVAR(field_rations,waterSupply) = 1514.16; // 400 US gallons
    EXGVAR(field_rations,offset)[] = {0, -0.3, -0.3};
};
class vn_object_b_base;
class Land_vn_b_prop_m149_03: vn_object_b_base {
    EXGVAR(field_rations,waterSupply) = 1514.16; // 400 US gallons
    EXGVAR(field_rations,offset)[] = {0, -0.3, -0.3};
};

// ZIL-157
class vn_wheeled_z157_base: vn_wheeled_truck_base {
    EGVAR(refuel,fuelCapacity) = 150;
};
class vn_wheeled_z157_fuel_base: vn_wheeled_z157_base {
    EGVAR(refuel,hooks)[] = {{-1.36, -3.575, -0.4}};
    EGVAR(refuel,fuelCargo) = 4000;
};
class vn_wheeled_z157_01_base;
class vn_wheeled_z157_ammo_base: vn_wheeled_z157_01_base {
    EGVAR(rearm,defaultSupply) = 1200;
};

// BTR-40
class vn_wheeled_btr40_base: vn_wheeled_car_base {
    EGVAR(refuel,fuelCapacity) = 122;
};
