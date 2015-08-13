#define MACRO_VALUES \
    CSTRING(Disabled), CSTRING(FirstPerson), CSTRING(ThirdPerson)

class ACE_Settings {
    class GVAR(mode) {
        value = 0;
        typeName = "SCALAR";
        displayName = CSTRING(Mode);
        description = CSTRING(ModeDesc);
        values[] = {MACRO_VALUES, CSTRING(Selective)};
    };
    class GVAR(modeSelectiveFoot) {
        value = 0;
        typeName = "SCALAR";
        displayName = CSTRING(ModeSelectiveFoot);
        description = CSTRING(ModeSelectiveFootDesc);
        values[] = {MACRO_VALUES};
    };
    class GVAR(modeSelectiveLand) {
        value = 0;
        typeName = "SCALAR";
        displayName = CSTRING(ModeSelectiveLand);
        description = CSTRING(ModeSelectiveLandDesc);
        values[] = {MACRO_VALUES};
    };
    class GVAR(modeSelectiveAir) {
        value = 0;
        typeName = "SCALAR";
        displayName = CSTRING(ModeSelectiveAir);
        description = CSTRING(ModeSelectiveAirDesc);
        values[] = {MACRO_VALUES};
    };
    class GVAR(modeSelectiveSea) {
        value = 0;
        typeName = "SCALAR";
        displayName = CSTRING(ModeSelectiveSea);
        description = CSTRING(ModeSelectiveSeaDesc);
        values[] = {MACRO_VALUES};
    };
    // Disabled - Reference comment in FUNC(canChangeCamera)
    /*class GVAR(modeSelectiveUAV) {
        value = 0;
        typeName = "SCALAR";
        displayName = CSTRING(ModeSelectiveUAV);
        description = CSTRING(ModeSelectiveUAVDesc);
        values[] = {MACRO_VALUES};
    };*/
};
