class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(wipeGlasses) {
                    displayName = CSTRING(WipeGlasses);
                    condition = QUOTE(GVAR(showClearGlasses) && {call FUNC(canWipeGlasses)});
                    statement = QUOTE(call FUNC(clearGlasses));
                    exceptions[] = {"isNotInside", "isNotSitting", "isNotSwimming", "isNotEscorting"};
                };
				class GVAR(ConnectRespirator) {
					displayName = CSTRING(connectRespirator);
					condition = QUOTE('combo' call FUNC(checkRespiratorConditions));
					statement = QUOTE(call FUNC(connectRespirator));
                    exceptions[] = {"isNotInside", "isNotSitting", "isNotSwimming", "isNotEscorting"};
				};
				class GVAR(toggleMask) {
					displayName = CSTRING(ToggleMask);
					condition = QUOTE('mask' call FUNC(checkRespiratorConditions));
					statement = QUOTE(call FUNC(toggleMask));
                    exceptions[] = {"isNotInside", "isNotSitting", "isNotSwimming", "isNotEscorting"};
				};
				class GVAR(hideHose) {
					displayName = CSTRING(HideHose);
					condition = QUOTE('hose' call FUNC(checkRespiratorConditions));
					statement = QUOTE(call FUNC(hideHose));
                    exceptions[] = {"isNotInside", "isNotSitting", "isNotSwimming", "isNotEscorting"};
				};
            };
        };
    };
};
