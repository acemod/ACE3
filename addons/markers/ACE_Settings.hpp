class ACE_Settings {
    class GVAR(MovableMarkersEnabled) {
        category = CSTRING(Module_DisplayName);
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(MovableMarkers_DisplayName);
        description = CSTRING(MovableMarkers_Description);
    };
    class GVAR(MoveRestriction) {
        category = CSTRING(Module_DisplayName);
        value = 0;
        typeName = "SCALAR";
        displayName = CSTRING(MoveRestriction_DisplayName);
        description = CSTRING(MoveRestriction_Description);
    };
};
