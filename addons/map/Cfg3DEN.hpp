
class Cfg3DEN {
    class Group {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class GVAR(hideBlueForceMarker) {
                        property = QGVAR(hideBlueForceMarker);
                        control = "Checkbox";
                        displayName = CSTRING(disableBFT);
                        tooltip = CSTRING(disableBFT_description);
                        expression = QUOTE(if (_value) then {_this setVariable [ARR_3('%s',_value,true)];};);
                        typeName = "BOOL";
                        defaultValue = "(false)"; // fix pbo project preprocessing bug
                    };
                };
            };
        };
    };
};
