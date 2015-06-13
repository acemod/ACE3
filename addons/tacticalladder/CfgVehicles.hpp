
class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_TacticalLadders {
                displayName = $STR_ACE_DEPLOY_TACLADDER;
                condition = QUOTE((backpack ACE_player) == QUOTE(QUOTE(ACE_TacticalLadder_Pack)));
                statement = QUOTE(call FUNC(deployTL));
                exceptions[] = {};
                showDisabled = 1;
                priority = 4;
            };
        };
    };
    
    class Bag_Base;
	class ACE_TacticalLadder_Pack: Bag_Base {
		scope = 2;
		displayName = "$STR_ACE_TACTICALLADDER";
        descriptionShort = "";
        model = PATHTOF(data\ace_tacticalladder_pack.p3d);
        picture = PATHTOF(UI\ace_tactical_ladder_pack_ca.paa); 
        maximumLoad = 0;
        mass = 50;
	};
    
    class House;
    class ACE_Tactical_Ladder: House {
        XEH_ENABLED;
        displayName = $STR_ACE_TACTICALLADDER;
        class DestructionEffects {};
        model = PATHTOF(data\ace_tacticalladder.p3d);
        animated = 1;
        autocenter = 0;
        featureSize = 12;
        ladders[] = {{"start","end"}};
        class AnimationSources {
            class rotate {
                source = "user";
                animPeriod = 1e-007;
            };
            class extract_1 {
                source = "user";
                animPeriod = 1e-007;
            };
            class extract_2: extract_1 {};
            class extract_3: extract_1 {};
            class extract_4: extract_1 {};
            class extract_5: extract_1 {};
            class extract_6: extract_1 {};
            class extract_7: extract_1 {};
            class extract_8: extract_1 {};
            class extract_9: extract_1 {};
            class extract_10: extract_1 {};
            class extract_11: extract_1 {};
        };
        class ACE_Actions {
            class ACE_MainActions {
                selection = "roadway";
                distance = 5;
                condition = "true";
                class ACE_PickUp {
                    selection = "";
                    displayName = "$STR_ACE_PICKUP_TACLADDER";
                    distance = 4;
                    condition = QUOTE((backpack ACE_player) == '');
                    statement = QUOTE([ARR_2(_target,_player)] call FUNC(pickupTL));
                    showDisabled = 0;
                    exceptions[] = {};
                    priority = 5;
                };
                class ACE_Position {
                    selection = "";
                    displayName = "$STR_ACE_POSITION_TACLADDER";
                    distance = 4;
                    condition = "true";
                    statement = QUOTE([ARR_2(_target,_player)] call FUNC(positionTL));
                    showDisabled = 0;
                    exceptions[] = {};
                    priority = 5;
                };
            };
        };
    };
};
