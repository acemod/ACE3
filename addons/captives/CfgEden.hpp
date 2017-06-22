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
                        expression = QUOTE(if (_value) then {[ARR_3(objNull,[_this],true)] call FUNC(moduleHandcuffed)});
                        typeName = "BOOL";
                        condition = "objectBrain";
                        defaultValue = "(false)";
                    };
                    class ace_isSurrendered {
                        property = QUOTE(ace_isSurrendered);
                        control = "Checkbox";
                        displayName = CSTRING(ModuleSurrender_DisplayName);
                        tooltip = CSTRING(ModuleSurrender_Description);
                        expression = QUOTE(if (_value) then {[ARR_3(objNull,[_this],true)] call FUNC(moduleSurrender)});
                        typeName = "BOOL";
                        condition = "objectBrain";
                        defaultValue = "(false)";
                    };
                };
            };
        };
    };
};
