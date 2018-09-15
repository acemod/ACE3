class CfgVehicles {
    class All;
    class AllVehicles: All {};
    class Ship: AllVehicles {};
    class Ship_F: Ship {};
    class Boat_F: Ship_F {};
    class Rubber_duck_base_F: Boat_F {};
    class rhsgref_canoe_base: Rubber_duck_base_F {
        // Canoes are propelled by paddlers
        EGVAR(refuel,canReceive) = 0;
    };
};
