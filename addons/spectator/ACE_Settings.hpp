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
        values[] = {CSTRING(modes_all), CSTRING(modes_unit), "$STR_A3_Spectator_free_camera_tooltip", "$STR_A3_Spectator_1pp_camera_tooltip", "$STR_A3_Spectator_3pp_camera_tooltip"};
    };
    class GVAR(restrictVisions) {
        displayName = CSTRING(visions_DisplayName);
        description = CSTRING(visions_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(modes_all), CSTRING(visions_nv), CSTRING(visions_ti), "$STR_Special_None"};
    };
    class GVAR(mapLocations) {
        displayName = CSTRING(mapLocations_DisplayName);
        description = CSTRING(mapLocations_Description);
        typeName = "BOOL";
        value = 0;
    };
};
