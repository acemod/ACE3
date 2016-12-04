class CfgVehicles {
    class Plane;
    class Plane_Base_F: Plane {
        class Turrets;
    };
    class RHS_AN2_Base: Plane_Base_F {
        class NewTurret;
        class Turrets: Turrets {
            class MainTurret: NewTurret {
                canEject = 1;
            };
        };
    };
};
