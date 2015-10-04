// ACE - Common
#include "script_component.hpp"

// #define ENABLE_PERFORMANCE_COUNTERS

//////////////////////////////////////////////////
// PFHs
//////////////////////////////////////////////////

//Singe PFEH to handle execNextFrame, waitAndExec and waitUntilAndExec:
[{
    private ["_entry", "_deleted"];

    //Handle the waitAndExec array:
    while {!(GVAR(waitAndExecArray) isEqualTo []) && {GVAR(waitAndExecArray) select 0 select 0 <= ACE_Time}} do {
        _entry = GVAR(waitAndExecArray) deleteAt 0;
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
    _deleted = 0;
    {
        // if condition is satisifed call statement
        if ((_x select 2) call (_x select 0)) then {
            // make sure to delete the correct handle when multiple conditions are met in one frame
            GVAR(waitUntilAndExecArray) deleteAt (_forEachIndex - _deleted);
            _deleted = _deleted + 1;
            (_x select 2) call (_x select 1);
        };
    } forEach GVAR(waitUntilAndExecArray);
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

// Listens for global "SettingChanged" events, to update the force status locally
["SettingChanged", {
    params ["_name", "_value", "_force"];

    if (_force) then {
        private "_settingData";
        _settingData = [_name] call FUNC(getSettingData);

        if (_settingData isEqualTo []) exitWith {};

        _settingData set [6, _force];
    };
}] call FUNC(addEventhandler);


// Event to log Fix Headbug output
["HeadbugFixUsed", {
    params ["_profileName", "_animation"];
    ACE_LOGINFO_2("Headbug Used: Name: %1, Animation: %2",_profileName,_animation);
}] call FUNC(addEventHandler);

["fixCollision", FUNC(fixCollision)] call FUNC(addEventhandler);
["fixFloating", FUNC(fixFloating)] call FUNC(addEventhandler);
["fixPosition", FUNC(fixPosition)] call FUNC(addEventhandler);

["unloadPersonEvent", FUNC(unloadPersonLocal)] call FUNC(addEventhandler);

["lockVehicle", {
    _this setVariable [QGVAR(lockStatus), locked _this];
    _this lock 2;
}] call FUNC(addEventhandler);

["unlockVehicle", {
    _this lock (_this getVariable [QGVAR(lockStatus), locked _this]);
}] call FUNC(addEventhandler);

["setDir", {(_this select 0) setDir (_this select 1)}] call FUNC(addEventhandler);
["setFuel", {(_this select 0) setFuel (_this select 1)}] call FUNC(addEventhandler);
["setSpeaker", {(_this select 0) setSpeaker (_this select 1)}] call FUNC(addEventhandler);
["selectLeader", {(_this select 0) selectLeader (_this select 1)}] call FUNC(addEventHandler);
["assignTeam", {(_this select 0) assignTeam (_this select 1)}] call FUNC(addEventHandler);
["setVelocity", {(_this select 0) setVelocity (_this select 1)}] call FUNC(addEventHandler);

if (isServer) then {
    ["hideObjectGlobal", {(_this select 0) hideObjectGlobal (_this select 1)}] call FUNC(addEventHandler);
    ["enableSimulationGlobal", {(_this select 0) enableSimulationGlobal (_this select 1)}] call FUNC(addEventHandler);
};


//////////////////////////////////////////////////
// Set up remote execution
//////////////////////////////////////////////////

// ACE events
"ACEg" addPublicVariableEventHandler {_this call FUNC(_handleNetEvent)};
"ACEc" addPublicVariableEventHandler {_this call FUNC(_handleNetEvent)};

// Synced ACE events
// Handle JIP scenario
if (!isServer) then {
    ["PlayerJip", {
        ACE_LOGINFO("JIP event synchronization initialized");
        ["SEH_all", [player]] call FUNC(serverEvent);
    }] call FUNC(addEventHandler);
} else {
    ["SEH_all", FUNC(_handleRequestAllSyncedEvents)] call FUNC(addEventHandler);
};

["SEH", FUNC(_handleSyncedEvent)] call FUNC(addEventHandler);
["SEH_s", FUNC(_handleRequestSyncedEvent)] call FUNC(addEventHandler);

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

private ["_currentVersion", "_previousVersion"];

_currentVersion = getText (configFile >> "CfgPatches" >> QUOTE(ADDON) >> "version");
_previousVersion = profileNamespace getVariable ["ACE_VersionNumberString", ""];

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
        call compile GVAR(checkPBOsWhitelist)
    ] call FUNC(checkPBOs)
}] call FUNC(addEventHandler);

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

    // Event so that ACE_Modules have their settings loaded:
    ["InitSettingsFromModules", []] call FUNC(localEvent);

    // Load user settings from profile
    if (hasInterface) then {
        call FUNC(loadSettingsFromProfile);
        call FUNC(loadSettingsLocalizedText);
    };

    ACE_LOGINFO("Settings initialized.");

    //Event that settings are safe to use:
    ["SettingsInitialized", []] call FUNC(localEvent);

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

GVAR(ScrollWheelFrame) = diag_frameno;

["mainDisplayLoaded", {
    [{
        call FUNC(handleScrollWheelInit);
        call FUNC(handleModifierKeyInit);
    }, [], 0.1] call FUNC(waitAndExecute); // needs delay, otherwise doesn't work without pressing "RESTART" in editor once. Tested in 1.52RC
}] call FUNC(addEventHandler);

// add PFH to execute event that fires when the main display (46) is created
private "_fnc_initMainDisplayCheck";
_fnc_initMainDisplayCheck = {
    [{
        if !(isNull findDisplay 46) then {
            // Raise ACE event locally
            ["mainDisplayLoaded", [findDisplay 46]] call FUNC(localEvent);
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    }, 0, []] call CBA_fnc_addPerFrameHandler;
};

call _fnc_initMainDisplayCheck;

// repeat this every time a savegame is loaded
addMissionEventHandler ["Loaded", _fnc_initMainDisplayCheck];

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
}] call FUNC(addEventhandler);


//////////////////////////////////////////////////
// Set up numerous eventhanders for player controlled units
//////////////////////////////////////////////////

// default variables
GVAR(OldPlayerVehicle) = vehicle objNull;
GVAR(OldPlayerTurret) = [objNull] call FUNC(getTurretIndex);
GVAR(OldPlayerWeapon) = currentWeapon objNull;
GVAR(OldPlayerInventory) = [objNull] call FUNC(getAllGear);
GVAR(OldPlayerVisionMode) = currentVisionMode objNull;
GVAR(OldCameraView) = "";
GVAR(OldVisibleMap) = false;
GVAR(OldInventoryDisplayIsOpen) = nil; //@todo check this
GVAR(OldZeusDisplayIsOpen) = false;
GVAR(OldIsCamera) = false;

// clean up playerChanged eventhandler from preinit and put it in the same PFH as the other events to reduce overhead and guarantee advantageous execution order
if (!isNil QGVAR(PreInit_playerChanged_PFHID)) then {
    [GVAR(PreInit_playerChanged_PFHID)] call CBA_fnc_removePerFrameHandler;
    GVAR(PreInit_playerChanged_PFHID) = nil;
};

// PFH to raise varios events
[{
    BEGIN_COUNTER(stateChecker);
    private "_data"; // reuse one variable to reduce number of variables that have to be set to private each frame

    // "playerChanged" event
    _data = call FUNC(player);
    if !(_data isEqualTo ACE_player) then {
        private "_oldPlayer";
        _oldPlayer = ACE_player;

        ACE_player = _data;
        uiNamespace setVariable ["ACE_player", _data];

        // Raise ACE event locally
        ["playerChanged", [ACE_player, _oldPlayer]] call FUNC(localEvent);
    };

    // "playerVehicleChanged" event
    _data = vehicle ACE_player;
    if !(_data isEqualTo GVAR(OldPlayerVehicle)) then {
        // Raise ACE event locally
        GVAR(OldPlayerVehicle) = _data;
        ["playerVehicleChanged", [ACE_player, _data]] call FUNC(localEvent);
    };

    // "playerTurretChanged" event
    _data = [ACE_player] call FUNC(getTurretIndex);
    if !(_data isEqualTo GVAR(OldPlayerTurret)) then {
        // Raise ACE event locally
        GVAR(OldPlayerTurret) = _data;
        ["playerTurretChanged", [ACE_player, _data]] call FUNC(localEvent);
    };

    // "playerWeaponChanged" event
    _data = currentWeapon ACE_player;
    if (_data != GVAR(OldPlayerWeapon)) then {
        // Raise ACE event locally
        GVAR(OldPlayerWeapon) = _data;
        ["playerWeaponChanged", [ACE_player, _data]] call FUNC(localEvent);
    };

    // "playerInventoryChanged" event
    _data = [ACE_player] call FUNC(getAllGear);
    if !(_data isEqualTo GVAR(OldPlayerInventory)) then {
        // Raise ACE event locally
        GVAR(OldPlayerInventory) = _data;
        ["playerInventoryChanged", [ACE_player, _data]] call FUNC(localEvent);
    };

    // "playerVisionModeChanged" event
    _data = currentVisionMode ACE_player;
    if !(_data isEqualTo GVAR(OldPlayerVisionMode)) then {
        // Raise ACE event locally
        GVAR(OldPlayerVisionMode) = _data;
        ["playerVisionModeChanged", [ACE_player, _data]] call FUNC(localEvent);
    };

    // "cameraViewChanged" event
    _data = cameraView;
    if !(_data isEqualTo GVAR(OldCameraView)) then {
        // Raise ACE event locally
        GVAR(OldCameraView) = _data;
        ["cameraViewChanged", [ACE_player, _data]] call FUNC(localEvent);
    };

    // "visibleMapChanged" event
    _data = visibleMap;
    if (!_data isEqualTo GVAR(OldVisibleMap)) then {
        // Raise ACE event locally
        GVAR(OldVisibleMap) = _data;
        ["visibleMapChanged", [ACE_player, _data]] call FUNC(localEvent);
    };

    // "inventoryDisplayChanged" event
    _data = !(isNull findDisplay 602);
    if !(_data isEqualTo GVAR(OldInventoryDisplayIsOpen)) then {
        // Raise ACE event locally
        GVAR(OldInventoryDisplayIsOpen) = _data;
        ["inventoryDisplayChanged", [ACE_player, _data]] call FUNC(localEvent);
    };

    // "zeusDisplayChanged" event
    _data = !(isNull findDisplay 312);
    if !(_data isEqualTo GVAR(OldZeusDisplayIsOpen)) then {
        // Raise ACE event locally
        GVAR(OldZeusDisplayIsOpen) = _data;
        ["zeusDisplayChanged", [ACE_player, _data]] call FUNC(localEvent);
    };

    // "activeCameraChanged" event
    _data = call FUNC(isfeatureCameraActive);
    if !(_data isEqualTo GVAR(OldIsCamera)) then {
        // Raise ACE event locally
        GVAR(OldIsCamera) = _data;
        ["activeCameraChanged", [ACE_player, _data]] call FUNC(localEvent);
    };

    END_COUNTER(stateChecker);
}, 0, []] call CBA_fnc_addPerFrameHandler;


//////////////////////////////////////////////////
// Eventhandlers for player controlled machines
//////////////////////////////////////////////////

// @todo still needed?
[QGVAR(StateArrested), false, true, QUOTE(ADDON)] call FUNC(defineVariable);

["displayTextStructured", {_this call FUNC(displayTextStructured)}] call FUNC(addEventhandler);
["displayTextPicture", {_this call FUNC(displayTextPicture)}] call FUNC(addEventhandler);

["medical_onUnconscious", {
    params ["_unit", "_isUnconscious"];

    if (local _unit && {!_isUnconscious}) then {
        [_unit, false, QFUNC(loadPerson), west /* dummy side */] call FUNC(switchToGroupSide);
    };
}] call FUNC(addEventhandler);


//////////////////////////////////////////////////
// Add various canInteractWith conditions
//////////////////////////////////////////////////

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
            ["PlayerJip", [player]] call FUNC(localEvent);
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
