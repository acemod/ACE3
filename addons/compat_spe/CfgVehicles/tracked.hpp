class Tank_F;
class SPE_Tank_base: Tank_F {
    EGVAR(cargo,hasCargo) = 1;
    EGVAR(cargo,space) = 4;
    EGVAR(refuel,canReceive) = 1;
    EGVAR(vehicle_damage,hullDetonationProb) = 0.01;
    EGVAR(vehicle_damage,turretDetonationProb) = 0.01;
    EGVAR(vehicle_damage,engineDetonationProb) = 0.01;
    EGVAR(vehicle_damage,hullFireProb) = 0.2;
    EGVAR(vehicle_damage,turretFireProb) = 0.1;
    EGVAR(vehicle_damage,engineFireProb) = 0.2;
    EGVAR(vehicle_damage,detonationDuringFireProb) = 0.2;
    EGVAR(vehicle_damage,canHaveFireRing) = 1;
};

// ALLIED FORCES
class SPE_M4A1_Sherman_HullMG_base;

class SPE_M4A1_75: SPE_M4A1_Sherman_HullMG_base {
    EGVAR(refuel,fuelCapacity) = 660;
};

class SPE_M4A1_76: SPE_M4A1_Sherman_HullMG_base {
    EGVAR(refuel,fuelCapacity) = 520;
};

class SPE_M4A1_T34_Calliope: SPE_M4A1_Sherman_HullMG_base {
    EGVAR(refuel,fuelCapacity) = 520;
};

class SPE_M10_base: SPE_Tank_base {
    EGVAR(refuel,fuelCapacity) = 620;
};

class SPE_M18_Hellcat_Base: SPE_Tank_base {
    EGVAR(refuel,fuelCapacity) = 620;
};

// AXIS FORCES

class SPE_Nashorn_base: SPE_Tank_base {
    EGVAR(refuel,fuelCapacity) = 470;
};

class SPE_PzKpfwVI_H1_base: SPE_Tank_base {
    EGVAR(refuel,fuelCapacity) = 540;
};

class SPE_PzKpfwIV_G_base: SPE_Tank_base {
    EGVAR(refuel,fuelCapacity) = 600;
};

class SPE_PzKpfwIII_Base: SPE_Tank_base {
    EGVAR(refuel,fuelCapacity) = 320;
};
