class CfgMagazines {
    class US85_Magazine;
    class US85_ATMine_mag: US85_Magazine {
        EGVAR(explosives,setupObject) = "ACE_Explosives_Place_US85_ATMine_mag";
        useAction = 0;
    };
    class US85_M14Mine_mag: US85_Magazine {
        EGVAR(explosives,setupObject) = "ACE_Explosives_Place_US85_M14Mine";
        useAction = 0;
    };
    class US85_SatchelCharge_Mag: US85_Magazine {
        EGVAR(explosives,setupObject) = "ACE_Explosives_Place_US85_SatchelCharge_Mag";
        useAction = 0;
    };
};
