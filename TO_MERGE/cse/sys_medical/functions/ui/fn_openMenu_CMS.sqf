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

if (isNull _interactionTarget) then { // _interactionTarget undefined here. WTF?
	_interactionTarget = player;
};

[format["INTERACTION WITH: %1",_interactionTarget]] call cse_fnc_Debug;
[player,_interactionTarget] call cse_fnc_registerInteractingWith;
CSE_SYS_MEDICAL_INTERACTION_TARGET = _interactionTarget;
createDialog "cse_sys_medicalMenu";
//[player,"release"] call cse_fnc_treatmentMutex_CMS; // Do we want to force release the treatment event, to prefent deadlock within the CMS Module?

[_interactionTarget] spawn {
	waituntil {sleep 0.1; !dialog};
	[player,_this select 0] call cse_fnc_unregisterInteractingWith;
};
