/*
 * Author: commy2
 *
 * Display a structured text. Used for medical diagnose.
 * 
 * Argument:
 * 0: Diagnosis (Text)
 * 
 * Return value:
 * Nothing
 */

private ["_text", "_ctrlHint"];

_text = _this select 0;

("AGM_RscHint" call BIS_fnc_rscLayer) cutRsc ["AGM_Medical_RscHint", "PLAIN", 0, true];

disableSerialization;
_ctrlHint = uiNamespace getVariable "AGM_ctrlHint";
_ctrlHint ctrlSetStructuredText _text;
