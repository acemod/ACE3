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
PREP(beingCarried);
PREP(binarizeNumber);
PREP(blurScreen);
PREP(callCustomEventHandlers);
PREP(callCustomEventHandlersGlobal);
PREP(canGetInPosition);
PREP(canInteract);
PREP(canInteractWith);
PREP(canUseWeapon);
PREP(carriedByObj);
PREP(carryObj);
PREP(changeProjectileDirection);
PREP(checkPBOs);
PREP(claim);
PREP(closeDialogIfTargetMoves);
PREP(codeToLetter);
PREP(codeToString);
PREP(convertKeyCode);
PREP(createOrthonormalReference);
PREP(currentChannel);
PREP(debug);
PREP(debugModule);
PREP(defineVariable);
PREP(disableAI);
PREP(disableUserInput);
PREP(displayIcon);
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
PREP(getAllDefinedSetVariables);
PREP(getAllGear);
PREP(getCaptivityStatus);
PREP(getCarriedBy);
PREP(getCarriedObj);
PREP(getConfigCommander);
PREP(getConfigGunner);
PREP(getDeathAnim);
PREP(getDefaultAnim);
PREP(getDefinedVariable);
PREP(getDefinedVariableDefault);
PREP(getDefinedVariableInfo);
PREP(getDoorTurrets);
PREP(getFirstObjectIntersection);
PREP(getFirstTerrainIntersection);
PREP(getForceWalkStatus);
PREP(getGunner);
PREP(getHitPoints);
PREP(getHitPointsWithSelections);
PREP(getInPosition);
PREP(getMarkerType);
PREP(getName);
PREP(getNumberFromMissionSQM);
PREP(getNumberMagazinesIn);
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
PREP(getVersion);
PREP(getWeaponAzimuthAndInclination);
PREP(getWeaponIndex);
PREP(getWeaponType);
PREP(getWindDirection);
PREP(goKneeling);
PREP(hadamardProduct);
PREP(hasItem);
PREP(hasMagazine);
PREP(inheritsFrom);
PREP(insertionSort);
PREP(interpolateFromArray);
PREP(inTransitionAnim);
PREP(inWater);
PREP(isArrested);
PREP(isAutoWind);
PREP(isAwake);
PREP(isEngineer);
PREP(isEOD);
PREP(isInBuilding);
PREP(isModLoaded);
PREP(isPlayer);
PREP(isTurnedOut);
PREP(letterToCode);
PREP(limitMovementSpeed);
PREP(loadPerson);
PREP(loadPersonLocal);
PREP(loadSettingsFromProfile);
PREP(loadSettingsOnServer);
PREP(map);
PREP(moduleCheckPBOs);
PREP(moduleLSDVehicles);
PREP(moveToTempGroup);
PREP(muteUnit);
PREP(numberToDigits);
PREP(numberToDigitsString);
PREP(onAnswerRequest);
PREP(onLoadRscDisplayChannel);
PREP(owned);
PREP(player);
PREP(playerSide);
PREP(progressBar);
PREP(queueAnimation);
PREP(readSettingFromModule);
PREP(receiveRequest);
PREP(removeActionEventHandler);
PREP(removeActionMenuEventHandler);
PREP(removeCameraEventHandler);
PREP(removeCustomEventHandler);
PREP(removeMapMarkerCreatedEventHandler);
PREP(removeScrollWheelEventHandler);
PREP(requestCallback);
PREP(resetAllDefaults);
PREP(restoreVariablesJIP);
PREP(revertKeyCodeLocalized);
PREP(sanitizeString);
PREP(sendRequest);
PREP(serverLog);
PREP(setArrestState);
PREP(setCanInteract);
PREP(setCaptivityStatus);
PREP(setCarriedBy);
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
PREP(subString);
PREP(switchToGroupSide);
PREP(throttledPublicVariable);
PREP(toBin);
PREP(toBitmask);
PREP(toHex);
PREP(toNumber);
PREP(uniqueElementsOnly);
PREP(unloadPerson);
PREP(unmuteUnit);
PREP(useItem);
PREP(useMagazine);
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

ADDON = true;

isHC = !(hasInterface || isDedicated);
