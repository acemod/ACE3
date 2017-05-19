class ACE_Settings {
    class GVAR(enableAI) {
        displayName = CSTRING(ai_DisplayName);
        description = CSTRING(ai_Description);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(restrictModes) {
        displayName = CSTRING(modes_DisplayName);
        description = CSTRING(modes_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(modes_all), CSTRING(modes_unit), CSTRING(modes_free), CSTRING(modes_internal), CSTRING(modes_external)};
    };
    class GVAR(restrictVisions) {
        displayName = CSTRING(visions_DisplayName);
        description = CSTRING(visions_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(modes_all), CSTRING(visions_nv), CSTRING(visions_ti), "$STR_Special_None"};
    };
};
