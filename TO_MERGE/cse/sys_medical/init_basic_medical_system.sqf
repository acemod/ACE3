
	waituntil {!isnil "cse_fnc_registerUnconsciousCondition"};

	[
		{(([_this select 0,"cse_bloodVolume"] call cse_fnc_getVariable) < 60)},
		{(([_this select 0,"cse_pain"] call cse_fnc_getVariable) > 48)}
	] call cse_fnc_registerUnconsciousCondition;