class GVAR(apps) {
    class BFT { // Name TBD
        scope = 2;
        displayName = "Battlespace Management";
        displayNameShort = "BM";
        icon = "\A3\ui_f\data\map\markers\nato\c_unknown.paa"; // 1:1 aspect ratio. Image TBD
        function = QGVAR(loadBFT);
    };
    class Messaging {
        scope = 2;
        displayName = "Beacon";
        displayNameShort = "BCN";
        icon = "\A3\ui_f\data\map\markers\nato\c_ship.paa"; // Image TBD
        function = QGVAR(loadMessaging);
    };
};