
class ACE_Settings {
    class GVAR(SavePreDeathGear) {
        displayName = CSTRING(SavePreDeathGear_DisplayName);
        description = CSTRING(SavePreDeathGear_Description);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(RemoveDeadBodiesDisconnected) {
        displayName = CSTRING(RemoveDeadBodiesDisconnected_DisplayName);
        description = CSTRING(RemoveDeadBodiesDisconnected_Description);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(BodyRemoveTimer) {
        value = 0;
        typeName = "SCALAR";
    };
};
