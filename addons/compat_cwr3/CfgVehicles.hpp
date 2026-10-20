class CfgVehicles {
    class Tank_F;
    class cwr3_m41_base: Tank_F {
        EGVAR(vehicle_damage,hullDetonationProb) = 0.5;
        EGVAR(vehicle_damage,turretDetonationProb) = 0.5;
        EGVAR(vehicle_damage,engineDetonationProb) = 0.2;
        EGVAR(vehicle_damage,hullFireProb) = 0.2;
        EGVAR(vehicle_damage,turretFireProb) = 0.2;
        EGVAR(vehicle_damage,engineFireProb) = 0.5;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.5;
        EGVAR(vehicle_damage,canHaveFireRing) = 1;
    };
};
