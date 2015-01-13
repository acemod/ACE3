/**
 * fn_effectBlackOut.sqf
 * @Descr: Displays the blacked out effect for clients.
 * @Author: Glowbal
 *
 * @Arguments: [displayEffect BOOL]
 * @Return: void
 * @PublicAPI: true
 */

private ["_displayEffect","_CSEFadingBlackUI"];
_displayEffect = [_this, 0, false,[false]] call bis_fnc_param;
disableSerialization;
_CSEFadingBlackUI = uiNamespace getVariable "CSEFadingBlackUI";
if (_displayEffect) then {
	(_CSEFadingBlackUI displayCtrl 11112) ctrlSetTextColor [0.0,0.0,0.0,0.9];
} else {
	(_CSEFadingBlackUI displayCtrl 11112) ctrlSetTextColor [0.0,0.0,0.0,0.0];
};