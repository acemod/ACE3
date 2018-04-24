class ACE_Settings {
    class GVAR(enabled) {
        category = CSTRING(Category_Pylons);
        displayName = CSTRING(Enabled);
        description = CSTRING(Enabled_description);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(rearmNewPylons) {
        category = CSTRING(Category_Pylons);
        displayName = CSTRING(RearmNewPylons);
        description = CSTRING(RearmNewPylons_description);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(searchDistance) {
        category = CSTRING(Category_Pylons);
        displayName = CSTRING(SearchDistance);
        description = CSTRING(SearchDistance_description);
        value = 15;
        typeName = "SCALAR";
        sliderSettings[] = {0, 50, 15, 1};
    };
    class GVAR(timePerPylon) {
        category = CSTRING(Category_Pylons);
        displayName = CSTRING(TimePerPylon);
        description = CSTRING(TimePerPylon_description);
        value = 5;
        typeName = "SCALAR";
        sliderSettings[] = {0, 10, 5, 1};
    };
    class GVAR(requireEngineer) {
        category = CSTRING(Category_Pylons);
        displayName = CSTRING(RequireEngineer);
        description = CSTRING(RequireEngineer_description);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(requireToolkit) {
        category = CSTRING(Category_Pylons);
        displayName = CSTRING(RequireToolkit);
        description = CSTRING(RequireToolkit_description);
        value = 1;
        typeName = "BOOL";
    };
};
