class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class GVAR(customName) {
                        displayName = CSTRING(customName_edenName);
                        tooltip = CSTRING(customName_edenDesc);
                        property = QGVAR(customName);
                        control = "Edit";

                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(customName), _value, true)];);
                        defaultValue = "''";

                        condition = "objectHasInventoryCargo - objectVehicle";
                        typeName = "STRING";
                    };
                    class GVAR(space) {
                        displayName = CSTRING(space_edenName);
                        tooltip = CSTRING(space_edenDesc);
                        property = QGVAR(space);
                        control = "Edit";

                        expression = QUOTE([ARR_2(_this,_value)] call DFUNC(setSpace););
                        defaultValue = QUOTE(GET_NUMBER(configOf _this >> QQGVAR(space),0));

                        validate = "number";
                        condition = "objectHasInventoryCargo";
                        typeName = "NUMBER";
                    };
                    class GVAR(size) {
                        displayName = CSTRING(size_edenName);
                        tooltip = CSTRING(size_edenDesc);
                        property = QGVAR(size);
                        control = "Edit";

                        // Expression only runs on the server, must handle actions for all machines and future JIPs (Why BI?!)
                        expression = QUOTE([ARR_2(_this,_value)] call DFUNC(setSize););
                        defaultValue = QUOTE(GET_NUMBER(configOf _this >> QQGVAR(size),-1));

                        validate = "number";
                        condition = "1-objectBrain";
                        typeName = "NUMBER";
                    };
                };
            };
        };
    };
};
