class ACE_Settings {
    class GVAR(zeusAscension) {
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(zeusBird) {
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(remoteWind) {
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(radioOrdnance) {
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(revealMines) {
        typeName = "SCALAR";
        value = 0;
        values[] = {"$STR_ACE_Zeus_revealMines_disable", "$STR_ACE_Zeus_revealMines_partial", "$STR_ACE_Zeus_revealMines_full"};
    };
};
