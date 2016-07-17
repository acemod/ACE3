class CfgVehicles {
    class NonStrategic;

    class FxCartridge_stay: NonStrategic {
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

    class FxCartridge_Small_stay: FxCartridge_stay {
        model = "\A3\Weapons_f\ammo\cartridge_small";
        //model = QUOTE(PATHTOF(rocko_9.p3d));
    };
    class FxCartridge_9mm_stay: FxCartridge_Small_stay {
    };
    class FxCartridge_556_stay: FxCartridge_stay {
        model = "\A3\weapons_f\ammo\cartridge_65";
        //model = QPATHTO_M(rocko_556.p3d);
    };
    class FxCartridge_65_stay: FxCartridge_stay {
        model = "\A3\weapons_f\ammo\cartridge_65";
    };
    class FxCartridge_65_caseless_stay: FxCartridge_stay {
        model = "\A3\weapons_f\empty";
    };
    class FxCartridge_762_stay: FxCartridge_stay {
        model = "\A3\weapons_f\ammo\cartridge_762";
        //model = QUOTE(PATHTOF(rocko_762.p3d));
    };
    class FxCartridge_127_stay: FxCartridge_stay {
        model = "\A3\weapons_f\ammo\cartridge_127";
        //model = QUOTE(PATHTOF(rocko_127.p3d));
    };
    class FxCartridge_slug_stay: FxCartridge_stay {
        model = "\A3\weapons_f\ammo\cartridge_slug";
        //model = QUOTE(PATHTOF(rocko_sg.p3d));
    };
    class FxCartridge_338_Ball_stay: FxCartridge_stay {
        model = "\A3\weapons_f\ammo\cartridge_762";
    };
    class FxCartridge_338_NM_Ball_stay: FxCartridge_stay {
        model = "\A3\weapons_f\ammo\cartridge_762";
    };
    class FxCartridge_127x54_APDS_stay: FxCartridge_stay {
        model = "\A3\weapons_f\ammo\cartridge_127";
    };
    class FxCartridge_93x64_Ball_stay: FxCartridge_stay {
        model = "\A3\weapons_f\ammo\cartridge_762";
    };
};

