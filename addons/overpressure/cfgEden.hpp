class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class GVAR(overPressureDistanceSetting) {
                        property = QUOTE(overpressureDistanceCoefficient);
                        control = QGVAR(slider);
                        displayName = CSTRING(Overpressure_distanceCoefficient_displayName);
                        tooltip = CSTRING(Overpressure_distanceCoefficient_toolTip);
                        expression = QUOTE(if (_value >= 0.1) then {_this setVariable [ARR_3(QQEGVAR(overpressure,distance),_value,true)]}); // ace_overpressure_distance
                        typeName = "NUMBER";
                        condition = "objectVehicle";
                        defaultValue = 0;
                    };
                };
            };
        };
    };
};
