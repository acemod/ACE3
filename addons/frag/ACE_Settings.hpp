class ACE_Settings {
    class GVAR(Enabled) {
        displayName = CSTRING(EnableFrag);
        description = CSTRING(EnableFrag_Desc);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(SpallEnabled) {
        displayName = CSTRING(EnableSpall);
        description = CSTRING(EnableSpall_Desc);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(maxTrack) {
        displayName = CSTRING(MaxTrack);
        description = CSTRING(MaxTrack_Desc);
        typeName = "SCALAR";
        value = 500;
    };
    class GVAR(MaxTrackPerFrame) {
        displayName = CSTRING(MaxTrackPerFrame);
        description = CSTRING(MaxTrackPerFrame_Desc);
        typeName = "SCALAR";
        value = 50;
    };
    
    class GVAR(EnableDebugTrace) {
        displayName = CSTRING(EnableDebugTrace);
        description = CSTRING(EnableDebugTrace_Desc);
        typeName = "BOOL";
        value = 0;
    };
};
