#define MACRO_PORTABLELIGHTSACTIONS(var1) \
    class ACE_Actions { \
        class ACE_MainActions { \
            displayName = CSTRING(MainAction); \
            selection = ""; \
            distance = 2; \
            condition = "true"; \
            class ACE_SwitchLamp { \
                displayName = CSTRING(var1); \
                condition = QUOTE(alive _target); \
                statement = QUOTE([ARR_1(_target)] call DFUNC(switchLamp)); \
                selection = ""; \
                distance = 2; \
                showDisabled = 0; \
                priority = -1; \
            }; \
        }; \
    }; \
    class ACE_SelfActions {}

class CfgVehicles {
    class ACE_Module;
    class ACE_ModuleInteraction: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Module_DisplayName);
        function = "ACE_Interaction_fnc_moduleInteraction";
        scope = 2;
        isGlobal = 1;
        icon = PATHTOF(UI\Icon_Module_Interaction_ca.paa);
        class Arguments {
            class EnableTeamManagement {
                displayName = CSTRING(EnableTeamManagement_DisplayName);
                description = CSTRING(EnableTeamManagement_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
          description = CSTRING(Module_Description);
        };
    };

    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = CSTRING(MainAction);
                distance = 4;
                condition = QUOTE(true);
                statement = "";
                icon = "\a3\ui_f\data\IGUI\Cfg\Actions\eject_ca.paa";
                selection = "pelvis";

                class ACE_TeamManagement {
                    displayName = CSTRING(TeamManagement);
                    condition = QUOTE([ARR_2(_player,_target)] call DFUNC(canJoinTeam) && {GVAR(EnableTeamManagement)});
                    statement = "";
                    showDisabled = 0;
                    priority = 3.2;
                    icon = PATHTOF(UI\team\team_management_ca.paa);
                    hotkey = "M";

                    class ACE_AssignTeamRed {
                        displayName = CSTRING(AssignTeamRed);
                        condition = QUOTE([ARR_2(_player,_target)] call DFUNC(canJoinTeam));
                        statement = QUOTE([ARR_2(_target,'RED')] call DFUNC(joinTeam));
                        showDisabled = 1;
                        icon = PATHTOF(UI\team\team_red_ca.paa);
                        priority = 2.4;
                        hotkey = "R";
                    };
                    class ACE_AssignTeamGreen {
                        displayName = CSTRING(AssignTeamGreen);
                        condition = QUOTE([ARR_2(_player,_target)] call DFUNC(canJoinTeam));
                        statement = QUOTE([ARR_2(_target,'GREEN')] call DFUNC(joinTeam));
                        showDisabled = 1;
                        icon = PATHTOF(UI\team\team_green_ca.paa);
                        priority = 2.3;
                        hotkey = "G";
                    };
                    class ACE_AssignTeamBlue {
                        displayName = CSTRING(AssignTeamBlue);
                        condition = QUOTE([ARR_2(_player,_target)] call DFUNC(canJoinTeam));
                        statement = QUOTE([ARR_2(_target,'BLUE')] call DFUNC(joinTeam));
                        showDisabled = 1;
                        icon = PATHTOF(UI\team\team_blue_ca.paa);
                        priority = 2.2;
                        hotkey = "B";
                    };
                    class ACE_AssignTeamYellow {
                        displayName = CSTRING(AssignTeamYellow);
                        condition = QUOTE([ARR_2(_player,_target)] call DFUNC(canJoinTeam));
                        statement = QUOTE([ARR_2(_target,'YELLOW')] call DFUNC(joinTeam));
                        showDisabled = 1;
                        icon = PATHTOF(UI\team\team_yellow_ca.paa);
                        priority = 2.1;
                        hotkey = "Y";
                    };

                    class ACE_UnassignTeam {
                        displayName = CSTRING(LeaveTeam);
                        condition = QUOTE([ARR_2(_player,_target)] call DFUNC(canJoinTeam) && {assignedTeam _target != 'MAIN'});
                        statement = QUOTE([ARR_2(_target,'MAIN')] call DFUNC(joinTeam));
                        showDisabled = 1;
                        icon = PATHTOF(UI\team\team_white_ca.paa);
                        priority = 2.5;
                        hotkey = "N";
                    };
                };

                class ACE_JoinGroup {
                    displayName = CSTRING(JoinGroup);
                    condition = QUOTE(GVAR(EnableTeamManagement) && {[ARR_2(_player,_target)] call DFUNC(canJoinGroup)});
                    statement = QUOTE([_player] joinSilent group _target);
                    showDisabled = 0;
                    priority = 2.6;
                    icon = PATHTOF(UI\team\team_management_ca.paa);
                    hotkey = "J";
                };

                class ACE_GetDown {
                    displayName = CSTRING(GetDown);
                    condition = QUOTE([_target] call DFUNC(canInteractWithCivilian));
                    statement = QUOTE([_target] call DFUNC(getDown));
                    showDisabled = 0;
                    priority = 2.2;
                };
                class ACE_SendAway {
                    displayName = CSTRING(SendAway);
                    condition = QUOTE([_target] call DFUNC(canInteractWithCivilian));
                    statement = QUOTE([_target] call DFUNC(sendAway));
                    showDisabled = 0;
                    priority = 2.0;
                };
                class ACE_Pardon {
                    displayName = CSTRING(Pardon);
                    condition = QUOTE(rating _target < -2000 && {alive _target} && {side group _player == side group _target});
                    statement = QUOTE([ARR_3(_target,'{_this addRating -rating _this}',_target)] call DEFUNC(common,execRemoteFnc));
                    showDisabled = 0;
                    priority = 2.5;
                };
            };
            class ACE_Torso {
                displayName = CSTRING(Torso);
                selection = "spine3";
                distance = 1.50;
                condition = "";
                statement = "";
            };
            class ACE_Head {
                displayName = CSTRING(Head);
                selection = "pilot";
                distance = 1.50;
                condition = "";
                statement = "";
            };
            class ACE_ArmLeft {
                displayName = CSTRING(ArmLeft);
                selection = "LeftForeArm";
                distance = 1.50;
                condition = "";
                statement = "";
            };
            class ACE_ArmRight {
                displayName = CSTRING(ArmRight);
                selection = "RightForeArm";
                distance = 1.50;
                condition = "";
                statement = "";
            };
            class ACE_LegLeft {
                displayName = CSTRING(LegLeft);
                selection = "LKnee";
                distance = 1.50;
                condition = "";
                statement = "";
            };
            class ACE_LegRight {
                displayName = CSTRING(LegRight);
                selection = "RKnee";
                distance = 1.50;
                condition = "";
                statement = "";
            };
            class ACE_Weapon {
                displayName = CSTRING(Weapon);
                position = QUOTE(call FUNC(getWeaponPos));
                distance = 1.50;
                condition = "";
                statement = "";
            };

            class ACE_TapShoulderRight {
                displayName = CSTRING(TapShoulder);
                selection = "rightshoulder";
                distance = 2.0;
                condition = QUOTE([ARR_2(_player, _target)] call DFUNC(canTapShoulder));
                statement = QUOTE([ARR_3(_player, _target, 0)] call DFUNC(tapShoulder));
            };
            class ACE_TapShoulderLeft {
                displayName = CSTRING(TapShoulder);
                selection = "leftshoulder";
                distance = 2.0;
                condition = QUOTE([ARR_2(_player, _target)] call DFUNC(canTapShoulder));
                statement = QUOTE([ARR_3(_player, _target, 1)] call DFUNC(tapShoulder));
            };
        };

        class ACE_SelfActions {
            class ACE_TeamManagement {
                displayName = CSTRING(TeamManagement);
                condition = QUOTE(GVAR(EnableTeamManagement));
                exceptions[] = {"isNotInside", "isNotSitting"};
                statement = "";
                showDisabled = 1;
                priority = 3.2;
                icon = PATHTOF(UI\team\team_management_ca.paa);
                hotkey = "M";

                class ACE_JoinTeamRed {
                    displayName = CSTRING(JoinTeamRed);
                    condition = QUOTE(true);
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    statement = QUOTE([ARR_2(_player,'RED')] call DFUNC(joinTeam));
                    showDisabled = 1;
                    priority = 2.4;
                    icon = PATHTOF(UI\team\team_red_ca.paa);
                    hotkey = "R";
                };
                class ACE_JoinTeamGreen {
                    displayName = CSTRING(JoinTeamGreen);
                    condition = QUOTE(true);
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    statement = QUOTE([ARR_2(_player,'GREEN')] call DFUNC(joinTeam));
                    showDisabled = 1;
                    priority = 2.3;
                    icon = PATHTOF(UI\team\team_green_ca.paa);
                    hotkey = "G";
                };
                class ACE_JoinTeamBlue {
                    displayName = CSTRING(JoinTeamBlue);
                    condition = QUOTE(true);
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    statement = QUOTE([ARR_2(_player,'BLUE')] call DFUNC(joinTeam));
                    showDisabled = 1;
                    priority = 2.2;
                    icon = PATHTOF(UI\team\team_blue_ca.paa);
                    hotkey = "B";
                };
                class ACE_JoinTeamYellow {
                    displayName = CSTRING(JoinTeamYellow);
                    condition = QUOTE(true);
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    statement = QUOTE([ARR_2(_player,'YELLOW')] call DFUNC(joinTeam));
                    showDisabled = 1;
                    priority = 2.1;
                    icon = PATHTOF(UI\team\team_yellow_ca.paa);
                    hotkey = "Y";
                };

                class ACE_LeaveTeam {
                    displayName = CSTRING(LeaveTeam);
                    condition = QUOTE(assignedTeam _player != 'MAIN');
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    statement = QUOTE([ARR_2(_player,'MAIN')] call DFUNC(joinTeam));
                    showDisabled = 1;
                    priority = 2.5;
                    icon = PATHTOF(UI\team\team_white_ca.paa);
                    hotkey = "N";
                };
                class ACE_BecomeLeader {
                    displayName = CSTRING(BecomeLeader);
                    condition = QUOTE(_this call DFUNC(canBecomeLeader));
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    statement = QUOTE(_this call DFUNC(doBecomeLeader));
                    showDisabled = 1;
                    priority = 1.0;
                    icon = PATHTOF(UI\team\team_white_ca.paa);
                    hotkey = "L";
                };
                class ACE_LeaveGroup {
                    displayName = CSTRING(LeaveGroup);
                    condition = QUOTE(count (units group _player) > 1);
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    statement = QUOTE(_oldGroup = units group _player; _newGroup = createGroup side _player; [_player] joinSilent _newGroup; {_player reveal _x} forEach _oldGroup;);
                    showDisabled = 1;
                    priority = 1.2;
                    icon = PATHTOF(UI\team\team_management_ca.paa);
                    hotkey = "M";
                };
            };

            class ACE_Gestures {
                displayName = CSTRING(Gestures);
                condition = "canStand _target";
                statement = "";
                showDisabled = 1;
                priority = 3.5;
                icon = PATHTOF(UI\gestures_ca.paa);
                hotkey = "G";

                /*class ACE_Gesture_Advance {
                    displayName = CSTRING(Gestures_Attack);
                    condition = "canStand _target";
                    statement = "_target playActionNow 'gestureAttack';";
                    showDisabled = 1;
                    priority = 2.0;
                };*/
                class ACE_Gesture_Advance {
                    displayName = CSTRING(Gestures_Advance);
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gestureAdvance';);
                    showDisabled = 1;
                    priority = 1.9;
                    hotkey = "1";
                };
                class ACE_Gesture_Go {
                    displayName = CSTRING(Gestures_Go);
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow ([ARR_2('gestureGo','gestureGoB')] select floor random 2););
                    showDisabled = 1;
                    priority = 1.8;
                    hotkey = "2";
                };
                class ACE_Gesture_Follow {
                    displayName = CSTRING(Gestures_Follow);
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gestureFollow';);
                    showDisabled = 1;
                    priority = 1.7;
                    hotkey = "3";
                };
                /*class ACE_Gesture_Point {
                    displayName = CSTRING(Gestures_Point);
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gesturePoint';);
                    showDisabled = 1;
                    priority = 1.6;
                };*/
                class ACE_Gesture_Up {
                    displayName = CSTRING(Gestures_Up);
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gestureUp';);
                    showDisabled = 1;
                    priority = 1.5;
                    hotkey = "4";
                };
                class ACE_Gesture_Cover {
                    displayName = CSTRING(Gestures_Cover);
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gestureCover';);
                    showDisabled = 1;
                    priority = 1.4;
                    hotkey = "5";
                };
                class ACE_Gesture_CeaseFire {
                    displayName = CSTRING(Gestures_Cease_Fire);
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gestureCeaseFire';);
                    showDisabled = 1;
                    priority = 1.3;
                    hotkey = "6";
                };
                class ACE_Gesture_Freeze {
                    displayName = CSTRING(Gestures_Freeze);
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gestureFreeze';);
                    showDisabled = 1;
                    priority = 1.2;
                    hotkey = "7";
                };
                class ACE_Gesture_Yes {
                    displayName = ECSTRING(common,Yes);
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow ([ARR_2('gestureYes','gestureNod')] select floor random 2););
                    showDisabled = 1;
                    priority = 1.1;
                    hotkey = "8";
                };
                class ACE_Gesture_No {
                    displayName = ECSTRING(common,No);
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gestureNo';);
                    showDisabled = 1;
                    priority = 1.0;
                    hotkey = "9";
                };
                class ACE_Gesture_Hi {
                    displayName = CSTRING(Gestures_Hi);
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow ([ARR_3('gestureHi','gestureHiB','gestureHiC')] select floor random 3););
                    showDisabled = 1;
                    priority = 0.9;
                    hotkey = "0";
                };
            };

            class ACE_Equipment {
                displayName = CSTRING(Equipment);
                condition = QUOTE(true);
                exceptions[] = {"isNotInside","notOnMap", "isNotSitting"};
                statement = "";
                showDisabled = 1;
                priority = 4.5;
                icon = "";  // @todo
                hotkey = "E";
            };
        };
    };

    class LandVehicle;
    class Car: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = CSTRING(MainAction);
                selection = "";
                distance = 10;
                condition = "true";
                class ACE_Passengers {
                    displayName = CSTRING(Passengers);
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
                };
            };
        };
        class ACE_SelfActions {
            class ACE_Passengers {
                displayName = CSTRING(Passengers);
                condition = "true";
                statement = "";
                insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
            };
        };
    };
    class Tank: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = CSTRING(MainAction);
                selection = "";
                distance = 10;
                condition = "true";
                class ACE_Passengers {
                    displayName = CSTRING(Passengers);
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
                };
            };
        };
        class ACE_SelfActions {
            class ACE_Passengers {
                displayName = CSTRING(Passengers);
                condition = "true";
                statement = "";
                insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
            };
        };
    };

    class Air;
    class Helicopter: Air {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = CSTRING(MainAction);
                selection = "";
                distance = 10;
                condition = "true";
                class ACE_Passengers {
                    displayName = CSTRING(Passengers);
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
                };
            };
        };
        class ACE_SelfActions {
            class ACE_Passengers {
                displayName = CSTRING(Passengers);
                condition = "true";
                statement = "";
                insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
            };
        };
    };
    class Plane: Air {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = CSTRING(MainAction);
                selection = "";
                distance = 10;
                condition = "true";
                class ACE_Passengers {
                    displayName = CSTRING(Passengers);
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
                };
            };
        };
        class ACE_SelfActions {
            class ACE_Passengers {
                displayName = CSTRING(Passengers);
                condition = "true";
                statement = "";
                insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
            };
        };
    };

    class Ship;
    class Ship_F: Ship {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = CSTRING(MainAction);
                selection = "";
                distance = 10;
                condition = "true";

                class ACE_Push {
                    displayName = CSTRING(Push);
                    distance = 6;
                    condition = QUOTE(getMass _target < 1000 && {alive _target});
                    statement = QUOTE([ARR_2(_target, [ARR_3(2 * (vectorDir _player select 0), 2 * (vectorDir _player select 1), 0.5)])] call DFUNC(push););
                    showDisabled = 0;
                    priority = -1;
                };
                class ACE_Passengers {
                    displayName = CSTRING(Passengers);
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
                };
            };
        };
        class ACE_SelfActions {
            class ACE_Passengers {
                displayName = CSTRING(Passengers);
                condition = "true";
                statement = "";
                insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
            };
        };
    };

    class StaticWeapon: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = CSTRING(MainAction);
                selection = "gunnerview";
                distance = 2;
                condition = "true";
                class ACE_Passengers {
                    displayName = CSTRING(Passengers);
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
                };
            };
        };
        class ACE_SelfActions {
            class ACE_Passengers {
                displayName = CSTRING(Passengers);
                condition = "true";
                statement = "";
                insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
            };
        };
    };

    class StaticMGWeapon: StaticWeapon {};
    class HMG_01_base_F: StaticMGWeapon {};
    class HMG_01_high_base_F: HMG_01_base_F {
          class ACE_Actions: ACE_Actions {
              class ACE_MainActions: ACE_MainActions {
                  position = "[-0.172852,0.164063,-0.476091]";
              };
          };
    };
    class AA_01_base_F: StaticMGWeapon {
          class ACE_Actions: ACE_Actions {
              class ACE_MainActions: ACE_MainActions {
                  position = "[0,0.515869,-0.200671]";
              };
          };
    };
    class AT_01_base_F: StaticMGWeapon {
          class ACE_Actions: ACE_Actions {
              class ACE_MainActions: ACE_MainActions {
                  position = "[0,0.515869,-0.200671]";
              };
          };
    };

    class thingX;
    class ReammoBox_F: thingX {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = CSTRING(MainAction);
                selection = "";
                distance = 2;
                condition = "true";
                class ACE_OpenBox {
                    displayName = CSTRING(OpenBox);
                    condition = QUOTE(alive _target);
                    statement = QUOTE(_player action [ARR_2(QUOTE(QUOTE(Gear)), _target)]);
                    showDisabled = 0;
                    priority = -1;
                };
            };
        };
        class ACE_SelfActions {};
    };

    class ACE_RepairItem_Base: thingX {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = CSTRING(MainAction);
                selection = "";
                distance = 2;
                condition = "true";
            };
        };
        class ACE_SelfActions {};
    };

    class Lamps_base_F;
    class Land_PortableLight_single_F: Lamps_base_F {
        scope = 2;
        GVAR(switchLampClass) = "Land_PortableLight_single_off_F";
        XEH_ENABLED;
        MACRO_PORTABLELIGHTSACTIONS(TurnOff);
    };
    class Land_PortableLight_single_off_F: Land_PortableLight_single_F {
        scope = 1;
        GVAR(switchLampClass) = "Land_PortableLight_single_F";
        GVAR(switchLampOff) = 1;
        MACRO_PORTABLELIGHTSACTIONS(TurnOn);
    };
    class Land_PortableLight_double_F: Land_PortableLight_single_F {
        scope = 2;
        GVAR(switchLampClass) = "Land_PortableLight_double_off_F";
        XEH_ENABLED;
        MACRO_PORTABLELIGHTSACTIONS(TurnOff);
    };
    class Land_PortableLight_double_off_F: Land_PortableLight_double_F {
        scope = 1;
        GVAR(switchLampClass) = "Land_PortableLight_double_F";
        GVAR(switchLampOff) = 1;
        MACRO_PORTABLELIGHTSACTIONS(TurnOn);
    };
};
