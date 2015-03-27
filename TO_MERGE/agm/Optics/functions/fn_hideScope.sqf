/*
 * Original Author: Taosenai
 * Adapted By: KoffeinFlummi
 *
 * Hides the scope.
 *
 */

private ["_scope"];

((uiNameSpace getVariable "AGM_Optics_Scope") displayCtrl 1) ctrlSetTextColor [1,1,1,0];
((uiNameSpace getVariable "AGM_Optics_Scope") displayCtrl 2) ctrlSetTextColor [1,1,1,0];
((uiNameSpace getVariable "AGM_Optics_Scope") displayCtrl 5) ctrlSetTextColor [1,1,1,0];
((uiNameSpace getVariable "AGM_Optics_Scope") displayCtrl 6) ctrlSetTextColor [1,1,1,0];

((uiNameSpace getVariable "AGM_Optics_Scope") displayCtrl 1) ctrlCommit 0;
((uiNameSpace getVariable "AGM_Optics_Scope") displayCtrl 2) ctrlCommit 0;
((uiNameSpace getVariable "AGM_Optics_Scope") displayCtrl 5) ctrlCommit 0;
((uiNameSpace getVariable "AGM_Optics_Scope") displayCtrl 6) ctrlCommit 0;
