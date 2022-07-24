#define DEFAULT_IS_EOD (_this getUnitTrait 'explosiveSpecialist')

class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class ace_isEOD {
                        displayName = CSTRING(IsEOD_DisplayName);
                        tooltip = CSTRING(IsEOD_Description);
                        property = QUOTE(ace_isEOD);
                        control = "Checkbox";
                        expression = QUOTE(_this setVariable [ARR_3('ACE_isEOD',_value,true)]);
                        defaultValue = QUOTE(DEFAULT_IS_EOD);
                        condition = "objectBrain";
                        typeName = "BOOL";
                    };
                };
            };
        };
    };
};
