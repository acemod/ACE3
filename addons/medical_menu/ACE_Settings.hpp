
class ACE_Settings {
    class GVAR(allow) {
        displayName = CSTRING(allow);
        description = CSTRING(allow_Descr);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(useMenu) {
        displayName = CSTRING(useMenu);
        description = CSTRING(useMenu_Descr);
        typeName = "BOOL";
        value = 1;
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
