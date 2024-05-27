class CfgMagazines {
    //Static Titan Magazine
    class 5Rnd_GAT_missiles;
    class 1Rnd_GAT_missiles: 5Rnd_GAT_missiles {
        ammo = "ACE_Javelin_FGM148_static"; //from misssileGuidance, was "M_Titan_AT_static"
    };

    //Handheld Titan "AT" Magazine (Locking - "Anti-Tank")
    class Titan_AA;
    class Titan_AT: Titan_AA {
        ammo = "ACE_Javelin_FGM148"; //from misssileGuidance, was "M_Titan_AT"
    };

    //Handheld Titan "AP" Magazine (SACLOS? "Anti-personal")
    // class Titan_AP: Titan_AA {
        //???
    // };
};
