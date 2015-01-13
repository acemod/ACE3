class CfgFunctions {
	class CSE {
		class Medical {
			file = "cse\cse_sys_medical\functions";
			class initForUnit_CMS { recompile = 1; };
			class getSelectedBodyPart_CMS { recompile = 1; };
			class getBandageOptions_CMS { recompile = 1; };
			class getAdvancedOptions_CMS { recompile = 1; };
			class getExamineOptions_CMS { recompile = 1; };
			class getAirwayOptions_CMS { recompile = 1; };
			class getMedicationOptions_CMS { recompile = 1; };
			class getToggleOptions_CMS { recompile = 1; };
			class getTriageCardOptions_CMS { recompile = 1; };
			class getDragOptions_CMS { recompile = 1; };
			class getOptionsForCategory_CMS { recompile = 1; };
			class updateAttributes_CMS { recompile = 1; };
			class getBloodLoss_CMS { recompile = 1; };
			class effectsLoop_CMS { recompile = 1; };
			class inMedicalFacility_CMS { recompile = 1; };
			class medicClass_CMS { recompile = 1; };
			class playInjuredSound_CMS { recompile = 1; };
			class setDead_CMS { recompile = 1; };
			class setMedicRole_CMS { recompile = 1; };
			class assignMedicRoles_CMS { recompile = 1;};
			class assignMedicalFacility_CMS { recompile = 1;};
			class assignMedicalVehicle_CMS { recompile = 1; };
			class assignMedicalEquipment_CMS { recompile = 1; };
			class addOpenWounds_CMS { recompile = 1; };
			class isMedicalVehicle_CMS { recompile = 1; };
			class canAccessMedicalEquipment_CMS;
			class hasMedicalEnabled_CMS { recompile = 1; };
			class placeInBodyBag_CMS { recompile = 1; };
			class canPutInBodyBag_CMS { recompile = 1; };
			class hasOpenWounds_CMS { recompile = 1; };
		};
		
		class Blood {
			file = "cse\cse_sys_medical\functions\blood";
			class BloodConditions_CMS { recompile = 1; };
			class cardiacArrest_CMS { recompile = 1; };
		};
		
		class ActivityLog {
			file = "cse\cse_sys_medical\functions\activityLog";
			class addActivityToLog_CMS { recompile = 1; };
			class getActivityLog_CMS { recompile = 1; };
			class addToQuickViewLog_CMS { recompile = 1; };
			class getQuickViewLog_CMS { recompile = 1; };
		};
		
		class MedicalUI {
			file = "cse\cse_sys_medical\functions\ui";
			class openMenu_CMS { recompile = 1; };
			class onMenuOpen_CMS { recompile = 1; };
			class updateUIInfo_CMS { recompile = 1; };
			class displayOptions_CMS { recompile = 1; };
			class updateActivityLog_CMS { recompile = 1; };
			class updateBodyImg_CMS { recompile = 1; };
			class dropDownTriageCard_CMS { recompile = 1; };
			class updateIcons_CMS { recompile = 1; };
			class getCurrentSelectedInjuryData_CMS { recompile = 1; };
		};
		
		class handleDamage {
			file = "cse\cse_sys_medical\functions\handledamage";
			class handleDamage_CMS { recompile = 1; };
			class getBodyPartNumber_CMS { recompile = 1; };
			class getNewDamageBodyPart_CMS { recompile = 1; };
			class getTypeOfDamage_CMS { recompile = 1; };
			class assignOpenWounds_CMS { recompile = 1; };
			class assignFractures_CMS { recompile = 1; };
			class assignAirwayStatus_CMS { recompile = 1; };
			class determineIfFatal_CMS { recompile = 1; };
			class determineIfUnconscious_CMS { recompile = 1; };
			class reactionToHit_CMS { recompile = 1; };
			class increasePain_CMS { recompile = 1; };
			class damageBodyPart_CMS { recompile = 1; };
			
		};
		class BasicMedical {
			file = "cse\cse_sys_medical\functions\basic";
			class basicBandage_CMS { recompile = 1; };
			class fromNumberToBodyPart_CMS { recompile = 1; };
		};
		
		class MedicalTreatment {
			file = "cse\cse_sys_medical\functions\treatment";
			class treatmentMutex_CMS { recompile = 1; };
			class isSetTreatmentMutex_CMS { recompile = 1; };
			class bandage_CMS { recompile = 1; };
			class bandageLocal_CMS { recompile = 1; };
			class bandageOpening_CMS { recompile = 1; };
			class iv_CMS { recompile = 1; };
			class ivLocal_CMS { recompile = 1; };
			class medication_CMS { recompile = 1; };
			class medicationLocal_CMS { recompile = 1; };
			class removeTourniquet_CMS { recompile = 1; };
			class tourniquet_CMS { recompile = 1; };
			class tourniquetLocal_CMS { recompile = 1; };
			class hasTourniquetAppliedTo_CMS {recompile = 1; };
			class performCPR_CMS { recompile = 1; };
			class performCPRLocal_CMS { recompile = 1; };
			class performCPRProvider_CMS { recompile = 1; };
			class performCPRSuccess_CMS { recompile = 1; };
			class heal_CMS { recompile = 1; };
			class healLocal_CMS { recompile = 1; };
			class handleHeal_CMS { recompile = 1; };
			class treatmentAirway_CMS { recompile = 1; };
			class treatmentAirwayLocal_CMS { recompile = 1; };
			class hasEquipment_CMS { recompile = 1; };
			class useEquipment_CMS { recompile = 1; };
			class performStitching_CMS { recompile = 1; };
		};
		
		class MedicalDrag {
			file = "cse\cse_sys_medical\functions\drag";
			class switchBody_CMS { recompile = 1; };
			class drag_CMS { recompile = 1; };
			class carry_CMS { recompile = 1; };
			class drop_CMS { recompile = 1; };
		};
		
		class MedicalLoading {
			file = "cse\cse_sys_medical\functions\loading";
			class load_CMS { recompile = 1; };
			class loadLocal_CMS { recompile = 1; };
			class unload_CMS { recompile = 1; };
		};
		
		class MedicalExamine {
			file = "cse\cse_sys_medical\functions\examine";
			class checkPulseLocal_CMS { recompile = 1; };
			class checkBloodPressureLocal_CMS { recompile = 1; };
			class checkPulse_CMS { recompile = 1; };
			class checkBloodPressure_CMS { recompile = 1; };
			class checkResponse_CMS { recompile = 1; };
		};

		class TriageCard {
			file = "cse\cse_sys_medical\functions\triage";
			class getTriageList_CMS { recompile = 1; };
			class addToTriageList_CMS { recompile = 1; };
			class setTriageStatus_CMS { recompile = 1; };
			class getTriageStatus_CMS { recompile = 1; };
		};

		class Vitals {
			file = "cse\cse_sys_medical\functions\vitals";
			class updateVitals_CMS { recompile = 1; };
			class getHeartRateChange_CMS { recompile = 1; };
			class getBloodVolumeChange_CMS { recompile = 1; };
			class getBloodPressure_CMS { recompile = 1; };
			class addHeartRateAdjustment_CMS { recompile = 1; };
			class getCardiacOutput_CMS { recompile = 1; };
		};
	};
};
