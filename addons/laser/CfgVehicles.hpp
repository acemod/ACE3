class CfgVehicles {
    class All;

    class LaserTarget: All {
        class EventHandlers {
            init = QUOTE(_this call FUNC(laser_init));
        };
    };
};