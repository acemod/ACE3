class ACE_Settings {
    class GVAR(Enabled) {
        displayName = "$STR_ACE_frag_EnableFrag";
        description = "$STR_ACE_frag_EnableFrag_Desc";
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(SpallEnabled) {
        displayName = "$STR_ACE_frag_EnableSpall";
        description = "$STR_ACE_frag_EnableSpall_Desc";
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(maxTrack) {
        displayName = "$STR_ACE_frag_MaxTrack";
        description = "$STR_ACE_frag_MaxTrack_Desc";
        typeName = "SCALAR";
        value = 500;
    };
    class GVAR(MaxTrackPerFrame) {
        displayName = "$STR_ACE_frag_MaxTrackPerFrame";
        description = "$STR_ACE_frag_MaxTrackPerFrame_Desc";
        typeName = "SCALAR";
        value = 50;
    };
    
    class GVAR(EnableDebugTrace) {
        displayName = "$STR_ACE_frag_EnableDebugTrace";
        description = "$STR_ACE_frag_EnableDebugTrace_Desc";
        typeName = "BOOL";
        value = 0;
    };
};
