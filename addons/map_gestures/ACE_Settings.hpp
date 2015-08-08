class ACE_Settings {
    class GVAR(enabled) {
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(enabled_displayName);
        description = CSTRING(enabled_description);
    };
    class GVAR(maxRange) {
        value = 7;
        typeName = "SCALAR";
        displayName = CSTRING(maxRange_displayName);
        description = CSTRING(maxRange_description);
    };
    class GVAR(interval) {
        value = 0.03;
        typeName = "SCALAR";
        displayName = CSTRING(interval_displayName);
        description = CSTRING(interval_description);
    };
    class GVAR(defaultLeadColor) {
        value[] = {1, 0.88, 0, 0.95};
        typeName = "COLOR";
        displayName = CSTRING(defaultLeadColor_displayName);
        description = CSTRING(defaultLeadColor_description);
    };
    class GVAR(defaultColor) {
        value[] = {1, 0.88, 0, 0.7};
        typeName = "COLOR";
        displayName = CSTRING(defaultColor_displayName);
        description = CSTRING(defaultColor_description);
    };
    class GVAR(GroupColorConfigurations) {
        value[] = {};
        typeName = "ARRAY";
        displayName = CSTRING(GroupColorConfigurations_displayName);
        description = CSTRING(GroupColorConfigurations_description);
    };
    class GVAR(GroupColorConfigurationsGroups) {
        value[] = {};
        typeName = "ARRAY";
        displayName = CSTRING(GroupColorConfigurationsGroups_displayName);
        description = CSTRING(GroupColorConfigurationsGroups_description);
    };
    class GVAR(GroupColorConfigurationsGroupIndex) {
        value[] = {};
        typeName = "ARRAY";
        displayName = CSTRING(GroupColorConfigurationsGroupIndex_displayName);
        description = CSTRING(GroupColorConfigurationsGroupIndex_description);
    };
};
