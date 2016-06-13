
class ACE_Head {
    displayName = ECSTRING(medical,Head);
    runOnHover = 1;
    statement = QUOTE([ARR_3(_target, true, 0)] call DFUNC(displayPatientInformation));
    ACTION_CONDITION
    modifierFunction = QUOTE([ARR_4(_target,_player,0,_this select 3)] call FUNC(modifyMedicalAction));
    EXCEPTIONS
    icon = QPATHTOEF(medical,UI\icons\medical_cross.paa);
    distance = MEDICAL_ACTION_DISTANCE;
    class Bandage {
        displayName = ECSTRING(medical,Bandage);
        distance = 2.0;
        condition = QUOTE([ARR_4(_player, _target, 'head', 'Bandage')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'head', 'Bandage')] call DFUNC(treatment));
        EXCEPTIONS
        showDisabled = 1;
        priority = 2;
        icon = QPATHTOEF(medical,UI\icons\bandage.paa);
    };
    // Advanced medical
    class FieldDressing {
        displayName = ECSTRING(medical,Actions_FieldDressing);
        distance = 5.0;
        condition = QUOTE([ARR_4(_player, _target, 'head', 'FieldDressing')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'head', 'FieldDressing')] call DFUNC(treatment));
        EXCEPTIONS
        showDisabled = 0;
        priority = 2;
        icon = QPATHTOEF(medical,UI\icons\bandage.paa);
    };
    class PackingBandage: fieldDressing {
        displayName = ECSTRING(medical,Actions_PackingBandage);
        condition = QUOTE([ARR_4(_player, _target, 'head', 'PackingBandage')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'head', 'PackingBandage')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\packingBandage.paa);
    };
    class ElasticBandage: fieldDressing {
        displayName = ECSTRING(medical,Actions_ElasticBandage);
        condition = QUOTE([ARR_4(_player, _target, 'head', 'ElasticBandage')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'head', 'ElasticBandage')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\bandage.paa);
    };
    class QuikClot: fieldDressing {
        displayName = ECSTRING(medical,Actions_QuikClot);
        condition = QUOTE([ARR_4(_player, _target, 'head', 'QuikClot')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'head', 'QuikClot')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\bandage.paa);
    };
    class CheckPulse: fieldDressing {
        displayName = ECSTRING(medical,Actions_CheckPulse);
        condition = QUOTE([ARR_4(_player, _target, 'head', 'CheckPulse')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'head', 'CheckPulse')] call DFUNC(treatment));
        EXCEPTIONS
        icon = "";
    };
    class CheckBloodPressure: CheckPulse {
        displayName = ECSTRING(medical,Actions_CheckBloodPressure);
        condition = QUOTE([ARR_4(_player, _target, 'head', 'CheckBloodPressure')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'head', 'CheckBloodPressure')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class CheckResponse: CheckPulse {
        displayName = ECSTRING(medical,Check_Response);
        condition = QUOTE([ARR_4(_player, _target, 'head', 'CheckResponse')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'head', 'CheckResponse')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class Diagnose: CheckPulse {
        displayName = ECSTRING(medical,Actions_Diagnose);
        condition = QUOTE([ARR_4(_player, _target, 'head', 'Diagnose')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'head', 'Diagnose')] call DFUNC(treatment));
        EXCEPTIONS
    };
};
class ACE_Torso {
    displayName = ECSTRING(medical,Torso);
    runOnHover = 1;
    statement = QUOTE([ARR_3(_target, true, 1)] call DFUNC(displayPatientInformation));
    ACTION_CONDITION
    modifierFunction = QUOTE([ARR_4(_target,_player,1,_this select 3)] call FUNC(modifyMedicalAction));
    EXCEPTIONS
    icon = QPATHTOEF(medical,UI\icons\medical_cross.paa);
    distance = MEDICAL_ACTION_DISTANCE;
    class Bandage {
        displayName = ECSTRING(medical,Bandage);
        distance = 2.0;
        condition = QUOTE([ARR_4(_player, _target, 'body', 'Bandage')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'body', 'Bandage')] call DFUNC(treatment));
        EXCEPTIONS
        showDisabled = 1;
        priority = 2;
        enableInside = 1;
        icon = QPATHTOEF(medical,UI\icons\bandage.paa);
    };
    class PlaceInBodyBag {
        displayName = ECSTRING(medical,PlaceInBodyBag);
        distance = 2.0;
        condition = QUOTE([ARR_4(_player, _target, 'body', 'BodyBag')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'body', 'BodyBag')] call DFUNC(treatment));
        EXCEPTIONS
        showDisabled = 1;
        priority = 2;
        enableInside = 1;
    };
    class TriageCard {
        displayName = ECSTRING(medical,Actions_TriageCard);
        distance = 2.0;
        condition = "true";
        statement = QUOTE([ARR_2(_target, true)] call DFUNC(displayTriageCard));
        EXCEPTIONS
        showDisabled = 1;
        priority = 2;
        enableInside = 1;
        icon = QPATHTOEF(medical,UI\icons\triageCard.paa);
    };
    class Diagnose {
        displayName = ECSTRING(medical,Actions_Diagnose);
        distance = 5.0;
        condition = QUOTE([ARR_4(_player, _target, 'body', 'Diagnose')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'body', 'Diagnose')] call DFUNC(treatment));
        EXCEPTIONS
        showDisabled = 0;
        priority = 2;
        icon = "";
    };

    // Advanced medical
    class FieldDressing {
        displayName = ECSTRING(medical,Actions_FieldDressing);
        distance = 5.0;
        condition = QUOTE([ARR_4(_player, _target, 'body', 'FieldDressing')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'body', 'FieldDressing')] call DFUNC(treatment));
        EXCEPTIONS
        showDisabled = 0;
        priority = 2;
        enableInside = 1;
        icon = QPATHTOEF(medical,UI\icons\bandage.paa);
    };
    class PackingBandage: fieldDressing {
        displayName = ECSTRING(medical,Actions_PackingBandage);
        condition = QUOTE([ARR_4(_player, _target, 'body', 'PackingBandage')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'body', 'PackingBandage')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\packingBandage.paa);
    };
    class ElasticBandage: fieldDressing {
        displayName = ECSTRING(medical,Actions_ElasticBandage);
        condition = QUOTE([ARR_4(_player, _target, 'body', 'ElasticBandage')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'body', 'ElasticBandage')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\bandage.paa);
    };
    class QuikClot: fieldDressing {
        displayName = ECSTRING(medical,Actions_QuikClot);
        condition = QUOTE([ARR_4(_player, _target, 'body', 'QuikClot')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'body', 'QuikClot')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\bandage.paa);
    };
    class SurgicalKit: fieldDressing {
        displayName = ECSTRING(medical,Use_SurgicalKit);
        condition = QUOTE([ARR_4(_player, _target, 'body', 'SurgicalKit')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'body', 'SurgicalKit')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\surgicalKit.paa);
    };
    class PersonalAidKit: fieldDressing {
        displayName = ECSTRING(medical,Use_Aid_Kit);
        condition = QUOTE([ARR_4(_player, _target, 'body', 'PersonalAidKit')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'body', 'PersonalAidKit')] call DFUNC(treatment));
        EXCEPTIONS
        icon = "";
    };
    class CPR: fieldDressing {
        displayName = ECSTRING(medical,Actions_CPR);
        condition = QUOTE([ARR_4(_player, _target, 'body', 'CPR')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'body', 'CPR')] call DFUNC(treatment));
        EXCEPTIONS
        icon = "";
    };
};
class ACE_ArmLeft {
    displayName = ECSTRING(interaction,ArmLeft);
    runOnHover = 1;
    statement = QUOTE([ARR_3(_target, true, 2)] call DFUNC(displayPatientInformation));
    ACTION_CONDITION
    modifierFunction = QUOTE([ARR_4(_target,_player,2,_this select 3)] call FUNC(modifyMedicalAction));
    EXCEPTIONS
    icon = QPATHTOEF(medical,UI\icons\medical_cross.paa);
    distance = MEDICAL_ACTION_DISTANCE;

    class Bandage {
        displayName = ECSTRING(medical,Bandage);
        distance = 2.0;
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Bandage')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Bandage')] call DFUNC(treatment));
        EXCEPTIONS
        showDisabled = 1;
        priority = 2;
        icon = QPATHTOEF(medical,UI\icons\bandage.paa);
    };

    // Advanced medical
    class FieldDressing {
        displayName = ECSTRING(medical,Actions_FieldDressing);
        distance = 5.0;
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'FieldDressing')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'FieldDressing')] call DFUNC(treatment));
        EXCEPTIONS
        showDisabled = 0;
        priority = 2;
        icon = QPATHTOEF(medical,UI\icons\bandage.paa);
    };
    class PackingBandage: fieldDressing {
        displayName = ECSTRING(medical,Actions_PackingBandage);
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'PackingBandage')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'PackingBandage')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\packingBandage.paa);
    };
    class ElasticBandage: fieldDressing {
        displayName = ECSTRING(medical,Actions_ElasticBandage);
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'ElasticBandage')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'ElasticBandage')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\bandage.paa);
    };
    class QuikClot: fieldDressing {
        displayName = ECSTRING(medical,Actions_QuikClot);
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'QuikClot')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'QuikClot')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\bandage.paa);
    };
    class Tourniquet: fieldDressing {
        displayName = ECSTRING(medical,Actions_Tourniquet);
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Tourniquet')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Tourniquet')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\tourniquet.paa);
    };
    class Morphine: fieldDressing {
        displayName = ECSTRING(medical,Inject_Morphine);
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Morphine')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Morphine')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\autoInjector.paa);
    };
    class Adenosine: Morphine {
        displayName = ECSTRING(medical,Inject_Adenosine);
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Adenosine')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Adenosine')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\autoInjector.paa);
    };
    class Atropine: Morphine {
        displayName = ECSTRING(medical,Inject_Atropine);
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Atropine')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Atropine')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\autoInjector.paa);
    };
    class Epinephrine: Morphine {
        displayName = ECSTRING(medical,Inject_Epinephrine);
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Epinephrine')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Epinephrine')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\autoInjector.paa);
    };
    class BloodIV: fieldDressing {
        displayName = ECSTRING(medical,Actions_Blood4_1000);
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\iv.paa);
    };
    class BloodIV_500: BloodIV {
        displayName = ECSTRING(medical,Actions_Blood4_500);
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV_500')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV_500')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class BloodIV_250: BloodIV {
        displayName = ECSTRING(medical,Actions_Blood4_250);
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV_250')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV_250')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class PlasmaIV: BloodIV {
        displayName = ECSTRING(medical,Actions_Plasma4_1000);
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'PlasmaIV')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'PlasmaIV')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class PlasmaIV_500: PlasmaIV {
        displayName = ECSTRING(medical,Actions_Plasma4_500);
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'PlasmaIV_500')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'PlasmaIV_500')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class PlasmaIV_250: PlasmaIV {
        displayName = ECSTRING(medical,Actions_Plasma4_250);
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'PlasmaIV_250')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'PlasmaIV_250')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class SalineIV: BloodIV {
        displayName = ECSTRING(medical,Actions_Saline4_1000);
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'SalineIV')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'SalineIV')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class SalineIV_500: SalineIV {
        displayName = ECSTRING(medical,Actions_Saline4_500);
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'SalineIV_500')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'SalineIV_500')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class SalineIV_250: SalineIV {
        displayName = ECSTRING(medical,Actions_Saline4_250);
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'SalineIV_250')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'SalineIV_250')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class CheckPulse: fieldDressing {
        displayName = ECSTRING(medical,Actions_CheckPulse);
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'CheckPulse')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'CheckPulse')] call DFUNC(treatment));
        EXCEPTIONS
        icon = "";
    };
    class CheckBloodPressure: CheckPulse {
        displayName = ECSTRING(medical,Actions_CheckBloodPressure);
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'CheckBloodPressure')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'CheckBloodPressure')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class RemoveTourniquet: Tourniquet {
        displayName = ECSTRING(medical,Actions_RemoveTourniquet);
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'RemoveTourniquet')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'RemoveTourniquet')] call DFUNC(treatment));
        EXCEPTIONS
    };
};
class ACE_ArmRight {
    displayName = ECSTRING(interaction,ArmRight);
    runOnHover = 1;
    statement = QUOTE([ARR_3(_target, true, 3)] call DFUNC(displayPatientInformation));
    ACTION_CONDITION
    modifierFunction = QUOTE([ARR_4(_target,_player,3,_this select 3)] call FUNC(modifyMedicalAction));
    EXCEPTIONS
    icon = QPATHTOEF(medical,UI\icons\medical_cross.paa);
    distance = MEDICAL_ACTION_DISTANCE;

    class Bandage {
        displayName = ECSTRING(medical,Bandage);
        distance = 2.0;
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Bandage')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Bandage')] call DFUNC(treatment));
        EXCEPTIONS
        showDisabled = 1;
        priority = 2;
        icon = QPATHTOEF(medical,UI\icons\bandage.paa);
    };

    // Advanced medical
    class FieldDressing {
        displayName = ECSTRING(medical,Actions_FieldDressing);
        distance = 5.0;
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'FieldDressing')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'FieldDressing')] call DFUNC(treatment));
        EXCEPTIONS
        showDisabled = 0;
        priority = 2;
        icon = QPATHTOEF(medical,UI\icons\bandage.paa);
    };
    class PackingBandage: fieldDressing {
        displayName = ECSTRING(medical,Actions_PackingBandage);
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'PackingBandage')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'PackingBandage')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\packingBandage.paa);
    };
    class ElasticBandage: fieldDressing {
        displayName = ECSTRING(medical,Actions_ElasticBandage);
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'ElasticBandage')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'ElasticBandage')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class QuikClot: fieldDressing {
        displayName = ECSTRING(medical,Actions_QuikClot);
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'QuikClot')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'QuikClot')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class Tourniquet: fieldDressing {
        displayName = ECSTRING(medical,Actions_Tourniquet);
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Tourniquet')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Tourniquet')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\tourniquet.paa);
    };
    class Morphine: fieldDressing {
        displayName = ECSTRING(medical,Inject_Morphine);
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Morphine')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Morphine')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\autoInjector.paa);
    };

    class Adenosine: Morphine {
        displayName = ECSTRING(medical,Inject_Adenosine);
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Adenosine')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Adenosine')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\autoInjector.paa);
    };
    class Atropine: Morphine {
        displayName = ECSTRING(medical,Inject_Atropine);
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Atropine')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Atropine')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class Epinephrine: Morphine {
        displayName = ECSTRING(medical,Inject_Epinephrine);
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Epinephrine')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Epinephrine')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class BloodIV: fieldDressing {
        displayName = ECSTRING(medical,Actions_Blood4_1000);
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV')] call DFUNC(treatment));
        EXCEPTIONS
        icon =QPATHTOEF(medical,UI\icons\iv.paa);
    };
    class BloodIV_500: BloodIV {
        displayName = ECSTRING(medical,Actions_Blood4_500);
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV_500')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV_500')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class BloodIV_250: BloodIV {
        displayName = ECSTRING(medical,Actions_Blood4_250);
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV_250')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV_250')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class PlasmaIV: BloodIV {
        displayName = ECSTRING(medical,Actions_Plasma4_1000);
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'PlasmaIV')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'PlasmaIV')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class PlasmaIV_500: PlasmaIV {
        displayName = ECSTRING(medical,Actions_Plasma4_500);
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'PlasmaIV_500')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'PlasmaIV_500')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class PlasmaIV_250: PlasmaIV {
        displayName = ECSTRING(medical,Actions_Plasma4_250);
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'PlasmaIV_250')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'PlasmaIV_250')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class SalineIV: BloodIV {
        displayName = ECSTRING(medical,Actions_Saline4_1000);
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'SalineIV')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'SalineIV')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class SalineIV_500: SalineIV {
        displayName = ECSTRING(medical,Actions_Saline4_500);
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'SalineIV_500')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'SalineIV_500')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class SalineIV_250: SalineIV {
        displayName = ECSTRING(medical,Actions_Saline4_250);
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'SalineIV_250')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'SalineIV_250')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class CheckPulse: fieldDressing {
        displayName = ECSTRING(medical,Actions_CheckPulse);
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'CheckPulse')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'CheckPulse')] call DFUNC(treatment));
        EXCEPTIONS
        icon = "";
    };
    class CheckBloodPressure: CheckPulse {
        displayName = ECSTRING(medical,Actions_CheckBloodPressure);
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'CheckBloodPressure')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'CheckBloodPressure')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class RemoveTourniquet: Tourniquet {
        displayName = ECSTRING(medical,Actions_RemoveTourniquet);
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'RemoveTourniquet')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'RemoveTourniquet')] call DFUNC(treatment));
        EXCEPTIONS
    };

};
class ACE_LegLeft {
    displayName = ECSTRING(interaction,LegLeft);
    runOnHover = 1;
    statement = QUOTE([ARR_3(_target, true, 4)] call DFUNC(displayPatientInformation));
    ACTION_CONDITION
    modifierFunction = QUOTE([ARR_4(_target,_player,4,_this select 3)] call FUNC(modifyMedicalAction));
    EXCEPTIONS
    icon = QPATHTOEF(medical,UI\icons\medical_cross.paa);
    distance = MEDICAL_ACTION_DISTANCE;

    class Bandage {
        displayName = ECSTRING(medical,Bandage);
        distance = 2.0;
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Bandage')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Bandage')] call DFUNC(treatment));
        EXCEPTIONS
        showDisabled = 1;
        priority = 2;
        icon = QPATHTOEF(medical,UI\icons\bandage.paa);
    };


    // Advanced medical
    class FieldDressing {
        displayName = ECSTRING(medical,Actions_FieldDressing);
        distance = 5.0;
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'FieldDressing')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'FieldDressing')] call DFUNC(treatment));
        EXCEPTIONS
        showDisabled = 0;
        priority = 2;
        icon = QPATHTOEF(medical,UI\icons\bandage.paa);
    };
    class PackingBandage: fieldDressing {
        displayName = ECSTRING(medical,Actions_PackingBandage);
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'PackingBandage')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'PackingBandage')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\packingBandage.paa);
    };
    class ElasticBandage: fieldDressing {
        displayName = ECSTRING(medical,Actions_ElasticBandage);
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'ElasticBandage')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'ElasticBandage')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class QuikClot: fieldDressing {
        displayName = ECSTRING(medical,Actions_QuikClot);
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'QuikClot')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'QuikClot')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class Tourniquet: fieldDressing {
        displayName = ECSTRING(medical,Actions_Tourniquet);
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Tourniquet')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Tourniquet')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\tourniquet.paa);
    };
    class Morphine: fieldDressing {
        displayName = ECSTRING(medical,Inject_Morphine);
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Morphine')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Morphine')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\autoInjector.paa);
    };
    class Adenosine: Morphine {
        displayName = ECSTRING(medical,Inject_Atropine);
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Adenosine')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Adenosine')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\autoInjector.paa);
    };
    class Atropine: Morphine {
        displayName = ECSTRING(medical,Inject_Atropine);
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Atropine')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Atropine')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\autoInjector.paa);
    };
    class Epinephrine: Morphine {
        displayName = ECSTRING(medical,Inject_Epinephrine);
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Epinephrine')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Epinephrine')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class BloodIV: fieldDressing {
        displayName = ECSTRING(medical,Actions_Blood4_1000);
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\iv.paa);
    };
    class BloodIV_500: BloodIV {
        displayName = ECSTRING(medical,Actions_Blood4_500);
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV_500')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV_500')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class BloodIV_250: BloodIV {
        displayName = ECSTRING(medical,Actions_Blood4_250);
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV_250')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV_250')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class PlasmaIV: BloodIV {
        displayName = ECSTRING(medical,Actions_Plasma4_1000);
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'PlasmaIV')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'PlasmaIV')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class PlasmaIV_500: PlasmaIV {
        displayName = ECSTRING(medical,Actions_Plasma4_500);
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'PlasmaIV_500')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'PlasmaIV_500')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class PlasmaIV_250: PlasmaIV {
        displayName = ECSTRING(medical,Actions_Plasma4_250);
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'PlasmaIV_250')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'PlasmaIV_250')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class SalineIV: BloodIV {
        displayName = ECSTRING(medical,Actions_Saline4_1000);
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'SalineIV')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'SalineIV')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class SalineIV_500: SalineIV {
        displayName = ECSTRING(medical,Actions_Saline4_500);
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'SalineIV_500')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'SalineIV_500')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class SalineIV_250: SalineIV {
        displayName = ECSTRING(medical,Actions_Saline4_250);
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'SalineIV_250')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'SalineIV_250')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class RemoveTourniquet: Tourniquet {
        displayName = ECSTRING(medical,Actions_RemoveTourniquet);
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'RemoveTourniquet')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'RemoveTourniquet')] call DFUNC(treatment));
        EXCEPTIONS
    };
};
class ACE_LegRight {
    displayName = ECSTRING(interaction,LegRight);
    runOnHover = 1;
    statement = QUOTE([ARR_3(_target, true, 5)] call DFUNC(displayPatientInformation));
    ACTION_CONDITION
    modifierFunction = QUOTE([ARR_4(_target,_player,5,_this select 3)] call FUNC(modifyMedicalAction));
    EXCEPTIONS
    icon = QPATHTOEF(medical,UI\icons\medical_cross.paa);
    distance = MEDICAL_ACTION_DISTANCE;

    class Bandage {
        displayName = ECSTRING(medical,Bandage);
        distance = 2.0;
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Bandage')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Bandage')] call DFUNC(treatment));
        EXCEPTIONS
        showDisabled = 1;
        priority = 2;
        icon = QPATHTOEF(medical,UI\icons\bandage.paa);
    };

    // Advanced medical
    class FieldDressing {
        displayName = ECSTRING(medical,Actions_FieldDressing);
        distance = 5.0;
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'FieldDressing')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'FieldDressing')] call DFUNC(treatment));
        EXCEPTIONS
        showDisabled = 0;
        priority = 2;
        icon = QPATHTOEF(medical,UI\icons\bandage.paa);
    };
    class PackingBandage: fieldDressing {
        displayName = ECSTRING(medical,Actions_PackingBandage);
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'PackingBandage')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'PackingBandage')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\packingBandage.paa);
    };
    class ElasticBandage: fieldDressing {
        displayName = ECSTRING(medical,Actions_ElasticBandage);
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'ElasticBandage')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'ElasticBandage')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class QuikClot: fieldDressing {
        displayName = ECSTRING(medical,Actions_QuikClot);
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'QuikClot')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'QuikClot')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class Tourniquet: fieldDressing {
        displayName = ECSTRING(medical,Actions_Tourniquet);
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Tourniquet')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Tourniquet')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\tourniquet.paa);
    };
    class Morphine: fieldDressing {
        displayName = ECSTRING(medical,Inject_Morphine);
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Morphine')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Morphine')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\autoInjector.paa);
    };
    class Adenosine: Morphine {
        displayName = ECSTRING(medical,Inject_Atropine);
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Adenosine')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Adenosine')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\autoInjector.paa);
    };
    class Atropine: Morphine {
        displayName = ECSTRING(medical,Inject_Atropine);
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Atropine')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Atropine')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\autoInjector.paa);
    };
    class Epinephrine: Morphine {
        displayName = ECSTRING(medical,Inject_Epinephrine);
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Epinephrine')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Epinephrine')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\autoInjector.paa);
    };
    class BloodIV: fieldDressing {
        displayName = ECSTRING(medical,Actions_Blood4_1000);
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOEF(medical,UI\icons\iv.paa);
    };
    class BloodIV_500: BloodIV {
        displayName = ECSTRING(medical,Actions_Blood4_500);
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV_500')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV_500')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class BloodIV_250: BloodIV {
        displayName = ECSTRING(medical,Actions_Blood4_250);
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV_250')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV_250')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class PlasmaIV: BloodIV {
        displayName = ECSTRING(medical,Actions_Plasma4_1000);
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'PlasmaIV')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'PlasmaIV')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class PlasmaIV_500: PlasmaIV {
        displayName = ECSTRING(medical,Actions_Plasma4_500);
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'PlasmaIV_500')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'PlasmaIV_500')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class PlasmaIV_250: PlasmaIV {
        displayName = ECSTRING(medical,Actions_Plasma4_250);
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'PlasmaIV_250')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'PlasmaIV_250')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class SalineIV: BloodIV {
        displayName = ECSTRING(medical,Actions_Saline4_1000);
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'SalineIV')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'SalineIV')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class SalineIV_500: SalineIV {
        displayName = ECSTRING(medical,Actions_Saline4_500);
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'SalineIV_500')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'SalineIV_500')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class SalineIV_250: SalineIV {
        displayName = ECSTRING(medical,Actions_Saline4_250);
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'SalineIV_250')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'SalineIV_250')] call DFUNC(treatment));
        EXCEPTIONS
    };
    class RemoveTourniquet: Tourniquet {
        displayName = ECSTRING(medical,Actions_RemoveTourniquet);
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'RemoveTourniquet')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'RemoveTourniquet')] call DFUNC(treatment));
        EXCEPTIONS
    };
};
