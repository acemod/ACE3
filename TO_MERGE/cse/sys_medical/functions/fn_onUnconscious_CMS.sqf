
private ["_unit", "_state"];
_unit = _this select 0;
_state = _this select 1;

if (_state) then {
	if (CSE_ALLOW_AIRWAY_INJURIES_CMS) then {
		if (random(1) >= 0.3) then {
			_unit setvariable ["cse_airwayOccluded", true, true];
		};
	};
} else {

};