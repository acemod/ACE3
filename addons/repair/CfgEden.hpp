class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class StateSpecial {
                class Attributes {
                    class ACE_IsEngineer {
                        property = QUOTE(ACE_IsEngineer);
                        value = 0;
                        control = "Combo";
                        displayName = CSTRING(AssignEngineerRole_role_DisplayName);
                        tooltip = CSTRING(AssignEngineerRole_role_Description);
                        expression = "_this setVariable ['%s',_value];";
                        typeName = "NUMBER";
                        condition = "objectBrain";
                        defaultValue = 0;
                        class values {
                            class none {name = CSTRING(AssignEngineerRole_role_none); value = 0; default = 1;};
                            class engineer {name = CSTRING(AssignEngineerRole_role_engineer); value = 1; default = 0;};
                            class specialist {name = CSTRING(AssignEngineerRole_role_specialist); value = 2; default = 0;};
                        };
                    };
                    class ACE_isRepairVehicle {
                        property = QUOTE(ACE_isRepairVehicle);
                        value = 0;
                        control = "CheckboxNumber";
                        displayName = CSTRING(AssignRepairVehicle_role_DisplayName)
                        tooltip = CSTRING(AssignRepairVehicle_role_Description)
                        expression = "_this setVariable ['%s',_value];";
                        typeName = "NUMBER";
                        condition = "objectVehicle";
                        defaultValue = 0;
                    };
                    class ACE_isRepairFacility {
                        property = QUOTE(ACE_isRepairFacility);
                        value = 0;
                        control = "CheckboxNumber";
                        displayName = CSTRING(AssignRepairFacility_role_DisplayName)
                        tooltip = CSTRING(AssignRepairFacility_role_Description)
                        expression = "_this setVariable ['%s',_value];";
                        typeName = "NUMBER";
                        condition = "(1 - objectBrain) * (1 - objectVehicle)";
                        defaultValue = 0;
                    };
                };
            };
        };
    };
};
