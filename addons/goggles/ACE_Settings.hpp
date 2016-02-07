
class ACE_Settings {
    /*class GVAR(enable) { // @todo
        value = 0;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(enable);
    };*/
    class GVAR(showInThirdPerson) {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(ShowInThirdPerson);
    };
};
