class ACE_Settings {
    //Time to move a round from one magazine to another
    class GVAR(TimePerAmmo) {
        value = 1.5;
        typeName = "SCALAR";
    };
    //Time to swap between magazines when repacking
    class GVAR(TimePerMagazine) {
        value = 2.0;
        typeName = "SCALAR";
    };
    //Time to relink 2 belts together
    class GVAR(TimePerBeltLink) {
        value = 8.0;
        typeName = "SCALAR";
    };
};
