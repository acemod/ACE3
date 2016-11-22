class CfgVehicles {
    class LandVehicle;
    class StaticWeapon: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {
                class ACE_StaticWeapon_Ammo {
                    insertChildren = QUOTE((_this call FUNC(actionsLoad)) + (_this call FUNC(actionsUnload)));
                };
            };
        };
    };
};
