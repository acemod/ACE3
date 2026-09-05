class CfgVehicles {
    // The invisible roadway LOD that is placed under the unit so the engine has
    // something solid to stand on while the anchor moves beneath it.
    class Items_base_F;
    class GVAR(roadway): Items_base_F {
        scope = 1;
        author = "Bloodwyn";
        displayName = CSTRING(Roadway_DisplayName);
        model = QPATHTOF(data\roadway.p3d);
        vehicleClass = "Objects";
        icon = "iconObject";
        mapSize = 0.7;
        armor = 20000;
    };

    // GVAR(walkable): 1 forces a class to be walkable, 0 excludes it.
    // Anything unset falls back to the kind check in FUNC(isWalkable).
    // This replaces the original addon's runtime classname arrays.
    class All {
        GVAR(walkable) = -1;
    };

    // Parachutes: standing on a canopy is never wanted and breaks the jump.
    class ParachuteBase;
    class ParachuteWest: ParachuteBase {
        GVAR(walkable) = 0;
    };
    class ParachuteEast: ParachuteBase {
        GVAR(walkable) = 0;
    };
    class ParachuteIndep: ParachuteBase {
        GVAR(walkable) = 0;
    };
    class Steerable_Parachute_F: ParachuteBase {
        GVAR(walkable) = 0;
    };
    class NonSteerable_Parachute_F: ParachuteBase {
        GVAR(walkable) = 0;
    };

    // Engine rope segments have no CfgVehicles entry to inherit from, so they are
    // excluded by classname at runtime instead. See FUNC(isWalkable).
};
