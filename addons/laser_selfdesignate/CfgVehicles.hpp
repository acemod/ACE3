class CfgVehicles {
    class AllVehicles;
    class Air: AllVehicles {
        class Turrets;
    };

    class Helicopter: Air {
        class Turrets {
            class MainTurret;
        };
    };

    class Helicopter_Base_F: Helicopter {};

    class Heli_Attack_01_base_F: Helicopter_Base_F {};

    class B_Heli_Attack_01_F: Heli_Attack_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                GVAR(Enabled) = 1;      // Enable laser self-designation
            };
        };
    };
};
