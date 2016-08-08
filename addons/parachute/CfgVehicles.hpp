class CfgVehicles {
    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Altimeter,6);
        };
        class TransportBackpacks {
            MACRO_ADDBACKPACK(ACE_NonSteerableParachute,4);
        };
    };

     class Man;
     class CAManBase: Man {
         class ACE_SelfActions {
             class ACE_CutParachute {
                 displayName = CSTRING(CutParachute);
                 exceptions[] = {"isNotInside"};
                 condition = QUOTE([_player] call FUNC(checkCutParachute));
                 statement = QUOTE([_player] call FUNC(cutParachute));
                 showDisabled = 0;
                 priority = 2.9;
                 icon = QPATHTOF(UI\cut_ca.paa);
             };
         };
     };

    class Helicopter;
    class ParachuteBase: Helicopter {
        MACRO_HASRESERVE
    };
    class ParachuteWest: ParachuteBase {
        MACRO_HASRESERVE
    };
    class ParachuteEast: ParachuteBase {
        MACRO_HASRESERVE
    };
    class ParachuteG: ParachuteBase {
        MACRO_HASRESERVE
    };
    class Parachute: ParachuteWest {
        MACRO_HASRESERVE
    };
    class NonSteerable_Parachute_F: Parachute {
        MACRO_HASRESERVE
    };
    class Paraglide: ParachuteWest{
        MACRO_HASRESERVE
    };
    class Steerable_Parachute_F: Paraglide{
        MACRO_HASRESERVE
    };
    class Parachute_02_base_F: parachuteBase {
        MACRO_HASRESERVE
    };
    class B_Parachute_02_F: Parachute_02_base_F {
        MACRO_HASRESERVE
    };
    class O_Parachute_02_F: Parachute_02_base_F {
        MACRO_HASRESERVE
    };
    class I_Parachute_02_F: Parachute_02_base_F {
        MACRO_HASRESERVE
    };
    class Bag_Base;
    class B_Parachute:Bag_Base {
        MACRO_HASRESERVE
    };
    class B_B_Parachute_02_F: B_Parachute {
        MACRO_HASRESERVE
    };
    class B_O_Parachute_02_F: B_Parachute {
        MACRO_HASRESERVE
    };
    class B_I_Parachute_02_F: B_Parachute {
        MACRO_HASRESERVE
    };

    class ACE_NonSteerableParachute: B_Parachute {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(NonSteerableParachute);
        //picture = "\A3\Characters_F\data\ui\icon_b_parachute_ca.paa";    // @todo
        //model = "\A3\Weapons_F\Ammoboxes\Bags\Backpack_Parachute";    // @todo
        // backpackSimulation = "ParachuteNonSteerable";    //ParachuteSteerable  //Bis broke this in 1.40
        ParachuteClass = "NonSteerable_Parachute_F";
        ace_hasReserveParachute = 1;
        ace_reserveParachute = "ACE_NonSteerableReserveParachute";
        maximumLoad = 0;
        mass = 100;
    };

    class ACE_ReserveParachute: ACE_NonSteerableParachute {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(ReserveParachute);
        scope = 1;
        mass = 70;
        ParachuteClass = "Steerable_Parachute_F";
        ace_reserveParachute = "";
        ace_hasReserveParachute = 0;
    };
    
    class ACE_NonSteerableReserveParachute: ACE_ReserveParachute {
        ParachuteClass = "NonSteerable_Parachute_F";
    };

    class B_Soldier_05_f; class B_Pilot_F: B_Soldier_05_f {backpack = "ACE_NonSteerableParachute";};
    class I_Soldier_04_F; class I_pilot_F: I_Soldier_04_F {backpack = "ACE_NonSteerableParachute";};
    class O_helipilot_F; class O_Pilot_F: O_helipilot_F {backpack = "ACE_NonSteerableParachute";};
};
