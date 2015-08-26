class ACE_Settings {
    class GVAR(MaxBreathingDistance) {
        typeName = "SCALAR";
        value = 100;
        isClientSettable = 1;
        category = "Mix";
        displayName = "Maximal Distance";
        description = "Maximal Distance where the Breathing Smoke is Simulated.";
    };
    class GVAR(breathIsForced) {
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(breathEnabled) {
        typeName = "BOOL";
        value = 0;
        isClientSettable = 1;
        category = "Mix";
        displayName = "Player Breathing is Enabled";
        description = "Enabled Player Breathing Simulation.";
    };
    class GVAR(breathTemperature) {
        typeName = "SCALAR";
        value = 0;
    };
    class GVAR(breathTimeStart) {
        typeName = "SCALAR";
        value = 0200;
    };
    class GVAR(breathTimeEnd) {
        typeName = "SCALAR";
        value = 0600;
    };
    class GVAR(bySpeaking) {
        typeName = "BOOL";
        value = 0;
        isClientSettable = 1;
        category = "Mix";
        displayName = "Simulate by Speaking";
        description = "Simulate the fog if a player speaks with ACRE/TFAR/or inGame Audio";
    };
};
