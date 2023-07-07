class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class XGVAR(blacklist) {
                        displayName = CSTRING(BlacklistEden);
                        tooltip = CSTRING(BlacklistEdenDesc);
                        property = QXGVAR(blacklist);
                        control = "Checkbox";
                        condition = "objectControllable";
                        expression = QUOTE(_this setVariable [ARR_3(QQXGVAR(blacklist), _value, true)]);
                        defaultValue = "(false)";
                    };
                };
            };
        };
    };
    class Group {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class XGVAR(blacklist) {
                        displayName = CSTRING(BlacklistEden);
                        tooltip = CSTRING(BlacklistEdenDesc);
                        property = QXGVAR(blacklist);
                        control = "Checkbox";
                        expression = QUOTE(_this setVariable [ARR_3(QQXGVAR(blacklist), _value, true)]);
                        defaultValue = "(false)";
                    };
                };
            };
        };
    };
};
