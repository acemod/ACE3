class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_ApplyHandcuffs {
                displayName = CSTRING(SetCaptive);
                selection = "righthand";
                distance = 2;
                condition = QUOTE([ARR_2(_player, _target)] call FUNC(canApplyHandcuffs));
                statement = QUOTE([ARR_2(_player, _target)] call FUNC(doApplyHandcuffs));
                exceptions[] = {"isNotSwimming", "isNotInside"};
                icon = QPATHTOF(UI\handcuff_ca.paa);
            };

            class ACE_MainActions {
                class ACE_RemoveHandcuffs {
                    displayName = CSTRING(ReleaseCaptive);
                    selection = "righthand";
                    distance = 2;
                    condition = QUOTE([ARR_2(_player, _target)] call FUNC(canRemoveHandcuffs));
                    statement = QUOTE([ARR_2(_player, _target)] call FUNC(doRemoveHandcuffs));
                    exceptions[] = {"isNotSwimming", "isNotInside"};
                    icon = QPATHTOF(UI\handcuff_ca.paa);
                };
                class ACE_EscortCaptive {
                    displayName = CSTRING(EscortCaptive);
                    distance = 4;
                    condition = QUOTE([ARR_2(_player, _target)] call FUNC(canEscortCaptive));
                    statement = QUOTE([ARR_3(_player, _target, true)] call FUNC(doEscortCaptive));
                    exceptions[] = {"isNotSwimming"};
                    showDisabled = 0;
                    icon = QPATHTOF(UI\captive_ca.paa);
                    priority = 2.3;
                };
                class ACE_StopEscorting {
                    displayName = CSTRING(StopEscorting);
                    distance = 4;
                    condition = QUOTE([ARR_2(_player, _target)] call FUNC(canStopEscorting));
                    statement = QUOTE([ARR_3(_player,_target, false)] call FUNC(doEscortCaptive));
                    exceptions[] = {"isNotEscorting", "isNotSwimming"};
                    showDisabled = 0;
                    icon = QPATHTOF(UI\captive_ca.paa);
                    priority = 2.3;
                };
                class ACE_LoadCaptive {
                    displayName = CSTRING(LoadCaptive);
                    distance = 4;
                    condition = QUOTE([ARR_3(_player, _target, objNull)] call FUNC(canLoadCaptive));
                    statement = QUOTE([ARR_3(_player, _target, objNull)] call FUNC(doLoadCaptive));
                    exceptions[] = {"isNotEscorting", "isNotSwimming"};
                    showDisabled = 0;
                    icon = QPATHTOF(UI\captive_ca.paa);
                    priority = 2.2;
                    insertChildren = QUOTE(call DFUNC(addLoadCaptiveActions));
                };
                class GVAR(UnloadCaptive) {
                    displayName = CSTRING(UnloadCaptive);
                    distance = 4;
                    condition = QUOTE([ARR_2(_player, _target)] call FUNC(canUnloadCaptive));
                    statement = QUOTE([ARR_2(_player, _target)] call FUNC(doUnloadCaptive));
                    exceptions[] = {"isNotSwimming"};
                    priority = 1.2;
                };
            };
        };

        class ACE_SelfActions {
            class ACE_StopEscortingSelf {
                displayName = CSTRING(StopEscorting);
                condition = QUOTE([ARR_2(_player, objNull)] call FUNC(canStopEscorting));
                statement = QUOTE([ARR_3(_player,objNull, false)] call FUNC(doEscortCaptive));
                exceptions[] = {"isNotEscorting", "isNotSwimming"};
                showDisabled = 0;
                priority = 2.3;
            };
            class ACE_StartSurrenderingSelf {
                displayName = CSTRING(StartSurrendering);
                condition = QUOTE([ARR_2(_player, true)] call FUNC(canSurrender));
                statement = QUOTE([ARR_2(_player, true)] call FUNC(setSurrendered));
                exceptions[] = {"isNotSwimming"};
                showDisabled = 0;
                priority = 0;
                icon = QPATHTOF(UI\Surrender_ca.paa);
            };
            class ACE_StopSurrenderingSelf {
                displayName = CSTRING(StopSurrendering);
                condition = QUOTE([ARR_2(_player, false)] call FUNC(canSurrender));
                statement = QUOTE([ARR_2(_player, false)] call FUNC(setSurrendered));
                exceptions[] = {"isNotSurrendering", "isNotSwimming"};
                showDisabled = 0;
                priority = 0;
                icon = QPATHTOF(UI\Surrender_ca.paa);
            };
        };
    };

#define MACRO_LOADCAPTIVE \
        class ACE_Actions { \
            class ACE_MainActions { \
                class GVAR(LoadCaptive) { \
                    displayName = CSTRING(LoadCaptive); \
                    distance = 4; \
                    condition = QUOTE([ARR_3(_player, objNull, _target)] call FUNC(canLoadCaptive)); \
                    statement = QUOTE([ARR_3(_player, objNull, _target)] call FUNC(doLoadCaptive)); \
                    exceptions[] = {"isNotEscorting", "isNotSwimming"}; \
                    priority = 1.2; \
                }; \
            }; \
        };

    class LandVehicle;
    class Car: LandVehicle {
        MACRO_LOADCAPTIVE
    };
    class Tank: LandVehicle {
        MACRO_LOADCAPTIVE
    };

    class Air;
    class Helicopter: Air {
        MACRO_LOADCAPTIVE
    };
    class Plane: Air {
        MACRO_LOADCAPTIVE
    };

    class Ship;
    class Ship_F: Ship {
        MACRO_LOADCAPTIVE
    };

    class StaticWeapon: LandVehicle {
        MACRO_LOADCAPTIVE
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_CableTie,12);
        };
    };


    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {};
        class ModuleDescription {};
    };

    class GVAR(ModuleSurrender): Module_F {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(ModuleSurrender_DisplayName);
        function = QFUNC(moduleSurrender);
        scope = 1;  //show in editor
        isGlobal = 0; //run on server
        isTriggerActivated  = 1; //Wait for triggers
        icon = QPATHTOF(UI\Icon_Module_Make_Unit_Surrender_ca.paa);
        functionPriority = 0;
        class Arguments {};
        class ModuleDescription: ModuleDescription {
            description = CSTRING(ModuleSurrender_Description);
            sync[] = {"AnyAI"};
        };
    };
    class GVAR(ModuleHandcuffed): Module_F {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(ModuleHandcuffed_DisplayName);
        function = QFUNC(moduleHandcuffed);
        scope = 1;  //show in editor
        isGlobal = 0; //run on server
        isTriggerActivated  = 1; //Wait for triggers
        icon = QPATHTOF(UI\Icon_Module_Make_Unit_Handcuffed_ca.paa);
        functionPriority = 0;
        class Arguments {};
        class ModuleDescription: ModuleDescription {
            description = CSTRING(ModuleHandcuffed_Description);
            sync[] = {"AnyAI"};
        };
    };

    class ACE_Module: Module_F {};
    class GVAR(moduleSettings): ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(ModuleSettings_DisplayName);
        function = QFUNC(moduleSettings);
        scope = 1;
        icon = QPATHTOF(UI\Icon_Module_settings_ca.paa);
        isGlobal = 1;
        isSingular = 1;
        class Arguments {
            class allowHandcuffOwnSide {
                displayName = CSTRING(ModuleSettings_handcuffSide_name);
                description = CSTRING(ModuleSettings_handcuffSide_description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class allowSurrender {
                displayName = CSTRING(ModuleSettings_allowSurrender_name);
                description = CSTRING(ModuleSettings_allowSurrender_description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class requireSurrender {
                displayName = CSTRING(ModuleSettings_requireSurrender_name);
                description = CSTRING(ModuleSettings_requireSurrender_description);
                typeName = "NUMBER";
                class values {
                    class disable {
                        name = ECSTRING(common,No);
                        value = 0;
                    };
                    class Surrender  {
                        name = CSTRING(SurrenderOnly);
                        value = 1;
                        default = 1;
                    };
                    class SurrenderOrNoWeapon  {
                        name = CSTRING(SurrenderOrNoWeapon);
                        value = 2;
                    };
                };
            };
            class requireSurrenderAi {
                displayName = CSTRING(ModuleSettings_requireSurrenderAi_name);
                description = CSTRING(ModuleSettings_requireSurrenderAi_description);
                typeName = "BOOL";
                defaultValue = 0;
            };
        };
        class ModuleDescription: ModuleDescription {
            description = CSTRING(ModuleSettings_Description);
            sync[] = {};
        };
    };
};
