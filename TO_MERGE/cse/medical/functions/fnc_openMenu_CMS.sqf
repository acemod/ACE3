/**
 * fn_openMenu_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_interactionTarget"];
_interactionTarget = objNull;
if (count _this > 0) then {
	_interactionTarget = _this select 0;

} else {
	_interactionTarget = cursortarget;
	if (isNull _interactionTarget) then {
		_interactionTarget = player;
	};
	if (_interactionTarget distance player > 5 || !(_interactionTarget isKindOf "CaManBase")) then {
		_interactionTarget = player;
	};
};

if (isNull _interactionTarget) then {
	_interactionTarget = player;
};

[format["INTERACTION WITH: %1",_interactionTarget]] call EFUNC(common,debug);
GVAR(INTERACTION_TARGET) = _interactionTarget;
createDialog QGVAR(medicalMenuIDD);
