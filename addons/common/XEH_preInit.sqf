// by commy2
#include "script_component.hpp"

ADDON = false;

PREP(addCanInteractWithCondition);
PREP(addLineToDebugDraw);
PREP(addSetting);
PREP(addToInventory);
PREP(assignedItemFix);
PREP(assignObjectsInList);
PREP(ambientBrightness);
PREP(applyForceWalkStatus);
PREP(ASLToPosition);
PREP(binarizeNumber);
PREP(blurScreen);
PREP(cachedCall);
PREP(canGetInPosition);
PREP(canInteractWith);
PREP(canUseWeapon);
PREP(changeProjectileDirection);
PREP(checkFiles);
PREP(checkPBOs);
PREP(claim);
PREP(codeToLetter);
PREP(codeToString);
PREP(createOrthonormalReference);
PREP(currentChannel);
PREP(debug);
PREP(debugModule);
PREP(defineVariable);
PREP(deviceKeyFindValidIndex);
PREP(deviceKeyRegisterNew);
PREP(disableAI);
PREP(disableUserInput);
PREP(displayIcon);
PREP(displayText);
PREP(displayTextPicture);
PREP(displayTextStructured);
PREP(doAnimation);
PREP(dropBackpack);
PREP(endRadioTransmission);
PREP(eraseCache);
PREP(errorMessage);
PREP(execNextFrame);
PREP(execPersistentFnc);
PREP(execRemoteFnc);
PREP(executePersistent);
PREP(filter);
PREP(fixCollision);
PREP(fixFloating);
PREP(fixLoweredRifleAnimation);
PREP(fixPosition);
PREP(getAllDefinedSetVariables);
PREP(getAllGear);
PREP(getCaptivityStatus);
PREP(getDeathAnim);
PREP(getDefaultAnim);
PREP(getDefinedVariable);
PREP(getDefinedVariableDefault);
PREP(getDefinedVariableInfo);
PREP(getFirstObjectIntersection);
PREP(getFirstTerrainIntersection);
PREP(getForceWalkStatus);
PREP(getGunner);
PREP(getInPosition);
PREP(getMapGridData);
PREP(getMapGridFromPos);
PREP(getMapPosFromGrid);
PREP(getMarkerType);
PREP(getMGRSdata);
PREP(getName);
PREP(getNumberFromMissionSQM);
PREP(getNumberMagazinesIn);
PREP(getPitchBankYaw);
PREP(getSettingData);
PREP(getStringFromMissionSQM);
PREP(getTargetAzimuthAndInclination);
PREP(getTargetDistance);
PREP(getTargetObject);
PREP(getTurnedOnLights);
PREP(getTurretDirection);
PREP(getUavControlPosition);
PREP(getVehicleCargo);
PREP(getVehicleCodriver);
PREP(getVersion);
PREP(getWeaponAzimuthAndInclination);
PREP(getWeaponIndex);
PREP(getWeaponState);
PREP(getWindDirection);
PREP(getZoom);
PREP(goKneeling);
PREP(hadamardProduct);
PREP(handleScrollWheel);
PREP(handleScrollWheelInit);
PREP(hasItem);
PREP(hasMagazine);
PREP(headBugFix);
PREP(hideUnit);
PREP(inheritsFrom);
PREP(insertionSort);
PREP(interpolateFromArray);
PREP(inTransitionAnim);
PREP(inWater);
PREP(isAlive);
PREP(isAutoWind);
PREP(isAwake);
PREP(isEngineer);
PREP(isEOD);
PREP(isFeatureCameraActive);
PREP(isInBuilding);
PREP(isModLoaded);
PREP(isPlayer);
PREP(isTurnedOut);
PREP(letterToCode);
PREP(lightIntensityFromObject);
PREP(loadPerson);
PREP(loadPersonLocal);
PREP(loadSettingsFromProfile);
PREP(loadSettingsOnServer);
PREP(loadSettingsLocalizedText);
PREP(map);
PREP(moduleCheckPBOs);
PREP(moduleLSDVehicles);
PREP(muteUnit);
PREP(muteUnitHandleInitPost);
PREP(muteUnitHandleRespawn);
PREP(numberToDigits);
PREP(numberToDigitsString);
PREP(numberToString);
PREP(onAnswerRequest);
PREP(owned);
PREP(parseList);
PREP(player);
PREP(playerSide);
PREP(positionToASL);
PREP(progressBar);
PREP(readSettingFromModule);
PREP(receiveRequest);
PREP(removeCanInteractWithCondition);
PREP(removeSpecificMagazine);
PREP(requestCallback);
PREP(resetAllDefaults);
PREP(restoreVariablesJIP);
PREP(runAfterSettingsInit);
PREP(sanitizeString);
PREP(sendRequest);
PREP(serverLog);
PREP(setCaptivityStatus);
PREP(setDefinedVariable);
PREP(setDisableUserInputStatus);
PREP(setForceWalkStatus);
PREP(setHearingCapability);
PREP(setName);
PREP(setParameter);
PREP(setPitchBankYaw);
PREP(setProne);
PREP(setSetting);
PREP(setSettingFromConfig);
PREP(setVariableJIP);
PREP(setVariablePublic);
PREP(setVolume);
PREP(sortAlphabeticallyBy);
PREP(stringCompare);
PREP(stringToColoredText);
PREP(stringRemoveWhiteSpace);
PREP(switchToGroupSide);
PREP(throttledPublicVariable);
PREP(toBin);
PREP(toBitmask);
PREP(toHex);
PREP(toNumber);
PREP(unhideUnit);
PREP(uniqueElements);
PREP(uniqueElementsOnly);
PREP(unloadPerson);
PREP(unloadPersonLocal);
PREP(unmuteUnit);
PREP(useItem);
PREP(useMagazine);
PREP(waitAndExecute);
PREP(waveHeightAt);

PREP(translateToWeaponSpace);
PREP(translateToModelSpace);

// Model and drawing helpers
PREP(worldToScreenBounds);

// config items
PREP(getConfigType);
PREP(getItemType);
PREP(getWeaponType);
PREP(getWeaponModes);
PREP(getWeaponMuzzles);

// config objects
PREP(getConfigTypeObject);
PREP(getConfigGunner);
PREP(getConfigCommander);
PREP(getHitPoints);
PREP(getHitPointsWithSelections);
PREP(getSelectionsWithoutHitPoints);
PREP(getReflectorsWithSelections);
PREP(getLightProperties);
PREP(getLightPropertiesWeapon);
PREP(getVehicleCrew);

// turrets
PREP(getTurrets);
PREP(getTurretIndex);
PREP(getTurretConfigPath);
PREP(getTurretGunner);
PREP(getTurretCommander);
PREP(getTurretCopilot);
PREP(getDoorTurrets);
PREP(getTurretsFFV);
PREP(getTurretsOther);

// ACE_Debug
PREP(exportConfig);
PREP(getChildren);
PREP(getDisplayConfigName);
PREP(monitor);
PREP(showUser);

PREP(dumpPerformanceCounters);
PREP(dumpArray);

// ACE_CuratorFix
PREP(addCuratorUnloadEventhandler);
PREP(fixCrateContent);

//ACE events global variables
GVAR(events) = [[],[]];

PREP(globalEvent);
PREP(_handleNetEvent);
PREP(addEventHandler);
PREP(targetEvent);
PREP(serverEvent);
PREP(localEvent);
PREP(removeEventHandler);
PREP(removeAlLEventHandlers);

// Synchronized Events
PREP(syncedEventPFH);
PREP(addSyncedEventHandler);
PREP(removeSyncedEventHandler);
PREP(requestSyncedEvent);
PREP(syncedEvent);

PREP(_handleSyncedEvent);
PREP(_handleRequestSyncedEvent);
PREP(_handleRequestAllSyncedEvents);

// other eventhandlers
PREP(addActionEventHandler);
PREP(addActionMenuEventHandler);
PREP(addScrollWheelEventHandler);
PREP(addMapMarkerCreatedEventHandler);

PREP(removeActionEventHandler);
PREP(removeActionMenuEventHandler);
PREP(removeScrollWheelEventHandler);
PREP(removeMapMarkerCreatedEventHandler);

// hashes
PREP(hashCreate);
PREP(hashSet);
PREP(hashGet);
PREP(hashHasKey);
PREP(hashRem);
PREP(hashListCreateList);
PREP(hashListCreateHash);
PREP(hashListSelect);
PREP(hashListSet);
PREP(hashListPush);

GVAR(syncedEvents) = HASH_CREATE;

//GVARS for execNextFrame and waitAndExec
GVAR(waitAndExecArray) = [];
GVAR(nextFrameNo) = diag_frameno;
GVAR(nextFrameBufferA) = [];
GVAR(nextFrameBufferB) = [];

GVAR(settingsInitFinished) = false;
GVAR(runAtSettingsInitialized) = [];

// @todo: Generic local-managed global-synced objects (createVehicleLocal)

//Debug
ACE_COUNTERS = [];

// Load settings on the server and broadcast them
if (isServer) then {
    call FUNC(loadSettingsOnServer);
};


//////////////////////////////////////////////////
// Set up PlayerChanged eventhandler for pre init
//////////////////////////////////////////////////

ACE_player = objNull;
uiNamespace setVariable ["ACE_player", objNull];

// @todo check if this can be removed
if (hasInterface) then {
    // PFH to update the ACE_player variable
    GVAR(PreInit_playerChanged_PFHID) = [{
        if !(ACE_player isEqualTo (call FUNC(player))) then {
            private ["_oldPlayer"];
            _oldPlayer = ACE_player;

            ACE_player = call FUNC(player);
            uiNamespace setVariable ["ACE_player", ACE_player];

            // Raise ACE event
            ["playerChanged", [ACE_player, _oldPlayer]] call FUNC(localEvent);
        };
    }, 0, []] call CBA_fnc_addPerFrameHandler;
};


//////////////////////////////////////////////////
// Time handling
//////////////////////////////////////////////////

ACE_time = diag_tickTime;
ACE_realTime = diag_tickTime;
ACE_virtualTime = diag_tickTime;
ACE_diagTime = diag_tickTime;
ACE_gameTime = time;
ACE_pausedTime = 0;
ACE_virtualPausedTime = 0;

PREP(timePFH);
[FUNC(timePFH), 0, []] call CBA_fnc_addPerFrameHandler;

// Init toHex
[0] call FUNC(toHex);

isHC = !hasInterface && !isDedicated; // deprecated because no tag
missionNamespace setVariable ["ACE_isHC", ACE_isHC];
uiNamespace setVariable ["ACE_isHC", ACE_isHC];

ADDON = true;
