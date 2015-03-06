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
};
