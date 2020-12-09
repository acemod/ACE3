class ACE_Head {
    displayName = ECSTRING(interaction,Head);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_2(_target,0)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_3(_target,0,_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
};
class ACE_Torso {
    displayName = ECSTRING(interaction,Torso);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_2(_target,1)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_3(_target,1,_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
    class TriageCard {
        displayName = CSTRING(Actions_TriageCard);
        exceptions[] = {"isNotInside", "isNotSitting"};
        condition = "true";
        statement = QUOTE(_target call FUNC(displayTriageCard));
        icon = QPATHTOF(ui\triage_card.paa);
    };
};
class ACE_ArmLeft {
    displayName = ECSTRING(interaction,ArmLeft);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_2(_target,2)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_3(_target,2,_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
};
class ACE_ArmRight {
    displayName = ECSTRING(interaction,ArmRight);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_2(_target,3)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_3(_target,3,_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
};
class ACE_LegLeft {
    displayName = ECSTRING(interaction,LegLeft);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_2(_target,4)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_3(_target,4,_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
};
class ACE_LegRight {
    displayName = ECSTRING(interaction,LegRight);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_2(_target,5)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_3(_target,5,_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
};
