
class ACE_Settings {
    class GVAR(allow) {
        displayName = CSTRING(allow);
        description = CSTRING(allow_Descr);
        value = 1;
        typeName = "SCALAR";
        values[] = {ECSTRING(common,Disabled), ECSTRING(common,Enabled), ECSTRING(common,VehiclesOnly)};
    };
    class GVAR(useMenu) {
        displayName = CSTRING(useMenu);
        description = CSTRING(useMenu_Descr);
        value = 0;
        typeName = "SCALAR";
        values[] = {ECSTRING(common,Disabled), ECSTRING(common,Enabled), ECSTRING(common,VehiclesOnly)};
        isClientSettable = 1;
    };
    class GVAR(openAfterTreatment) {
        displayName = CSTRING(openAfterTreatment);
        description = CSTRING(openAfterTreatment_Descr);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
};
