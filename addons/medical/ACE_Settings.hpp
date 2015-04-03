class ACE_Settings {
    class GVAR(level) {
        value = 1;
        typeName = "SCALAR";
        values[] = {"Disabled", "Basic", "Advanced"};
    };
    class GVAR(medicSetting) {
        value = 1;
        typeName = "SCALAR";
        values[] = {"Disabled", "Normal", "Advanced"};
    };
    class GVAR(enableFor) {
        value = 0;
        typeName = "SCALAR";
        values[] = {"Players only", "Players and AI"};
    };
    class GVAR(enableOverdosing) {
        typeName = "BOOL";
        value = true;
    };
    class GVAR(bleedingCoefficient) {
        typeName = "NUMBER";
        value = 1;
    };

    class GVAR(enableAirway) {
        typeName = "BOOL";
        value = false;
    };
    class GVAR(enableFractures) {
        typeName = "BOOL";
        value = false;
    };
    class GVAR(enableAdvancedWounds) {
        typeName = "BOOL";
        value = false;
    };
    class GVAR(enableVehicleCrashes) {
        typeName = "BOOL";
        value = true;
    };
    class GVAR(enableScreams) {
        typeName = "BOOL";
        value = true;
    };
    class GVAR(playerDamageThreshold) {
        typeName = "NUMBER";
        value = 1;
    };
    class GVAR(AIDamageThreshold) {
        typeName = "NUMBER";
        value = 1;
    };
    class GVAR(enableUnsconsiousnessAI) {
        value = 1;
        typeName = "NUMBER";
        values[] = {"Disabled", "Enabled", "50/50"};
    };
    class GVAR(preventInstaDeath) {
        typeName = "BOOL";
        value = false;
    };
    class GVAR(maxReviveTime) {
        typeName = "NUMBER";
        value = 120;
    };
    class GVAR(amountOfReviveLives) {
        typeName = "NUMBER";
        value = -1;
    };
    class GVAR(allowDeadBodyMovement) {
        typeName = "BOOL";
        value = false;
    };
    class GVAR(allowLitterCreation) {
        typeName = "BOOL";
        value = true;
    };
};
