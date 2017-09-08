class ACE_Settings {
    class GVAR(movableMarkersEnabled) {
        category = CSTRING(Module_DisplayName);
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(MovableMarkers_DisplayName);
        description = CSTRING(MovableMarkers_Description);
    };
    class GVAR(moveRestriction) {
        category = CSTRING(Module_DisplayName);
        value = 0;
        typeName = "SCALAR";
        displayName = CSTRING(MoveRestriction_DisplayName);
        description = CSTRING(MoveRestriction_Description);
        values[] = {CSTRING(MoveRestriction_All), CSTRING(MoveRestriction_Admins), CSTRING(MoveRestriction_GroupLeaders), CSTRING(MoveRestriction_GroupLeadersAndAdmins)};
    };
};
