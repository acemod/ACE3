/**
 * XEH_postInit.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"
#include "variable_defines.sqf"



GVAR(injuredUnitCollection) = [];
[{
    {
        if (!alive _x || !local _x) then {
            GVAR(injuredUnitCollection) set [ _forEachIndex, ObjNull];
        } else {
            [_x] call FUNC(handleUnitVitals);

            private "_pain";
            _pain = _X getvariable [QGVAR(amountOfPain), 0];
            if (_pain > 5 && (random(1) > 0.5)) then {
                _x setvariable [QGVAR(amountOfPain), _pain + 0.002];
            };
            if (_pain > 45) then {
                if (random(1) > 0.6) then {
                    [_X] call EFUNC(common,setUnconsciousState);
                };
                //[_X] call FUNC(playInjuredSound);
            };
        };
    }foreach GVAR(injuredUnitCollection);
    GVAR(injuredUnitCollection) = GVAR(injuredUnitCollection) - [ObjNull];
}, 1, [] ] call CBA_fnc_addPerFrameHandler;

[
    {(([_this select 0,QGVAR(bloodVolume)] call EFUNC(common,getDefinedVariable)) < 65)},
    {(([_this select 0,QGVAR(amountOfPain)] call EFUNC(common,getDefinedVariable)) > 48)}
] call EFUNC(common,registerUnconsciousCondition);

call FUNC(handleDisplayEffects);

// Assigning all eventhandlers
["Medical_treatmentCompleted", FUNC(onTreatmentCompleted)] call ace_common_fnc_addEventHandler;
["onStartMovingUnit", FUNC(onStartMovingUnit)] call ace_common_fnc_addEventHandler;
["onUnconscious", FUNC(onUnconscious)] call ace_common_fnc_addEventHandler;
["carryObjectDropped", FUNC(onCarryObjectDropped)] call ace_common_fnc_addEventHandler;



// Keybindings
GVAR(keyPressed) = false;

["ACE3",
   localize "STR_ACE_OPEN_CMS_MENU_DESC",
   {    if (!GVAR(keyPressed)) then {
            GVAR(keyPressed) = true;
            GVAR(timeMenuOpened) = time;
            [] call FUNC(openMenu);

            true;
        } else {
            false;
        };
   },
   [ 0, [false, false, false]],
   false,
  "keydown"] call cba_fnc_registerKeybind;

["ACE3",
   localize "STR_ACE_OPEN_CMS_MENU_DESC",
   {
        GVAR(keyPressed) = false;
        if (time - GVAR(timeMenuOpened) >= (0.25*accTime)) then {
            disableSerialization;
            _display = uiNamespace getVariable QGVAR(medicalMenu);
            if (!isnil "_display") then {
                closeDialog 314412;
            };
        };
        false;
   },
   [ 0, [false, false, false]],
   false,
  "keyUp"] call cba_fnc_registerKeybind;



// Adding the treatment options for all available medical equipment.

// Advanced Treatment options
ADD_TREATMENT_ADVANCED("STR_ACE_ACTION_BLOODIV_1000ml","STR_ACE_ACTION_BLOODIV_1000ML_TOOLTIP",'ACE_blood_iv');
ADD_TREATMENT_ADVANCED("STR_ACE_ACTION_BLOODIV_500ml","STR_ACE_ACTION_BLOODIV_500ML_TOOLTIP",'ACE_blood_iv_500');
ADD_TREATMENT_ADVANCED("STR_ACE_ACTION_BLOODIV_250ml","STR_ACE_ACTION_BLOODIV_250ML_TOOLTIP",'ACE_blood_iv_250');
ADD_TREATMENT_ADVANCED("STR_ACE_ACTION_PLASMAIV_1000ml","STR_ACE_ACTION_PLASMAIV_1000ML_TOOLTIP",'ACE_plasma_iv');
ADD_TREATMENT_ADVANCED("STR_ACE_ACTION_PLASMAIV_500ml","STR_ACE_ACTION_PLASMAIV_500ML_TOOLTIP",'ACE_plasma_iv_500');
ADD_TREATMENT_ADVANCED("STR_ACE_ACTION_PLASMAIV_250ml","STR_ACE_ACTION_PLASMAIV_250ML_TOOLTIP",'ACE_plasma_iv_250');
ADD_TREATMENT_ADVANCED("STR_ACE_ACTION_SALINEIV_1000ml","STR_ACE_ACTION_SALINEIV_1000ML_TOOLTIP",'ACE_saline_iv');
ADD_TREATMENT_ADVANCED("STR_ACE_ACTION_SALINEIV_500ml","STR_ACE_ACTION_SALINEIV_500ML_TOOLTIP",'ACE_saline_iv_500');
ADD_TREATMENT_ADVANCED("STR_ACE_ACTION_SALINEIV_250ml","STR_ACE_ACTION_SALINEIV_250ML_TOOLTIP",'ACE_saline_iv_250');

["STR_ACE_ACTION_PERSONAL_AID_KIT","STR_ACE_ACTION_PERSONAL_AID_KIT_TOOLTIP",{
    _caller = _this select 0;
    _target = _this select 1;
    if !([_this select 0,_this select 1, 'ACE_personal_aid_kit'] call FUNC(hasEquipment)) exitwith {
        false;
    };
    _inMedFacility = ([_caller] call FUNC(inMedicalFacility));
    _hasOpenWounds = ([_target] call FUNC(hasOpenWounds));

    if ((GVAR(setting_aidKitRestrictions) == 0 && _inMedFacility) ||
        (GVAR(setting_aidKitRestrictions) == 1 && _inMedFacility && (!_hasOpenWounds)) ||
        (GVAR(setting_aidKitRestrictions) == 2) ||
        (GVAR(setting_aidKitRestrictions) == 3 && (!_hasOpenWounds))) exitwith {

        ((GVAR(setting_aidKitMedicsOnly) && [_caller] call FUNC(medicClass) || !GVAR(setting_aidKitMedicsOnly)));
    };
    false;
},TREATMENT_ADVANCED('ACE_personal_aid_kit'),'advanced'] call FUNC(addTreatmentOption);

["STR_ACE_ACTION_PERFORM_CPR","STR_ACE_ACTION_PERFORM_CPR_TOOLTIP",{
    _caller = _this select 0;
    _target = _this select 1;

    (!(_caller getvariable[QGVAR(isProvidingCPR), false]) && ((_target getvariable [QGVAR(inCardiacArrest),false]) || !([_target] call EFUNC(common,isAwake))))
},TREATMENT_ADVANCED('ACE_CPR'),'advanced'] call FUNC(addTreatmentOption);

["STR_ACE_ACTION_STOP_CPR","STR_ACE_ACTION_STOP_CPR_TOOLTIP",{
    _caller = _this select 0;
    _target = _this select 1;

    (_caller getvariable[QGVAR(isProvidingCPR), false])
},{((_this select 0) setvariable[QGVAR(isProvidingCPR), nil, true])},'advanced'] call FUNC(addTreatmentOption);

["STR_ACE_ACTION_STITCHING","STR_ACE_ACTION_STITCHING_TOOLTIP",{
    _caller = _this select 0;
    _target = _this select 1;

     ((GVAR(setting_allowStitching) == 0 && [_Caller] call FUNC(medicClass)) || GVAR(setting_allowStitching) == 1)
},TREATMENT_ADVANCED('ACE_surgical_kit'),'advanced'] call FUNC(addTreatmentOption);

// Airway Management
["STR_ACE_ACTION_APPLY_NPA","STR_ACE_ACTION_APPLY_NPA_TOOLTIP",{
    _caller = _this select 0;
    _target = _this select 1;
    if !([_this select 0,_this select 1, 'ACE_nasopharyngeal_tube'] call FUNC(hasEquipment)) exitwith {
        false;
    };
    (!([_target, QGVAR(airwayTreated)] call EFUNC(common,getDefinedVariable)) && !([_target] call EFUNC(common,isAwake)))
},TREATMENT_AIRWAY('ACE_nasopharyngeal_tube'),'advanced'] call FUNC(addTreatmentOption);

["STR_ACE_ACTION_REMOVE_NPA","STR_ACE_ACTION_REMOVE_NPA_TOOLTIP",{
    _caller = _this select 0;
    _target = _this select 1;
    ([_target, QGVAR(airwayTreated)] call EFUNC(common,getDefinedVariable));
}, {GVAR(INTERACTION_TARGET) setvariable [QGVAR(airwayTreated), nil, true]; (_this select 0) addItem 'ACE_nasopharyngeal_tube';},'airway'] call FUNC(addTreatmentOption);


// Bandaging
ADD_TREATMENT_BANDAGE("STR_ACE_ACTION_BANDAGE_BASIC","STR_ACE_ACTION_BANDAGE_BASIC_TOOLTIP",'ACE_bandage_basic');
ADD_TREATMENT_BANDAGE("STR_ACE_ACTION_QUIKCLOT","STR_ACE_ACTION_QUIKCLOT_TOOLTIP",'ACE_quikclot');
ADD_TREATMENT_BANDAGE("STR_ACE_ACTION_BANDAGE_ELASTIC","STR_ACE_ACTION_BANDAGE_ELASTIC_TOOLTIP",'ACE_bandageElastic');
ADD_TREATMENT_BANDAGE("STR_ACE_ACTION_PACKING_BANDAGE","STR_ACE_ACTION_PACKING_BANDAGE_TOOLTIP",'ACE_packing_bandage');

["STR_ACE_ACTION_REMOVE_TOURNIQUET","STR_ACE_ACTION_REMOVE_TOURNIQUET_TOOLTIP",{
    _caller = _this select 0;
    _target = _this select 1;
    ([_target, call FUNC(getSelectedBodyPart)] call FUNC(hasTourniquetAppliedTo));
},{[_this select 0,_this select 1,call FUNC(getSelectedBodyPart)] call FUNC(actionRemoveTourniquet)},'bandage'] call FUNC(addTreatmentOption);

["STR_ACE_ACTION_APPLY_TOURNIQUET","STR_ACE_ACTION_APPLY_TOURNIQUET_TOOLTIP",{
    _caller = _this select 0;
    _target = _this select 1;
    (!([_target, call FUNC(getSelectedBodyPart)] call FUNC(hasTourniquetAppliedTo)) && ([_caller,_target,'ACE_tourniquet'] call FUNC(hasEquipment)));
},TREATMENT_BANDAGE('ACE_tourniquet'),'bandage'] call FUNC(addTreatmentOption);


// Medication
ADD_TREATMENT_MEDICATION("STR_ACE_ACTION_MORPHINE","STR_ACE_ACTION_MORPHINE_TOOLTIP",'ACE_morphine');
ADD_TREATMENT_MEDICATION("STR_ACE_ACTION_ATROPINE","STR_ACE_ACTION_ATROPINE_TOOLTIP",'ACE_atropine');
ADD_TREATMENT_MEDICATION("STR_ACE_ACTION_EPINEPHRINE","STR_ACE_ACTION_EPINEPHRINE_TOOLTIP",'ACE_epinephrine');


// Examine
["STR_ACE_ACTION_CHECK_PULSE","STR_ACE_ACTION_CHECK_PULSE_TOOLTIP",{
    true;
},{[_this select 0,_this select 1] call FUNC(actionCheckPulse)},'examine'] call FUNC(addTreatmentOption);

["STR_ACE_ACTION_CHECK_BP","STR_ACE_ACTION_CHECK_BP_TOOLTIP",{
    true;
},{[_this select 0,_this select 1] call FUNC(actionCheckBloodPressure);},'examine'] call FUNC(addTreatmentOption);

["STR_ACE_ACTION_CHECK_RESPONSE","STR_ACE_ACTION_CHECK_RESPONSE_TOOLTIP",{
    true;
},{[_this select 0,_this select 1] call FUNC(actionCheckResponse)},'examine'] call FUNC(addTreatmentOption);


// Drag/Movement
["STR_ACE_ACTION_DRAG_PATIENT","STR_ACE_ACTION_DRAG_PATIENT_TOOLTIP",{
    _caller = _this select 0;
    _target = _this select 1;

    (isNull ([_caller] call EFUNC(common,getCarriedObj)) && isNull ([_target] call EFUNC(common,getCarriedObj)) && (_caller != _target) && (vehicle _target == _target));
}, {[_this select 0,_this select 1] call FUNC(actionDragUnit)},'drag'] call FUNC(addTreatmentOption);

["STR_ACE_ACTION_CARRY_PATIENT","STR_ACE_ACTION_CARRY_PATIENT_TOOLTIP",{
    _caller = _this select 0;
    _target = _this select 1;

    (isNull ([_caller] call EFUNC(common,getCarriedObj)) && isNull ([_target] call EFUNC(common,getCarriedObj)) && (_caller != _target) && (vehicle _target == _target));
}, {[_this select 0,_this select 1] call FUNC(actionCarryUnit)},'drag'] call FUNC(addTreatmentOption);

["STR_ACE_ACTION_BODYBAG","STR_ACE_ACTION_BODYBAG_TOOLTIP",{
    _caller = _this select 0;
    _target = _this select 1;

    (isNull ([_caller] call EFUNC(common,getCarriedObj)) && isNull ([_target] call EFUNC(common,getCarriedObj)) && (_caller != _target) && (vehicle _target == _target) && ([_caller, _target] call FUNC(canPutInBodyBag)));
}, {[_this select 0,_this select 1] call FUNC(actionPlaceInBodyBag)},'drag'] call FUNC(addTreatmentOption);

["STR_ACE_ACTION_DROP_PATIENT","STR_ACE_ACTION_DROP_PATIENT_TOOLTIP",{
    _caller = _this select 0;
    _target = _this select 1;

    (!(isNull ([_caller] call EFUNC(common,getCarriedObj))) && ([_caller] call FUNC(isMovingUnit)));
}, {[_this select 0,_this select 1] call FUNC(actionDropUnit)},'drag'] call FUNC(addTreatmentOption);

["STR_ACE_ACTION_LOAD_PATIENT","STR_ACE_ACTION_LOAD_PATIENT_TOOLTIP",{
    _caller = _this select 0;
    _target = _this select 1;

    ((vehicle _target == _target));
}, {[_this select 0,_this select 1] call FUNC(actionLoadUnit)},'drag'] call FUNC(addTreatmentOption);

["STR_ACE_ACTION_UNLOAD_PATIENT","STR_ACE_ACTION_UNLOAD_PATIENT_TOOLTIP",{
    _caller = _this select 0;
    _target = _this select 1;

    ((vehicle _target != _target));
}, {[_this select 0,_this select 1] call FUNC(actionUnloadUnit)},'drag'] call FUNC(addTreatmentOption);

systemchat format["finished postInit"];
diag_log format["finished postInit"];
