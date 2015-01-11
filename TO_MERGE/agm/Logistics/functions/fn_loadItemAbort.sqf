// by commy2

_item = _this select 0;

if (_item != player getVariable ["AGM_carriedItem", objNull]) then {
	_item setVariable ["AGM_isUsedBy", objNull, true];
};
