/*
 * Original Author: Taosenai
 * Adapted By: KoffeinFlummi
 *
 * Initializes the scope resources.
 *
 */

private ["_display"];

// Make sure we only cutRsc when the resource isn't already available
if (isNil {uiNameSpace getVariable "AGM_Optics_Scope"} or {isNull (uiNameSpace getVariable "AGM_Optics_Scope")}) exitWith {
  AGM_Optics_scopeRSC cutRsc ["AGM_Optics_Scope","PLAIN",0];
  ((uiNameSpace getVariable "AGM_Optics_Scope") displayCtrl 1) ctrlSetTextColor [1,1,1,0];
  ((uiNameSpace getVariable "AGM_Optics_Scope") displayCtrl 2) ctrlSetTextColor [1,1,1,0];
  ((uiNameSpace getVariable "AGM_Optics_Scope") displayCtrl 5) ctrlSetTextColor [1,1,1,0];
  ((uiNameSpace getVariable "AGM_Optics_Scope") displayCtrl 6) ctrlSetTextColor [1,1,1,0];

  ((uiNameSpace getVariable "AGM_Optics_Scope") displayCtrl 1) ctrlCommit 0;
  ((uiNameSpace getVariable "AGM_Optics_Scope") displayCtrl 2) ctrlCommit 0;
  ((uiNameSpace getVariable "AGM_Optics_Scope") displayCtrl 5) ctrlCommit 0;
  ((uiNameSpace getVariable "AGM_Optics_Scope") displayCtrl 6) ctrlCommit 0;
  True
};
False
