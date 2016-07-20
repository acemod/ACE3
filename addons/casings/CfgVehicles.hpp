class CfgVehicles {
    class NonStrategic;

    class GVAR(FxCartridge): NonStrategic {
        model = "\A3\Weapons_f\ammo\cartridge";
        icon = "";
        displayName = "";
        nameSound = "";
        destrType = "DestructNo";
        mapSize = 0;
        accuracy = 0;
        armor = 5;
        scope = 1;
        typicalCargo[] = {};
        transportAmmo = 0;
        transportRepair = 0;
        transportFuel = 0;
        htMin = 30;
        htMax = 60;
        afMax = 400;
        mfMax = 200;
        mFact = 0;
        tBody = 200;
    };

    class GVAR(FxCartridge_Small): GVAR(FxCartridge) {
        model = QUOTE(PATHTOF(models\ace_casing_9.p3d));
    };
    class GVAR(FxCartridge_9mm): GVAR(FxCartridge_Small) {
    };
    class GVAR(FxCartridge_556): GVAR(FxCartridge) {
        model = QPATHTO_M(models\ace_casing_556.p3d);
    };
    class GVAR(FxCartridge_65): GVAR(FxCartridge) {
        model = QPATHTO_M(models\ace_casing_556.p3d);
    };
    class GVAR(FxCartridge_65_caseless): GVAR(FxCartridge) {
        model = "\A3\weapons_f\empty";
    };
    class GVAR(FxCartridge_762): GVAR(FxCartridge) {
        model = QUOTE(PATHTOF(models\ace_casing_762.p3d));
    };
    class GVAR(FxCartridge_127): GVAR(FxCartridge) {
        model = QUOTE(PATHTOF(models\ace_casing_127.p3d));
    };
    class GVAR(FxCartridge_slug): GVAR(FxCartridge) {
        model = QUOTE(PATHTOF(models\ace_casing_sg.p3d));
    };
    class GVAR(FxCartridge_338_Ball): GVAR(FxCartridge) {
        model = QUOTE(PATHTOF(models\ace_casing_762.p3d));
    };
    class GVAR(FxCartridge_338_NM_Ball): GVAR(FxCartridge) {
        model = QUOTE(PATHTOF(models\ace_casing_762.p3d));
    };
    class GVAR(FxCartridge_127x54_APDS): GVAR(FxCartridge) {
        model = QUOTE(PATHTOF(models\ace_casing_127.p3d));
    };
    class GVAR(FxCartridge_93x64_Ball): GVAR(FxCartridge) {
        model = QUOTE(PATHTOF(models\ace_casing_127.p3d));
    };
};

