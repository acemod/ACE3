// by commy2

terminate (missionNamespace getVariable ["AGM_waitForAnimationHandle", scriptNull]);

AGM_waitForAnimationHandle = _this spawn {
	waitUntil {!([_this select 0] call GVAR(fnc_inTransitionAnim))};

	_this call GVAR(fnc_doAnimation);
};
