
class CfgMagazines {
    class CA_Magazine;
    class B_IR_Grenade: CA_Magazine {
        ACE_Attachable = "B_IRStrobe";
        model = QPATHTOF(data\ace_IRStrobe.p3d);
    };

    class O_IR_Grenade: B_IR_Grenade {
        ACE_Attachable = "O_IRStrobe";
        model = QPATHTOF(data\ace_IRStrobe.p3d);
    };

    class I_IR_Grenade: B_IR_Grenade {
        ACE_Attachable = "I_IRStrobe";
        model = QPATHTOF(data\ace_IRStrobe.p3d);
    };

    class SmokeShell;
    class Chemlight_green: SmokeShell {
        ACE_Attachable = "Chemlight_green";
    };

    class Chemlight_blue: Chemlight_green {
        ACE_Attachable = "Chemlight_blue";
    };

    class Chemlight_red: Chemlight_green {
        ACE_Attachable = "Chemlight_red";
    };

    class Chemlight_yellow: Chemlight_green {
        ACE_Attachable = "Chemlight_yellow";
    };
};
