class ACE_Head {
    displayName = ECSTRING(interaction,Head);
    icon = QPATHTOEF(medical,UI\icons\medical_cross.paa);
    exceptions[] = {"isNotInside", "isNotSitting"};
    statement = QUOTE([ARR_3(_target,1,0)] call EFUNC(medical,displayPatientInformation));
    modifierFunction = QUOTE([ARR_4(_target,_player,0,_this select 3)] call FUNC(modifyAction));
    condition = "true";
    runOnHover = 1;
};
class ACE_Torso {
    displayName = ECSTRING(interaction,Torso);
    distance = 5.0;
    condition = "true";
    runOnHover = 1;
    exceptions[] = {"isNotInside", "isNotSitting"};
    statement = QUOTE([ARR_3(_target,1,1)] call EFUNC(medical,displayPatientInformation));
    modifierFunction = QUOTE([ARR_4(_target,_player,1,_this select 3)] call FUNC(modifyAction));
    showDisabled = 1;
    priority = 2;
    icon = QPATHTOEF(medical,UI\icons\medical_cross.paa);
};
class ACE_ArmLeft {
    displayName = ECSTRING(interaction,ArmLeft);
    runOnHover = 1;
    exceptions[] = {"isNotInside", "isNotSitting"};
    statement = QUOTE([ARR_3(_target,1,2)] call EFUNC(medical,displayPatientInformation));
    modifierFunction = QUOTE([ARR_4(_target,_player,2,_this select 3)] call FUNC(modifyAction));
    condition = "true";
    icon = QPATHTOEF(medical,UI\icons\medical_cross.paa);
};
class ACE_ArmRight {
    displayName = ECSTRING(interaction,ArmRight);
    runOnHover = 1;
    exceptions[] = {"isNotInside", "isNotSitting"};
    statement = QUOTE([ARR_3(_target,1,3)] call EFUNC(medical,displayPatientInformation));
    modifierFunction = QUOTE([ARR_4(_target,_player,3,_this select 3)] call FUNC(modifyAction));
    condition = "true";
    icon = QPATHTOEF(medical,UI\icons\medical_cross.paa);
};
class ACE_LegLeft {
    displayName = ECSTRING(interaction,LegLeft);
    runOnHover = 1;
    exceptions[] = {"isNotInside", "isNotSitting"};
    statement = QUOTE([ARR_3(_target,1,4)] call EFUNC(medical,displayPatientInformation));
    modifierFunction = QUOTE([ARR_4(_target,_player,4,_this select 3)] call FUNC(modifyAction));
    condition = "true";
    icon = QPATHTOEF(medical,UI\icons\medical_cross.paa);
};
class ACE_LegRight {
    displayName = ECSTRING(interaction,LegRight);
    runOnHover = 1;
    exceptions[] = {"isNotInside", "isNotSitting"};
    statement = QUOTE([ARR_3(_target,1,5)] call EFUNC(medical,displayPatientInformation));
    modifierFunction = QUOTE([ARR_4(_target,_player,5,_this select 3)] call FUNC(modifyAction));
    condition = "true";
    icon = QPATHTOEF(medical,UI\icons\medical_cross.paa);
};
