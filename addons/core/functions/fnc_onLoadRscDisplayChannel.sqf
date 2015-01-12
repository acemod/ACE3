/*
  Name: FUNC(onLoadRscDisplayChannel)

  Author: Pabst Mirror, commy2

  Description:
    When the RscDisplayChannel is loaded, this will constantly uiNamespace variable "AGM_currentChannel"
    with the raw localized text of CA_Channel (IDC=101). Only runs while the display is open.

  Parameters:
    0: DISPLAY - RscDisplayChannel

  Returns:
    Nothing
*/

/*
_this spawn {
  private "_display";
  disableSerialization;
  _display = _this select 0;
  waitUntil {
    if (isNull _display) exitWith {true};
    if (ctrlText (_display displayCtrl 101) != "") then {
      uiNamespace setVariable ["AGM_currentChannel", ctrlText (_display displayCtrl 101)];
    };
    false
  };
};
*/

uiNamespace setVariable ["AGM_ctrlChannel", (_this select 0) displayCtrl 101];

["AGM_currentChannel", "onEachFrame", {
  if (ctrlText (uiNamespace getVariable ["AGM_ctrlChannel", controlNull]) != "") then {
    uiNamespace setVariable ["AGM_currentChannel", ctrlText (uiNamespace getVariable ["AGM_ctrlChannel", controlNull])];
  };
}] call BIS_fnc_addStackedEventhandler;
