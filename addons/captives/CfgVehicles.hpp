class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {

            class ACE_ApplyHandcuffs {
                displayName = "$STR_ACE_Captives_SetCaptive";
                selection = "righthand";
                distance = 2;
                condition = QUOTE([ARR_2(_player, _target)] call FUNC(canApplyHandcuffs));
                statement = QUOTE([ARR_2(_player, _target)] call FUNC(doApplyHandcuffs));
                exceptions[] = {};
                icon = QUOTE(PATHTOF(UI\handcuff_ca.paa));
            };
            class ACE_RemoveHandcuffs {
                displayName = "$STR_ACE_Captives_ReleaseCaptive";
                selection = "righthand";
                distance = 2;
                condition = QUOTE([ARR_2(_player, _target)] call FUNC(canRemoveHandcuffs));
                statement = QUOTE([ARR_2(_player, _target)] call FUNC(doRemoveHandcuffs));
                exceptions[] = {};
                icon = QUOTE(PATHTOF(UI\handcuff_ca.paa));
            };

            class ACE_MainActions {
                class ACE_EscortCaptive {
                    displayName = "$STR_ACE_Captives_EscortCaptive";
                    distance = 4;
                    condition = QUOTE([ARR_2(_player, _target)] call FUNC(canEscortCaptive));
                    statement = QUOTE([ARR_3(_player, _target, true)] call FUNC(doEscortCaptive));
                    exceptions[] = {};
                    showDisabled = 0;
                    icon = QUOTE(PATHTOF(UI\captive_ca.paa));
                    priority = 2.3;
                    hotkey = "E";
                };
                class ACE_StopEscorting {
                    displayName = "$STR_ACE_Captives_StopEscorting";
                    distance = 4;
                    condition = QUOTE([ARR_2(_player, _target)] call FUNC(canStopEscorting));
                    statement = QUOTE([ARR_3(_player,_target, false)] call FUNC(doEscortCaptive));
                    exceptions[] = {"isNotEscorting"};
                    showDisabled = 0;
                    icon = QUOTE(PATHTOF(UI\captive_ca.paa));
                    priority = 2.3;
                    hotkey = "E";
                };
                class ACE_LoadCaptive {
                    displayName = "$STR_ACE_Captives_LoadCaptive";
                    distance = 4;
                    condition = QUOTE([ARR_3(_player, _target, objNull)] call FUNC(canLoadCaptive));
                    statement = QUOTE([ARR_3(_player, _target, objNull)] call FUNC(doLoadCaptive));
                    exceptions[] = {"isNotEscorting"};
                    showDisabled = 0;
                    icon = QUOTE(PATHTOF(UI\captive_ca.paa));
                    priority = 2.2;
                    hotkey = "L";
                };
                class ACE_FriskPerson {
                    displayName = "$STR_ACE_Captives_FriskPerson";
                    distance = 2;
                    condition = QUOTE([ARR_2(_player, _target)] call FUNC(canFriskPerson));
                    statement = QUOTE([ARR_2(_player, _target)] call FUNC(doFriskPerson));
                    showDisabled = 0;
                    //icon = "";  //@todo
                    priority = 3;
                    hotkey = "F";
                };
            };
        };

        class ACE_SelfActions {
            class ACE_StopEscortingSelf {
                displayName = "$STR_ACE_Captives_StopEscorting";
                condition = QUOTE([ARR_2(_player, objNull)] call FUNC(canStopEscorting));
                statement = QUOTE([ARR_3(_player,objNull, false)] call FUNC(doEscortCaptive));
                exceptions[] = {"isNotEscorting"};
                showDisabled = 0;
                priority = 2.3;
                hotkey = "C";
            };
            class ACE_StartSurrenderingSelf {
                displayName = "$STR_ACE_Captives_StartSurrendering";
                condition = QUOTE([ARR_2(_player, true)] call FUNC(canSurrender));
                statement = QUOTE([ARR_2(_player, true)] call FUNC(setSurrendered));
                exceptions[] = {};
                showDisabled = 0;
                priority = 0;
            };
            class ACE_StopSurrenderingSelf {
                displayName = "$STR_ACE_Captives_StopSurrendering";
                condition = QUOTE([ARR_2(_player, false)] call FUNC(canSurrender));
                statement = QUOTE([ARR_2(_player, false)] call FUNC(setSurrendered));
                exceptions[] = {"isNotSurrendering"};
                showDisabled = 0;
                priority = 0;
            };
        };
    };

#define MACRO_LOADUNLOADCAPTIVE \
        class ACE_Actions { \
            class ACE_MainActions { \
                class GVAR(LoadCaptive) { \
                    displayName = "$STR_ACE_Captives_LoadCaptive"; \
                    distance = 4; \
                    condition = QUOTE([ARR_3(_player, objNull, _target)] call FUNC(canLoadCaptive)); \
                    statement = QUOTE([ARR_3(_player, objNull, _target)] call FUNC(doLoadCaptive)); \
                    exceptions[] = {"isNotEscorting"}; \
                    priority = 1.2; \
                }; \
                class GVAR(UnloadCaptive) { \
                    displayName = "$STR_ACE_Captives_UnloadCaptive"; \
                    distance = 4; \
                    condition = QUOTE([ARR_2(_player, _target)] call FUNC(canUnloadCaptive)); \
                    statement = QUOTE([ARR_2(_player, _target)] call FUNC(doUnloadCaptive)); \
                    priority = 1.2; \
                }; \
            }; \
        };

    class LandVehicle;
    class Car: LandVehicle {
        MACRO_LOADUNLOADCAPTIVE
    };
    class Tank: LandVehicle {
        MACRO_LOADUNLOADCAPTIVE
    };

    class Air;
    class Helicopter: Air {
        MACRO_LOADUNLOADCAPTIVE
    };
    class Plane: Air {
        MACRO_LOADUNLOADCAPTIVE
    };

    class Ship;
    class Ship_F: Ship {
        MACRO_LOADUNLOADCAPTIVE
    };

    class StaticWeapon: LandVehicle {
        MACRO_LOADUNLOADCAPTIVE
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
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "$STR_ACE_Captives_ModuleSurrender_DisplayName"; //Make Unit Surrender
        function = QFUNC(moduleSurrender);
        scope = 2;  //show in editor
        isGlobal = 1; //run global
        isTriggerActivated  = 1; //Wait for triggers
        icon = QUOTE(PATHTOF(UI\Icon_Module_Make_Unit_Surrender_ca.paa));
        functionPriority = 0;
        class Arguments {};
        class ModuleDescription: ModuleDescription {
            description = "$STR_ACE_Captives_ModuleSurrender_Description"; //Sync a unit to make them surrender.<br/>Source: ace_captives
            sync[] = {"AnyAI"};
        };
    };

    class ACE_Module: Module_F {};
    class GVAR(moduleSettings): ACE_Module {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "$STR_ACE_Captives_ModuleSettings_DisplayName";
        function = QFUNC(moduleSettings);
        scope = 2;
        icon = QUOTE(PATHTOF(UI\Icon_Module_Make_Unit_Surrender_ca.paa));
        isGlobal = 1;
        class Arguments {
            class allowHandcuffOwnSide {
                displayName = "$STR_ACE_Captives_ModuleSettings_handcuffSide_name";
                description = "$STR_ACE_Captives_ModuleSettings_handcuffSide_description";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class allowSurrender {
                displayName = "$STR_ACE_Captives_ModuleSettings_allowSurrender_name";
                description = "$STR_ACE_Captives_ModuleSettings_allowSurrender_description";
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription: ModuleDescription {
            description = "$STR_ACE_Captives_ModuleSettings_Description";
            sync[] = {};
        };
    };
};
