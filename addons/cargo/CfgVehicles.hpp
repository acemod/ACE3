
class CfgVehicles {
    class LandVehicle;
    class Car: LandVehicle {
        GVAR(space) = 4;
        GVAR(hasCargo) = 1;
    };

    class Tank: LandVehicle {
        GVAR(space) = 4;
        GVAR(hasCargo) = 1;
    };
    class Car_F;
    class Truck_F: Car_F {
        GVAR(space) = 8;
        GVAR(hasCargo) = 1;
    };

    class Air;
    // Repair helicopters
    class Helicopter: Air {
        GVAR(space) = 8;
        GVAR(hasCargo) = 1;
    };

    class Heli_Transport_02_base_F;
    class I_Heli_Transport_02_F : Heli_Transport_02_base_F {
        GVAR(space) = 20;
        GVAR(hasCargo) = 1;
    };

    // Repair fixed wing aircraft
    class Plane: Air {
        GVAR(space) = 4;
        GVAR(hasCargo) = 1;
    };

    // boats
    class Ship;
    class Ship_F: Ship {
        GVAR(space) = 4;
        GVAR(hasCargo) = 1;
    };

    // Static weapons
    class StaticWeapon: LandVehicle {
        GVAR(size) = 2; // 1 = small, 2 = large
        GVAR(canLoad) = 1;
    };

    class StaticMortar;
    class Mortar_01_base_F: StaticMortar {
        GVAR(size) = 2; // 1 = small, 2 = large
        GVAR(canLoad) = 1;
    };

    // Ammo boxes
    class ThingX;
    class ReammoBox_F: ThingX {
        GVAR(size) = 2; // 1 = small, 2 = large
        GVAR(canLoad) = 1;
    };
};
