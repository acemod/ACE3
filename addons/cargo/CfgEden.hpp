#define GET_NUMBER(config,default) (if (isNumber (config)) then {getNumber (config)} else {default})

class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class GVAR(space) {
                        displayName = CSTRING(space_edenName);
                        tooltip = CSTRING(space_edenDesc);
                        property = QGVAR(space);
                        control = "Edit";

                        expression = QUOTE(_this setVariable [ARR_3('%s',_value,true)];);
                        defaultValue = QUOTE(GET_NUMBER(configFile >> 'CfgVehicles' >> typeOf _this >> QQGVAR(space),-1));

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
                        expression = QUOTE(_this setVariable [ARR_3('%s',_value,true)];);
                        defaultValue = QUOTE(GET_NUMBER(configFile >> 'CfgVehicles' >> typeOf _this >> QQGVAR(size),-1));

                        validate = "number";
                        condition = "objectSimulated-objectBrain";
                        typeName = "NUMBER";
                    };
                };
            };
        };
    };
};
