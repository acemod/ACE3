class CfgVehicles {
	class All;
	class AllVehicles: All {
		class ACE_Actions {
			class ACE_MainActions {
				class ADDON {
					displayName = CSTRING(displayName);
					distance = TOW_ACTION_DISTANCE;
					condition = QUOTE[ARR_1(_target, 0) call FUNC(isSuitableSimulation)];
					statement = "";
					exceptions[] = { INTERACTION_EXCEPTIONS };
					showDisabled = 0;
					icon = "";
					class GVAR(startTow) {
						displayName = CSTRING(start);
						condition = QUOTE([ARR_2(_player,_target)] call FUNC(canStartTow));
						statement = QUOTE([ARR_2(_player,_target)] call FUNC(startTow));
						exceptions[] = { INTERACTION_EXCEPTIONS };
					};
				};
			};
		};
	};
};
