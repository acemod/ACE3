#define XEH_INHERITED class EventHandlers {class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};}

// fuel pumps
class Land_vn_commercial_base;
class Land_vn_fuelstation_01_pump_f: Land_vn_commercial_base {
    XEH_INHERITED;
    EGVAR(refuel,hooks)[] = {{0, 0.4, -0.5}, {0, -0.4, -0.5}};
    EGVAR(refuel,fuelCargo) = REFUEL_INFINITE_FUEL;
};
class Land_vn_fuelstation_02_pump_f: Land_vn_commercial_base {
    XEH_INHERITED;
    EGVAR(refuel,hooks)[] = {{0, 0.4, -0.5}, {0, -0.4, -0.5}};
    EGVAR(refuel,fuelCargo) = REFUEL_INFINITE_FUEL;
};
class Land_vn_fuelstation_feed_f: Land_vn_commercial_base {
    XEH_INHERITED;
    EGVAR(refuel,hooks)[] = {{0, 0.4, -0.5}, {0, -0.4, -0.5}};
    EGVAR(refuel,fuelCargo) = REFUEL_INFINITE_FUEL;
};

// fuel objects
class Land_vn_building_b_base;
class Land_vn_usaf_fueltank_75_01: Land_vn_building_b_base {
    XEH_INHERITED;
    EGVAR(refuel,hooks)[] = {{-2.52, -2.2, -2.05}, {2.5, 0, -1.3}};
    EGVAR(refuel,fuelCargo) = 2840; // 750 * 3.785
};
class Land_vn_b_prop_fuelbladder_01: Land_vn_usaf_fueltank_75_01 {
    EGVAR(refuel,hooks)[] = {{-1.75, -6.7, -1}};
    EGVAR(refuel,fuelCargo) = 3785; // 1000 * 3.785
};
class Land_vn_b_prop_fuelbladder_03: Land_vn_b_prop_fuelbladder_01 {
    EGVAR(refuel,hooks)[] = {{-1.55, -6.5, -1}};
};
class Land_vn_building_industrial_base;
class Land_vn_fuel_tank_stairs: Land_vn_building_industrial_base {
    XEH_INHERITED;
    EGVAR(refuel,hooks)[] = {{0, 0.4, -1.3}, {0, -0.4, -1.3}};
    EGVAR(refuel,fuelCargo) = 10000; // reference is B_Slingload_01_Fuel_F
};
class Land_vn_object_b_base;
class Land_vn_b_prop_fueldrum_01: Land_vn_object_b_base {
    XEH_INHERITED;
    EGVAR(refuel,hooks)[] = {{0, 0, 0}};
    EGVAR(refuel,fuelCargo) = 300; // reference is Land_FlexibleTank_01_F
};
class Land_vn_b_prop_fueldrum_02: Land_vn_b_prop_fueldrum_01 {
    EGVAR(refuel,hooks)[] = {{0, -1.3, -0.15}, {2.3, 1.25, -0.15}};
    EGVAR(refuel,fuelCargo) = 14100; // (23 + 24) * 300
};
class vn_b_ammobox_supply_07;
class vn_b_ammobox_supply_09: vn_b_ammobox_supply_07 { // just a pallet
    XEH_INHERITED;
};
class vn_object_c_base_02;
class Land_vn_canisterfuel_f: vn_object_c_base_02 {
    EGVAR(cargo,size) = 1;
    EGVAR(cargo,canLoad) = 1;
    EGVAR(cargo,noRename) = 1;
};
class Land_vn_object_c_base;
class Land_vn_fuelcan: Land_vn_object_c_base {
    XEH_INHERITED;
    EGVAR(cargo,size) = 1;
    EGVAR(cargo,canLoad) = 1;
    EGVAR(cargo,noRename) = 1;
};
