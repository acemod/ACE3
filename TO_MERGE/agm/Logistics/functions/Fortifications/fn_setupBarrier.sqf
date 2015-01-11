// by Garth de Wet (LH), edited by commy2

_this spawn {
	_unit = _this select 0;
	_crate = _this select 1;
	_type = _this select 2;

	AGM_Fortifications_placer = _unit;
	AGM_Fortifications_crate = _crate;

	[_unit, _crate] call AGM_Core_fnc_claim;

	AGM_Fortifications_Setup = _type createVehicleLocal [0, 0, -10000];
	AGM_Fortifications_Setup allowDamage false;
	AGM_Fortifications_Setup enableSimulationGlobal false;
	AGM_Fortifications_Setup attachTo [_unit, _unit worldToModel ((ASLtoATL eyePos player) vectorAdd (positionCameraToWorld [0, 0, 4] vectorDiff positionCameraToWorld [0, 0, 0]))];
	detach AGM_Fortifications_Setup;

	[_unit, "AGM_Logistics", true] call AGM_Core_fnc_setForceWalkStatus;
	AGM_Fortifications_TweakedAngle = 180;

	["AGM_Fortifications_Placement", "OnEachFrame", {
		if (AGM_Fortifications_placer != player) exitWith {
			call AGM_Fortifications_fnc_setupCancel;
		};
		AGM_Fortifications_pfeh_running = true;

		_pos = (ASLtoATL eyePos player) vectorAdd (positionCameraToWorld [0, 0, 4] vectorDiff positionCameraToWorld [0, 0, 0]);
		_pos set [2, 0];

		if (getPosATL player distance _pos < 2 || {!alive player} || {player getVariable ["AGM_isUnconscious", false]} || {player != vehicle player}) exitWith {
			call AGM_Fortifications_fnc_setupCancel;
		};

		AGM_Fortifications_Setup setPosATL _pos;

		if (AGM_Modifier == 0) then {
			AGM_Fortifications_Setup setDir (AGM_Fortifications_TweakedAngle + getDir player);
		};
	}] call BIS_fnc_addStackedEventHandler;

	[localize "STR_AGM_Fortifications_PlaceAction", localize "STR_AGM_Fortifications_CancelAction", localize "STR_AGM_Fortifications_ScrollAction"] call AGM_Interaction_fnc_showMouseHint;
	_unit setVariable ["AGM_Fortifications_Place", [_unit, "DefaultAction", {AGM_Fortifications_pfeh_running && {!isNull AGM_Fortifications_Setup}}, {call AGM_Fortifications_fnc_setupApprove}] call AGM_Core_fnc_AddActionEventHandler];
	_unit setVariable ["AGM_Fortifications_Cancel", [_unit, "MenuBack", {AGM_Fortifications_pfeh_running && {!isNull AGM_Fortifications_Setup}}, {call AGM_Fortifications_fnc_setupCancel}] call AGM_Core_fnc_AddActionEventHandler];
};
