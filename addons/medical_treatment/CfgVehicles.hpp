
#define MEDICAL_ACTION_DISTANCE 1.75

class CBA_Extended_EventHandlers;

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            #include "ACE_Medical_SelfActions.hpp"
        };

        class ACE_Actions {
            // Include actions in body parts for treatment while in the open
            #define EXCEPTIONS exceptions[] = {};
            #define ACTION_CONDITION condition = QUOTE(EGVAR(medical,menuTypeStyle) == 0);
            #include "ACE_Medical_Actions.hpp"

            // Create a consolidates medical menu for treatment while boarded
            class ACE_MainActions {
                class Medical {
                    displayName = ECSTRING(medical,Actions_Medical);
                    runOnHover = 1;
                    exceptions[] = {"isNotInside"};
                    condition = QUOTE((vehicle _target != _target && vehicle _target == vehicle _player) || EGVAR(medical,menuTypeStyle)== 1);
                    statement = QUOTE([ARR_3(_target, true, 0)] call DFUNC(displayPatientInformation));
                    icon = QPATHTOEF(medical,UI\icons\medical_cross.paa);

                    #undef EXCEPTIONS
                    #undef ACTION_CONDITION
                    #define EXCEPTIONS exceptions[] = {"isNotInside"};
                    #define ACTION_CONDITION condition = "true";
                    #include "ACE_Medical_Actions.hpp"
                };
                class GVAR(loadPatient) {
                    displayName = ECSTRING(medical,LoadPatient);
                    distance = 5;
                    condition = QUOTE(_target getVariable[ARR_2(QUOTE(QUOTE(ACE_isUnconscious)),false)] && vehicle _target == _target);
                    statement = QUOTE([ARR_2(_player, _target)] call DFUNC(actionLoadUnit));
                    showDisabled = 0;
                    priority = 2;
                    icon = QPATHTOEF(medical,UI\icons\medical_cross.paa);
                    exceptions[] = {"isNotDragging", "isNotCarrying"};
                };
                class GVAR(UnLoadPatient) {
                    displayName = ECSTRING(medical,UnloadPatient);
                    distance = 5;
                    condition = QUOTE(_target getVariable[ARR_2(QUOTE(QUOTE(ACE_isUnconscious)),false)] && vehicle _target != _target);
                    statement = QUOTE([ARR_2(_player, _target)] call DFUNC(actionUnloadUnit));
                    showDisabled = 0;
                    priority = 2;
                    icon = QPATHTOEF(medical,UI\icons\medical_cross.paa);
                    exceptions[] = {"isNotDragging", "isNotCarrying", "isNotInside"};
                };
            };
        };
    };
};
