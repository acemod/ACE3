// BWA3 Realism - Core
// (C) 2013 KoffeinFlummi. See LICENSE.

"GVAR(remoteFnc)" addPublicVariableEventHandler {
  (_this select 1) call GVAR(fnc_execRemoteFnc);
};

[missionNamespace] call GVAR(fnc_executePersistent);

// check previous version number from profile
_currentVersion = getText (configFile >> "CfgPatches" >> "AGM_Core" >> "version");
_previousVersion = profileNamespace getVariable ["AGM_VersionNumberString", ""];

if (_currentVersion != _previousVersion) then {
  // do something

  profileNamespace setVariable ["AGM_VersionNumberString", _currentVersion];
};

0 spawn compile preprocessFileLineNumbers "\AGM_core\scripts\Version\checkVersionNumber.sqf";

// everything that only player controlled machines need, goes below this
if (!hasInterface) exitWith {};

call compile preprocessFileLineNumbers "\AGM_core\scripts\assignedItemFix.sqf";

GVAR(keyInput)  = compile preprocessFileLineNumbers "\AGM_core\scripts\keyInput.sqf";
GVAR(keyRelease)  = compile preprocessFileLineNumbers "\AGM_core\scripts\keyRelease.sqf";
GVAR(editKey)   = compile preprocessFileLineNumbers "\AGM_core\scripts\editKey.sqf";
GVAR(openMenu)  = compile preprocessFileLineNumbers "\AGM_core\scripts\openMenu.sqf";
GVAR(closeMenu) = compile preprocessFileLineNumbers "\AGM_core\scripts\closeMenu.sqf";
GVAR(nextKeys) = compile preprocessFileLineNumbers "\AGM_core\scripts\nextKeys.sqf";
GVAR(toggleState) = compile preprocessFileLineNumbers "\AGM_core\scripts\toggleState.sqf";

[false] call GVAR(fnc_setKeyDefault);

GVAR(keyStates) = [];
GVAR(keyTimes) = [];
for "_index" from 0 to 300 do {
  GVAR(keyStates) set [_index, 0];
  GVAR(keyTimes) set [_index, -1];
};

call compile preprocessFileLineNumbers "\AGM_core\scripts\KeyInput\initCanInteractFunction.sqf";
call compile preprocessFileLineNumbers "\AGM_core\scripts\KeyInput\initKeys.sqf";
call compile preprocessFileLineNumbers "\AGM_core\scripts\KeyInput\initScrollWheel.sqf";

0 spawn {
  while {true} do {
    waitUntil {!isNull (findDisplay 46)}; sleep 0.1;
    findDisplay 46 displayAddEventHandler ["KeyDown", "_this call GVAR(onKeyDown)"];
    findDisplay 46 displayAddEventHandler ["KeyUp", "_this call GVAR(onKeyUp)"];
    findDisplay 46 displayAddEventHandler ["MouseZChanged", "_this call GVAR(onScrollWheel)"];
    [false] call GVAR(fnc_disableUserInput);
    waitUntil {isNull (findDisplay 46)};
  };
};

enableCamShake true;

[missionNamespace, "playerChanged", "{if (alive (_this select 0)) then {[_this select 0] call GVAR(fnc_setName)}; if (alive (_this select 1)) then {[_this select 1] call GVAR(fnc_setName)};}"] call GVAR(fnc_addCustomEventhandler);
