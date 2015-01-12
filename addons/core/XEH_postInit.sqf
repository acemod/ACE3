// ACE - Core
#include "script_component.hpp"

QGVAR(remoteFnc) addPublicVariableEventHandler {
  (_this select 1) call FUNC(execRemoteFnc);
};

[missionNamespace] call FUNC(executePersistent);

// check previous version number from profile
_currentVersion = getText (configFile >> "CfgPatches" >> "ACE_Core" >> "version");
_previousVersion = profileNamespace getVariable ["ACE_VersionNumberString", ""];

if (_currentVersion != _previousVersion) then {
  // do something

  profileNamespace setVariable ["ACE_VersionNumberString", _currentVersion];
};

0 spawn COMPILE_FILE2(scripts\Version\checkVersionNumber);

// everything that only player controlled machines need, goes below this
if (!hasInterface) exitWith {};

call COMPILE_FILE2(scripts\assignedItemFix.sqf);

GVAR(keyInput)  = COMPILE_FILE2(scripts\keyInput.sqf);
GVAR(keyRelease)  = COMPILE_FILE2(scripts\keyRelease.sqf);
GVAR(editKey)   = COMPILE_FILE2(scripts\editKey.sqf);
GVAR(openMenu)  = COMPILE_FILE2(scripts\openMenu.sqf);
GVAR(closeMenu) = COMPILE_FILE2(scripts\closeMenu.sqf);
GVAR(nextKeys) = COMPILE_FILE2(scripts\nextKeys.sqf);
GVAR(toggleState) = COMPILE_FILE2(scripts\toggleState.sqf);

[false] call FUNC(setKeyDefault);

GVAR(keyStates) = [];
GVAR(keyTimes) = [];
for "_index" from 0 to 300 do {
  GVAR(keyStates) set [_index, 0];
  GVAR(keyTimes) set [_index, -1];
};

call COMPILE_FILE2(scripts\KeyInput\initCanInteractFunction.sqf);
call COMPILE_FILE2(scripts\KeyInput\initKeys.sqf);
call COMPILE_FILE2(scripts\KeyInput\initScrollWheel.sqf);

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
