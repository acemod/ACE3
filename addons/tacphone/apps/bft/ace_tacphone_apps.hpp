class EGVAR(tacphone,apps) {
    class BFT { // Name TBD
        scope = 2;
        displayName = "Battlespace Management";
        displayNameShort = "BM";
        icon = "\A3\ui_f\data\map\markers\nato\c_unknown.paa"; // 1:1 aspect ratio. Image TBD

        EGVAR(tacphone,createApp) = QFUNC(createApp);
        EGVAR(tacphone,onClose) = QFUNC(onClose);
    };
};