class ACE_Settings {
    class GVAR(enabled) {
        displayName = "Advanced Ballistics";
        description = "Enables advanced ballistics";
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(simulateForSnipers) {
        displayName = "Enabled For Snipers";
        description = "Enables advanced ballistics for non local snipers (when using high power optics)";
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(simulateForGroupMembers) {
        displayName = "Enabled For Group Members";
        description = "Enables advanced ballistics for non local group members";
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(simulateForEveryone) {
        displayName = "Enabled For Everyone";
        description = "Enables advanced ballistics for all non local players (enabling this may degrade performance during heavy firefights in multiplayer)";
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(disabledInFullAutoMode) {
        displayName = "Disabled In FullAuto Mode";
        description = "Disables advanced ballistics during full auto fire";
        typeName = "BOOL";
        value = 0;
    };
    /* // TODO: We currently do not have firedEHs on vehicles
    class GVAR(vehicleGunnerEnabled) {
        displayName = "Enabled For Vehicle Gunners";
        description = "Enables advanced ballistics for vehicle gunners";
        typeName = "BOOL";
        value = 0;
    };
    */
    class GVAR(ammoTemperatureEnabled) {
        displayName = "Enable Ammo Temperature Simulation";
        description = "Muzzle velocity varies with ammo temperature";
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(barrelLengthInfluenceEnabled) {
        displayName = "Enable Barrel Length Simulation";
        description = "Muzzle velocity varies with barrel length";
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(bulletTraceEnabled) {
        displayName = "Enable Bullet Trace Effect";
        description = "Enables a bullet trace effect to high caliber bullets (only visible when looking through high power optics)";
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(simulationInterval) {
        displayName = "Simulation Interval";
        description = "Defines the interval between every calculation step";
        typeName = "SCALAR";
        value = 0.0;
    };
    class GVAR(simulationRadius) {
        displayName = "Simulation Radius";
        description = "Defines the radius around the player (in meters) at which advanced ballistics are applied to projectiles";
        typeName = "SCALAR";
        value = 3000;
    };
};
