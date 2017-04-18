class ACE_Settings {
    class GVAR(useImperial) {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(UseImperial);
    };
    class GVAR(climbHeight) {
        value = 0;
        typeName = "SCALAR";
        displayName = CSTRING(ClimbHeight);
        description = CSTRING(ClimbHeightDesc)
    };
};
