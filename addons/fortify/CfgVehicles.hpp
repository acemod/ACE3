class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ADDON {
                displayName = CSTRING(Fortify);
                condition = QUOTE([_player] call FUNC(canFortify));
                modifierFunction = QUOTE(call FUNC(modifyAction));
                insertChildren = QUOTE(_this call FUNC(addActions));
                statement = "";
                exceptions[] = {};
                showDisabled = 0;
                priority = 1;
            };
        };
    };
    class Logic;
    class Module_F: Logic {
        class AttributesBase {
            class Default;
            class Combo;
            class Edit;
            class Checkbox;
            class ModuleDescription;
        };
        class ModuleDescription;
    };
    class ACE_Module: Module_F {};
    class XGVAR(setupModule): ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACEX";
        displayName = CSTRING(Fortify);
        function = QFUNC(setupModule);
        scope = 2;
        isGlobal = 0;
        class Attributes: AttributesBase {
            class Side: Combo {
                displayName = "$STR_eval_typeside";
                property = QGVAR(setupModule_Side);
                typeName = "NUMBER";
                defaultValue = 1;
                class values {
                    class West {
                        name = "$STR_WEST";
                        value = 1;
                    };
                    class East {
                        name = "$STR_east";
                        value = 2;
                    };
                    class Indp {
                        name = "$STR_guerrila";
                        value = 3;
                    };
                    class Civ {
                        name = "$STR_civilian";
                        value = 4;
                    };
                };
            };
            class Preset: Default {
                displayName = "$STR_controls_presets";
                property = QGVAR(setupModule_Preset);
                control = QGVAR(presetSelection);
                typeName = "STRING";
                defaultValue = 0;
            };
            class Budget: Edit {
                property = QGVAR(setupModule_Budget);
                displayName = CSTRING(budget);
                typeName = "NUMBER";
                defaultValue = -1;
            };
            class AddToolItem: Checkbox {
                property = QGVAR(setupModule_AddToolItem);
                displayName = CSTRING(addToolItem);
                typeName = "BOOL";
            };
            class ModuleDescription: ModuleDescription {};
        };

        class ModuleDescription: ModuleDescription {
            description = CSTRING(moduleDescription);
        };
    };

    class XGVAR(buildLocationModule): ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACEX";
        displayName = CSTRING(buildLocationModule);
        scope = 2;
        isGlobal = 1;
        canSetArea = 1;
        function = QFUNC(buildLocationModule);
        class AttributeValues {
            size3[] = {300, 300, -1};
            IsRectangle = 1;
        };
    };

};
