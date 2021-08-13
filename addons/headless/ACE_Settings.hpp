class ACE_Settings {
    class XGVAR(enabled) {
        category = CSTRING(Module);
        value = 0;
        typeName = "BOOL";
        displayName = ACECSTRING(common,Enabled);
        description = CSTRING(EnabledDesc);
    };
    class XGVAR(delay) {
        category = CSTRING(Module);
        value = DELAY_DEFAULT;
        typeName = "SCALAR";
        displayName = CSTRING(Delay);
        description = CSTRING(DelayDesc);
        sliderSettings[] = {0, 120, DELAY_DEFAULT, 0};
    };
    class XGVAR(endMission) {
        category = CSTRING(Module);
        value = 0;
        values[] = {ACECSTRING(Common,Disabled), CSTRING(Instant), CSTRING(Delayed)};
        typeName = "SCALAR";
        displayName = CSTRING(EndMission);
        description = CSTRING(EndMissionDesc);
    };
    class XGVAR(log) {
        category = CSTRING(Module);
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(Log);
        description = CSTRING(LogDesc);
    };
};
