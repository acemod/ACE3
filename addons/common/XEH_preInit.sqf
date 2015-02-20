// by commy2
#include "script_component.hpp"

ADDON = false;

// ACE Common Function
PREP(addActionEventHandler);
PREP(addActionMenuEventHandler);
PREP(addCameraEventHandler);
PREP(addCustomEventHandler);
PREP(addLineToDebugDraw);
PREP(addMapMarkerCreatedEventHandler);
PREP(addScrollWheelEventHandler);
PREP(addSetting);
PREP(adminKick);
PREP(ambientBrightness);
PREP(applyForceWalkStatus);
PREP(binarizeNumber);
PREP(callCustomEventHandlers);
PREP(callCustomEventHandlersGlobal);
PREP(canGetInPosition);
PREP(canInteractWith);
PREP(canUseWeapon);
PREP(changeProjectileDirection);
PREP(checkPBOs);
PREP(claim);
PREP(closeDialogIfTargetMoves);
PREP(codeToLetter);
PREP(codeToString);
PREP(convertKeyCode);
PREP(createOrthonormalReference);
PREP(currentChannel);
PREP(disableUserInput);
PREP(displayText);
PREP(displayTextPicture);
PREP(displayTextStructured);
PREP(doAnimation);
PREP(endRadioTransmission);
PREP(execNextFrame);
PREP(execPersistentFnc);
PREP(execRemoteFnc);
PREP(executePersistent);
PREP(filter);
PREP(fixLoweredRifleAnimation);
PREP(getAllGear);
PREP(getCaptivityStatus);
PREP(getConfigCommander);
PREP(getConfigGunner);
PREP(getDefaultAnim);
PREP(getDoorTurrets);
PREP(getForceWalkStatus);
PREP(getGunner);
PREP(getHitPoints);
PREP(getHitPointsWithSelections);
PREP(getInPosition);
PREP(getMarkerType);
PREP(getName);
PREP(getNumberFromMissionSQM);
PREP(getPitchBankYaw);
PREP(getSettingData);
PREP(getStringFromMissionSQM);
PREP(getTargetAzimuthAndInclination);
PREP(getTargetDistance);
PREP(getTargetObject);
PREP(getTurretCommander);
PREP(getTurretConfigPath);
PREP(getTurretCopilot);
PREP(getTurretGunner);
PREP(getTurretIndex);
PREP(getTurrets);
PREP(getTurretsFFV);
PREP(getTurretsOther);
PREP(getUavControlPosition);
PREP(getVehicleCargo);
PREP(getVehicleCodriver);
PREP(getVehicleCrew);
PREP(getWeaponAzimuthAndInclination);
PREP(getWeaponIndex);
PREP(getWeaponType);
PREP(getWindDirection);
PREP(goKneeling);
PREP(hadamardProduct);
PREP(interpolateFromArray);
PREP(inTransitionAnim);
PREP(isAutoWind);
PREP(isEngineer);
PREP(isEOD);
PREP(isInBuilding);
PREP(isPlayer);
PREP(isTurnedOut);
PREP(letterToCode);
PREP(loadSettingsFromProfile);
PREP(loadSettingsOnServer);
PREP(map);
PREP(moduleCheckPBOs);
PREP(moduleLSDVehicles);
PREP(muteUnit);
PREP(numberToDigits);
PREP(numberToDigitsString);
PREP(onLoadRscDisplayChannel);
PREP(owned);
PREP(player);
PREP(playerSide);
PREP(progressBar);
PREP(queueAnimation);
PREP(readSettingFromModule);
PREP(removeActionEventHandler);
PREP(removeActionMenuEventHandler);
PREP(removeCameraEventHandler);
PREP(removeCustomEventHandler);
PREP(removeMapMarkerCreatedEventHandler);
PREP(removeScrollWheelEventHandler);
PREP(removeSpecificMagazine);
PREP(restoreVariablesJIP);
PREP(revertKeyCodeLocalized);
PREP(sanitizeString);
PREP(serverLog);
PREP(setCaptivityStatus);
PREP(setForceWalkStatus);
PREP(setName);
PREP(setParameter);
PREP(setPitchBankYaw);
PREP(setVariableJIP);
PREP(setVariablePublic);
PREP(setSetting);
PREP(setSettingFromConfig);
PREP(stringToColoredText);
PREP(subString);
PREP(toBin);
PREP(toBitmask);
PREP(toHex);
PREP(toNumber);
PREP(throttledPublicVariable);
PREP(unmuteUnit);
PREP(waitAndExecute);

// ACE_Debug
PREP(exportConfig);
PREP(getChildren);
PREP(getDisplayConfigName);
PREP(log);
PREP(logControls);
PREP(logDisplays);
PREP(monitor);
PREP(showUser);

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

// Load settings
if (isServer) then {
    call FUNC(loadSettingsOnServer);
};

ACE_player = player;

if (hasInterface) then {
    // PFH to update the ACE_player variable
    [{
        if !(ACE_player isEqualTo (missionNamespace getVariable ["BIS_fnc_moduleRemoteControl_unit", player])) then {
            _oldPlayer = ACE_player;

            ACE_player = missionNamespace getVariable ["BIS_fnc_moduleRemoteControl_unit", player];
            uiNamespace setVariable ["ACE_player", ACE_player];

            // Raise custom event. @todo, remove
            [missionNamespace, "playerChanged", [ACE_player, _oldPlayer]] call FUNC(callCustomEventHandlers);
            // Raise ACE event
            ["playerChanged", [ACE_player, _oldPlayer]] call FUNC(localEvent);
        };
    }, 0, []] call cba_fnc_addPerFrameHandler;
};

PREP(stringCompare);
PREP(string_removeWhiteSpace);
PREP(isHC);
PREP(sendRequest_f);
PREP(requestCallback);
PREP(receiveRequest);
PREP(onAnswerRequest);
PREP(debug);
PREP(debugModule);
PREP(defineVariable);
PREP(setDefinedVariable);
PREP(getDefinedVariable);
PREP(getAllDefinedSetVariables);
PREP(getDefinedVariableInfo);
PREP(getDefinedVariableDefault);
PREP(getDeathAnim);
PREP(insertionSort);
PREP(uniqueElementsOnly);
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

PREP(isAwake);
PREP(setProne);

PREP(setDisableUserInputStatus);

PREP(dropWeapon_f);
PREP(inWater_f);
PREP(setVolume_f);
PREP(closeAllDialogs_f);
PREP(disableAI_f);
PREP(switchToGroupSide_f);
PREP(getFirstObjectIntersection);
PREP(getFirstTerrainIntersection);
PREP(setHearingCapability);
PREP(revealObject_f);
PREP(getWeaponItems_f);
PREP(isModLoaded_f);
PREP(inheritsFrom);
PREP(getVersion);
PREP(carryObj);
PREP(carriedByObj);
PREP(getCarriedObj);
PREP(getCarriedBy);
PREP(beingCarried);
PREP(setCarriedBy);


PREP(moveToTempGroup);


PREP(limitMovementSpeed);
PREP(setArrestState);
PREP(isArrested);
PREP(loadPerson_F);
PREP(loadPersonLocal_F);
PREP(unloadPerson_F);


ADDON = true;
