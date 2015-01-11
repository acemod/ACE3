_fence = _this select 0;

if (alive player) then {
	_fence setdamage 1;
	[localize "STR_AGM_FenceCut"] call AGM_Core_fnc_displayTextStructured;
	[player, "AmovPknlMstpSrasWrflDnon", 1] call AGM_Core_fnc_doAnimation;
};
