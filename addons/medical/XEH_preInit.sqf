/**
 * XEH_preInit);
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

PREP(actionCarryUnit);
PREP(ActioncheckBloodPressure);
PREP(ActionCheckBloodPressureLocal);
PREP(ActionCheckPulse);
PREP(actionCheckPulseLocal);
PREP(actionCheckResponse);
PREP(actionDragUnit);
PREP(actionDropUnit);
PREP(actionLoadUnit);
PREP(actionPlaceInBodyBag);
PREP(actionRemoveTourniquet);
PREP(actionUnloadUnit);

PREP(addActivityToLog);
PREP(addHeartRateAdjustment);
PREP(addOpenWounds);
PREP(addToInjuredCollection);
PREP(addToQuickViewLog);
PREP(addToTriageList);
PREP(addTreatmentOption);

PREP(canAccessMedicalEquipment);
PREP(canPutInBodyBag);
PREP(determineIfFatal);
PREP(determineIfUnconscious);
PREP(fromNumberToBodyPart);

PREP(effectPain);
PREP(effectBleeding);
PREP(effectBlackOut);

PREP(getActivityLog);
PREP(getBloodLoss);
PREP(getBloodPressure);
PREP(getBloodVolumeChange);
PREP(getBodyPartNumber);
PREP(getCardiacOutput);
PREP(getCurrentSelectedInjuryData);
PREP(getHeartRateChange);
PREP(getNewDamageBodyPart);
PREP(getQuickViewLog);
PREP(getSelectedBodyPart);
PREP(getTreatmentOptions);
PREP(getTriageList);
PREP(getTriageStatus);
PREP(getTypeOfDamage);

// Handling events & actions
PREP(handleBandageOpening);
PREP(handleDamage);
PREP(handleDisplayEffects);
PREP(handleHeal);
PREP(handleReactionHit);
PREP(handleTreatment);
PREP(handleTreatment_Action_AdvancedLocal);
PREP(handleTreatment_Action_AirwayLocal);
PREP(handleTreatment_Action_BandageLocal);
PREP(handleTreatment_Action_CPR);
PREP(handleTreatment_Action_CPRLocal);
PREP(handleTreatment_Action_fullHeal);
PREP(handleTreatment_Action_fullHealLocal);
PREP(handleTreatment_Action_MedicationLocal);
PREP(handleTreatment_Action_Stitching);
PREP(handleTreatment_Action_tourniquet);
PREP(handleTreatment_Action_tourniquetLocal);
PREP(handleTreatment_Category_Advanced);
PREP(handleTreatment_Category_Airway);
PREP(handleTreatment_Category_Bandaging);
PREP(handleTreatment_Category_Medication);
PREP(handleUI_DisplayOptions);
PREP(handleUI_dropDownTriageCard);
PREP(handleUnitVitals);
PREP(handleDropUnit);

PREP(hasEquipment);
PREP(hasMedicalEnabled);
PREP(hasOpenWounds);
PREP(hasTourniquetAppliedTo);

PREP(increasePain);
PREP(initalizeModuleCMS);
PREP(inMedicalFacility);
PREP(isMedic);
PREP(isMedicalVehicle);
PREP(isSetTreatmentMutex);
PREP(isMovingUnit);

PREP(moduleAssignMedicalEquipment);
PREP(moduleAssignMedicalFacility);
PREP(moduleAssignMedicalVehicle);
PREP(moduleAssignMedicRoles);
PREP(moduleDamageSettings);

PREP(onInitForUnit);
PREP(onInjury_assignAirwayStatus);
PREP(onInjury_assignFractures);
PREP(onInjury_assignOpenWounds);
PREP(onKilled);
PREP(onLocal);
PREP(onMenuOpen);
PREP(onTreatmentCompleted);
PREP(onUnconscious);
PREP(onStartMovingUnit);
PREP(onCarryObjectDropped);
PREP(onDamage);

PREP(openMenu);
PREP(playInjuredSound);
PREP(setCardiacArrest);
PREP(setDamageBodyPart);
PREP(setDead);
PREP(setMedicRole);
PREP(setTriageStatus);
PREP(treatmentMutex);

PREP(updateActivityLog);
PREP(updateBodyImg);
PREP(updateIcons);
PREP(updateUIInfo);

PREP(useEquipment);


PREP(cacheHandledamageCall);
PREP(checkDamage);

// initalize all module parameters.
GVAR(setting_allowInstantDead) = true;
GVAR(setting_AdvancedLevel) = 0;
GVAR(setting_advancedWoundsSetting) = false;
GVAR(setting_advancedMedicRoles) = false;
GVAR(setting_medicalDifficulty) = 1;
GVAR(setting_enableBandagingAid) = true;
GVAR(setting_allowAIFullHeal) = false;
GVAR(setting_enableForUnits) = 1;
GVAR(setting_allowAirwayInjuries) = false;
GVAR(setting_aidKitRestrictions) = 0;
GVAR(setting_removeAidKitOnUse) = true;
GVAR(setting_aidKitMedicsOnly) = false;
GVAR(setting_bandageWaitingTime) = 5;
GVAR(setting_allowVehicleCrashInjuries) = true;
GVAR(setting_allowStitching) = 0;

ADDON = true;
