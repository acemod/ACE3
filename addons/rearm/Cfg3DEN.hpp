#define GET_NUMBER(config,default) (if (isNumber (config)) then {getNumber (config)} else {default})
#define DEFAULT_REARMCARGO GET_NUMBER(configFile >> 'CfgVehicles' >> typeOf _this >> QQGVAR(defaultSupply),-1)


class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class GVAR(rearmCargo) {
                        displayName = CSTRING(rearmCargo_edenName);
                        tooltip = CSTRING(rearmCargo_edenDesc);
                        property = QGVAR(rearmCargo);
                        control = "EditShort";
                        expression = QUOTE(if (_value != DEFAULT_REARMCARGO) then {[ARR_2(_this,_value)] call DFUNC(makeSource)});
                        defaultValue = QUOTE(DEFAULT_REARMCARGO);
                        validate = "number";
                        condition = "(1-objectBrain)*(1-objectAgent)";
                        typeName = "NUMBER";
                    };
                };
            };
        };
    };
};
