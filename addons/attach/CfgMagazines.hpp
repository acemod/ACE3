
class CfgMagazines {
    class CA_Magazine;
    class B_IR_Grenade: CA_Magazine {
        ACE_Attachable = 1;
        ACE_attachable_effect = "B_IRStrobe";
    };

    class O_IR_Grenade: B_IR_Grenade {
        ACE_attachable_effect = "O_IRStrobe";
    };

    class I_IR_Grenade: B_IR_Grenade {
        ACE_attachable_effect = "I_IRStrobe";
    };

    class SmokeShell;
    class Chemlight_green: SmokeShell {
        ACE_Attachable = 1;
        ACE_attachable_effect = "Chemlight_green";
    };

    class Chemlight_blue: Chemlight_green {
        ACE_attachable_effect = "Chemlight_blue";
    };

    class Chemlight_red: Chemlight_green {
        ACE_attachable_effect = "Chemlight_red";
    };

    class Chemlight_yellow: Chemlight_green {
        ACE_attachable_effect = "Chemlight_yellow";
    };
};
