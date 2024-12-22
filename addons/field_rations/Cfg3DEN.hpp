#define GET_NUMBER(config,default) (if (isNumber (config)) then {getNumber (config)} else {default})
#define DEFAULT_WATER_SUPPLY GET_NUMBER(configFile >> 'CfgVehicles' >> typeOf _this >> QQXGVAR(waterSupply),REFILL_WATER_DISABLED)

class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class XGVAR(waterSupply) {
                        displayName = CSTRING(WaterSupply_3DEN_DisplayName);
                        tooltip = CSTRING(WaterSupply_3DEN_Description);
                        property = QXGVAR(waterSupply);
                        control = "EditShort";
                        expression = QUOTE(if (_value != DEFAULT_WATER_SUPPLY) then {_this setVariable [ARR_3(QQGVAR(currentWaterSupply),_value,true)]});
                        defaultValue = QUOTE(DEFAULT_WATER_SUPPLY);
                        validate = "NUMBER";
                        condition = "(1 - objectBrain) * (1 - objectAgent)";
                        typeName = "NUMBER";
                    };
                };
            };
        };
    };
};
