class GVAR(apps) {
    class Messaging {
        scope = 2;
        displayName = "Beacon";
        displayNameShort = "BCN";
        icon = "\A3\ui_f\data\map\markers\nato\c_ship.paa"; // Image TBD
        GVAR(createApp) = QFUNC(loadMessaging);
    };
};