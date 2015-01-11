// by commy2

addMissionEventHandler ["HandleDisconnect", {
	if !((_this select 0) getVariable ["AGM_isUnconscious", false]) then {
		_this call AGM_Core_fnc_unmuteUnit;
	};
	(_this select 0) setVariable ["AGM_NoRadio_isMuted", false, true];
}];
