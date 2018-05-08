class ACE_Head {
    displayName = ECSTRING(interaction,Head);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\ui\icons\medical_cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_3(_target,1,0)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_4(_target,_player,0,_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
};
class ACE_Torso {
    displayName = ECSTRING(interaction,Torso);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\ui\icons\medical_cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_3(_target,1,1)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_4(_target,_player,1,_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
};
class ACE_ArmLeft {
    displayName = ECSTRING(interaction,ArmLeft);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\ui\icons\medical_cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_3(_target,1,2)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_4(_target,_player,2,_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
};
class ACE_ArmRight {
    displayName = ECSTRING(interaction,ArmRight);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\ui\icons\medical_cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_3(_target,1,3)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_4(_target,_player,3,_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
};
class ACE_LegLeft {
    displayName = ECSTRING(interaction,LegLeft);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\ui\icons\medical_cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_3(_target,1,4)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_4(_target,_player,4,_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
};
class ACE_LegRight {
    displayName = ECSTRING(interaction,LegRight);
    distance = MEDICAL_ACTION_DISTANCE;
    icon = QPATHTOF(ui\ui\icons\medical_cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    ACTION_CONDITION
    statement = QUOTE([ARR_3(_target,1,5)] call FUNC(displayPatientInformation));
    modifierFunction = QUOTE([ARR_4(_target,_player,5,_this select 3)] call FUNC(modifyAction));
    runOnHover = 1;
};
