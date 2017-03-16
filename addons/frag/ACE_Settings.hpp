class ACE_Settings {
    class GVAR(enabled) {
        category = CSTRING(Module_DisplayName);
        displayName = CSTRING(EnableFrag);
        description = CSTRING(EnableFrag_Desc);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(spallEnabled) {
        category = CSTRING(Module_DisplayName);
        displayName = CSTRING(EnableSpall);
        description = CSTRING(EnableSpall_Desc);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(reflectionsEnabled) {
        category = CSTRING(Module_DisplayName);
        displayName = CSTRING(EnableReflections);
        description = CSTRING(EnableReflections_Desc);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(maxTrack) {
        category = CSTRING(Module_DisplayName);
        displayName = CSTRING(MaxTrack);
        description = CSTRING(MaxTrack_Desc);
        typeName = "SCALAR";
        value = 500;
    };
    class GVAR(maxTrackPerFrame) {
        category = CSTRING(Module_DisplayName);
        displayName = CSTRING(MaxTrackPerFrame);
        description = CSTRING(MaxTrackPerFrame_Desc);
        typeName = "SCALAR";
        value = 50;
    };
    class GVAR(enableDebugTrace) {
        category = CSTRING(Module_DisplayName);
        displayName = CSTRING(EnableDebugTrace);
        description = CSTRING(EnableDebugTrace_Desc);
        typeName = "BOOL";
        value = 0;
    };
};
