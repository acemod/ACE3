#define MACRO_VALUES \
    CSTRING(Disabled), CSTRING(FirstPerson), CSTRING(ThirdPerson)

class ACE_Settings {
    class XGVAR(mode) {
        category = CSTRING(ModuleDisplayName);
        value = 0;
        typeName = "SCALAR";
        displayName = CSTRING(Mode);
        description = CSTRING(ModeDesc);
        values[] = {MACRO_VALUES, CSTRING(Selective)};
    };
    class XGVAR(modeSelectiveFoot) {
        category = CSTRING(ModuleDisplayName);
        value = 0;
        typeName = "SCALAR";
        displayName = CSTRING(ModeSelectiveFoot);
        description = CSTRING(ModeSelectiveFootDesc);
        values[] = {MACRO_VALUES};
    };
    class XGVAR(modeSelectiveLand) {
        category = CSTRING(ModuleDisplayName);
        value = 0;
        typeName = "SCALAR";
        displayName = CSTRING(ModeSelectiveLand);
        description = CSTRING(ModeSelectiveLandDesc);
        values[] = {MACRO_VALUES};
    };
    class XGVAR(modeSelectiveAir) {
        category = CSTRING(ModuleDisplayName);
        value = 0;
        typeName = "SCALAR";
        displayName = CSTRING(ModeSelectiveAir);
        description = CSTRING(ModeSelectiveAirDesc);
        values[] = {MACRO_VALUES};
    };
    class XGVAR(modeSelectiveSea) {
        category = CSTRING(ModuleDisplayName);
        value = 0;
        typeName = "SCALAR";
        displayName = CSTRING(ModeSelectiveSea);
        description = CSTRING(ModeSelectiveSeaDesc);
        values[] = {MACRO_VALUES};
    };
    // Disabled - Reference comment in FUNC(canChangeCamera)
    /*class GVAR(modeSelectiveUAV) {
        category = CSTRING(ModuleDisplayName);
        value = 0;
        typeName = "SCALAR";
        displayName = CSTRING(ModeSelectiveUAV);
        description = CSTRING(ModeSelectiveUAVDesc);
        values[] = {MACRO_VALUES};
    };*/
};
