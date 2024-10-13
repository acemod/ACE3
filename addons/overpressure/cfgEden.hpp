class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class GVAR(overPressureDistanceSetting) {
                        displayName = LSTRING(Overpressure_distanceCoefficient_displayName);
                        tooltip = LSTRING(Overpressure_distanceCoefficient_toolTip);
                        property = QUOTE(overpressureDistanceCoefficient);
                        control = "Edit";
                        expression = QUOTE(_this setVariable [ARR_3(QQEGVAR(overpressure,distance),_value,true)]);
                        defaultValue = -1;
                        validate = "number";
                        typeName = "NUMBER";
                        condition = "objectVehicle";
                    };
                };
            };
        };
    };
};
