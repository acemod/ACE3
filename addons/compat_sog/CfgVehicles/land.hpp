
// fuel pumps
class Land_vn_commercial_base;
class Land_vn_fuelstation_01_pump_f: Land_vn_commercial_base {
    transportFuel = 0;
    EGVAR(refuel,hooks)[] = {{0, 0.4, -0.5}, {0, -0.4, -0.5}};
    EGVAR(refuel,fuelCargo) = REFUEL_INFINITE_FUEL;
};
class Land_vn_fuelstation_02_pump_f: Land_vn_commercial_base {
    transportFuel = 0;
    EGVAR(refuel,hooks)[] = {{0, 0.4, -0.5}, {0, -0.4, -0.5}};
    EGVAR(refuel,fuelCargo) = REFUEL_INFINITE_FUEL;
};
class Land_vn_fuelstation_feed_f: Land_vn_commercial_base {
    transportFuel = 0;
    EGVAR(refuel,hooks)[] = {{0, 0.4, -0.5}, {0, -0.4, -0.5}};
    EGVAR(refuel,fuelCargo) = REFUEL_INFINITE_FUEL;
};

// fuel objects
class Land_vn_building_b_base;
class Land_vn_usaf_fueltank_75_01: Land_vn_building_b_base {
    transportFuel = 0;
    EGVAR(refuel,hooks)[] = {{0, -0.4, -0.5}};
    EGVAR(refuel,fuelCargo) = 2840; // 750 * 3.785
};
class Land_vn_object_b_base;
class Land_vn_b_prop_fueldrum_01: Land_vn_object_b_base {
    transportFuel = 0;
    EGVAR(refuel,hooks)[] = {{0, 0, 0.5}}; // reference is Land_FlexibleTank_01_F
    EGVAR(refuel,fuelCargo) = 300; // reference is Land_FlexibleTank_01_F
};
