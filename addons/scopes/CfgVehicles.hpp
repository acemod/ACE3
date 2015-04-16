class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(adjustZero) {
                    // Updates the zero reference
                    displayName = "$STR_ACE_Scopes_AdjustZero";
                    condition = QUOTE([ACE_player] call FUNC(canAdjustZero));
                    statement = QUOTE([ACE_player] call FUNC(adjustZero));
                    showDisabled = 0;
                    priority = 0.2;
                    //icon = QUOTE(PATHTOF(UI\...)); // TODO
                    exceptions[] = {"notOnMap", "isNotInside"};
                };
            };
        };
    };
};
