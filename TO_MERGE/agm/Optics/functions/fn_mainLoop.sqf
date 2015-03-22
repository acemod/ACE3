/*
 * Original Author: Taosenai
 * Adapted By: KoffeinFlummi
 *
 * Monitors the RscInGameUI and displays the overlays when needed.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 */

if !(cameraOn == AGM_player && {alive AGM_player} && {!visibleMap} && {ctrlShown ((uinamespace getVariable "AGM_OpticsIGUI") displayCtrl 154)}) exitWith {
  // Failed the state check, hide the scope if it's up
  if (AGM_Optics_inScope) then {
    // Hide the scope
    AGM_Optics_inScope = false;
    AGM_Optics_inScope_FOV = ([] call cba_fnc_getFOV) select 0;

    [] call AGM_Optics_fnc_hideScope;
  };
};

AGM_Optics_Camera setposATL (positioncameratoworld [0,0,0.4]);
AGM_Optics_Camera camPrepareTarget (positioncameratoworld [0,0,50]);
AGM_Optics_Camera camCommitPrepared 0;

if (cameraView == "Gunner") then {
  AGM_Optics_Camera camsetFOV 0.7;
  AGM_Optics_Camera camcommit 0;
} else {
  AGM_Optics_Camera camsetFOV 0.01;
  AGM_Optics_Camera camcommit 0;
};

private ["_optic", "_scope"];

disableSerialization;

// Get the name of the attached optic
_optic = (primaryWeaponItems AGM_player) select 2;
_scope = uiNameSpace getVariable "AGM_Optics_Scope";

// Init the scope (if needed)
[] call AGM_Optics_fnc_initScope;

// Check if the optic has changed since we last drew it
_doUpdateAllLayers = false;
if (AGM_Optics_currentOptic != _optic) then {
  AGM_Optics_currentOptic = _optic;
  _doUpdateAllLayers = true;
};

// Check if Splendid Camera, unit switch, etc. has blanked out our displays for no good reason (grrr)
if (ctrlText (_scope displayCtrl 1) == "") then {
  _doUpdateAllLayers = true;
};

// Draw the correct layers (don't show them)
if (_doUpdateAllLayers) then {
  (_scope displayCtrl 1) ctrlSetText getText (configFile >> "CfgWeapons" >> _optic >> "AGM_Optics_reticle");
  (_scope displayCtrl 2) ctrlSetText getText (configFile >> "CfgWeapons" >> _optic >> "AGM_Optics_reticleIllum");
  (_scope displayCtrl 5) ctrlSetText getText (configFile >> "CfgWeapons" >> _optic >> "AGM_Optics_bodyNight");
  (_scope displayCtrl 6) ctrlSetText getText (configFile >> "CfgWeapons" >> _optic >> "AGM_Optics_body");
};

// Stop processing if already in the scope view and FOV hasn't changed
if (AGM_Optics_inScope) exitwith {};

// Mark that we're in enhanced scope view
AGM_Optics_inScope = true;

// Calculate lighting
_lighting = sunOrMoon; // 1 is day, 0 is night

_nightOpacity = 1;
_dayOpacity = (0 max moonIntensity * (1 - (0 max overcast)))/5;

if (_lighting == 1) then {
  _nightOpacity = 0;
  _dayOpacity = 1;
};

// Apply lighting and make layers visible
(_scope displayCtrl 1) ctrlSetTextColor [1,1,1,1];
(_scope displayCtrl 2) ctrlSetTextColor [1,1,1,_nightOpacity];
(_scope displayCtrl 5) ctrlSetTextColor [1,1,1,_nightOpacity];
(_scope displayCtrl 6) ctrlSetTextColor [1,1,1,_dayOpacity];

(_scope displayCtrl 1) ctrlCommit 0;
(_scope displayCtrl 2) ctrlCommit 0;
(_scope displayCtrl 5) ctrlCommit 0;
(_scope displayCtrl 6) ctrlCommit 0;
