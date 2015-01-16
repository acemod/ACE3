// ACE - Common
#include "script_component.hpp"

QGVAR(remoteFnc) addPublicVariableEventHandler {
    (_this select 1) call FUNC(execRemoteFnc);
};

[missionNamespace] call FUNC(executePersistent);

// check previous version number from profile
_currentVersion = getText (configFile >> "CfgPatches" >> "ACE_Common" >> "version");
_previousVersion = profileNamespace getVariable ["ACE_VersionNumberString", ""];

if (_currentVersion != _previousVersion) then {
    // do something

    profileNamespace setVariable ["ACE_VersionNumberString", _currentVersion];
};

0 spawn COMPILE_FILE(scripts\Version\checkVersionNumber);

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
[missionNamespace, "playerChanged", {
    if (alive (_this select 0)) then {
        [_this select 0] call FUNC(setName)
    };
    if (alive (_this select 1)) then {
        [_this select 1] call FUNC(setName)
    };
}] call FUNC(addCustomEventhandler);



[QGVAR(ENABLE_REVIVE_COUNTER), 0, false, QGVAR(ADDON)] call FUNC(defineVariable);
[QGVAR(inReviveState), false, true, QGVAR(ADDON)] call FUNC(defineVariable);
[QGVAR(isDead),false,true,QUOTE(ADDON)] call FUNC(defineVariable);
[QGVAR(isDeadPlayer), false, true, QUOTE(ADDON)] call FUNC(defineVariable);
[QGVAR(StateArrested),false,true,QUOTE(ADDON)] call FUNC(defineVariable);
[QGVAR(StateUnconscious),false,true,QUOTE(ADDON)] call FUNC(defineVariable);
[QGVAR(ENABLE_REVIVE_SETDEAD_F),0,false,QUOTE(ADDON)] call FUNC(defineVariable);
[QGVAR(carriedBy),objNull,false,QUOTE(ADDON)] call FUNC(defineVariable);

if (isNil QGVAR(ENABLE_REVIVE_F)) then {
    GVAR(ENABLE_REVIVE_F) = 0;
};

