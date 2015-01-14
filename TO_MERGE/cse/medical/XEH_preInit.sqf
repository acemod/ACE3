/**
 * XEH_preInit.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

PREP(initForUnit_CMS);
PREP(getSelectedBodyPart_CMS);
PREP(getBandageOptions_CMS);
PREP(getAdvancedOptions_CMS);
PREP(getExamineOptions_CMS);
PREP(getAirwayOptions_CMS);
PREP(getMedicationOptions_CMS);
PREP(getToggleOptions_CMS);
PREP(getTriageCardOptions_CMS);
PREP(getDragOptions_CMS);
PREP(getOptionsForCategory_CMS);
PREP(getBloodLoss_CMS);
PREP(effectsLoop_CMS);
PREP(inMedicalFacility_CMS);
PREP(medicClass_CMS);
PREP(playInjuredSound_CMS);
PREP(setDead_CMS);
PREP(setMedicRole_CMS);
PREP(assignMedicRoles_CMS);
PREP(assignMedicalFacility_CMS);
PREP(assignMedicalVehicle_CMS);
PREP(assignMedicalEquipment_CMS);
PREP(addOpenWounds_CMS);
PREP(isMedicalVehicle_CMS);
PREP(canAccessMedicalEquipment_CMS;
PREP(hasMedicalEnabled_CMS);
PREP(placeInBodyBag_CMS);
PREP(canPutInBodyBag_CMS);
PREP(hasOpenWounds_CMS);

PREP(BloodConditions_CMS);
PREP(cardiacArrest_CMS);

PREP(addActivityToLog_CMS);
PREP(getActivityLog_CMS);
PREP(addToQuickViewLog_CMS);
PREP(getQuickViewLog_CMS);

PREP(openMenu_CMS);
PREP(onMenuOpen_CMS);
PREP(updateUIInfo_CMS);
PREP(displayOptions_CMS);
PREP(updateActivityLog_CMS);
PREP(updateBodyImg_CMS);
PREP(dropDownTriageCard_CMS);
PREP(updateIcons_CMS);
PREP(getCurrentSelectedInjuryData_CMS);

PREP(handleDamage_CMS);
PREP(getBodyPartNumber_CMS);
PREP(getNewDamageBodyPart_CMS);
PREP(getTypeOfDamage_CMS);
PREP(assignOpenWounds_CMS);
PREP(assignFractures_CMS);
PREP(assignAirwayStatus_CMS);
PREP(determineIfFatal_CMS);
PREP(determineIfUnconscious_CMS);
PREP(reactionToHit_CMS);
PREP(increasePain_CMS);
PREP(damageBodyPart_CMS);

PREP(fromNumberToBodyPart_CMS);

PREP(treatmentMutex_CMS);
PREP(isSetTreatmentMutex_CMS);
PREP(bandage_CMS);
PREP(bandageLocal_CMS);
PREP(bandageOpening_CMS);
PREP(iv_CMS);
PREP(ivLocal_CMS);
PREP(medication_CMS);
PREP(medicationLocal_CMS);
PREP(removeTourniquet_CMS);
PREP(tourniquet_CMS);
PREP(tourniquetLocal_CMS);
PREP(hasTourniquetAppliedTo_CMS);
PREP(performCPR_CMS);
PREP(performCPRLocal_CMS);
PREP(performCPRProvider_CMS);
PREP(performCPRSuccess_CMS);
PREP(heal_CMS);
PREP(healLocal_CMS);
PREP(handleHeal_CMS);
PREP(treatmentAirway_CMS);
PREP(treatmentAirwayLocal_CMS);
PREP(hasEquipment_CMS);
PREP(useEquipment_CMS);
PREP(performStitching_CMS);

PREP(drag_CMS);
PREP(carry_CMS);
PREP(drop_CMS);

PREP(load_CMS);
PREP(loadLocal_CMS);
PREP(unload_CMS);

PREP(checkPulseLocal_CMS);
PREP(checkBloodPressureLocal_CMS);
PREP(checkPulse_CMS);
PREP(checkBloodPressure_CMS);
PREP(checkResponse_CMS);

PREP(getTriageList_CMS);
PREP(addToTriageList_CMS);
PREP(setTriageStatus_CMS);
PREP(getTriageStatus_CMS);

PREP(updateVitals_CMS);
PREP(getHeartRateChange_CMS);
PREP(getBloodVolumeChange_CMS);
PREP(getBloodPressure_CMS);
PREP(addHeartRateAdjustment_CMS);
PREP(getCardiacOutput_CMS);


FUNC(unitLoop_CMS) = {
	_unit = _this select 0;
	if !(local _unit) exitwith{};
	if !(_unit getvariable[QGVAR(addedToUnitLoop),false]) then{
		_unit setvariable [QGVAR(addedToUnitLoop),true];
	};

	if ([_unit] call FUNC(hasMedicalEnabled_CMS)) then {
		if (isnil QGVAR(injuredUnitCollection)) then {
			GVAR(injuredUnitCollection) = [];
		};
		if (_unit in GVAR(injuredUnitCollection)) exitwith {};
		GVAR(injuredUnitCollection) pushback _unit;
		[format["Added %1 to unitLoop",_unit]] call EFUNC(common,debug);
	};
};

FUNC(onBodySwitch_CMS) = {
	private ["_unit","_newUnit"];
	_unit = _this select 0;
	_newUnit = _this select 1;
	if (!dialog) exitwith{};
	if (GVAR(INTERACTION_TARGET) == _unit) then {
		GVAR(INTERACTION_TARGET) = _newUnit;
	};
};

FUNC(eh_killed_CMS) = {
	private["_unit"];
	_unit = _this select 0;
	if (!local _unit) exitwith {};
	[_unit, QGVAR(amountOfPain),0,true] call EFUNC(common,setDefinedVariable);
	[_unit, QGVAR(heartRate),0,true] call EFUNC(common,setDefinedVariable);
	[_unit, QGVAR(bloodPressure), [0,0],true] call EFUNC(common,setDefinedVariable);
	if (_unit getvariable[EQGVAR(common,unconscious_non_captive_f),false]) then {
		_unit setCaptive false;
		_unit setvariable[EQGVAR(common,unconscious_non_captive_f),nil];
	};
};

FUNC(eh_local_CMS) = {
	private["_unit"];
	_unit = _this select 0;
	_local = _this  select 1;
	[format["Locality changed for: %1",_this]] call EFUNC(common,debug);
	if (_local) then {
		if (_unit getvariable[QGVAR(addedToUnitLoop),false]) then {
			[_unit] call FUNC(unitLoop_CMS);
		};
	};
};
