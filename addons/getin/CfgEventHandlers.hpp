class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_InitPost_EventHandlers {
    class Car {
        class GVAR(InitPostCar) {
            clientInit = QUOTE(_this call FUNC(vehicleInitPost));
        };
    };
    class Tank {
        class GVAR(InitPostTank) {
            clientInit = QUOTE(_this call FUNC(vehicleInitPost));
        };
    };
    class Helicopter {
        class GVAR(InitPostHelicopter) {
            clientInit = QUOTE(_this call FUNC(vehicleInitPost));
        };
    };
    class Ship {
        class GVAR(InitPostShip) {
            clientInit = QUOTE(_this call FUNC(vehicleInitPost));
        };
    };
    class StaticWeapon {
        class GVAR(InitPostStaticWeapon) {
            clientInit = QUOTE(_this call FUNC(vehicleInitPost));
        };
    };
};
