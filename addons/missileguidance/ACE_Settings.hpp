class ACE_Settings {
    class GVAR(enabled) {
        value = 2;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = CSTRING(Title);
        description = CSTRING(Desc);
        values[] = {CSTRING(Off), CSTRING(PlayerOnly), CSTRING(PlayerAndAi)};
    };
};