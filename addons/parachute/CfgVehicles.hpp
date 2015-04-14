class CfgVehicles {
    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            class _xx_ACE_Altimeter {
                name = "ACE_Altimeter";
                count = 6;
            };
        };
        class TransportBackpacks {
            class _xx_ACE_NonSteerableParachute {
                backpack = "ACE_NonSteerableParachute";
                count = 4;
            };
        };
    };

    class B_Parachute;
    class ACE_NonSteerableParachute: B_Parachute {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        displayName = "$STR_ACE_Parachute_NonSteerableParachute";
        //picture = "\A3\Characters_F\data\ui\icon_b_parachute_ca.paa";    // @todo
        //model = "\A3\Weapons_F\Ammoboxes\Bags\Backpack_Parachute";    // @todo
        // backpackSimulation = "ParachuteNonSteerable";    //ParachuteSteerable  //Bis broke this in 1.40
        ParachuteClass = "NonSteerable_Parachute_F";
        maximumLoad = 0;
        mass = 100;
    };

    class B_Soldier_05_f; class B_Pilot_F: B_Soldier_05_f {backpack = "ACE_NonSteerableParachute";};
    class I_Soldier_04_F; class I_pilot_F: I_Soldier_04_F {backpack = "ACE_NonSteerableParachute";};
    class O_helipilot_F; class O_Pilot_F: O_helipilot_F {backpack = "ACE_NonSteerableParachute";};
};
