
class ACE_Settings {
    class GVAR(savePreDeathGear) {
        displayName = CSTRING(SavePreDeathGear_DisplayName);
        description = CSTRING(SavePreDeathGear_Description);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(removeDeadBodiesDisconnected) {
        displayName = CSTRING(RemoveDeadBodiesDisconnected_DisplayName);
        description = CSTRING(RemoveDeadBodiesDisconnected_Description);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(bodyRemoveTimer) {
        value = 0;
        typeName = "SCALAR";
    };
};
