class EGVAR(tacphone,apps) {
    class Homescreen { // Name TBD
        scope = 1;
        displayName = "Home Screen";
        displayNameShort = "HS";
        icon = "\A3\ui_f\data\map\markers\nato\c_unknown.paa"; // 1:1 aspect ratio. Image TBD

        EGVAR(tacphone,createApp) = QFUNC(createApp);
        EGVAR(tacphone,onClose) = QFUNC(onClose);
    };
};