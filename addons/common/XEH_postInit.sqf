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
["forceWalk", false, ["ace_advanced_fatigue", "ACE_SwitchUnits", "ACE_Attach", "ACE_dragging", "ACE_Explosives", "ACE_Ladder", "ACE_Sandbag", "ACE_refuel", "ACE_rearm", "ACE_Trenches", "ace_medical_fracture"]] call FUNC(statusEffect_addType);
["blockSprint", false, ["ace_advanced_fatigue", "ace_medical_fracture"]] call FUNC(statusEffect_addType);
["setCaptive", true, [QEGVAR(captives,Handcuffed), QEGVAR(captives,Surrendered)]] call FUNC(statusEffect_addType);
["blockDamage", false, ["fixCollision", "ACE_cargo"]] call FUNC(statusEffect_addType);
["blockEngine", false, ["ACE_Refuel"]] call FUNC(statusEffect_addType);
["blockThrow", false, ["ACE_Attach", "ACE_concertina_wire", "ACE_dragging", "ACE_Explosives", "ACE_Ladder", "ACE_rearm", "ACE_refuel", "ACE_Sandbag", "ACE_Trenches", "ACE_tripod"]] call FUNC(statusEffect_addType);
["setHidden", true, ["ace_unconscious"]] call FUNC(statusEffect_addType);
["blockRadio", false, [QEGVAR(captives,Handcuffed), QEGVAR(captives,Surrendered), "ace_unconscious"]] call FUNC(statusEffect_addType);

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
    if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
        _object setVariable ["tf_unable_to_use_radio", _set > 0, true];
    };
    if (isClass (configFile >> "CfgPatches" >> "acre_main")) then {
        _object setVariable ["acre_sys_core_isDisabled", _set > 0, true];
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

// Event to log Fix Headbug output
[QGVAR(headbugFixUsed), {
    params ["_profileName", "_animation"];
    INFO_2("Headbug Used: Name: %1, Animation: %2",_profileName,_animation);
}] call CBA_fnc_addEventHandler;

[QGVAR(fixCollision), FUNC(fixCollision)] call CBA_fnc_addEventHandler;
[QGVAR(fixFloating), FUNC(fixFloating)] call CBA_fnc_addEventHandler;
[QGVAR(fixPosition), FUNC(fixPosition)] call CBA_fnc_addEventHandler;

["ace_loadPersonEvent", LINKFUNC(loadPersonLocal)] call CBA_fnc_addEventHandler;
["ace_unloadPersonEvent", LINKFUNC(unloadPersonLocal)] call CBA_fnc_addEventHandler;

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
[QGVAR(addWeaponItem), {(_this select 0) addWeaponItem [(_this select 1), (_this select 2)]}] call CBA_fnc_addEventHandler;

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
    [QGVAR(claimSafe), LINKFUNC(claimSafeServer)] call CBA_fnc_addEventHandler;
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
// Set up ace_settingsInitialized eventhandler
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
        switch (toLower _position) do {
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
    {_unit != _target && {vehicle _unit == vehicle _target}} ||
    // Players can always interact with connected UAV
    {!(isNull (ACE_controlledUAV select 0))}
}] call FUNC(addCanInteractWithCondition);

["isNotInZeus", {isNull curatorCamera}] call FUNC(addCanInteractWithCondition);

["isNotUnconscious", {
    params ["_unit"];
    lifeState _unit != "INCAPACITATED"
}] call FUNC(addCanInteractWithCondition);

//////////////////////////////////////////////////
// Set up reload mutex
//////////////////////////////////////////////////

GVAR(isReloading) = false;
GVAR(reloadMutex_lastMagazines) = [];
// When reloading, the new magazine is removed from inventory, an animation plays and then the old magazine is added
// If the animation is interrupted, the new magazine will be lost
["loadout", {
    params ["_unit", "_newLoadout"];
    private _mags = magazines _unit;
    // if our magazine count dropped by 1, we might be reloading
    if ((count GVAR(reloadMutex_lastMagazines)) - (count _mags) == 1) then {
        private _weapon = currentWeapon _unit;
        private _muzzle = currentMuzzle _unit;
        if (_weapon == "") exitWith {};
        private _wpnMzlConfig = configFile >> "CfgWeapons" >> _weapon;
        if (_muzzle != _weapon) then { _wpnMzlConfig = _wpnMzlConfig >> _muzzle; };

        private _compatMags = [_wpnMzlConfig] call CBA_fnc_compatibleMagazines;
        private _lastCompatMagCount = {_x in _compatMags} count GVAR(reloadMutex_lastMagazines);
        private _curCompatMagCount = {_x in _compatMags} count _mags;
        TRACE_3("",_wpnMzlConfig,_lastCompatMagCount,_curCompatMagCount);
        if (_lastCompatMagCount - _curCompatMagCount != 1) exitWith {}; // check if magazines for our specific muzzle dropped by 1

        private _gesture = getText (_wpnMzlConfig >> "reloadAction");
        if (_gesture == "") exitWith {}; //Ignore weapons with no reload gesture (binoculars)
        private _isLauncher = _weapon isKindOf ["Launcher", configFile >> "CfgWeapons"];
        private _duration = 0;
        if (_isLauncher) then {
            _duration = getNumber (configfile >> "CfgMovesMaleSdr" >> "States" >> _gesture >> "speed");
        };
        if (_duration == 0) then {
            _duration = getNumber (configfile >> "CfgGesturesMale" >> "States" >> _gesture >> "speed");
        };

        if (_duration != 0) then {
            _duration = if (_duration < 0) then { abs _duration } else { 1 / _duration };
        } else {
            _duration = 6;
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
    GVAR(reloadMutex_lastMagazines) = _mags;
}, true] call CBA_fnc_addPlayerEventHandler;

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

GVAR(commonPostInited) = true;
