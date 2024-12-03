#define GET_1ST_ARRAY(config) (if (isArray (config)) then {getArray (config) select 0} else {[ARR_3(0,0,0)]})
#define DEFAULT_HOOKS GET_1ST_ARRAY(configOf _this >> QQGVAR(hooks))

class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class GVAR(fuelCargo) {
                        displayName = CSTRING(fuelCargo_edenName);
                        tooltip = CSTRING(fuelCargo_edenDesc);
                        property = QGVAR(fuelCargo);
                        control = "EditShort";
                        expression = QUOTE(if (_value != (_this call FUNC(getFuelCargo))) then {[ARR_2(_this,_value)] call FUNC(makeSource)});
                        defaultValue = QUOTE(_this call FUNC(getFuelCargo));
                        validate = "number";
                        condition = "(1-objectBrain)*(1-objectAgent)";
                        typeName = "NUMBER";
                    };
                    class GVAR(hooks) {
                        displayName = CSTRING(hooks_edenName);
                        tooltip = CSTRING(hooks_edenDesc);
                        property = QGVAR(hooks);
                        control = "EditXYZ";
                        expression = QUOTE(if (_value isNotEqualTo DEFAULT_HOOKS) then {_this setVariable [ARR_3('%s',[_value],true)]});
                        defaultValue = QUOTE(DEFAULT_HOOKS);
                        condition = "(1-objectBrain)*(1-objectAgent)";
                    };
                };
            };
        };
    };
};
