class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class GVAR(stencilVehicle) {
                        property = QGVAR(stencilVehicle);
                        control = "Edit";
                        displayName = CSTRING(stencilVehicle);
                        tooltip = CSTRING(stencilVehicle_tooltip);
                        expression = QUOTE([ARR_2(_this,_value)] call FUNC(stencilVehicle));
                        condition = "objectVehicle";
                        defaultValue = "''";
                        typeName = "STRING";
                    };
                };
            };
        };
    };
};
