// by commy2

terminate (missionNamespace getVariable ["AGM_waitForAnimationHandle", scriptNull]);

AGM_waitForAnimationHandle = _this spawn {
	waitUntil {!([_this select 0] call FUNC(inTransitionAnim))};

	_this call FUNC(doAnimation);
};
