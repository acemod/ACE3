
class ACE_Settings {
    class GVAR(savePreDeathGear) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(SavePreDeathGear_DisplayName);
        description = CSTRING(SavePreDeathGear_Description);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(removeDeadBodiesDisconnected) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(RemoveDeadBodiesDisconnected_DisplayName);
        description = CSTRING(RemoveDeadBodiesDisconnected_Description);
        value = 1;
        typeName = "BOOL";
    };
    // Not used anywhere???
    // class GVAR(bodyRemoveTimer) {
        // category = CSTRING(DisplayName);
        // displayName = CSTRING(DeadBodyRemoveTimer);
        // value = 0;
        // typeName = "SCALAR";
    // };
};
