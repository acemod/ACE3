class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class GVAR(overPressureDistanceSetting) {
                        displayName = CSTRING(distanceCoefficient_displayName);
                        tooltip = CSTRING(distanceCoefficient_toolTip);
                        property = QUOTE(overpressureDistanceCoefficient);
                        control = "Edit";
                        expression = QUOTE(if (_value >= 0) then { _this setVariable [ARR_3(QQGVAR(distance),_value,true)] });
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
