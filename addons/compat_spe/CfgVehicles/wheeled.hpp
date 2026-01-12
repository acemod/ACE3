class Truck_F;
class SPE_Truck_base: Truck_F {
    EGVAR(cargo,hasCargo) = 1;
    EGVAR(cargo,space) = 4;
    EGVAR(refuel,canReceive) = 1;
    EGVAR(refuel,fuelCapacity) = 88;
    EGVAR(vehicle_damage,hullDetonationProb) = 0.2;
    EGVAR(vehicle_damage,turretDetonationProb) = 0.03;
    EGVAR(vehicle_damage,engineDetonationProb) = 0.03;
    EGVAR(vehicle_damage,hullFireProb) = 0.6;
    EGVAR(vehicle_damage,turretFireProb) = 0.1;
    EGVAR(vehicle_damage,engineFireProb) = 0.2;
    EGVAR(vehicle_damage,detonationDuringFireProb) = 0.2;
    EGVAR(vehicle_damage,canHaveFireRing) = 1;
};
class SPE_WheeledTracked_APC_base: SPE_Truck_base {
    EGVAR(refuel,fuelCapacity) = 140;
    EGVAR(vehicle_damage,hullDetonationProb) = 0.03;
    EGVAR(vehicle_damage,turretDetonationProb) = 0.03;
    EGVAR(vehicle_damage,engineDetonationProb) = 0.03;
    EGVAR(vehicle_damage,hullFireProb) = 0.3;
    EGVAR(vehicle_damage,turretFireProb) = 0.1;
    EGVAR(vehicle_damage,engineFireProb) = 0.2;
    EGVAR(vehicle_damage,detonationDuringFireProb) = 0.2;
    EGVAR(vehicle_damage,canHaveFireRing) = 1;
};

class SPE_Halftrack_base: SPE_WheeledTracked_APC_base {
    EGVAR(refuel,fuelCapacity) = 230;
    EGVAR(vehicle_damage,hullDetonationProb) = 0.03;
    EGVAR(vehicle_damage,turretDetonationProb) = 0.03;
    EGVAR(vehicle_damage,engineDetonationProb) = 0.03;
    EGVAR(vehicle_damage,hullFireProb) = 0.3;
    EGVAR(vehicle_damage,turretFireProb) = 0.1;
    EGVAR(vehicle_damage,engineFireProb) = 0.2;
    EGVAR(vehicle_damage,detonationDuringFireProb) = 0.2;
    EGVAR(vehicle_damage,canHaveFireRing) = 1;
};


// WHEELED - AXIS
class SPE_OpelBlitz_base: SPE_Truck_base {
    EGVAR(refuel,fuelCapacity) = 88;
};

class SPE_OpelBlitz_Ambulance: SPE_OpelBlitz_base {
    EGVAR(medical,medicClass) = 1;
};

class SPE_OpelBlitz_Repair: SPE_OpelBlitz_base {
    EGVAR(repair,canRepair) = 1;
};

class SPE_OpelBlitz_Ammo: SPE_OpelBlitz_base {
    EGVAR(rearm,defaultSupply) = 1200;
};

class SPE_OpelBlitz_Fuel: SPE_OpelBlitz_base {
    EGVAR(refuel,hooks)[] = {{-0.23, -2.58, -0.59}};
    EGVAR(refuel,fuelCargo) = 2000;
};

// WHEELED - ALLIED FORCES
class SPE_US_M3_Halftrack_Ambulance: SPE_Halftrack_base {
    EGVAR(medical,medicClass) = 1;
};

class SPE_US_M3_Halftrack_Repair: SPE_Halftrack_base {
    EGVAR(repair,canRepair) = 1;
};

class SPE_US_M3_Halftrack_Ammo: SPE_Halftrack_base {
    EGVAR(rearm,defaultSupply) = 1200;
};

class SPE_US_M3_Halftrack_Fuel: SPE_Halftrack_base {
    EGVAR(refuel,hooks)[] = {{-0.23, -2.58, -0.59}};
    EGVAR(refuel,fuelCargo) = 2000;
};

class SPE_Car_base;
class SPE_G503_MB_base: SPE_Car_base {
    class EGVAR(interaction,anims) {
        class hide_musette_source {
            positions[] = {{0.8, -0.97, -0.6}, {-0.8, -0.92, -0.6}};
            items[] = {"B_SPE_US_M36", "B_SPE_US_M36"};
            name = "$STR_CTH_B_SPE_US_M36";
            text = "$STR_CTH_B_SPE_US_M36";
        };
    };
};
class SPE_US_G503_MB_M1919_base: SPE_G503_MB_base {
    class EGVAR(interaction,anims): EGVAR(interaction,anims) {
        class hide_musette_source: hide_musette_source {
            positions[] = {{0.8, -0.5, -0.6}, {-0.8, -0.45, -0.6}};
        };
    };
};
class SPE_US_G503_MB_M1919_Armoured_base: SPE_G503_MB_base {
    class EGVAR(interaction,anims): EGVAR(interaction,anims) {
        class hide_musette_source: hide_musette_source {
            positions[] = {{0.8, -0.5, -0.6}, {-0.8, -0.45, -0.6}};
        };
    };
};
class SPE_US_G503_MB_M1919_PATROL_base: SPE_G503_MB_base {
    class EGVAR(interaction,anims): EGVAR(interaction,anims) {
        class hide_musette_source: hide_musette_source {
            positions[] = {{0.8, -0.5, -0.6}, {-0.8, -0.45, -0.6}};
        };
    };
};
class SPE_US_G503_MB_M2_base: SPE_G503_MB_base {
    class EGVAR(interaction,anims): EGVAR(interaction,anims) {
        class hide_musette_source: hide_musette_source {
            positions[] = {{0.8, -0.5, -0.6}, {-0.8, -0.45, -0.6}};
        };
    };
};
class SPE_US_G503_MB_M2_Armoured_base: SPE_G503_MB_base {
    class EGVAR(interaction,anims): EGVAR(interaction,anims) {
        class hide_musette_source: hide_musette_source {
            positions[] = {{0.8, -0.5, -0.6}, {-0.8, -0.45, -0.6}};
        };
    };
};
class SPE_US_G503_MB_M2_PATROL_base: SPE_G503_MB_base {
    class EGVAR(interaction,anims): EGVAR(interaction,anims) {
        class hide_musette_source: hide_musette_source {
            positions[] = {{0.8, -0.5, -0.6}, {-0.8, -0.45, -0.6}};
        };
    };
};
class SPE_G503_MB_Ambulance_base: SPE_G503_MB_base {
    class EGVAR(interaction,anims): EGVAR(interaction,anims) {
        class hide_musette_source: hide_musette_source {
            positions[] = {{0.8, -0.5, -0.6}, {-0.8, -0.45, -0.6}};
        };
    };
};
