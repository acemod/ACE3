// ACE - Common
// #define ENABLE_PERFORMANCE_COUNTERS
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

//////////////////////////////////////////////////
// Get Map Data
//////////////////////////////////////////////////

//Find MGRS zone and 100km grid for current map
[] call FUNC(getMGRSdata);
//Prepare variables for FUNC(getMapGridFromPos)/FUNC(getMapPosFromGrid)
[] call FUNC(getMapGridData);


//////////////////////////////////////////////////
// Eventhandlers
//////////////////////////////////////////////////

//Status Effect EHs:
[QGVAR(setStatusEffect), LINKFUNC(statusEffect_set)] call CBA_fnc_addEventHandler;
["forceWalk", false, ["ace_advanced_fatigue", "ace_attach", "ace_dragging", "ace_explosives", QEGVAR(medical,fracture), "ace_rearm", "ace_refuel", "ace_sandbag", "ace_switchunits", "ace_tacticalladder", "ace_trenches"]] call FUNC(statusEffect_addType);
["blockSprint", false, ["ace_advanced_fatigue", "ace_dragging", QEGVAR(medical,fracture)]] call FUNC(statusEffect_addType);
["setCaptive", true, [QEGVAR(captives,handcuffed), QEGVAR(captives,surrendered)]] call FUNC(statusEffect_addType);
["blockDamage", false, ["fixCollision", "ace_cargo"]] call FUNC(statusEffect_addType);
["blockEngine", false, ["ace_refuel"]] call FUNC(statusEffect_addType);
["blockThrow", false, ["ace_attach", "ace_concertina_wire", "ace_dragging", "ace_explosives", "ace_rearm", "ace_refuel", "ace_sandbag", "ace_tacticalladder", "ace_trenches", "ace_tripod"]] call FUNC(statusEffect_addType);
["setHidden", true, ["ace_unconscious"]] call FUNC(statusEffect_addType);
["blockRadio", false, [QEGVAR(captives,handcuffed), QEGVAR(captives,surrendered), "ace_unconscious"]] call FUNC(statusEffect_addType);
["blockSpeaking", false, ["ace_unconscious"]] call FUNC(statusEffect_addType);
["disableWeaponAssembly", false, ["ace_common", QGVAR(lockVehicle), "ace_csw"]] call FUNC(statusEffect_addType);
["lockInventory", true, [], true] call FUNC(statusEffect_addType);
["disableCollision", true, [], true] call FUNC(statusEffect_addType);

[QGVAR(forceWalk), {
    params ["_object", "_set"];
    TRACE_2("forceWalk EH",_object,_set);
    _object forceWalk (_set > 0);
}] call CBA_fnc_addEventHandler;

[QGVAR(blockSprint), { //Name reversed from `allowSprint` because we want NOR logic
    params ["_object", "_set"];
    TRACE_2("blockSprint EH",_object,_set);
    _object allowSprint (_set == 0);
}] call CBA_fnc_addEventHandler;

[QGVAR(setAnimSpeedCoef), {
    params ["_object", "_set"];
    _object setAnimSpeedCoef _set;
}] call CBA_fnc_addEventHandler;

[QGVAR(setCaptive), {
    params ["_object", "_set"];
    TRACE_2("setCaptive EH",_object,_set);
    _object setCaptive (_set > 0);
}] call CBA_fnc_addEventHandler;

[QGVAR(setHidden), {
    params ["_object", "_set"];
    TRACE_2("setHidden EH",_object,_set);
    // May report nil. Default to factor 1.
    private _vis = [_object getUnitTrait "camouflageCoef"] param [0, 1];
    if (_set > 0) then {
        if (_vis != 0) then {
            _object setVariable [QGVAR(oldVisibility), _vis];
            _object setUnitTrait ["camouflageCoef", 0];
            {
                if (side _x != side group _object) then {
                    _x forgetTarget _object;
                };
            } forEach allGroups;
        };
    } else {
        _vis = _object getVariable [QGVAR(oldVisibility), _vis];
        _object setUnitTrait ["camouflageCoef", _vis];
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(blockRadio), {
    params ["_object", "_set"];
    TRACE_2("blockRadio EH",_object,_set);
    if (_object isEqualTo ACE_Player && {_set > 0}) then {
        call FUNC(endRadioTransmission);
    };
    if (["task_force_radio"] call FUNC(isModLoaded)) then {
        _object setVariable ["tf_unable_to_use_radio", _set > 0, true];
    };
    if (["acre_main"] call FUNC(isModLoaded)) then {
        _object setVariable ["acre_sys_core_isDisabledRadio", _set > 0, true];
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(blockSpeaking), {
    params ["_object", "_set"];
    TRACE_2("blockSpeaking EH",_object,_set);
    if (["acre_main"] call FUNC(isModLoaded)) then {
        _object setVariable ["acre_sys_core_isDisabled", _set > 0, true];
    };
    if (["task_force_radio"] call FUNC(isModLoaded)) then {
        _object setVariable ["tf_voiceVolume", parseNumber (_set == 0), true];
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(blockDamage), { //Name reversed from `allowDamage` because we want NOR logic
    params ["_object", "_set"];
    if ((_object isKindOf "CAManBase") && {(["ace_medical"] call FUNC(isModLoaded))}) then {
        TRACE_2("blockDamage EH (using medical)",_object,_set);
       _object setVariable [QEGVAR(medical,allowDamage), (_set == 0), true];
    } else {
        TRACE_2("blockDamage EH (using allowDamage)",_object,_set);
       _object allowDamage (_set == 0);
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(blockEngine), {
    params ["_vehicle", "_set"];
    _vehicle setVariable [QGVAR(blockEngine), _set > 0, true];
    _vehicle engineOn false;
}] call CBA_fnc_addEventHandler;

[QGVAR(setMass), {
    params ["_object", "_mass"];
    _object setMass _mass;
}] call CBA_fnc_addEventHandler;

[QGVAR(disableWeaponAssembly), {
    params ["_object", "_set"];
    _object enableWeaponDisassembly (_set < 1);
}] call CBA_fnc_addEventHandler;

[QGVAR(lockInventory), {
    params ["_object", "_set"];
    TRACE_2("lockInventory EH",_object,_set);
    _object lockInventory (_set > 0);
}] call CBA_fnc_addEventHandler;

[QGVAR(disableCollision), { // Name "reversed" from `setPhysicsCollisionFlag` because we want NOR logic
    params ["_object", "_set"];
    TRACE_2("disableCollision EH",_object,_set);
    _object setPhysicsCollisionFlag (_set < 1);
}] call CBA_fnc_addEventHandler;

[QGVAR(disableAiUAV), {
    params ["_unit", "_disable"];

    if (_disable) then {
        private _features = ["AUTOTARGET", "TARGET", "WEAPONAIM", "FIREWEAPON", "RADIOPROTOCOL"];

        // Save current status
        _unit setVariable [QGVAR(featuresAiUAV), _features apply {[_x, _unit checkAIFeature _x]}];

        {
            _unit enableAIFeature [_x, false];
        } forEach _features;
    } else {
        // Restore previous status
        private _features = _unit getVariable [QGVAR(featuresAiUAV), []];

        {
            _unit enableAIFeature [_x select 0, _x select 1];
        } forEach _features;

        _unit setVariable [QGVAR(featuresAiUAV), nil];
    };
}] call CBA_fnc_addEventHandler;

//Add a fix for BIS's zeus remoteControl module not reseting variables on DC when RC a unit
//This variable is used for isPlayer checks
if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {
        params ["_dcPlayer"];
        private _zeusLogic = getAssignedCuratorLogic _dcPlayer;
        if ((!isNil "_zeusLogic") && {!isNull _zeusLogic}) then {
            {
                if ((_x getVariable ["bis_fnc_moduleRemoteControl_owner", objNull]) isEqualTo _dcPlayer) exitWith {
                    INFO_3("[%1] DC - Was Zeus [%2] while controlling unit [%3] - manually clearing `bis_fnc_moduleRemoteControl_owner`",[_x] call FUNC(getName),_dcPlayer,_x);
                    _x setVariable ["bis_fnc_moduleRemoteControl_owner", nil, true];
                };
            } forEach (curatorEditableObjects _zeusLogic);
        };
    }];
};

// Event to log Fix Headbug output
[QGVAR(headbugFixUsed), {
    params ["_profileName", "_animation"];
    INFO_2("Headbug Used: Name: %1, Animation: %2",_profileName,_animation);
}] call CBA_fnc_addEventHandler;

[QGVAR(fixCollision), LINKFUNC(fixCollision)] call CBA_fnc_addEventHandler;
[QGVAR(fixFloating), LINKFUNC(fixFloating)] call CBA_fnc_addEventHandler;
[QGVAR(fixPosition), LINKFUNC(fixPosition)] call CBA_fnc_addEventHandler;

["ace_loadPersonEvent", LINKFUNC(loadPersonLocal)] call CBA_fnc_addEventHandler;
["ace_unloadPersonEvent", LINKFUNC(unloadPersonLocal)] call CBA_fnc_addEventHandler;

[QGVAR(lockVehicle), {
    _this setVariable [QGVAR(lockStatus), locked _this];
    _this lock 2;
    if ([] isNotEqualTo getArray (configOf _this >> "assembleInfo" >> "dissasembleTo")) then {
        [_this, "disableWeaponAssembly", QGVAR(lockVehicle), true] call FUNC(statusEffect_set);
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(unlockVehicle), {
    _this lock (_this getVariable [QGVAR(lockStatus), locked _this]);
    if ([] isNotEqualTo getArray (configOf _this >> "assembleInfo" >> "dissasembleTo")) then {
        [_this, "disableWeaponAssembly", QGVAR(lockVehicle), false] call FUNC(statusEffect_set);
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(setDir), {(_this select 0) setDir (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(setFuel), {(_this select 0) setFuel (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(engineOn), {(_this select 0) engineOn (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(setSpeaker), {(_this select 0) setSpeaker (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(selectLeader), {(_this select 0) selectLeader (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(setVelocity), {(_this select 0) setVelocity (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(playMove), {(_this select 0) playMove (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(playMoveNow), {(_this select 0) playMoveNow (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(playAction), {(_this select 0) playAction (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(playActionNow), {(_this select 0) playActionNow (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(switchMove), {(_this select 0) switchMove (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(setVectorDirAndUp), {(_this select 0) setVectorDirAndUp (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(addWeaponItem), {(_this select 0) addWeaponItem [(_this select 1), (_this select 2)]}] call CBA_fnc_addEventHandler;
[QGVAR(addMagazineTurret), {(_this select 0) addMagazineTurret (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(removeMagazineTurret), {(_this select 0) removeMagazineTurret [_this select 1, _this select 2]}] call CBA_fnc_addEventHandler;
[QGVAR(removeMagazinesTurret), {(_this select 0) removeMagazinesTurret [_this select 1, _this select 2]}] call CBA_fnc_addEventHandler;
[QGVAR(setMagazineTurretAmmo), {(_this select 0) setMagazineTurretAmmo [_this select 1, _this select 2, _this select 3]}] call CBA_fnc_addEventHandler;
[QGVAR(triggerAmmo), {triggerAmmo _this}] call CBA_fnc_addEventHandler;

[QGVAR(setVanillaHitPointDamage), {
    params ["_object", "_hitPointAnddamage"];
    private _damageDisabled = !isDamageAllowed _object;

    if (_damageDisabled) then {
        _object allowDamage true;
    };

    _object setHitPointDamage _hitPointAnddamage;

    if (_damageDisabled) then {
        _object allowDamage false;
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(systemChatGlobal), {systemChat _this}] call CBA_fnc_addEventHandler;

if (isServer) then {
    [QGVAR(hideObjectGlobal), {(_this select 0) hideObjectGlobal (_this select 1)}] call CBA_fnc_addEventHandler;
    [QGVAR(enableSimulationGlobal), {(_this select 0) enableSimulationGlobal (_this select 1)}] call CBA_fnc_addEventHandler;
    [QGVAR(setShotParents), {(_this select 0) setShotParents [_this select 1, _this select 2]}] call CBA_fnc_addEventHandler;
    ["ace_setOwner", {(_this select 0) setOwner (_this select 1)}] call CBA_fnc_addEventHandler;
    [QGVAR(serverLog), LINKFUNC(serverLog)] call CBA_fnc_addEventHandler;
    [QGVAR(claimSafe), LINKFUNC(claimSafeServer)] call CBA_fnc_addEventHandler;
};

["CBA_SettingChanged", {
    ["ace_settingChanged", _this] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

//////////////////////////////////////////////////
// Set up remote execution
//////////////////////////////////////////////////

// Synced ACE events
// Handle JIP scenario
if (!isServer) then {
    ["ace_playerJIP", {
        INFO("JIP event synchronization initialized");
        ["ACEa", [player]] call CBA_fnc_serverEvent;
    }] call CBA_fnc_addEventHandler;
} else {
    ["ACEa", LINKFUNC(_handleRequestAllSyncedEvents)] call CBA_fnc_addEventHandler;
};

["ACEe", LINKFUNC(_handleSyncedEvent)] call CBA_fnc_addEventHandler;
["ACEs", LINKFUNC(_handleRequestSyncedEvent)] call CBA_fnc_addEventHandler;

if (isServer) then {
    [LINKFUNC(syncedEventPFH), 0.5, []] call CBA_fnc_addPerFrameHandler;
};


//////////////////////////////////////////////////
// Check files, previous installed version etc.
//////////////////////////////////////////////////

private _currentVersion = getText (configFile >> "CfgPatches" >> QUOTE(ADDON) >> "versionStr");
private _previousVersion = profileNamespace getVariable ["ACE_VersionNumberString", ""];

// check previous version number from profile
if (_currentVersion != _previousVersion) then {
    INFO_2("Updating ACE from [%1] to [%2]",_previousVersion,_currentVersion);
    [_previousVersion] call FUNC(cbaSettings_transferUserSettings);
    profileNamespace setVariable ["ACE_VersionNumberString", _currentVersion];
};

call FUNC(checkFiles);


//////////////////////////////////////////////////
// Set up CBA_settingsInitialized eventhandler
//////////////////////////////////////////////////

["CBA_settingsInitialized", {
    [
        GVAR(checkPBOsAction),
        GVAR(checkPBOsCheckAll),
        GVAR(checkPBOsWhitelist)
    ] call FUNC(checkPBOs)
}] call CBA_fnc_addEventHandler;



/***************************************************************************/
/***************************************************************************/
/** everything that only player controlled machines need, goes below this **/
/***************************************************************************/
/***************************************************************************/

if (!hasInterface) exitWith {};

//////////////////////////////////////////////////
// Set up mouse wheel eventhandler
//////////////////////////////////////////////////

call FUNC(assignedItemFix);

// @todo remove?
enableCamShake true;


//FUNC(showHud) needs to be refreshed if it was set during mission init
["ace_infoDisplayChanged", {
    if (GVAR(showHudHash) isNotEqualTo createHashMap) then {
        [] call FUNC(showHud);
    };
}] call CBA_fnc_addEventHandler;


//////////////////////////////////////////////////
// Eventhandler to set player names
//////////////////////////////////////////////////

// Set the name for the current player
["unit", {
    params ["_newPlayer","_oldPlayer"];

    if (alive _newPlayer) then {
        [FUNC(setName), [_newPlayer]] call CBA_fnc_execNextFrame;
    };

    if (alive _oldPlayer) then {
        [FUNC(setName), [_oldPlayer]] call CBA_fnc_execNextFrame;
    };
}, true] call CBA_fnc_addPlayerEventHandler;


//////////////////////////////////////////////////
// Set up numerous eventhanders for player controlled units
//////////////////////////////////////////////////

TRACE_1("adding unit playerEH to set ace_player",isNull cba_events_oldUnit);
["unit", {
    ACE_player = (_this select 0);
}, true] call CBA_fnc_addPlayerEventHandler;

// Clear uniqueItems cache on loadout change
["loadout", {
    GVAR(uniqueItemsCache) = nil;
}] call CBA_fnc_addPlayerEventHandler;

// Backwards compatiblity for old ace event
GVAR(OldIsCamera) = false;
["featureCamera", {
    params ["_player", "_cameraName"];
    GVAR(OldIsCamera) = _cameraName != "";
    ["ace_activeCameraChanged", [_player, GVAR(OldIsCamera)]] call CBA_fnc_localEvent;
}, true] call CBA_fnc_addPlayerEventHandler;

// Update vehicle audio attenuation when player vehicle changes
GVAR(playerVehAttenuation) = 1;
["vehicle", LINKFUNC(updatePlayerVehAttenuation), true] call CBA_fnc_addPlayerEventHandler;
["turret", LINKFUNC(updatePlayerVehAttenuation), false] call CBA_fnc_addPlayerEventHandler;

// Add event handler for UAV control change
ACE_controlledUAV = [objNull, objNull, [], ""];
addMissionEventHandler ["PlayerViewChanged", {
    // On non-server client this command is semi-broken
    // arg index 5 should be the controlled UAV, but it will often be objNull (delay from locality switching?)
    // On PlayerViewChanged event, start polling for new uav state for a few seconds (should be done within a few frames)

    params ["", "", "", "", "_newCameraOn", "_UAV"];
    TRACE_2("PlayerViewChanged",_newCameraOn,_UAV);

    [{
        if (isNull player) exitWith {true};
        private _UAV = getConnectedUAV player;
        if (!alive player) then {_UAV = objNull;};
        private _position = [player] call FUNC(getUavControlPosition);
        private _seatAI = objNull;
        private _turret = [];
        switch (toLowerANSI _position) do {
            case (""): {
                _UAV = objNull; // set to objNull if not actively controlling
            };
            case ("driver"): {
                _turret = [-1];
                _seatAI = driver _UAV;
            };
            case ("gunner"): {
                _turret = [0];
                _seatAI = gunner _UAV;
            };
        };

        private _newArray = [_UAV, _seatAI, _turret, _position];
        if (_newArray isEqualTo ACE_controlledUAV) exitWith {false}; // no change yet

        TRACE_2("Seat Change",_newArray,ACE_controlledUAV);
        ACE_controlledUAV = _newArray;
        ["ACE_controlledUAV", _newArray] call CBA_fnc_localEvent;

        // stay in the loop as we might switch from gunner -> driver, and there may be a empty position event in-between
        false
    }, {}, [], 3, {TRACE_1("timeout",_this);}] call CBA_fnc_waitUntilAndExecute;
}];


//////////////////////////////////////////////////
// Eventhandlers for player controlled machines
//////////////////////////////////////////////////

[QGVAR(displayTextStructured), LINKFUNC(displayTextStructured)] call CBA_fnc_addEventHandler;
[QGVAR(displayTextPicture), LINKFUNC(displayTextPicture)] call CBA_fnc_addEventHandler;

["ace_unconscious", {
    params ["_unit", "_isUnconscious"];

    if (local _unit && {!_isUnconscious}) then {
        [_unit, false, QFUNC(loadPerson), west /* dummy side */] call FUNC(switchToGroupSide);
    };
}] call CBA_fnc_addEventHandler;

["ace_useItem", LINKFUNC(useItem)] call CBA_fnc_addEventHandler;


//////////////////////////////////////////////////
// Add various canInteractWith conditions
//////////////////////////////////////////////////

["isNotDead", {
    params ["_unit"];
    alive _unit
}] call FUNC(addCanInteractWithCondition);

["notOnMap", {!visibleMap}] call FUNC(addCanInteractWithCondition);

["isNotInside", {
    params ["_unit", "_target"];

    // Players can always interact with himself if not boarded
    isNull objectParent _unit ||
    // Players can always interact with his vehicle
    {objectParent _unit isEqualTo _target} ||
    // Players can always interact with passengers of the same vehicle
    {_unit isNotEqualTo _target && {!isNull objectParent _target} && {objectParent _unit isEqualTo objectParent _target}} ||
    // Players can always interact with connected UAV
    {!(isNull (ACE_controlledUAV select 0))}
}] call FUNC(addCanInteractWithCondition);

["isNotInZeus", {isNull curatorCamera}] call FUNC(addCanInteractWithCondition);

["isNotUnconscious", {
    params ["_unit"];
    lifeState _unit isNotEqualTo "INCAPACITATED"
}] call FUNC(addCanInteractWithCondition);

//////////////////////////////////////////////////
// Set up reload mutex
//////////////////////////////////////////////////

GVAR(isReloading) = false;

["unit", {
    params ["_newPlayer"];

    // Catch the current unit reloading
    private _weaponState = weaponState _newPlayer;
    GVAR(isReloading) = (_weaponState select 6) != 0;

    if (!GVAR(isReloading)) exitWith {};

    GVAR(magazineReloadPhase) = 0;

    // Wait until reload animation has finished (if weapon is no longer available, it returns -1)
    [{
        private _magazineReloadingPhase = ((_this select 0) weaponState (_this select 1)) select 6;

        // Need to check the reloading phase, as if you interrupt reloading with a gesture, the phase will remain stuck at a value > 0
        if (GVAR(magazineReloadPhase) == _magazineReloadingPhase) exitWith {
            TRACE_2("Interrupted magazine reloading",_this select 0,_this select 1);

            true
        };

        GVAR(magazineReloadPhase) = _magazineReloadingPhase;

        _magazineReloadingPhase <= 0
    }, {
        TRACE_2("End magazine reloading",_this select 0,_this select 1);

        // Player might switch units before reload finishes
        if ((_this select 0) isNotEqualTo ACE_player) exitWith {};

        GVAR(isReloading) = false;
    }, [_newPlayer, _weaponState select 1]] call CBA_fnc_waitUntilAndExecute;
}, true] call CBA_fnc_addPlayerEventHandler;

[QGVAR(magazineReloading), "MagazineReloading", {
    params ["_unit", "", "_muzzle"];

    TRACE_2("Init magazine reloading",_unit,_muzzle);

    // Wait until reload animation has started
    [{
        ((_this select 0) weaponState (_this select 1)) select 6 != 0
    }, {
        TRACE_2("Start magazine reloading",_this select 0,_this select 1);

        // Player might switch units before reload starts
        if ((_this select 0) isNotEqualTo ACE_player) exitWith {};

        GVAR(isReloading) = true;
        GVAR(magazineReloadPhase) = 0;

        // Wait until reload animation has finished (if weapon is no longer available, it returns -1)
        [{
            private _magazineReloadingPhase = ((_this select 0) weaponState (_this select 1)) select 6;

            // Need to check the reloading phase, as if you interrupt reloading with a gesture, the phase will remain stuck at a value > 0
            if (GVAR(magazineReloadPhase) == _magazineReloadingPhase) exitWith {
                TRACE_2("Interrupted magazine reloading",_this select 0,_this select 1);

                true
            };

            GVAR(magazineReloadPhase) = _magazineReloadingPhase;

            _magazineReloadingPhase <= 0
        }, {
            TRACE_2("End magazine reloading",_this select 0,_this select 1);

            // Player might switch units before reload finishes
            if ((_this select 0) isNotEqualTo ACE_player) exitWith {};

            GVAR(isReloading) = false;
        }, _this] call CBA_fnc_waitUntilAndExecute;
    }, [_unit, _muzzle], 5] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addBISPlayerEventHandler;

//////////////////////////////////////////////////
// Start the sway loop
//////////////////////////////////////////////////
["CBA_settingsInitialized", {
    ["multiplier", {
        switch (true) do {
            case (isWeaponRested ACE_player): {
                GVAR(swayFactor) * GVAR(restedSwayFactor)
            };
            case (isWeaponDeployed ACE_player): {
                GVAR(swayFactor) * GVAR(deployedSwayFactor)
            };
            default {
                GVAR(swayFactor)
            };
        };
    }, QUOTE(ADDON)] call FUNC(addSwayFactor);

    [{
        // frame after settingsInitialized to ensure all other addons have added their factors
        if (GVAR(enableSway)) then {
            call FUNC(swayLoop);
        };
        // check for pre-3.16 sway factors being added
        if (!isNil {missionNamespace getVariable "ACE_setCustomAimCoef"}) then {
            WARNING("ACE_setCustomAimCoef no longer supported - use ace_common_fnc_addSwayFactor");
            WARNING_1("source: %1",(missionNamespace getVariable "ACE_setCustomAimCoef") apply {_x});
        };
    }] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addEventHandler;

//////////////////////////////////////////////////
// Set up PlayerJIP eventhandler
//////////////////////////////////////////////////

// Lastly, do JIP events
// JIP Detection and event trigger. Run this at the very end, just in case anything uses it
// Note: usage of player is most likely on purpose
if (didJIP) then {
    // We are jipping! Get ready and wait, and throw the event
    [{
        if(!isNull player && GVAR(settingsInitFinished)) then {
            ["ace_playerJIP", [player]] call CBA_fnc_localEvent;
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    }, 0, []] call CBA_fnc_addPerFrameHandler;
};


//////////////////////////////////////////////////
// CBA key input handling
//////////////////////////////////////////////////

//Device Handler:
GVAR(deviceKeyHandlingArray) = [];
GVAR(deviceKeyCurrentIndex) = -1;

// Register localizations for the Keybinding categories
["ACE3 Equipment", LLSTRING(ACEKeybindCategoryEquipment)] call CBA_fnc_registerKeybindModPrettyName;
["ACE3 Common", LLSTRING(ACEKeybindCategoryCommon)] call CBA_fnc_registerKeybindModPrettyName;
["ACE3 Weapons", LLSTRING(ACEKeybindCategoryWeapons)] call CBA_fnc_registerKeybindModPrettyName;
["ACE3 Movement", LLSTRING(ACEKeybindCategoryMovement)] call CBA_fnc_registerKeybindModPrettyName;
["ACE3 Scope Adjustment", LLSTRING(ACEKeybindCategoryScopeAdjustment)] call CBA_fnc_registerKeybindModPrettyName;
["ACE3 Vehicles", LLSTRING(ACEKeybindCategoryVehicles)] call CBA_fnc_registerKeybindModPrettyName;

["ACE3 Equipment", QGVAR(openDevice), LLSTRING(toggleHandheldDevice), {
    [] call FUNC(deviceKeyFindValidIndex);
    if (GVAR(deviceKeyCurrentIndex) == -1) exitWith {false};
    [] call ((GVAR(deviceKeyHandlingArray) select GVAR(deviceKeyCurrentIndex)) select 3);
    true
},
{false},
[0xC7, [false, false, false]], false] call CBA_fnc_addKeybind;  //Home Key

["ACE3 Equipment", QGVAR(closeDevice), LLSTRING(closeHandheldDevice), {
    [] call FUNC(deviceKeyFindValidIndex);
    if (GVAR(deviceKeyCurrentIndex) == -1) exitWith {false};
    [] call ((GVAR(deviceKeyHandlingArray) select GVAR(deviceKeyCurrentIndex)) select 4);
    true
},
{false},
[0xC7, [false, true, false]], false] call CBA_fnc_addKeybind;  //CTRL + Home Key

["ACE3 Equipment", QGVAR(cycleDevice), LLSTRING(cycleHandheldDevices), {
    [1] call FUNC(deviceKeyFindValidIndex);
    if (GVAR(deviceKeyCurrentIndex) == -1) exitWith {false};
    private _displayName = ((GVAR(deviceKeyHandlingArray) select GVAR(deviceKeyCurrentIndex)) select 0);
    private _iconImage = ((GVAR(deviceKeyHandlingArray) select GVAR(deviceKeyCurrentIndex)) select 1);
    [_displayName, _iconImage] call FUNC(displayTextPicture);
    true
},
{false},
[0xC7, [true, false, false]], false] call CBA_fnc_addKeybind;  //SHIFT + Home Key


["ACE3 Weapons", QGVAR(unloadWeapon), LSTRING(unloadWeapon), {
    private _unit = ACE_player;

    // Conditions
    if !([_unit, objNull, ["isNotInside"]] call FUNC(canInteractWith)) exitWith {false};

    if !(_unit call CBA_fnc_canUseWeapon) exitWith {false};

    (weaponState _unit) params ["_weapon", "_muzzle", "", "_magazine", "_ammo"];

    // Check if there is any ammo
    if (_ammo < 1) exitWith {false};

    // Check if the unit has a weapon
    if (_weapon == "") exitWith {false};

    // Check if the unit has a weapon selected
    if !(_weapon in [primaryWeapon _unit, handgunWeapon _unit, secondaryWeapon _unit]) exitWith {false};

    // Statement
    [_unit, _weapon, _muzzle, _magazine, _ammo, false] call FUNC(unloadUnitWeapon);

    true
}, {false}, [19, [false, false, true]], false] call CBA_fnc_addKeybind; // Alt + R

["CBA_loadoutSet", {
    params ["_unit", "_loadout"];
    _loadout params ["_primaryWeaponArray"];

    if ((_primaryWeaponArray param [0, ""]) == "ACE_FakePrimaryWeapon") then {
        TRACE_1("Ignoring fake gun",_primaryWeaponArray);
        _loadout set [0, []];
    };
}] call CBA_fnc_addEventHandler;

GVAR(commonPostInited) = true;
