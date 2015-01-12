/*
  Name: FUNC(onLoadRscDisplayChannel)

  Author: Pabst Mirror, commy2

  Description:
    When the RscDisplayChannel is loaded, this will constantly uiNamespace variable "ACE_currentChannel"
    with the raw localized text of CA_Channel (IDC=101). Only runs while the display is open.

  Parameters:
    0: DISPLAY - RscDisplayChannel

  Returns:
    Nothing
*/
#include "\z\ace\addons\core\script_component.hpp"

uiNamespace setVariable ["ACE_ctrlChannel", (_this select 0) displayCtrl 101];

["ACE_currentChannel", "onEachFrame", {
  if (ctrlText (uiNamespace getVariable ["ACE_ctrlChannel", controlNull]) != "") then {
    uiNamespace setVariable ["ACE_currentChannel", ctrlText (uiNamespace getVariable ["ACE_ctrlChannel", controlNull])];
  };
}] call BIS_fnc_addStackedEventhandler;
