class Extended_InitPost_EventHandlers {
    class UAV_02_Base_lxWS {
        class ADDON {
            init = QUOTE(call EFUNC(cookoff,disableCookoff));
        };
    };

    class UAV_02_IED_Base_lxWS {
        class ADDON {
            init = ""; // Enable cook-off for IED drone
        };
    };
};
