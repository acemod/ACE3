// BWA3 Realism - Core
// (C) 2013 KoffeinFlummi. See LICENSE.

QGVAR(remoteFnc) addPublicVariableEventHandler {
  (_this select 1) call FUNC(execRemoteFnc);
};

[missionNamespace] call FUNC(executePersistent);

// check previous version number from profile
_currentVersion = getText (configFile >> "CfgPatches" >> "AGM_Core" >> "version");
_previousVersion = profileNamespace getVariable ["AGM_VersionNumberString", ""];

if (_currentVersion != _previousVersion) then {
  // do something

  profileNamespace setVariable ["AGM_VersionNumberString", _currentVersion];
};

0 spawn compile preprocessFileLineNumbers PATHTOF(scripts\Version\checkVersionNumber.sqf);

// everything that only player controlled machines need, goes below this
if (!hasInterface) exitWith {};

call compile preprocessFileLineNumbers PATHTOF(scripts\assignedItemFix.sqf);

GVAR(keyInput)  = compile preprocessFileLineNumbers PATHTOF(scripts\keyInput.sqf);
GVAR(keyRelease)  = compile preprocessFileLineNumbers PATHTOF(scripts\keyRelease.sqf);
GVAR(editKey)   = compile preprocessFileLineNumbers PATHTOF(scripts\editKey.sqf);
GVAR(openMenu)  = compile preprocessFileLineNumbers PATHTOF(scripts\openMenu.sqf);
GVAR(closeMenu) = compile preprocessFileLineNumbers PATHTOF(scripts\closeMenu.sqf);
GVAR(nextKeys) = compile preprocessFileLineNumbers PATHTOF(scripts\nextKeys.sqf);
GVAR(toggleState) = compile preprocessFileLineNumbers PATHTOF(scripts\toggleState.sqf);

[false] call FUNC(setKeyDefault);

GVAR(keyStates) = [];
GVAR(keyTimes) = [];
for "_index" from 0 to 300 do {
  GVAR(keyStates) set [_index, 0];
  GVAR(keyTimes) set [_index, -1];
};

call compile preprocessFileLineNumbers PATHTOF(scripts\KeyInput\initCanInteractFunction.sqf);
call compile preprocessFileLineNumbers PATHTOF(scripts\KeyInput\initKeys.sqf);
call compile preprocessFileLineNumbers PATHTOF(scripts\KeyInput\initScrollWheel.sqf);

0 spawn {
  while {true} do {
    waitUntil {!isNull (findDisplay 46)}; sleep 0.1;
    findDisplay 46 displayAddEventHandler ["KeyDown", "_this call GVAR(onKeyDown)"];
    findDisplay 46 displayAddEventHandler ["KeyUp", "_this call GVAR(onKeyUp)"];
    findDisplay 46 displayAddEventHandler ["MouseZChanged", "_this call GVAR(onScrollWheel)"];
    [false] call FUNC(disableUserInput);
    waitUntil {isNull (findDisplay 46)};
  };
};

enableCamShake true;

[missionNamespace, "playerChanged", "{if (alive (_this select 0)) then {[_this select 0] call FUNC(setName)}; if (alive (_this select 1)) then {[_this select 1] call FUNC(setName)};}"] call FUNC(addCustomEventhandler);
