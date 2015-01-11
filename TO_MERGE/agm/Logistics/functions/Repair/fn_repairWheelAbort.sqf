// by commy2

private "_spareWheel";

_spareWheel = _this select 2;

[player, "AmovPknlMstpSrasWrflDnon", 1] call AGM_Core_fnc_doAnimation;

[objNull, _spareWheel] call AGM_Core_fnc_claim;
