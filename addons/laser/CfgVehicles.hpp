class CfgVehicles {
    class All;
    class LaserTarget: All {
        // @TODO: Changing the model and simulation hides it, but THEN IT DOESNT SPAWN WTF!?
        // model = "\A3\Weapons_F\empty.p3d";

        class EventHandlers {
            class ADDON {
                init = QUOTE(_this call FUNC(handleLaserTargetCreation));
            };
        };
    };
};
