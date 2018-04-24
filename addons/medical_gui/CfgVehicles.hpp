
class CfgVehicles {

    class ACE_Module;
    class ACE_moduleMedicalMenuSettings: ACE_Module {
        scope = 1;
        displayName = CSTRING(module_DisplayName);
        icon = QPATHTOEF(medical,UI\Icon_Module_Medical_ca.paa);
        category = "ACE_medical";
        function = QUOTE(DFUNC(module));
        functionPriority = 1;
        isGlobal = 1;
        isSingular = 1;
        isTriggerActivated = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class allow {
                displayName = CSTRING(allow);
                description = CSTRING(allow_Descr);
                typeName = "NUMBER";
                class values {
                    class disable {
                        name = ECSTRING(common,Disabled);
                        value = 0;
                    };
                    class enable  {
                        name = ECSTRING(common,Enabled);
                        value = 1;
                        default = 1;
                    };
                    class VehiclesOnly  {
                        name = ECSTRING(common,VehiclesOnly);
                        value = 2;
                    };
                };
            };
        };
        class ModuleDescription {
            description = CSTRING(module_Desc);
            sync[] = {};
        };
    };

    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class Medical {
                displayName = CSTRING(Actions_Medical);
                runOnHover = 1;
                exceptions[] = {"isNotInside", "isNotSitting"};
                statement = QUOTE([ARR_3(_target,1,0)] call FUNC(displayPatientInformation));
                condition = "true";
                icon = QPATHTOF(data\icons\interact\b1.paa);
                #define ACTION_CONDITION condition = "true";
                #include "InteractionBodyParts.hpp"
                #undef ACTION_CONDITION
            };
            class ACE_Medical_Menu {
                displayName = CSTRING(OpenMenu);
                runOnHover = 0;
                exceptions[] = {"isNotInside", "isNotSwimming"};
                condition = QUOTE([ARR_2(ACE_player,_target)] call FUNC(canOpenMenu));
                statement = QUOTE([_target] call DFUNC(openMenu));
                icon = QPATHTOF(data\icons\interact\b1.paa);
            };
        };

        class ACE_Actions {
            #define ACTION_CONDITION condition = QUOTE((EGVAR(medical,menuTypeStyle) == 0));
            #include "InteractionBodyParts.hpp"
            #undef ACTION_CONDITION
            // Create a consolidates medical menu for treatment while boarded
            class ACE_MainActions {
                class ACE_Medical_Menu {
                    displayName = CSTRING(OpenMenu);
                    runOnHover = 0;
                    exceptions[] = {"isNotInside", "isNotSwimming"};
                    condition = QUOTE([ARR_2(ACE_player,_target)] call FUNC(canOpenMenu));
                    statement = QUOTE([_target] call DFUNC(openMenu));
                    icon = QPATHTOF(data\icons\interact\b1.paa);
                };
                class ACE_Medical_Radial {
                    displayName = CSTRING(Actions_Medical);
                    runOnHover = 1;
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    statement = QUOTE([ARR_3(_target,1,0)] call FUNC(displayPatientInformation));
                    condition = QUOTE(((vehicle _target != _target && vehicle _target == vehicle _player) || {EGVAR(medical,menuTypeStyle) == 1}));
                    icon = QPATHTOF(data\icons\interact\b1.paa);
                    #define ACTION_CONDITION condition = "true";
                    #include "InteractionBodyParts.hpp"
                    #undef ACTION_CONDITION
                };
                class  ACE_Medical_loadPatient {
                    displayName = CSTRING(LoadPatient);
                    condition = "(_target getVariable ['ACE_isUnconscious', false]) && {alive _target} && {vehicle _target == _target}";
                    statement = QUOTE([ARR_2(_player, _target)] call EFUNC(medical_treatment,actionLoadUnit));
                    icon = QPATHTOF(data\icons\interact\b1.paa);
                    exceptions[] = {"isNotDragging", "isNotCarrying"};
                    insertChildren = QUOTE(call DEFUNC(medical_treatment,addLoadPatientActions));
                };
                class ACE_Medical_UnLoadPatient {
                    displayName = CSTRING(UnloadPatient);
                    condition = "(_target getVariable ['ACE_isUnconscious', false]) && {vehicle _target != _target} && {vehicle _player == _player}";
                    statement = QUOTE([ARR_2(_player, _target)] call EFUNC(medical_treatment,actionUnloadUnit));
                    icon = QPATHTOF(data\icons\interact\b1.paa);
                    exceptions[] = {"isNotDragging", "isNotCarrying", "isNotInside"};
                };
            };
        };
    };
};
