
class CBA_Extended_EventHandlers;

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ACE_TacticalLadders {
                    displayName = CSTRING(Deploy);
                    condition = QUOTE(backpack _player == 'ACE_TacticalLadder_Pack');
                    statement = QUOTE([_player] call FUNC(deployTL));
                    exceptions[] = {};
                    showDisabled = 1;
                    priority = 4;
                };
            };
        };
    };

    class Bag_Base;
    class ACE_TacticalLadder_Pack: Bag_Base {
        scope = 2;
        displayName = CSTRING(DisplayName);
        descriptionShort = "";
        model = QPATHTOF(data\ace_tacticalladder_pack.p3d);
        picture = QPATHTOF(UI\ace_tactical_ladder_pack_ca.paa);
        maximumLoad = 0;
        mass = 50;
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportBackpacks {
            MACRO_ADDBACKPACK(ACE_TacticalLadder_Pack,3);
        };
    };

    class House;
    class ACE_TacticalLadder: House {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        displayName = CSTRING(DisplayName);
        class DestructionEffects {};
        model = QPATHTOF(data\ace_tacticalladder.p3d);
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
                condition = QUOTE(_target call FUNC(isLadderEmpty));

                class ACE_PickUp {
                    selection = "";
                    displayName = CSTRING(Pickup);
                    distance = 4;
                    condition = QUOTE((backpack ACE_player) == '');
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(pickupTL));
                    showDisabled = 0;
                    exceptions[] = {};
                    priority = 5;
                };

                class ACE_Position {
                    selection = "";
                    displayName = CSTRING(Position);
                    distance = 4;
                    condition = "true";
                    //wait a frame to handle "Do When releasing action menu key" option:
                    statement = QUOTE([ARR_2({_this call FUNC(positionTL)},[ARR_2(_player,_target)])] call CBA_fnc_execNextFrame);
                    showDisabled = 0;
                    exceptions[] = {};
                    priority = 5;
                };
            };
        };
    };
};
