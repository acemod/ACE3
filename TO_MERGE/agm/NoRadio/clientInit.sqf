// by commy2

0 spawn {
	waitUntil {!isNull AGM_player};

	[AGM_player] call AGM_Core_fnc_muteUnit;
	AGM_player setVariable ["AGM_NoRadio_isMuted", true, true];
};

[missionNamespace, "playerChanged", {
	[_this select 0] call AGM_Core_fnc_muteUnit;
	(_this select 0) setVariable ["AGM_NoRadio_isMuted", true, true];

	if (!((_this select 1) getVariable ["AGM_isUnconscious", false]) && {alive (_this select 1)}) then {
		[_this select 1] call AGM_Core_fnc_unmuteUnit;
	};
	(_this select 1) setVariable ["AGM_NoRadio_isMuted", false, true];
}] call AGM_Core_fnc_addCustomEventHandler;
