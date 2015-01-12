// by commy2
#include "script_component.hpp"

// ACE Core Function
PREPF(addActionEventHandler);
PREPF(addActionMenuEventHandler);
PREPF(addCameraEventHandler);
PREPF(addCustomEventHandler);
PREPF(addInfoDisplayEventHandler);
PREPF(addMapMarkerCreatedEventHandler);
PREPF(addInventoryDisplayLoadedEventHandler);
PREPF(addScrollWheelEventHandler);
PREPF(adminKick);
PREPF(ambientBrightness);
PREPF(applyForceWalkStatus);
PREPF(binarizeNumber);
PREPF(callCustomEventHandlers);
PREPF(callCustomEventHandlersGlobal);
PREPF(canGetInPosition);
PREPF(canInteractWith);
PREPF(canUseWeapon);
PREPF(changeProjectileDirection);
PREPF(checkPBOs);
PREPF(claim);
PREPF(closeDialogIfTargetMoves);
PREPF(codeToLetter);
PREPF(codeToString);
PREPF(convertKeyCode);
PREPF(currentChannel);
PREPF(disableUserInput);
PREPF(displayText);
PREPF(displayTextPicture);
PREPF(displayTextStructured);
PREPF(doAnimation);
PREPF(endRadioTransmission);
PREPF(execPersistentFnc);
PREPF(execRemoteFnc);
PREPF(executePersistent);
PREPF(filter);
PREPF(fixLoweredRifleAnimation);
PREPF(getCaptivityStatus);
PREPF(getConfigCommander);
PREPF(getConfigGunner);
PREPF(getDefaultAnim);
PREPF(getDoorTurrets);
PREPF(getForceWalkStatus);
PREPF(getHitPoints);
PREPF(getHitPointsWithSelections);
PREPF(getInPosition);
PREPF(getMarkerType);
PREPF(getName);
PREPF(getNumberFromMissionSQM);
PREPF(getPitchBankYaw);
PREPF(getStringFromMissionSQM);
PREPF(getTargetAzimuthAndInclination);
PREPF(getTargetDistance);
PREPF(getTargetObject);
PREPF(getTurretCommander);
PREPF(getTurretConfigPath);
PREPF(getTurretCopilot);
PREPF(getTurretGunner);
PREPF(getTurretIndex);
PREPF(getTurrets);
PREPF(getTurretsFFV);
PREPF(getTurretsOther);
PREPF(getUavControlPosition);
PREPF(getVehicleCargo);
PREPF(getVehicleCodriver);
PREPF(getVehicleCrew);
PREPF(getWeaponAzimuthAndInclination);
PREPF(getWeaponType);
PREPF(getWindDirection);
PREPF(goKneeling);
PREPF(hadamardProduct);
PREPF(interpolateFromArray);
PREPF(inTransitionAnim);
PREPF(isAutoWind);
PREPF(isEngineer);
PREPF(isEOD);
PREPF(isInBuilding);
PREPF(isMedic);
PREPF(isPlayer);
PREPF(isTurnedOut);
PREPF(letterToCode);
PREPF(map);
PREPF(moduleCheckPBOs);
PREPF(moduleLSDVehicles);
PREPF(muteUnit);
PREPF(numberToDigits);
PREPF(numberToDigitsString);
PREPF(onLoadRscDisplayChannel);
PREPF(owned);
PREPF(player);
PREPF(playerSide);
PREPF(progressBar);
PREPF(queueAnimation);
PREPF(readBooleanParameterFromModule);
PREPF(readNumericParameterFromModule);
PREPF(removeActionEventHandler);
PREPF(removeActionMenuEventHandler);
PREPF(removeCameraEventHandler);
PREPF(removeCustomEventHandler);
PREPF(removeInfoDisplayEventHandler);
PREPF(removeInventoryDisplayLoadedEventHandler);
PREPF(removeMapMarkerCreatedEventHandler);
PREPF(removeScrollWheelEventHandler);
PREPF(restoreVariablesJIP);
PREPF(revertKeyCodeLocalized);
PREPF(sanitizeString);
PREPF(serverLog);
PREPF(setCaptivityStatus);
PREPF(setForceWalkStatus);
PREPF(setKeyDefault);
PREPF(setName);
PREPF(setParameter);
PREPF(setPitchBankYaw);
PREPF(setVariableJIP);
PREPF(stringToColoredText);
PREPF(subString);
PREPF(toBin);
PREPF(toBitmask);
PREPF(toHex);
PREPF(toNumber);
PREPF(unmuteUnit);

// ACE_Debug
PREPF(exportConfig);
PREPF(getChildren);
PREPF(getDisplayConfigName);
PREPF(log);
PREPF(logControls);
PREPF(logDisplays);
PREPF(monitor);
PREPF(showUser);

// ACE_CuratorFix
PREPF(addUnloadEventhandler);
PREPF(fixCrateContent);

// Loop to update the ACE_player variable
ACE_player = player;
if (hasInterface) then {
	["ACE_CheckForPlayerChange", "onEachFrame", {
		if !(ACE_player isEqualTo (missionNamespace getVariable ["BIS_fnc_moduleRemoteControl_unit", player])) then {
			_this = ACE_player;

			ACE_player = missionNamespace getVariable ["BIS_fnc_moduleRemoteControl_unit", player];
			uiNamespace setVariable ["ACE_player", ACE_player];

			[missionNamespace, "playerChanged", [ACE_player, _this]] call FUNC(callCustomEventHandlers);
		};
	}] call BIS_fnc_addStackedEventHandler;
};
