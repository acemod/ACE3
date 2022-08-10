// M41
class vn_armor_tank_base;
class vn_armor_m41_base: vn_armor_tank_base {
    EGVAR(refuel,fuelCapacity) = 530;
};

// Type 63
class vn_armor_type63_base: vn_armor_tank_base {
    EGVAR(refuel,fuelCapacity) = 545;
};

// M113A1 https://man.fas.org/dod-101/sys/land/m113.htm
class APC_Tracked_01_base_F;
class vn_armor_m113_base : APC_Tracked_01_base_F {
    EGVAR(refuel,fuelCapacity) = 360;
};

// PT-76A https://en.wikipedia.org/wiki/PT-76
class vn_armor_pt76_base : vn_armor_tank_base {
    EGVAR(refuel,fuelCapacity) = 250;
};

// PT-76B (This variant increased the fuel size from 250 to 400 liters)
class vn_armor_pt76b_base : vn_armor_pt76_base {
    EGVAR(refuel,fuelCapacity) = 400;
};
