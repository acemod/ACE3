class ACE_Settings {
    class GVAR(quickTag) {
        category = CSTRING(Tagging);
        displayName = CSTRING(QuickTag);
        description = CSTRING(QuickTagDesc);
        typeName = "SCALAR";
        value = 1;
        values[] = {ECSTRING(Common,Disabled), CSTRING(LastUsed), CSTRING(RandomX), CSTRING(Random)};
        isClientSettable = 1;
    };
};
