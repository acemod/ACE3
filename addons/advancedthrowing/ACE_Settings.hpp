class ACE_Settings {
    class GVAR(enabled) {
        category = CSTRING(Category);
        displayName = CSTRING(Enable_DisplayName);
        description = CSTRING(Enable_Description);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(showThrowArc) {
        category = CSTRING(Category);
        displayName = CSTRING(ShowThrowArc_DisplayName);
        description = CSTRING(ShowThrowArc_Description);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(showMouseControls) {
        category = CSTRING(Category);
        displayName = CSTRING(ShowMouseControls_DisplayName);
        description = CSTRING(ShowMouseControls_Description);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
};
