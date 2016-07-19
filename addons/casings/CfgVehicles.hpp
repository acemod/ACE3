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
        model = "\A3\Weapons_f\ammo\cartridge_small";
        //model = QUOTE(PATHTOF(rocko_9.p3d));
    };
    class GVAR(FxCartridge_9mm): GVAR(FxCartridge_Small) {
    };
    class GVAR(FxCartridge_556): GVAR(FxCartridge) {
        model = "\A3\weapons_f\ammo\cartridge_65";
        //model = QPATHTO_M(rocko_556.p3d);
    };
    class GVAR(FxCartridge_65): GVAR(FxCartridge) {
        model = "\A3\weapons_f\ammo\cartridge_65";
    };
    class GVAR(FxCartridge_65_caseless): GVAR(FxCartridge) {
        model = "\A3\weapons_f\empty";
    };
    class GVAR(FxCartridge_762): GVAR(FxCartridge) {
        model = "\A3\weapons_f\ammo\cartridge_762";
        //model = QUOTE(PATHTOF(rocko_762.p3d));
    };
    class GVAR(FxCartridge_127): GVAR(FxCartridge) {
        model = "\A3\weapons_f\ammo\cartridge_127";
        //model = QUOTE(PATHTOF(rocko_127.p3d));
    };
    class GVAR(FxCartridge_slug): GVAR(FxCartridge) {
        model = "\A3\weapons_f\ammo\cartridge_slug";
        //model = QUOTE(PATHTOF(rocko_sg.p3d));
    };
    class GVAR(FxCartridge_338_Ball): GVAR(FxCartridge) {
        model = "\A3\weapons_f\ammo\cartridge_762";
    };
    class GVAR(FxCartridge_338_NM_Ball): GVAR(FxCartridge) {
        model = "\A3\weapons_f\ammo\cartridge_762";
    };
    class GVAR(FxCartridge_127x54_APDS): GVAR(FxCartridge) {
        model = "\A3\weapons_f\ammo\cartridge_127";
    };
    class GVAR(FxCartridge_93x64_Ball): GVAR(FxCartridge) {
        model = "\A3\weapons_f\ammo\cartridge_762";
    };
};

