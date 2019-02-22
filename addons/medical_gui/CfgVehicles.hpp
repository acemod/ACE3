class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class Medical {
                displayName = CSTRING(Actions_Medical);
                runOnHover = 1;
                exceptions[] = {"isNotInside", "isNotSitting"};
                statement = QUOTE([ARR_2(_target,0)] call FUNC(displayPatientInformation));
                condition = QUOTE(GVAR(enableSelfActions));
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
            #define ACTION_CONDITION condition = QUOTE(GVAR(enableActions) == 0);
            #include "InteractionBodyParts.hpp"
            #undef ACTION_CONDITION
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
                    statement = QUOTE([ARR_2(_target,0)] call FUNC(displayPatientInformation));
                    condition = QUOTE(((vehicle _target != _target && vehicle _target == vehicle _player) || {GVAR(enableActions) == 1}));
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
