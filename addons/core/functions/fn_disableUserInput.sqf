/*
 * Author: commy2
 *
 * Disables key input. ESC can still be pressed to open the menu.
 *
 * Argument:
 * 0: True to disable key inputs, false to re-enable them (Bool)
 *
 * Return value:
 * Nothing
 */

private ["_state", "_dlg"];

_state = _this select 0;

if (_state) then {
  disableSerialization;

  if (!isNull (uiNamespace getVariable ["GVAR(dlgDisableMouse)", displayNull])) exitWith {};
  if ("AGM_DisableUserInput" in ([BIS_stackedEventHandlers_onEachFrame, {_this select 0}] call GVAR(fnc_map))) exitWith {};

  // end TFAR and ACRE2 radio transmissions
  0 spawn GVAR(fnc_endRadioTransmission);

  // Close map
  if (visibleMap && {!(player getVariable ["AGM_canSwitchUnits", false])}) then {openMap false};

  closeDialog 0;
  createDialog "GVAR(DisableMouse_Dialog)";

  _dlg = uiNamespace getVariable "GVAR(dlgDisableMouse)";

  _dlg displayAddEventHandler ["KeyDown", {
    _key = _this select 1;

    if (_key == 1 && {alive player}) then {
      createDialog (["RscDisplayInterrupt", "RscDisplayMPInterrupt"] select isMultiplayer);

      disableSerialization;
      _dlg = finddisplay 49;
      _dlg displayAddEventHandler ["KeyDown", {
        _key = _this select 1;
        !(_key == 1)
      }];

      for "_index" from 100 to 2000 do {
        (_dlg displayCtrl _index) ctrlEnable false;
      };

      _ctrl = _dlg displayctrl 103;
      _ctrl ctrlSetEventHandler ["buttonClick", "while {!isNull (uiNamespace getVariable ['GVAR(dlgDisableMouse)', displayNull])} do {closeDialog 0}; failMission 'LOSER'; [false] call GVAR(fnc_disableUserInput);"];
      _ctrl ctrlEnable true;
      _ctrl ctrlSetText "ABORT";
      _ctrl ctrlSetTooltip "Abort.";

      _ctrl = _dlg displayctrl ([104, 1010] select isMultiplayer);
      _ctrl ctrlSetEventHandler ["buttonClick", "closeDialog 0; player setDamage 1; [false] call GVAR(fnc_disableUserInput);"];
      _ctrl ctrlEnable (call {_config = missionConfigFile >> "respawnButton"; !isNumber _config || {getNumber _config == 1}});
      _ctrl ctrlSetText "RESPAWN";
      _ctrl ctrlSetTooltip "Respawn.";
    };

    if (_key in actionKeys "TeamSwitch"       && {teamSwitchEnabled})                                then {(uiNamespace getVariable ["GVAR(dlgDisableMouse)", displayNull]) closeDisplay 0; teamSwitch};//_acc = accTime; teamSwitch; setAccTime _acc};
    if (_key in actionKeys "CuratorInterface" && {getAssignedCuratorLogic player in allCurators})    then {(uiNamespace getVariable ["GVAR(dlgDisableMouse)", displayNull]) closeDisplay 0; openCuratorInterface};
    if (_key in actionKeys "ShowMap"          && {player getVariable ["AGM_canSwitchUnits", false]}) then {(uiNamespace getVariable ["GVAR(dlgDisableMouse)", displayNull]) closeDisplay 0; openMap true};

    if (serverCommandAvailable "#missions" || {player getVariable ["AGM_isUnconscious", false] && {(call GVAR(fnc_player)) getVariable ["AGM_Medical_AllowChatWhileUnconscious", missionNamespace getVariable ["AGM_Medical_AllowChatWhileUnconscious", false]]}})  then {
      if (!(_key in (actionKeys "DefaultAction" + actionKeys "Throw")) && {_key in (actionKeys "Chat" + actionKeys "PrevChannel" + actionKeys "NextChannel")}) then {
        _key = 0;
      };
    };

    _key > 0
  }];
  _dlg displayAddEventHandler ["KeyUp", {true}];

  ["AGM_DisableUserInput", "onEachFrame", {
    if (isNull (uiNamespace getVariable ["GVAR(dlgDisableMouse)", displayNull]) && {!visibleMap && isNull findDisplay 49 && isNull findDisplay 312 && isNull findDisplay 632}) then {
      ["AGM_DisableUserInput", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
      [true] call GVAR(fnc_disableUserInput);
    };
  }] call BIS_fnc_addStackedEventHandler;
} else {
  if ("AGM_DisableUserInput" in ([BIS_stackedEventHandlers_onEachFrame, {_this select 0}] call GVAR(fnc_map))) then {
    ["AGM_DisableUserInput", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
  };

  (uiNamespace getVariable ["GVAR(dlgDisableMouse)", displayNull]) closeDisplay 0;
};
