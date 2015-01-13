/**
 * fn_getCurrentRadialTarget_gui.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_target"];
if (isnil "CSE_interactionTarget") then {
	_target = objNull;
} else {
	disableSerialization;

	if (isNull (uiNamespace getvariable "CSE_RADIAL_MENU")) then {
		_target = objNull;
	} else {
		_target = CSE_interactionTarget;
	};
};
_target