// ACE - Common
// #define ENABLE_PERFORMANCE_COUNTERS
// #define DEBUG_MODE_FULL
#include "script_component.hpp"


//////////////////////////////////////////////////
// PFHs
//////////////////////////////////////////////////

//Singe PFEH to handle execNextFrame, waitAndExec and waitUntilAndExec:
[{
    BEGIN_COUNTER(waitAndExec);

    //Handle the waitAndExec array:
    while {!(GVAR(waitAndExecArray) isEqualTo []) && {GVAR(waitAndExecArray) select 0 select 0 <= ACE_Time}} do {
        private _entry = GVAR(waitAndExecArray) deleteAt 0;
        (_entry select 2) call (_entry select 1);
    };

    //Handle the execNextFrame array:
    {
        (_x select 0) call (_x select 1);
        false
    } count GVAR(nextFrameBufferA);

    //Swap double-buffer:
    GVAR(nextFrameBufferA) = GVAR(nextFrameBufferB);
    GVAR(nextFrameBufferB) = [];
    GVAR(nextFrameNo) = diag_frameno + 1;

    //Handle the waitUntilAndExec array:
    {
        // if condition is satisifed call statement
        if ((_x select 2) call (_x select 0)) then {
            // make sure to delete the correct handle when multiple conditions are met in one frame
            GVAR(waitUntilAndExecArray) deleteAt (GVAR(waitUntilAndExecArray) find _x);
            (_x select 2) call (_x select 1);
        };
        nil
    } count +GVAR(waitUntilAndExecArray);

    END_COUNTER(waitAndExec);
}, 0, []] call CBA_fnc_addPerFrameHandler;


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
["ace_setStatusEffect", {_this call FUNC(statusEffect_set)}] call CBA_fnc_addEventHandler;
["forceWalk", false, ["ACE_SwitchUnits", "ACE_Attach", "ACE_dragging", "ACE_Explosives", "ACE_Ladder", "ACE_Sandbag", "ACE_refuel", "ACE_rearm", "ACE_dragging"]] call FUNC(statusEffect_addType);
["blockSprint", false, []] call FUNC(statusEffect_addType);
["setCaptive", true, [QEGVAR(captives,Handcuffed), QEGVAR(captives,Surrendered), QEGVAR(medical,unconscious)]] call FUNC(statusEffect_addType);
["blockDamage", false, ["fixCollision"]] call FUNC(statusEffect_addType);
["blockEngine", false, ["ACE_Refuel"]] call FUNC(statusEffect_addType);

["ace_forceWalk", {
    params ["_object", "_set"];
    TRACE_2("forceWalk EH",_object,_set);
    _object forceWalk (_set > 0);
}] call CBA_fnc_addEventHandler;
["blockSprint", { //Name reversed from `allowSprint` because we want NOR logic
    params ["_object", "_set"];
    TRACE_2("blockSprint EH",_object,_set);
    _object allowSprint (_set == 0);
}] call CBA_fnc_addEventHandler;
["setCaptive", {
    params ["_object", "_set"];
    TRACE_2("setCaptive EH",_object,_set);
    _object setCaptive (_set > 0);
}] call CBA_fnc_addEventHandler;
["blockDamage", { //Name reversed from `allowDamage` because we want NOR logic
    params ["_object", "_set"];
    if ((_object isKindOf "CAManBase") && {(["ace_medical"] call FUNC(isModLoaded))}) then {
        TRACE_2("blockDamage EH (using medical)",_object,_set);
       _object setvariable [QEGVAR(medical,allowDamage), (_set == 0), true];
    } else {
        TRACE_2("blockDamage EH (using allowDamage)",_object,_set);
       _object allowDamage (_set == 0);
    };
}] call CBA_fnc_addEventHandler;
["blockEngine", {
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
                    ACE_LOGINFO_3("[%1] DC - Was Zeus [%2] while controlling unit [%3] - manually clearing `bis_fnc_moduleRemoteControl_owner`", [_x] call FUNC(getName), _dcPlayer, _x);
                    _x setVariable ["bis_fnc_moduleRemoteControl_owner", nil, true];
                };
                nil
            } count (curatorEditableObjects  _zeusLogic);
        };
    }];
};

// Listens for global "SettingChanged" events, to update the force status locally
["SettingChanged", {
    params ["_name", "_value", "_force"];

    if (_force) then {
        private _settingData = [_name] call FUNC(getSettingData);

        if (_settingData isEqualTo []) exitWith {};

        _settingData set [6, _force];
    };
}] call CBA_fnc_addEventHandler;


// Event to log Fix Headbug output
["HeadbugFixUsed", {
    params ["_profileName", "_animation"];
    ACE_LOGINFO_2("Headbug Used: Name: %1, Animation: %2",_profileName,_animation);
}] call CBA_fnc_addEventHandler;

["ace_fixCollision", FUNC(fixCollision)] call CBA_fnc_addEventHandler;
["ace_fixFloating", FUNC(fixFloating)] call CBA_fnc_addEventHandler;
["ace_fixPosition", FUNC(fixPosition)] call CBA_fnc_addEventHandler;

["ace_loadPersonEvent", FUNC(loadPersonLocal)] call CBA_fnc_addEventHandler;
["ace_unloadPersonEvent", FUNC(unloadPersonLocal)] call CBA_fnc_addEventHandler;

["lockVehicle", {
    _this setVariable [QGVAR(lockStatus), locked _this];
    _this lock 2;
}] call CBA_fnc_addEventHandler;

["unlockVehicle", {
    _this lock (_this getVariable [QGVAR(lockStatus), locked _this]);
}] call CBA_fnc_addEventHandler;

["ace_setDir", {(_this select 0) setDir (_this select 1)}] call CBA_fnc_addEventHandler;
["ace_setFuel", {(_this select 0) setFuel (_this select 1)}] call CBA_fnc_addEventHandler;
["ace_engineOn", {(_this select 0) engineOn (_this select 1)}] call CBA_fnc_addEventHandler;
["ace_setSpeaker", {(_this select 0) setSpeaker (_this select 1)}] call CBA_fnc_addEventHandler;
["ace_selectLeader", {(_this select 0) selectLeader (_this select 1)}] call CBA_fnc_addEventHandler;
["ace_setVelocity", {(_this select 0) setVelocity (_this select 1)}] call CBA_fnc_addEventHandler;
["ace_playMove", {(_this select 0) playMove (_this select 1)}] call CBA_fnc_addEventHandler;
["ace_playMoveNow", {(_this select 0) playMoveNow (_this select 1)}] call CBA_fnc_addEventHandler;
["ace_switchMove", {(_this select 0) switchMove (_this select 1)}] call CBA_fnc_addEventHandler;
["ace_setVectorDirAndUp", {(_this select 0) setVectorDirAndUp (_this select 1)}] call CBA_fnc_addEventHandler;
["ace_setVanillaHitPointDamage", {(_this select 0) setHitPointDamage (_this select 1)}] call CBA_fnc_addEventHandler;

if (isServer) then {
    ["ace_hideObjectGlobal", {(_this select 0) hideObjectGlobal (_this select 1)}] call CBA_fnc_addEventHandler;
    ["ace_enableSimulationGlobal", {(_this select 0) enableSimulationGlobal (_this select 1)}] call CBA_fnc_addEventHandler;
};


//////////////////////////////////////////////////
// Set up remote execution
//////////////////////////////////////////////////

// Synced ACE events
// Handle JIP scenario
if (!isServer) then {
    ["PlayerJip", {
        ACE_LOGINFO("JIP event synchronization initialized");
        ["ace_sEH_all", [player]] call CBA_fnc_serverEvent;
    }] call CBA_fnc_addEventHandler;
} else {
    ["ace_sEH_all", FUNC(_handleRequestAllSyncedEvents)] call CBA_fnc_addEventHandler;
};

["ace_sEH", FUNC(_handleSyncedEvent)] call CBA_fnc_addEventHandler;
["ace_sEH_s", FUNC(_handleRequestSyncedEvent)] call CBA_fnc_addEventHandler;

if (isServer) then {
    [FUNC(syncedEventPFH), 0.5, []] call CBA_fnc_addPerFrameHandler;
};

// @todo deprecated
QGVAR(remoteFnc) addPublicVariableEventHandler {
    (_this select 1) call FUNC(execRemoteFnc);
};

// @todo figure out what this does.
[missionNamespace] call FUNC(executePersistent);


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
// Set up SettingsInitialized eventhandler
//////////////////////////////////////////////////

["SettingsInitialized", {
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
            ACE_LOGINFO("Waiting on settings from server...");
        };
    };

    [_this select 1] call CBA_fnc_removePerFrameHandler;

    ACE_LOGINFO("Settings received from server.");

    if (isServer) then { //read settings from paramsArray
        [] call FUNC(readSettingsFromParamsArray);
    };
    // Event so that ACE_Modules have their settings loaded:
    ["ace_initSettingsFromModules", []] call CBA_fnc_localEvent;

    if (isServer) then {
        // Publish all settings data after all configs and modules are read
        publicVariable QGVAR(settings);
    };

    // Load user settings from profile
    if (hasInterface) then {
        call FUNC(loadSettingsFromProfile);
        call FUNC(loadSettingsLocalizedText);
    };

    ACE_LOGINFO("Settings initialized.");

    //Event that settings are safe to use:
    ["ace_settingsInitialized", []] call CBA_fnc_localEvent;

    //Set init finished and run all delayed functions:
    GVAR(settingsInitFinished) = true;
    ACE_LOGINFO_1("%1 delayed functions running.",count GVAR(runAtSettingsInitialized));

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


//////////////////////////////////////////////////
// Eventhandler to set player names
//////////////////////////////////////////////////

// Set the name for the current player
["playerChanged", {
    params ["_newPlayer","_oldPlayer"];

    if (alive _newPlayer) then {
        [_newPlayer] call FUNC(setName);
    };

    if (alive _oldPlayer) then {
        [_oldPlayer] call FUNC(setName);
    };
}] call CBA_fnc_addEventHandler;


//////////////////////////////////////////////////
// Set up numerous eventhanders for player controlled units
//////////////////////////////////////////////////

// default variables
GVAR(OldPlayerVehicle) = vehicle objNull;
GVAR(OldPlayerTurret) = [objNull] call FUNC(getTurretIndex);
GVAR(OldPlayerWeapon) = currentWeapon objNull;
GVAR(OldPlayerInventory) = [];
GVAR(OldPlayerInventoryNoAmmo) = [];
GVAR(OldPlayerVisionMode) = currentVisionMode objNull;
GVAR(OldCameraView) = "";
GVAR(OldVisibleMap) = false;
GVAR(OldInventoryDisplayIsOpen) = nil; //@todo check this
GVAR(OldIsCamera) = false;

// PFH to raise varios events
[{
    BEGIN_COUNTER(stateChecker);

    // "playerChanged" event
    private _data = call FUNC(player);
    if !(_data isEqualTo ACE_player) then {
        private _oldPlayer = ACE_player;

        ACE_player = _data;
        uiNamespace setVariable ["ACE_player", _data];

        // Raise ACE event locally
        ["ace_playerChanged", [ACE_player, _oldPlayer]] call CBA_fnc_localEvent;
    };

    // "playerVehicleChanged" event
    _data = vehicle ACE_player;
    if !(_data isEqualTo GVAR(OldPlayerVehicle)) then {
        // Raise ACE event locally
        GVAR(OldPlayerVehicle) = _data;
        ["ace_playerVehicleChanged", [ACE_player, _data]] call CBA_fnc_localEvent;
    };

    // "playerTurretChanged" event
    _data = [ACE_player] call FUNC(getTurretIndex);
    if !(_data isEqualTo GVAR(OldPlayerTurret)) then {
        // Raise ACE event locally
        GVAR(OldPlayerTurret) = _data;
        ["ace_playerTurretChanged", [ACE_player, _data]] call CBA_fnc_localEvent;
    };

    // "playerWeaponChanged" event
    _data = currentWeapon ACE_player;
    if (_data != GVAR(OldPlayerWeapon)) then {
        // Raise ACE event locally
        GVAR(OldPlayerWeapon) = _data;
        ["ace_playerWeaponChanged", [ACE_player, _data]] call CBA_fnc_localEvent;
    };

    // "playerInventoryChanged" event
    _data = getUnitLoadout ACE_player;
    if !(_data isEqualTo GVAR(OldPlayerInventory)) then {
        // Raise ACE event locally
        GVAR(OldPlayerInventory) = _data;

        // we don't want to trigger this just because your ammo counter decreased.
        _data = + GVAR(OldPlayerInventory);

        private _weaponInfo = _data param [0, []];
        if !(_weaponInfo isEqualTo []) then {
            _weaponInfo set [4, primaryWeaponMagazine ACE_player];
            _weaponInfo deleteAt 5;
        };

        _weaponInfo = _data param [1, []];
        if !(_weaponInfo isEqualTo []) then {
            _weaponInfo set [4, secondaryWeaponMagazine ACE_player];
            _weaponInfo deleteAt 5;
        };

        _weaponInfo = _data param [2, []];
        if !(_weaponInfo isEqualTo []) then {
            _weaponInfo set [4, handgunMagazine ACE_player];
            _weaponInfo deleteAt 5;
        };

        if !(_data isEqualTo GVAR(OldPlayerInventoryNoAmmo)) then {
            GVAR(OldPlayerInventoryNoAmmo) = _data;
            ["ace_playerInventoryChanged", [ACE_player, [ACE_player, false] call FUNC(getAllGear)]] call CBA_fnc_localEvent;
        };
    };

    // "playerVisionModeChanged" event
    _data = currentVisionMode ACE_player;
    if !(_data isEqualTo GVAR(OldPlayerVisionMode)) then {
        // Raise ACE event locally
        GVAR(OldPlayerVisionMode) = _data;
        ["ace_playerVisionModeChanged", [ACE_player, _data]] call CBA_fnc_localEvent;
    };

    // "cameraViewChanged" event
    _data = cameraView;
    if !(_data isEqualTo GVAR(OldCameraView)) then {
        // Raise ACE event locally
        GVAR(OldCameraView) = _data;
        ["ace_cameraViewChanged", [ACE_player, _data]] call CBA_fnc_localEvent;
    };

    // "visibleMapChanged" event
    _data = visibleMap;
    if (!_data isEqualTo GVAR(OldVisibleMap)) then {
        // Raise ACE event locally
        GVAR(OldVisibleMap) = _data;
        ["ace_visibleMapChanged", [ACE_player, _data]] call CBA_fnc_localEvent;
    };

    // "activeCameraChanged" event
    _data = call FUNC(isfeatureCameraActive);
    if !(_data isEqualTo GVAR(OldIsCamera)) then {
        // Raise ACE event locally
        GVAR(OldIsCamera) = _data;
        ["ace_activeCameraChanged", [ACE_player, _data]] call CBA_fnc_localEvent;
    };

    END_COUNTER(stateChecker);
}, 0, []] call CBA_fnc_addPerFrameHandler;


//////////////////////////////////////////////////
// Eventhandlers for player controlled machines
//////////////////////////////////////////////////

["ace_displayTextStructured", {_this call FUNC(displayTextStructured)}] call CBA_fnc_addEventHandler;
["ace_displayTextPicture", {_this call FUNC(displayTextPicture)}] call CBA_fnc_addEventHandler;

["medical_onUnconscious", {
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
    params ["_unit", "_target"];
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
// Set up PlayerJIP eventhandler
//////////////////////////////////////////////////

// Lastly, do JIP events
// JIP Detection and event trigger. Run this at the very end, just in case anything uses it
// Note: usage of player is most likely on purpose
if (didJip) then {
    // We are jipping! Get ready and wait, and throw the event
    [{
        if(!isNull player && GVAR(settingsInitFinished)) then {
            ["ace_playerJip", [player]] call CBA_fnc_localEvent;
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
    _displayName = ((GVAR(deviceKeyHandlingArray) select GVAR(deviceKeyCurrentIndex)) select 0);
    _iconImage = ((GVAR(deviceKeyHandlingArray) select GVAR(deviceKeyCurrentIndex)) select 1);
    [_displayName, _iconImage] call FUNC(displayTextPicture);
    true
},
{false},
[0xC7, [true, false, false]], false] call CBA_fnc_addKeybind;  //SHIFT + Home Key

GVAR(commonPostInited) = true;
