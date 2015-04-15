class ACE_Settings {
    class GVAR(simulationInterval) {
        displayName = "Simulation Interval";
        description = "Defines the interval between every calculation step";
        typeName = "SCALAR";
        value = 0.05;
    };
    class GVAR(simulationRadius) {
        displayName = "Simulation Radius";
        description = "Defines the radius (in meters) in which advanced ballistics are applied";
        typeName = "SCALAR";
        value = 3000;
    };
};
