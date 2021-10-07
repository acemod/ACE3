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

// M151
class vn_wheeled_car_base;
class vn_wheeled_m151_base: vn_wheeled_car_base {
    EGVAR(refuel,fuelCapacity) = 65;
};

// ZIL-157
class vn_wheeled_z157_base : vn_wheeled_truck_base {
    EGVAR(refuel,fuelCapacity) = 150;
};
class vn_wheeled_z157_fuel_base: vn_wheeled_z157_base {
    EGVAR(refuel,hooks)[] = {{-1.36, -3.575, -0.4}};
    EGVAR(refuel,fuelCargo) = 4000;
};

// BTR-40
class vn_wheeled_btr40_base: vn_wheeled_car_base {
    EGVAR(refuel,fuelCapacity) = 122;
};
