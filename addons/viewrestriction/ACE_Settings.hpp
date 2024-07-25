#define MACRO_VALUES \
    CSTRING(Disabled), CSTRING(FirstPerson), CSTRING(ThirdPerson)

class ACE_Settings {
    class XGVAR(mode) {
        movedToSQF = 1;
    };
    class XGVAR(modeSelectiveFoot) {
        movedToSQF = 1;
    };
    class XGVAR(modeSelectiveLand) {
        movedToSQF = 1;
    };
    class XGVAR(modeSelectiveAir) {
        movedToSQF = 1;
    };
    class XGVAR(modeSelectiveSea) {
        movedToSQF = 1;
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
