// by commy2

_unit = _this select 0;
_target =_this select 1;

_unit setVariable ["AGM_isDragging", false];
_unit setVariable ["AGM_carriedItem", objNull, true];
_target setVariable ["AGM_isUsedBy", objNull, true];

[objNull, _target, true] call AGM_Core_fnc_claim;

_unit allowDamage false;
detach _target;
[_unit, "AGM_Logistics", false] call AGM_Core_fnc_setForceWalkStatus;
_unit allowDamage true;

_unit removeAction (_unit getVariable ["AGM_Drag_ReleaseActionID", -1]);

[_target, "{_this setVectorUp (surfaceNormal getPosASL _this)}", _target] call AGM_Core_fnc_execRemoteFnc;
