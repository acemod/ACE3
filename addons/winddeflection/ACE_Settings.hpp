class ACE_Settings {
    class GVAR(enabled) {
        displayName = "Wind Deflection";
        description = "Enables wind deflection";
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(vehicleEnabled) {
        displayName = "Vehicle Enabled";
        description = "Enables wind deflection for static/vehicle gunners";
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(simulationInterval) {
        displayName = "Simulation Interval";
        description = "Defines the interval between every calculation step";
        typeName = "SCALAR";
        value = 0.05;
    };
    class GVAR(simulationRadius) {
        displayName = "Simulation Radius";
        description = "Defines the radius around the player (in meters) at which projectiles are wind deflected";
        typeName = "SCALAR";
        value = 3000;
    };
};
