class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_InitPost_EventHandlers {
    class Car {
        class GVAR(InitPost) {
            clientInit = QUOTE(_this call FUNC(vehicleInitPost));
        };
    };
    class Tank {
        class GVAR(InitPost) {
            clientInit = QUOTE(_this call FUNC(handleUnitInitPost));
        };
    };
    class Air {
        class GVAR(InitPost) {
            clientInit = QUOTE(_this call FUNC(handleUnitInitPost));
        };
    };
    class Ship {
        class GVAR(InitPost) {
            clientInit = QUOTE(_this call FUNC(handleUnitInitPost));
        };
    };
    class StaticWeapon {
        class GVAR(InitPost) {
            clientInit = QUOTE(_this call FUNC(handleUnitInitPost));
        };
    };
};
