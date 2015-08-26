// ACE - Common
#include "script_component.hpp"

//IGNORE_PRIVATE_WARNING("_handleNetEvent", "_handleRequestAllSyncedEvents", "_handleRequestSyncedEvent", "_handleSyncedEvent");

//Singe PFEH to handle execNextFrame and waitAndExec:
[{
    private ["_entry"];

    //Handle the waitAndExec array:
    while {((count GVAR(waitAndExecArray)) > 0) && {((GVAR(waitAndExecArray) select 0) select 0) <= ACE_Time}} do {
        _entry = GVAR(waitAndExecArray) deleteAt 0;
        _entry params ["", "_code", "_args"];
        _args call _code;
    };

    //Handle the execNextFrame array:
    {
        params ["_code", "_args"];
        _args call _code;
        true
    } count GVAR(nextFrameBufferA);
    //Swap double-buffer:
    GVAR(nextFrameBufferA) = GVAR(nextFrameBufferB);
    GVAR(nextFrameBufferB) = [];
    GVAR(nextFrameNo) = diag_frameno + 1;
}, 0, []] call CBA_fnc_addPerFrameHandler;


// Listens for global "SettingChanged" events, to update the force status locally
["SettingChanged", {

    if !(params ["_name", "_value", "_force"]) exitWith {};
    private "_settingData";
    if (_force) then {
        _settingData = [_name] call FUNC(getSettingData);
        if (count _settingData == 0) exitWith {};
        _settingData set [6,_force];
    };
}] call FUNC(addEventhandler);

//~~~~~Get Map Data~~~~~
//Find MGRS zone and 100km grid for current map
[] call FUNC(getMGRSdata);
//Prepare variables for FUNC(getMapGridFromPos)/FUNC(getMapPosFromGrid)
[] call FUNC(getMapGridData);

["HeadbugFixUsed", {
    params ["_profileName", "_animation"];
    diag_log text format ["[ACE] Headbug Used: Name: %1, Animation: %2", _profileName, _animation];
}] call FUNC(addEventHandler);

["fixCollision", DFUNC(fixCollision)] call FUNC(addEventhandler);
["fixFloating", DFUNC(fixFloating)] call FUNC(addEventhandler);
["fixPosition", DFUNC(fixPosition)] call FUNC(addEventhandler);

["unloadPersonEvent", DFUNC(unloadPersonLocal)] call FUNC(addEventhandler);

["lockVehicle", {
    _this setVariable [QGVAR(lockStatus), locked _this];
    _this lock 2;
}] call FUNC(addEventhandler);

["unlockVehicle", {
    _this lock (_this getVariable [QGVAR(lockStatus), locked _this]);
}] call FUNC(addEventhandler);

["setDir", {params ["_object", "_dir"]; _object setDir _dir}] call FUNC(addEventhandler);
["setFuel", {params ["_object", "_value"]; _object setFuel _value}] call FUNC(addEventhandler);
["setSpeaker", {params ["_object", "_speaker"]; _object setSpeaker _speaker}] call FUNC(addEventhandler);

if (isServer) then {
    ["hideObjectGlobal", {params ["_object", "_status"]; _object hideObjectGlobal _status}] call FUNC(addEventHandler);
};

// hack to get PFH to work in briefing
[QGVAR(onBriefingPFH), "onEachFrame", {
    if (ACE_time > 0) exitWith {
        [QGVAR(onBriefingPFH), "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
    };

    call CBA_common_fnc_onFrame;
}] call BIS_fnc_addStackedEventHandler;
/////

QGVAR(remoteFnc) addPublicVariableEventHandler {
    (_this select 1) call FUNC(execRemoteFnc);
};

[missionNamespace] call FUNC(executePersistent);

private ["_currentVersion", "_previousVersion"];
// check previous version number from profile
_currentVersion = getText (configFile >> "CfgPatches" >> QUOTE(ADDON) >> "version");
_previousVersion = profileNamespace getVariable ["ACE_VersionNumberString", ""];

if (_currentVersion != _previousVersion) then {
    // do something

    profileNamespace setVariable ["ACE_VersionNumberString", _currentVersion];
};

// ACE events
"ACEg" addPublicVariableEventHandler { _this call FUNC(_handleNetEvent); };
"ACEc" addPublicVariableEventHandler { _this call FUNC(_handleNetEvent); };

// Synced ACE events
// Handle JIP scenario
if(!isServer) then {
    ["PlayerJip", {
        diag_log text format["[ACE] * JIP event synchronization initialized"];
        ["SEH_all", [player]] call FUNC(serverEvent);
    }] call FUNC(addEventHandler);
} else {
    ["SEH_all", DFUNC(_handleRequestAllSyncedEvents)] call FUNC(addEventHandler);
};
["SEH", DFUNC(_handleSyncedEvent)] call FUNC(addEventHandler);
["SEH_s", DFUNC(_handleRequestSyncedEvent)] call FUNC(addEventHandler);
if (isServer) then {
    [DFUNC(syncedEventPFH), 0.5, []] call CBA_fnc_addPerFrameHandler;
};
call FUNC(checkFiles);


// Create a pfh to wait until all postinits are ready and settings are initialized
[{
    params ["_args","_idPFH"];
    _args params ["_waitingMsgSent"];
    // If post inits are not ready then wait
    if !(SLX_XEH_MACHINE select 8) exitWith {};

    // If settings are not initialized then wait
    if (isNil QGVAR(settings) || {(!isServer) && (isNil QEGVAR(modules,serverModulesRead))}) exitWith {
        if (!_waitingMsgSent) then {
            _args set [0, true];
            diag_log text format["[ACE] Waiting on settings from server"];
        };
    };

    [_idPFH] call CBA_fnc_removePerFrameHandler;

    diag_log text format["[ACE] Settings received from server"];

    // Event so that ACE_Modules have their settings loaded:
    ["InitSettingsFromModules", []] call FUNC(localEvent);

    // Load user settings from profile
    if (hasInterface) then {
        call FUNC(loadSettingsFromProfile);
        call FUNC(loadSettingsLocalizedText);
    };

    diag_log text format["[ACE] Settings initialized"];

    //Event that settings are safe to use:
    ["SettingsInitialized", []] call FUNC(localEvent);

}, 0, [false]] call CBA_fnc_addPerFrameHandler;


["SettingsInitialized", {
    [
        GVAR(checkPBOsAction),
        GVAR(checkPBOsCheckAll),
        call compile GVAR(checkPBOsWhitelist)
    ] call FUNC(checkPBOs)
}] call FUNC(addEventHandler);


/***************************************************************/
/***************************************************************/
/***************************************************************/
/***************************************************************/
/***************************************************************/

// everything that only player controlled machines need, goes below this
if (!hasInterface) exitWith {};

call FUNC(assignedItemFix);
GVAR(ScrollWheelFrame) = diag_frameno;

addMissionEventHandler ["Loaded", {call FUNC(mouseZHandler)}];
call FUNC(mouseZHandler);

enableCamShake true;

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

GVAR(OldPlayerInventory) = [ACE_player] call FUNC(getAllGear);
GVAR(OldPlayerVisionMode) = currentVisionMode ACE_player;
GVAR(OldZeusDisplayIsOpen) = !(isNull findDisplay 312);
GVAR(OldCameraView) = cameraView;
GVAR(OldPlayerVehicle) = vehicle ACE_player;
GVAR(OldPlayerTurret) = [ACE_player] call FUNC(getTurretIndex);
GVAR(OldPlayerWeapon) = currentWeapon ACE_player;

// PFH to raise varios events
[{
    private ["_newCameraView", "_newInventoryDisplayIsOpen", "_newPlayerInventory", "_newPlayerTurret", "_newPlayerVehicle", "_newPlayerVisionMode", "_newPlayerWeapon", "_newZeusDisplayIsOpen"];
    // "playerInventoryChanged" event
    _newPlayerInventory = [ACE_player] call FUNC(getAllGear);
    if !(_newPlayerInventory isEqualTo GVAR(OldPlayerInventory)) then {
        // Raise ACE event locally
        GVAR(OldPlayerInventory) = _newPlayerInventory;
        ["playerInventoryChanged", [ACE_player, _newPlayerInventory]] call FUNC(localEvent);
    };

    // "playerVisionModeChanged" event
    _newPlayerVisionMode = currentVisionMode ACE_player;
    if !(_newPlayerVisionMode isEqualTo GVAR(OldPlayerVisionMode)) then {
        // Raise ACE event locally
        GVAR(OldPlayerVisionMode) = _newPlayerVisionMode;
        ["playerVisionModeChanged", [ACE_player, _newPlayerVisionMode]] call FUNC(localEvent);
    };

    // "inventoryDisplayChanged" event
    _newInventoryDisplayIsOpen = !(isNull findDisplay 602);
    if !(_newInventoryDisplayIsOpen isEqualTo GVAR(OldInventoryDisplayIsOpen)) then {
        // Raise ACE event locally
        GVAR(OldInventoryDisplayIsOpen) = _newInventoryDisplayIsOpen;
        ["inventoryDisplayChanged", [ACE_player, _newInventoryDisplayIsOpen]] call FUNC(localEvent);
    };

    // "zeusDisplayChanged" event
    _newZeusDisplayIsOpen = !(isNull findDisplay 312);
    if !(_newZeusDisplayIsOpen isEqualTo GVAR(OldZeusDisplayIsOpen)) then {
        // Raise ACE event locally
        GVAR(OldZeusDisplayIsOpen) = _newZeusDisplayIsOpen;
        ["zeusDisplayChanged", [ACE_player, _newZeusDisplayIsOpen]] call FUNC(localEvent);
    };

    // "cameraViewChanged" event
    _newCameraView = cameraView;
    if !(_newCameraView isEqualTo GVAR(OldCameraView)) then {
        // Raise ACE event locally
        GVAR(OldCameraView) = _newCameraView;
        ["cameraViewChanged", [ACE_player, _newCameraView]] call FUNC(localEvent);
    };

    // "playerVehicleChanged" event
    _newPlayerVehicle = vehicle ACE_player;
    if !(_newPlayerVehicle isEqualTo GVAR(OldPlayerVehicle)) then {
        // Raise ACE event locally
        GVAR(OldPlayerVehicle) = _newPlayerVehicle;
        ["playerVehicleChanged", [ACE_player, _newPlayerVehicle]] call FUNC(localEvent);
    };

    // "playerTurretChanged" event
    _newPlayerTurret = [ACE_player] call FUNC(getTurretIndex);
    if !(_newPlayerTurret isEqualTo GVAR(OldPlayerTurret)) then {
        // Raise ACE event locally
        GVAR(OldPlayerTurret) = _newPlayerTurret;
        ["playerTurretChanged", [ACE_player, _newPlayerTurret]] call FUNC(localEvent);
    };

    // "playerWeaponChanged" event
    _newPlayerWeapon = currentWeapon ACE_player;
    if (_newPlayerWeapon != GVAR(OldPlayerWeapon)) then {
        // Raise ACE event locally
        GVAR(OldPlayerWeapon) = _newPlayerWeapon;
        ["playerWeaponChanged", [ACE_player, _newPlayerWeapon]] call FUNC(localEvent);
    };

}, 0, []] call CBA_fnc_addPerFrameHandler;


// PFH to raise camera created event. Only works on these cams by BI.
#define ALL_CAMERAS [ \
    missionNamespace getVariable ["BIS_DEBUG_CAM", objNull], \
    missionNamespace getVariable ["BIS_fnc_camera_cam", objNull], \
    uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull], \
    uiNamespace getVariable ["BIS_fnc_animViewer_cam", objNull], \
    missionNamespace getVariable ["BIS_fnc_establishingShot_fakeUAV", objNull] \
]

GVAR(OldIsCamera) = false;

[{

    // "activeCameraChanged" event
    private ["_isCamera"];
    _isCamera = {!isNull _x} count ALL_CAMERAS > 0;
    if !(_isCamera isEqualTo GVAR(OldIsCamera)) then {
        // Raise ACE event locally
        GVAR(OldIsCamera) = _isCamera;
        ["activeCameraChanged", [ACE_player, _isCamera]] call FUNC(localEvent);
    };

}, 1, []] call CBA_fnc_addPerFrameHandler; // feel free to decrease the sleep ACE_time if you need it.


[QGVAR(StateArrested),false,true,QUOTE(ADDON)] call FUNC(defineVariable);

["displayTextStructured", FUNC(displayTextStructured)] call FUNC(addEventhandler);
["displayTextPicture", FUNC(displayTextPicture)] call FUNC(addEventhandler);
["medical_onUnconscious", {
    params ["_unit", "_isUnconc"];
    if (local _unit && {!_isUnconc}) then {
        [_unit, false, QFUNC(loadPerson), west /* dummy side */] call FUNC(switchToGroupSide);
    };
}] call FUNC(addEventhandler);

["notOnMap", {!visibleMap}] call FUNC(addCanInteractWithCondition);
["isNotInside", {
    params ["_player","_target"];
    // Players can always interact with himself if not boarded
    vehicle _player == _player ||
    // Players can always interact with his vehicle
    {vehicle _player == _target} ||
    // Players can always interact with passengers of the same vehicle
    {!(_player isEqualTo _target) && {vehicle _player == vehicle _target}}
}] call FUNC(addCanInteractWithCondition);

// Lastly, do JIP events
// JIP Detection and event trigger. Run this at the very end, just in case anything uses it
if(isMultiplayer && { ACE_time > 0 || isNull player } ) then {
    // We are jipping! Get ready and wait, and throw the event
    [{
        if(!(isNull player)) then {
            ["PlayerJip", [player] ] call FUNC(localEvent);
            [(_this select 1)] call CBA_fnc_removePerFrameHandler;
        };
    }, 0, []] call CBA_fnc_addPerFrameHandler;
};

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

["ACE3 Equipment", QGVAR(openDevice), (localize "STR_ACE_Common_toggleHandheldDevice"),
{
    [] call FUNC(deviceKeyFindValidIndex);
    if (GVAR(deviceKeyCurrentIndex) == -1) exitWith {false};
    [] call ((GVAR(deviceKeyHandlingArray) select GVAR(deviceKeyCurrentIndex)) select 3);
    true
},
{false},
[0xC7, [false, false, false]], false] call CBA_fnc_addKeybind;  //Home Key

["ACE3 Equipment", QGVAR(closeDevice), (localize "STR_ACE_Common_closeHandheldDevice"),
{
    [] call FUNC(deviceKeyFindValidIndex);
    if (GVAR(deviceKeyCurrentIndex) == -1) exitWith {false};
    [] call ((GVAR(deviceKeyHandlingArray) select GVAR(deviceKeyCurrentIndex)) select 4);
    true
},
{false},
[0xC7, [false, true, false]], false] call CBA_fnc_addKeybind;  //CTRL + Home Key

["ACE3 Equipment", QGVAR(cycleDevice), (localize "STR_ACE_Common_cycleHandheldDevices"),
{
    private ["_displayName", "_iconImage"];
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
