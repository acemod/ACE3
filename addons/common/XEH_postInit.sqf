// ACE - Common
#include "script_component.hpp"

// Load settings from profile
if (hasInterface) then {
    call FUNC(loadSettingsFromProfile);
};

// Listens for global "SettingChanged" events, to update the force status locally
["SettingChanged", {

    PARAMS_2(_name,_value);
    if !(count _this > 2) exitWith {};

    _force = _this select 2;
    if (_force) then {
        _settingData = [_name] call FUNC(getSettingData);
        if (count _settingData == 0) exitWith {};
        _settingData set [6,_force];
    };
}] call FUNC(addEventhandler);

["fixCollision", DFUNC(fixCollision)] call FUNC(addEventhandler);
["fixFloating", DFUNC(fixFloating)] call FUNC(addEventhandler);
["fixPosition", DFUNC(fixPosition)] call FUNC(addEventhandler);

["lockVehicle", {
    _this setVariable [QGVAR(lockStatus), locked _this];
    _this lock 2;
}] call FUNC(addEventhandler);

["unlockVehicle", {
    _this lock (_this getVariable [QGVAR(lockStatus), locked _this]);
}] call FUNC(addEventhandler);

["setDir", {(_this select 0) setDir (_this select 1)}] call FUNC(addEventhandler);
["setFuel", {(_this select 0) setFuel (_this select 1)}] call FUNC(addEventhandler);

// hack to get PFH to work in briefing
[QGVAR(onBriefingPFH), "onEachFrame", {
    if (time > 0) exitWith {
        [QGVAR(onBriefingPFH), "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
    };

    call cba_common_fnc_onFrame;
}] call BIS_fnc_addStackedEventHandler;
/////

QGVAR(remoteFnc) addPublicVariableEventHandler {
    (_this select 1) call FUNC(execRemoteFnc);
};

[missionNamespace] call FUNC(executePersistent);

// check previous version number from profile
_currentVersion = getText (configFile >> "CfgPatches" >> QUOTE(ADDON) >> "version");
_previousVersion = profileNamespace getVariable ["ACE_VersionNumberString", ""];

if (_currentVersion != _previousVersion) then {
    // do something

    profileNamespace setVariable ["ACE_VersionNumberString", _currentVersion];
};

0 spawn COMPILE_FILE(scripts\Version\checkVersionNumber);

"ACEg" addPublicVariableEventHandler { _this call FUNC(_handleNetEvent); };
"ACEc" addPublicVariableEventHandler { _this call FUNC(_handleNetEvent); };

// everything that only player controlled machines need, goes below this
if (!hasInterface) exitWith {};

call COMPILE_FILE(scripts\assignedItemFix);
call COMPILE_FILE(scripts\initScrollWheel);

0 spawn {
    while {true} do {
        waitUntil {!isNull (findDisplay 46)}; sleep 0.1;
        findDisplay 46 displayAddEventHandler ["MouseZChanged", QUOTE( _this call GVAR(onScrollWheel) )];
        [false] call FUNC(disableUserInput);
        waitUntil {isNull (findDisplay 46)};
    };
};
enableCamShake true;

// Set the name for the current player
["playerChanged", {
    EXPLODE_2_PVT(_this,_newPlayer,_oldPlayer);

    if (alive _newPlayer) then {
        [_newPlayer] call FUNC(setName)
    };
    if (alive _oldPlayer) then {
        [_oldPlayer] call FUNC(setName)
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
    [ACE_player] call FUNC(getTurretIndex);
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

}, 0, []] call cba_fnc_addPerFrameHandler;

[QGVAR(StateArrested),false,true,QUOTE(ADDON)] call FUNC(defineVariable);

["displayTextStructured", FUNC(displayTextStructured)] call FUNC(addEventhandler);
["displayTextPicture", FUNC(displayTextPicture)] call FUNC(addEventhandler);

["notOnMap", {!visibleMap}] call FUNC(addCanInteractWithCondition);
["isNotInside", {
    // Players can always interact with himself if not boarded
    vehicle (_this select 0) == (_this select 0) ||
    // Players can always interact with his vehicle
    {vehicle (_this select 0) == (_this select 1)} ||
    // Players can always interact with passengers of the same vehicle
    {!((_this select 0) isEqualTo (_this select 1)) && {vehicle (_this select 0) == vehicle (_this select 1)}}
}] call FUNC(addCanInteractWithCondition);
