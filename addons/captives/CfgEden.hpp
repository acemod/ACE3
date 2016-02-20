class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class ace_isHandcuffed {
                        property = QUOTE(ace_isHandcuffed);
                        control = "Checkbox";
                        displayName = CSTRING(ModuleHandcuffed_DisplayName);
                        tooltip = CSTRING(ModuleHandcuffed_Description);
                        expression = QUOTE([ARR_2(_this,_value)]call FUNC(setHandcuffed));
                        typeName = "BOOL";
                        condition = "objectBrain";
                        defaultValue = false;
                    };
                    class ace_isSurrendered {
                        property = QUOTE(ace_isSurrendered);
                        control = "Checkbox";
                        displayName = CSTRING(ModuleSurrender_DisplayName);
                        tooltip = CSTRING(ModuleSurrender_Description);
                        expression = QUOTE([ARR_2(_this,_value)]call FUNC(setSurrendered));
                        typeName = "BOOL";
                        condition = "objectBrain";
                        defaultValue = false;
                    };
                };
            };
        };
    };
};
