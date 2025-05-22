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
				class GVAR(respiratorConnect) {
					displayName = CSTRING(Respirator_Connect);
					condition = QUOTE('combo' call FUNC(respiratorConditions));
					statement = QUOTE(call FUNC(respiratorConnect));
                    exceptions[] = {"isNotInside", "isNotSitting", "isNotSwimming", "isNotEscorting"};
				};
				class GVAR(respiratorDisconnect) {
					displayName = CSTRING(Respirator_Disconnect);
					condition = QUOTE('hose' call FUNC(respiratorConditions));
					statement = QUOTE(call FUNC(respiratorDisconnect));
                    exceptions[] = {"isNotInside", "isNotSitting", "isNotSwimming", "isNotEscorting"};
				};
				class GVAR(respiratorFilter) {
					displayName = CSTRING(Respirator_Filters);
					condition = QUOTE('mask' call FUNC(respiratorConditions));
					statement = QUOTE(call FUNC(respiratorFilter));
                    exceptions[] = {"isNotInside", "isNotSitting", "isNotSwimming", "isNotEscorting"};
				};
            };
        };
    };
};
