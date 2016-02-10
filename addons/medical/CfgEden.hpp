class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class ace_isMedic {
                        property = QUOTE(ace_isMedic);
                        value = 0;
                        control = "Combo";
                        displayName = CSTRING(AssignMedicRoles_role_DisplayName);
                        tooltip = CSTRING(Attributes_isMedic_Description);
                        expression = QUOTE(_this setVariable [ARR_2(QUOTE(QGVAR(medicClass)),_value)];);
                        typeName = "NUMBER";
                        condition = "objectBrain";
                        defaultValue = 0;
                        class values {
                            class none {name = CSTRING(AssignMedicRoles_role_none); value = 0; default = 1;};
                            class medic {name = CSTRING(AssignMedicRoles_role_medic); value = 1; default = 0;};
                            class doctor {name = CSTRING(AssignMedicRoles_role_doctor); value = 2; default = 0;};
                        };
                    };
                    class ace_isMedicalVehicle {
                        property = QUOTE(ace_isMedicalVehicle);
                        value = 0;
                        control = "CheckboxNumber";
                        displayName = CSTRING(AssignMedicVehicle_enabled_DisplayName)
                        tooltip = CSTRING(Attributes_isMedicalVehicle_Description)
                        expression = QUOTE(_this setVariable [ARR_2(QUOTE(QGVAR(medicClass)),_value)];);
                        typeName = "NUMBER";
                        condition = "objectVehicle";
                        defaultValue = 0;
                    };
                    class ace_isMedicalFacility {
                        property = QUOTE(ace_isMedicalFacility);
                        value = 0;
                        control = "Checkbox";
                        displayName = CSTRING(AssignMedicalFacility_enabled_DisplayName)
                        tooltip = CSTRING(AssignMedicalFacility_enabled_Description)
                        expression = QUOTE(_this setVariable [ARR_2(QUOTE(QGVAR(isMedicalFacility)),_value)];);
                        typeName = "BOOL";
                        condition = "(1 - objectBrain) * (1 - objectVehicle)";
                        defaultValue = "false";
                    };
                };
            };
        };
    };
};
