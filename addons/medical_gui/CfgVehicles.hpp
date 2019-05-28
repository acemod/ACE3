class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Medical {
                displayName = CSTRING(Medical);
                condition = QGVAR(enableSelfActions);
                exceptions[] = {"isNotInside", "isNotSitting"};
                statement = QUOTE([ARR_2(_target,0)] call FUNC(displayPatientInformation));
                runOnHover = 1;
                icon = QPATHTOF(ui\cross.paa);
                #define ACTION_CONDITION condition = "true";
                #include "InteractionBodyParts.hpp"
                #undef ACTION_CONDITION
            };
            class ACE_Medical_Menu {
                displayName = CSTRING(MedicalMenu);
                condition = QUOTE([ARR_2(_player,_target)] call FUNC(canOpenMenu));
                exceptions[] = {"isNotInside", "isNotSwimming"};
                statement = QUOTE(_target call FUNC(openMenu));
                icon = QPATHTOF(ui\cross.paa);
            };
        };
        class ACE_Actions {
            #define ACTION_CONDITION condition = QUOTE(GVAR(enableActions) == 0);
            #include "InteractionBodyParts.hpp"
            #undef ACTION_CONDITION
            class ACE_MainActions {
                class ACE_Medical_Menu {
                    displayName = CSTRING(MedicalMenu);
                    condition = QUOTE([ARR_2(ACE_player,_target)] call FUNC(canOpenMenu));
                    exceptions[] = {"isNotInside", "isNotSwimming"};
                    statement = QUOTE(_target call FUNC(openMenu));
                    icon = QPATHTOF(ui\cross.paa);
                };
                class ACE_Medical_Radial {
                    displayName = CSTRING(Medical);
                    condition = QUOTE((GVAR(enableActions) == 1 || {GVAR(enableActions) != 2 && {vehicle _target != _target && {vehicle _target == vehicle _player}}}));
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    statement = QUOTE([ARR_2(_target,0)] call FUNC(displayPatientInformation));
                    runOnHover = 1;
                    icon = QPATHTOF(ui\cross.paa);
                    #define ACTION_CONDITION condition = "true";
                    #include "InteractionBodyParts.hpp"
                    #undef ACTION_CONDITION
                };
                class ACE_LoadPatient {
                    displayName = CSTRING(LoadPatient);
                    condition = QUOTE(_target getVariable [ARR_2('ACE_isUnconscious',false)] && {alive _target} && {vehicle _target == _target});
                    exceptions[] = {"isNotDragging", "isNotCarrying"};
                    statement = QUOTE([ARR_2(_player, _target)] call EFUNC(medical_treatment,loadUnit));
                    icon = QPATHTOF(ui\cross.paa);
                    insertChildren = QUOTE(call DEFUNC(medical_treatment,addLoadPatientActions));
                };
                class ACE_UnloadPatient {
                    displayName = CSTRING(UnloadPatient);
                    condition = QUOTE(_target getVariable [ARR_2('ACE_isUnconscious',false)] && {vehicle _target != _target} && {vehicle _player == _player});
                    exceptions[] = {"isNotDragging", "isNotCarrying", "isNotInside"};
                    statement = QUOTE([ARR_2(_player, _target)] call EFUNC(medical_treatment,unloadUnit));
                    icon = QPATHTOF(ui\cross.paa);
                };
            };
        };
    };
};
