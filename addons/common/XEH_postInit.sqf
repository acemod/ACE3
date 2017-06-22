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
[QGVAR(setStatusEffect), {_this call FUNC(statusEffect_set)}] call CBA_fnc_addEventHandler;
["forceWalk", false, ["ACE_SwitchUnits", "ACE_Attach", "ACE_dragging", "ACE_Explosives", "ACE_Ladder", "ACE_Sandbag", "ACE_refuel", "ACE_rearm", "ACE_dragging"]] call FUNC(statusEffect_addType);
["blockSprint", false, []] call FUNC(statusEffect_addType);
["setCaptive", true, [QEGVAR(captives,Handcuffed), QEGVAR(captives,Surrendered), "ace_unconscious"]] call FUNC(statusEffect_addType);
["blockDamage", false, ["fixCollision"]] call FUNC(statusEffect_addType);
["blockEngine", false, ["ACE_Refuel"]] call FUNC(statusEffect_addType);

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
[QGVAR(setCaptive), {
    params ["_object", "_set"];
    TRACE_2("setCaptive EH",_object,_set);
    _object setCaptive (_set > 0);
}] call CBA_fnc_addEventHandler;
[QGVAR(blockDamage), { //Name reversed from `allowDamage` because we want NOR logic
    params ["_object", "_set"];
    if ((_object isKindOf "CAManBase") && {(["ace_medical"] call FUNC(isModLoaded))}) then {
        TRACE_2("blockDamage EH (using medical)",_object,_set);
       _object setvariable [QEGVAR(medical,allowDamage), (_set == 0), true];
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

//Add a fix for BIS's zeus remoteControl module not reseting variables on DC when RC a unit
//This variable is used for isPlayer checks
if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {
        params ["_dcPlayer"];
        private _zeusLogic = getAssignedCuratorLogic _dcPlayer;
        if ((!isNil "_zeusLogic") && {!isNull _zeusLogic}) then {
            {
                if ((_x getvariable ["bis_fnc_moduleRemoteControl_owner", objnull]) isEqualTo _dcPlayer) exitWith {
                    INFO_3("[%1] DC - Was Zeus [%2] while controlling unit [%3] - manually clearing `bis_fnc_moduleRemoteControl_owner`", [_x] call FUNC(getName), _dcPlayer, _x);
                    _x setVariable ["bis_fnc_moduleRemoteControl_owner", nil, true];
                };
                nil
            } count (curatorEditableObjects  _zeusLogic);
        };
    }];
};

// Listens for global "SettingChanged" events, to update the force status locally
["ace_settingChanged", {
    params ["_name", "_value", "_force"];

    if (_force) then {
        private _settingData = [_name] call FUNC(getSettingData);

        if (_settingData isEqualTo []) exitWith {};

        _settingData set [6, _force];
    };
}] call CBA_fnc_addEventHandler;


// Event to log Fix Headbug output
[QGVAR(headbugFixUsed), {
    params ["_profileName", "_animation"];
    INFO_2("Headbug Used: Name: %1, Animation: %2",_profileName,_animation);
}] call CBA_fnc_addEventHandler;

[QGVAR(fixCollision), FUNC(fixCollision)] call CBA_fnc_addEventHandler;
[QGVAR(fixFloating), FUNC(fixFloating)] call CBA_fnc_addEventHandler;
[QGVAR(fixPosition), FUNC(fixPosition)] call CBA_fnc_addEventHandler;

["ace_loadPersonEvent", FUNC(loadPersonLocal)] call CBA_fnc_addEventHandler;
["ace_unloadPersonEvent", FUNC(unloadPersonLocal)] call CBA_fnc_addEventHandler;

[QGVAR(lockVehicle), {
    _this setVariable [QGVAR(lockStatus), locked _this];
    _this lock 2;
}] call CBA_fnc_addEventHandler;

[QGVAR(unlockVehicle), {
    _this lock (_this getVariable [QGVAR(lockStatus), locked _this]);
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
[QGVAR(setVanillaHitPointDamage), {(_this select 0) setHitPointDamage (_this select 1)}] call CBA_fnc_addEventHandler;

// Request framework
[QGVAR(requestCallback), FUNC(requestCallback)] call CBA_fnc_addEventHandler;
[QGVAR(receiveRequest), FUNC(receiveRequest)] call CBA_fnc_addEventHandler;

[QGVAR(systemChatGlobal), {systemChat _this}] call CBA_fnc_addEventHandler;

if (isServer) then {
    [QGVAR(hideObjectGlobal), {(_this select 0) hideObjectGlobal (_this select 1)}] call CBA_fnc_addEventHandler;
    [QGVAR(enableSimulationGlobal), {(_this select 0) enableSimulationGlobal (_this select 1)}] call CBA_fnc_addEventHandler;
    [QGVAR(setShotParents), {(_this select 0) setShotParents [_this select 1, _this select 2]}] call CBA_fnc_addEventHandler;
    ["ace_setOwner", {(_this select 0) setOwner (_this select 1)}] call CBA_fnc_addEventHandler;
    [QGVAR(serverLog), FUNC(serverLog)] call CBA_fnc_addEventHandler;
};


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
    ["ACEa", FUNC(_handleRequestAllSyncedEvents)] call CBA_fnc_addEventHandler;
};

["ACEe", FUNC(_handleSyncedEvent)] call CBA_fnc_addEventHandler;
["ACEs", FUNC(_handleRequestSyncedEvent)] call CBA_fnc_addEventHandler;

if (isServer) then {
    [FUNC(syncedEventPFH), 0.5, []] call CBA_fnc_addPerFrameHandler;
};


//////////////////////////////////////////////////
// Check files, previous installed version etc.
//////////////////////////////////////////////////

private _currentVersion = getText (configFile >> "CfgPatches" >> QUOTE(ADDON) >> "version");
private _previousVersion = profileNamespace getVariable ["ACE_VersionNumberString", ""];

// check previous version number from profile
if (_currentVersion != _previousVersion) then {
    // do something

    profileNamespace setVariable ["ACE_VersionNumberString", _currentVersion];
};

call FUNC(checkFiles);


//////////////////////////////////////////////////
// Set up ace_settingsInitialized eventhandler
//////////////////////////////////////////////////

["ace_settingsInitialized", {
    [
        GVAR(checkPBOsAction),
        GVAR(checkPBOsCheckAll),
        GVAR(checkPBOsWhitelist)
    ] call FUNC(checkPBOs)
}] call CBA_fnc_addEventHandler;

// Create a pfh to wait until all postinits are ready and settings are initialized
[{
    params ["_args"];

    _args params ["_waitingMsgSent"];

    // If post inits are not ready then wait
    if !(SLX_XEH_MACHINE select 8) exitWith {};

    // If settings are not initialized then wait
    if (isNil QGVAR(settings) || {!isServer && isNil QEGVAR(modules,serverModulesRead)}) exitWith {
        if !(_waitingMsgSent) then {
            _args set [0, true];
            INFO("Waiting on settings from server...");
        };
    };

    [_this select 1] call CBA_fnc_removePerFrameHandler;

    INFO("Settings received from server.");

    if (isServer) then { //read settings from paramsArray
        [] call FUNC(readSettingsFromParamsArray);
    };
    // Event so that ACE_Modules have their settings loaded:
    [QGVAR(initSettingsFromModules), []] call CBA_fnc_localEvent;

    if (isServer) then {
        // Publish all settings data after all configs and modules are read
        publicVariable QGVAR(settings);
    };

    // Load user settings from profile
    if (hasInterface) then {
        call FUNC(loadSettingsFromProfile);
        call FUNC(loadSettingsLocalizedText);
    };

    INFO("Settings initialized.");

    //Event that settings are safe to use:
    ["ace_settingsInitialized", []] call CBA_fnc_localEvent;

    //Set init finished and run all delayed functions:
    GVAR(settingsInitFinished) = true;
    INFO_1("%1 delayed functions running.",count GVAR(runAtSettingsInitialized));

    {
        (_x select 1) call (_x select 0);
        false
    } count GVAR(runAtSettingsInitialized);

    GVAR(runAtSettingsInitialized) = nil; //cleanup
}, 0, [false]] call CBA_fnc_addPerFrameHandler;


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
    GVAR(showHudHash) params ["", "", "_masks"];
    if !(_masks isEqualTo []) then {
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
}] call CBA_fnc_addPlayerEventHandler;


//////////////////////////////////////////////////
// Set up numerous eventhanders for player controlled units
//////////////////////////////////////////////////

TRACE_1("adding unit playerEH to set ace_player",isNull cba_events_oldUnit);
["unit", {
    ACE_player = (_this select 0);
}, true] call CBA_fnc_addPlayerEventHandler;

GVAR(OldIsCamera) = false;

[{
    BEGIN_COUNTER(stateChecker);

    // "activeCameraChanged" event
    private _data = call FUNC(isfeatureCameraActive);
    if !(_data isEqualTo GVAR(OldIsCamera)) then {
        // Raise ACE event locally
        GVAR(OldIsCamera) = _data;
        ["ace_activeCameraChanged", [ACE_player, _data]] call CBA_fnc_localEvent;
    };

    END_COUNTER(stateChecker);
}, 0.5, []] call CBA_fnc_addPerFrameHandler;


//////////////////////////////////////////////////
// Eventhandlers for player controlled machines
//////////////////////////////////////////////////

[QGVAR(displayTextStructured), {_this call FUNC(displayTextStructured)}] call CBA_fnc_addEventHandler;
[QGVAR(displayTextPicture), {_this call FUNC(displayTextPicture)}] call CBA_fnc_addEventHandler;

["ace_unconscious", {
    params ["_unit", "_isUnconscious"];

    if (local _unit && {!_isUnconscious}) then {
        [_unit, false, QFUNC(loadPerson), west /* dummy side */] call FUNC(switchToGroupSide);
    };
}] call CBA_fnc_addEventHandler;

["ace_useItem", DFUNC(useItem)] call CBA_fnc_addEventHandler;


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
    vehicle _unit == _unit ||
    // Players can always interact with his vehicle
    {vehicle _unit == _target} ||
    // Players can always interact with passengers of the same vehicle
    {_unit != _target && {vehicle _unit == vehicle _target}}
}] call FUNC(addCanInteractWithCondition);

["isNotInZeus", {isNull curatorCamera}] call FUNC(addCanInteractWithCondition);

//////////////////////////////////////////////////
// Set up reload mutex
//////////////////////////////////////////////////

GVAR(isReloading) = false;

["keyDown", {
    if ((_this select 1) in actionKeys "ReloadMagazine" && {alive ACE_player}) then {
        //Ignore mounted (except ffv)
        if (!(player call CBA_fnc_canUseWeapon)) exitWith {};
        private _weapon = currentWeapon ACE_player;

        if (_weapon != "") then {
            private _gesture  = getText (configfile >> "CfgWeapons" >> _weapon >> "reloadAction");
            if (_gesture == "") exitWith {}; //Ignore weapons with no reload gesture (binoculars)
            private _isLauncher = _weapon isKindOf ["Launcher", configFile >> "CfgWeapons"];
            private _config = ["CfgGesturesMale", "CfgMovesMaleSdr"] select _isLauncher;
            private _duration = getNumber (configfile >> _config >> "States" >> _gesture >> "speed");

            if (_duration != 0) then {
                _duration = if (_duration < 0) then { abs _duration } else { 1 / _duration };
            } else {
                _duration = 3;
            };

            TRACE_2("Reloading, blocking gestures",_weapon,_duration);
            GVAR(reloadingETA) = CBA_missionTime + _duration;

            if (!GVAR(isReloading)) then {
                GVAR(isReloading) = true;

                [{
                    CBA_missionTime > GVAR(reloadingETA)
                },{
                    GVAR(isReloading) = false;
                }] call CBA_fnc_waitUntilAndExecute;
            };
        };
    };

    false
}] call CBA_fnc_addDisplayHandler;

//////////////////////////////////////////////////
// Set up PlayerJIP eventhandler
//////////////////////////////////////////////////

// Lastly, do JIP events
// JIP Detection and event trigger. Run this at the very end, just in case anything uses it
// Note: usage of player is most likely on purpose
if (didJip) then {
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
["ACE3 Equipment", localize LSTRING(ACEKeybindCategoryEquipment)] call CBA_fnc_registerKeybindModPrettyName;
["ACE3 Common", localize LSTRING(ACEKeybindCategoryCommon)] call CBA_fnc_registerKeybindModPrettyName;
["ACE3 Weapons", localize LSTRING(ACEKeybindCategoryWeapons)] call CBA_fnc_registerKeybindModPrettyName;
["ACE3 Movement", localize LSTRING(ACEKeybindCategoryMovement)] call CBA_fnc_registerKeybindModPrettyName;
["ACE3 Scope Adjustment", localize LSTRING(ACEKeybindCategoryScopeAdjustment)] call CBA_fnc_registerKeybindModPrettyName;
["ACE3 Vehicles", localize LSTRING(ACEKeybindCategoryVehicles)] call CBA_fnc_registerKeybindModPrettyName;

["ACE3 Equipment", QGVAR(openDevice), (localize "STR_ACE_Common_toggleHandheldDevice"), {
    [] call FUNC(deviceKeyFindValidIndex);
    if (GVAR(deviceKeyCurrentIndex) == -1) exitWith {false};
    [] call ((GVAR(deviceKeyHandlingArray) select GVAR(deviceKeyCurrentIndex)) select 3);
    true
},
{false},
[0xC7, [false, false, false]], false] call CBA_fnc_addKeybind;  //Home Key

["ACE3 Equipment", QGVAR(closeDevice), (localize "STR_ACE_Common_closeHandheldDevice"), {
    [] call FUNC(deviceKeyFindValidIndex);
    if (GVAR(deviceKeyCurrentIndex) == -1) exitWith {false};
    [] call ((GVAR(deviceKeyHandlingArray) select GVAR(deviceKeyCurrentIndex)) select 4);
    true
},
{false},
[0xC7, [false, true, false]], false] call CBA_fnc_addKeybind;  //CTRL + Home Key

["ACE3 Equipment", QGVAR(cycleDevice), (localize "STR_ACE_Common_cycleHandheldDevices"), {
    [1] call FUNC(deviceKeyFindValidIndex);
    if (GVAR(deviceKeyCurrentIndex) == -1) exitWith {false};
    private _displayName = ((GVAR(deviceKeyHandlingArray) select GVAR(deviceKeyCurrentIndex)) select 0);
    private _iconImage = ((GVAR(deviceKeyHandlingArray) select GVAR(deviceKeyCurrentIndex)) select 1);
    [_displayName, _iconImage] call FUNC(displayTextPicture);
    true
},
{false},
[0xC7, [true, false, false]], false] call CBA_fnc_addKeybind;  //SHIFT + Home Key

GVAR(commonPostInited) = true;
