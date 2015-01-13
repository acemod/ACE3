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


PREP(stringCompare);
PREP(string_removeWhiteSpace);

PREP(isHC);

PREP(sendRequest_f);
PREP(requestCallback);
PREP(receiveRequest);
PREP(onAnswerRequest);

PREP(debug);
PREP(debugModule);
PREP(traceModule);

PREP(addTaskToPool_f);
PREP(removeTaskFromPool_f);
PREP(loopThroughPool_f);

PREP(createMutex);
PREP(releaseMutex);
PREP(waitForSingleMutex);
PREP(waitForMultipleMutex);
PREP(lockMutex);

PREP(defineVariable);
PREP(setDefinedVariable);
PREP(getDefinedVariable);
PREP(getAllDefinedSetVariables);
PREP(getDefinedVariableInfo);
PREP(getDefinedVariableDefault);

PREP(sendHintTo);
PREP(sendMessageTo);
PREP(sendDisplayInformationTo);
PREP(sendDisplayMessageTo);

PREP(broadcastAnim);
PREP(getDeathAnim);
PREP(switchAnim);
PREP(playMoveNow);
PREP(localAnim);

PREP(insertionSort);
PREP(findIf);
PREP(findIn);
PREP(findAll);
PREP(uniqueElementsOnly);
PREP(foreachDo);
PREP(sortAlphabeticallyBy);

PREP(hasMagazine);
PREP(useMagazine);
PREP(findMagazine);
PREP(hasItem);
PREP(useItem);
PREP(findItem);
PREP(getNumberMagazinesIn);

PREP(setCanInteract);
PREP(getCanInteract);
PREP(canInteract);

PREP(resetAllDefaults_f);
PREP(broadcastSound3D_f);
PREP(getName);
PREP(setDead);
PREP(isAwake);
PREP(setProne);
PREP(isInBuilding);
PREP(disableKeyInput_f);
PREP(disableUserInput_f);
PREP(dropWeapon_f);
PREP(inWater_f);
PREP(setVolume_f);
PREP(lockVehicleOfUnitUntil);
PREP(closeAllDialogs_f);
PREP(disableAI_f);
PREP(moduleBasicRevive);
PREP(switchToGroupSide_f);
PREP(hasItem_f);
PREP(getFirstObjectIntersection);
PREP(getFirstTerrainIntersection);
PREP(setHearingCapability);
PREP(revealObject_f);
PREP(getWeaponItems_f);

PREP(ALiVE_Bus_Mod);
PREP(isLoaded_ALiVE_Mod);
PREP(isModLoaded_f);

PREP(inheritsFrom);

PREP(getVersion);

PREP(carryObj);
PREP(carriedByObj);
PREP(getCarriedObj);
PREP(getCarriedBy);
PREP(beingCarried);
PREP(setCarriedBy); /* Should not be used by other developers */

PREP(setUnconsciousState);
PREP(isUnconscious);
PREP(getUnconsciousCondition);
PREP(registerUnconsciousCondition);
PREP(setCaptiveSwitch);
PREP(moveToTempGroup);
PREP(canGoUnconsciousState);
PREP(setWeaponsCorrectUnconscious);

PREP(effectPain);
PREP(effectBleeding);
PREP(effectBlackOut);

PREP(limitMovementSpeed);
PREP(limitSpeed);

PREP(setArrestState);
PREP(isArrested);

PREP(loadPerson_F);
PREP(loadPersonLocal_F);
PREP(makeCopyOfBody_F);
PREP(makeCopyOfBodyLocal_F);
PREP(unloadPerson_F);
PREP(cleanUpCopyOfBody_F);

