class CfgVehicles {
    class AllVehicles;
    class Air: AllVehicles {
        class Attributes {
            class GVAR(enabled) {
                displayName = CSTRING(Attribute_Enabled_DisplayName);
                tooltip = CSTRING(Attribute_Enabled_Tooltip);
                property = QGVAR(enabled);
                control = "Checkbox";
                typeName = "BOOL";
                expression = QUOTE(_this setVariable [ARR_3(QQGVAR(enabled),_value,true)]);
                defaultValue = "true";
                condition = "objectVehicle";
            };
        };
    };
};
