class EGVAR(tacphone,apps) {
    class Groups { // Name TBD
        scope = 2;
        displayName = "Group Management";
        displayNameShort = "GM";
        icon = "\A3\ui_f\data\map\markers\nato\c_air.paa"; // 1:1 aspect ratio. Image TBD

        EGVAR(tacphone,createApp) = QFUNC(createApp);
        EGVAR(tacphone,onClose) = QFUNC(onClose);
    };
};