class CfgVehicles {
    class Sound;
    class GVAR(Sound_low): Sound {
        author = ECSTRING(common,ACETeam);
        _generalMacro = QGVAR(Sound);
        scope = 1;
        sound = QGVAR(CookOff_low);
    };
    class GVAR(Sound_mid): GVAR(Sound_low) {
        sound = QGVAR(CookOff_mid);
    };
    class GVAR(Sound_high): GVAR(Sound_low) {
        sound = QGVAR(CookOff_high);
    };

    class Tank;
    class Tank_F: Tank {
        GVAR(cookoffSelections)[] = {"poklop_gunner","poklop_commander"};
    };

    class Car_F;
    class Wheeled_APC_F: Car_F {
        GVAR(cookoffSelections)[] = {"poklop_gunner","poklop_commander"};

        // Big explosions for wheeled APCs (same as for tanks)
        explosionEffect = "FuelExplosionBig";
    };
    class MRAP_01_base_F: Car_F {
        GVAR(engineSmokeOffset)[] = {0, -2, 0};
    };
    class MRAP_02_base_F: Car_F {
        GVAR(engineSmokeOffset)[] = {0, -2, 0};
    };
    class MRAP_03_base_F: Car_F {
        GVAR(engineSmokeOffset)[] = {0, -2, 0};
    };
    class Quadbike_01_base_F: Car_F {
        GVAR(engineSmokeOffset)[] = {0, 1, 0};
    };

    class Truck_F;
    class Truck_02_base_F: Truck_F {
        GVAR(engineSmokeOffset)[] = {0, -2.6, -0.1};
    };
    class Truck_02_MRL_base_F: Truck_02_base_F {
        GVAR(engineSmokeOffset)[] = {0, 0.3, -0.1};
    };
};
