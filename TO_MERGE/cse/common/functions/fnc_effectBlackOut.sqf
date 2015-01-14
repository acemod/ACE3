/**
 * fn_effectBlackOut.sqf
 * @Descr: Displays the blacked out effect for clients.
 * @Author: Glowbal
 *
 * @Arguments: [displayEffect BOOL]
 * @Return: void
 * @PublicAPI: true
 */

private ["_displayEffect","_effect"];
_displayEffect = [_this, 0, false,[false]] call bis_fnc_param;
disableSerialization;
_effect = uiNamespace getVariable QGVAR(ScreenEffectsBlack);
if (_displayEffect) then {
	(_effect displayCtrl 11112) ctrlSetTextColor [0.0,0.0,0.0,0.9];
} else {
	(_effect displayCtrl 11112) ctrlSetTextColor [0.0,0.0,0.0,0.0];
};