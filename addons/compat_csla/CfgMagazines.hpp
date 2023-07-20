class CfgMagazines {

    class CSLA_UK59_50rnd_7_62vz59;
    class CSLA_UK59_50rnd_7_62Sv59: CSLA_UK59_50rnd_7_62vz59 {
        ace_isBelt = 1;
    };

    class US85_Magazine;
    class US85_20Rnd_762x51;
    class US85_30Rnd_556x45;
    class US85_30Rnd_762x51;

    class US85_50Rnd_762x51: US85_Magazine {
        ace_isBelt = 1;
    };

    class US85_100Rnd_762x51: US85_20Rnd_762x51 {
        ace_isBelt = 1;
    };

    class US85_200Rnd_556x45: US85_30Rnd_556x45 {
        ace_isBelt = 1;
    };

    class US85_ATMine_mag: US85_Magazine {
        EGVAR(explosive,SetupObject) = "ACE_Explosives_Place_US85_ATMine_mag";
        useAction = 0;
    };

    class US85_M14Mine_mag: US85_Magazine {
        EGVAR(explosive,SetupObject) = "ACE_Explosives_Place_US85_M14Mine";
        useAction = 0;
    };

    class US85_SatchelCharge_Mag: US85_Magazine {
        EGVAR(explosive,SetupObject) = "ACE_Explosives_Place_US85_SatchelCharge_Mag";
        useAction = 0;
    };

};
