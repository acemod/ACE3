class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Medical {
                displayName = CSTRING(Medical);
                condition = QGVAR(enableSelfActions);
                exceptions[] = {"isNotInside", "isNotSitting", "isNotSwimming"};
                statement = QUOTE([ARR_2(_target,-1)] call FUNC(displayPatientInformation));
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
                modifierFunction = QUOTE(call FUNC(modifyActionTriageLevel));
            };
        };
        class ACE_Actions {
            #define ACTION_CONDITION condition = QUOTE(GVAR(enableActions) == 0);
            #include "InteractionBodyParts.hpp"
            #undef ACTION_CONDITION
            class ACE_MainActions {
                modifierFunction = QUOTE(call FUNC(modifyActionTriageLevel));
                class ACE_Medical_Menu {
                    displayName = CSTRING(MedicalMenu);
                    condition = QUOTE([ARR_2(ACE_player,_target)] call FUNC(canOpenMenu));
                    exceptions[] = {"isNotInside", "isNotSwimming"};
                    statement = QUOTE(_target call FUNC(openMenu));
                    icon = QPATHTOF(ui\cross.paa);
                    modifierFunction = QUOTE(call FUNC(modifyActionTriageLevel));
                };
                class ACE_Medical_Radial {
                    displayName = CSTRING(Medical);
                    condition = QUOTE((GVAR(enableActions) == 1 || {GVAR(enableActions) != 2 && {!isNull objectParent _target && {objectParent _target isEqualTo objectParent _player}}}));
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    statement = QUOTE([ARR_2(_target,-1)] call FUNC(displayPatientInformation));
                    runOnHover = 1;
                    icon = QPATHTOF(ui\cross.paa);
                    #define ACTION_CONDITION condition = "true";
                    #include "InteractionBodyParts.hpp"
                    #undef ACTION_CONDITION
                };
                class ACE_LoadPatient {
                    displayName = CSTRING(LoadPatient);
                    condition = QUOTE(!(_target call EFUNC(common,isAwake)) && {isNull objectParent _target} && {(_target call EFUNC(common,nearestVehiclesFreeSeat)) isNotEqualTo []});
                    exceptions[] = {"isNotDragging", "isNotCarrying", "isNotSwimming"};
                    statement = QUOTE([ARR_2(_player,_target)] call EFUNC(medical_treatment,loadUnit));
                    icon = QPATHTOF(ui\cross.paa);
                    insertChildren = QUOTE(call DEFUNC(medical_treatment,addLoadPatientActions));
                };
                class ACE_UnloadPatient {
                    displayName = CSTRING(UnloadPatient);
                    condition = QUOTE([ARR_2(_player,_target)] call EFUNC(medical_treatment,canUnloadUnit));
                    exceptions[] = {"isNotDragging", "isNotCarrying", "isNotInside"};
                    statement = QUOTE([ARR_2(_player,_target)] call EFUNC(medical_treatment,unloadUnit));
                    icon = QPATHTOF(ui\cross.paa);
                };
            };
        };
    };
};
