// ACE - Common
#include "script_component.hpp"

QGVAR(remoteFnc) addPublicVariableEventHandler {
    (_this select 1) call FUNC(execRemoteFnc);
};

[missionNamespace] call FUNC(executePersistent);

// check previous version number from profile
_currentVersion = getText (configFile >> "CfgPatches" >> ADDON >> "version");
_previousVersion = profileNamespace getVariable ["ACE_VersionNumberString", ""];

if (_currentVersion != _previousVersion) then {
    // do something

    profileNamespace setVariable ["ACE_VersionNumberString", _currentVersion];
};

0 spawn COMPILE_FILE(scripts\Version\checkVersionNumber);

//add network event handlers
"ACEg" addPublicVariableEventHandler { _this call FUNC(_handletNetEvent); };
"ACEc" addPublicVariableEventHandler { _this call FUNC(_handletNetEvent); };

// everything that only player controlled machines need, goes below this
if (!hasInterface) exitWith {};

call COMPILE_FILE(scripts\assignedItemFix);

GVAR(keyInput)    = COMPILE_FILE(scripts\keyInput);
GVAR(keyRelease)  = COMPILE_FILE(scripts\keyRelease);
GVAR(editKey)     = COMPILE_FILE(scripts\editKey);
GVAR(openMenu)    = COMPILE_FILE(scripts\openMenu);
GVAR(closeMenu)   = COMPILE_FILE(scripts\closeMenu);
GVAR(nextKeys)    = COMPILE_FILE(scripts\nextKeys);
GVAR(toggleState) = COMPILE_FILE(scripts\toggleState);

[false] call FUNC(setKeyDefault);

GVAR(keyStates) = [];
GVAR(keyTimes) = [];
for "_index" from 0 to 300 do {
    GVAR(keyStates) set [_index, 0];
    GVAR(keyTimes) set [_index, -1];
};

call COMPILE_FILE(scripts\KeyInput\initCanInteractFunction);
call COMPILE_FILE(scripts\KeyInput\initKeys);
call COMPILE_FILE(scripts\KeyInput\initScrollWheel);

0 spawn {
    while {true} do {
        waitUntil {!isNull (findDisplay 46)}; sleep 0.1;
        findDisplay 46 displayAddEventHandler ["KeyDown", QUOTE( _this call GVAR(onKeyDown) )];
        findDisplay 46 displayAddEventHandler ["KeyUp", QUOTE( _this call GVAR(onKeyUp) )];
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


