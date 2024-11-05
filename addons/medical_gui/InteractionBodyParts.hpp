class ACE_Head {
    displayName = ECSTRING(interaction,Head);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_2(_target,0)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_3(_target,""head"",_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
};
class ACE_Chest {
    displayName = ECSTRING(interaction,Chest);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_2(_target,2)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_3(_target,""chest"",_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
    class TriageCard {
        displayName = CSTRING(Actions_TriageCard);
        exceptions[] = {"isNotInside", "isNotSitting"};
        condition = "true";
        statement = QUOTE(_target call FUNC(displayTriageCard));
        icon = QPATHTOF(ui\triage_card.paa);
    };
};
class ACE_Torso {
    displayName = ECSTRING(interaction,Torso);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_2(_target,3)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_3(_target,""body"",_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
    class TriageCard {
        displayName = CSTRING(Actions_TriageCard);
        exceptions[] = {"isNotInside", "isNotSitting"};
        condition = "true";
        statement = QUOTE(_target call FUNC(displayTriageCard));
        icon = QPATHTOF(ui\triage_card.paa);
    };
};
class ACE_ArmUpperLeft {
    displayName = ECSTRING(interaction,ArmUpperLeft);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_2(_target,5)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_3(_target,""leftupperarm"",_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
};
class ACE_ArmLeft {
    displayName = ECSTRING(interaction,ArmLeft);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_2(_target,4)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_3(_target,""leftarm"",_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
};
class ACE_ArmUpperRight {
    displayName = ECSTRING(interaction,ArmUpperRight);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_2(_target,7)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_3(_target,""rightupperarm"",_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
};
class ACE_ArmRight {
    displayName = ECSTRING(interaction,ArmRight);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_2(_target,6)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_3(_target,""rightarm"",_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
};
class ACE_LegUpperLeft {
    displayName = ECSTRING(interaction,LegUpperLeft);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_2(_target,9)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_3(_target,""leftupperleg"",_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
};
class ACE_LegLeft {
    displayName = ECSTRING(interaction,LegLeft);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_2(_target,8)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_3(_target,""leftleg"",_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
};
class ACE_LegUpperRight {
    displayName = ECSTRING(interaction,LegUpperRight);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_2(_target,11)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_3(_target,""rightupperleg"",_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
};
class ACE_LegRight {
    displayName = ECSTRING(interaction,LegRight);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_2(_target,10)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_3(_target,""rightleg"",_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
};
