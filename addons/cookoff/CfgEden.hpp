
class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class GVAR(enable) {
                        property = QGVAR(enable);
                        control = "Checkbox";
                        displayName = CSTRING(enable_name);
                        tooltip = CSTRING(enable_tooltip);
                        expression = QUOTE(if !(_value) then {_this setVariable [ARR_3('%s',_value,true)];};);
                        typeName = "BOOL";
                        condition = "objectVehicle";
                        defaultValue = "(true)"; // fix pbo project preprocessing bug
                    };
                    class GVAR(enableAmmoCookoff) {
                        property = QGVAR(enableAmmoCookoff);
                        control = "Checkbox";
                        displayName = CSTRING(enableAmmoCookoff_name);
                        tooltip = CSTRING(enableAmmoCookoff_tooltip);
                        expression = QUOTE(if !(_value) then {_this setVariable [ARR_3('%s',_value,true)];};);
                        typeName = "BOOL";
                        condition = "objectHasInventoryCargo";
                        defaultValue = "(true)"; // fix pbo project preprocessing bug
                    };
                };
            };
        };
    };
};
