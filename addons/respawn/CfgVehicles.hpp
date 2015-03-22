class CfgVehicles {
    class Module_F;
    class ACE_ModuleRespawn : Module_F {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "Respawn System";
        function = QFUNC(module);
        scope = 2;
        isGlobal = 1;
        icon = QUOTE(PATHTOF(UI\Icon_Module_Respawn_ca.paa));
        class Arguments {
            class SavePreDeathGear {
                displayName = "Save Gear?";
                description = "Respawn with the gear a soldier had just before his death?";
                typeName = "BOOL";
                class values {
                    class Yes { name = "Yes"; value = 1; };
                    class No { default = 1; name = "No"; value = 0; };
                };
            };
            class RemoveDeadBodiesDisonncected {
                displayName = "Remove bodies?";
                description = "Remove player bodies after disconnect?";
                typeName = "BOOL";
                class values {
                    class Yes { default = 1; name = "Yes"; value = 1; };
                    class No { name = "No"; value = 0; };
                };
            };
        };
    };

    class ACE_ModuleFriendlyFire : Module_F {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "Friendly Fire Messages";
        function = QFUNC(moduleFriendlyFire);
        scope = 2;
        isGlobal = 1;
        icon = QUOTE(PATHTOF(UI\Icon_Module_FriendlyFire_ca.paa));
        class Arguments {
        };
    };

    class ACE_ModuleRallypoint : Module_F {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "Rallypoint System";
        function = QFUNC(moduleRallypoint);
        scope = 2;
        isGlobal = 1;
        icon = QUOTE(PATHTOF(UI\Icon_Module_Rallypoint_ca.paa));
        class Arguments {
        };
    };

    // rallypoints
    class FlagCarrier;
    class Flag_NATO_F : FlagCarrier {
        class ACE_Actions;
    };

    class Flag_CSAT_F : FlagCarrier {
        class ACE_Actions;
    };

    class Flag_AAF_F : FlagCarrier {
        class ACE_Actions;
    };

    // static
    class ACE_Rallypoint_West : Flag_NATO_F {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "Rallypoint West Base";
        vehicleClass = QGVAR(Rallypoints);

        class EventHandlers {
            init = QUOTE((_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_nato_CO.paa'; _this call FUNC(initRallypoint));
        };
        class ACE_Actions : ACE_Actions {
            class ACE_MainActions {
                distance = 5;
                condition = "true";
                selection = "";
                class ACE_Teleport {
                    displayName = "Teleport to Rallypoint";
                    distance = 4;
                    condition = QUOTE(side group _player == west);
                    statement = QUOTE([ARR_3(_player, side group _player, false)] call FUNC(teleportToRallypoint));
                    showDisabled = 1;
                    priority = 1;
                };
            };
        };
    };

    class ACE_Rallypoint_East : Flag_CSAT_F {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "Rallypoint East Base";
        vehicleClass = QGVAR(Rallypoints);

        class EventHandlers {
            init = QUOTE((_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_CSAT_CO.paa'; _this call FUNC(initRallypoint));
        };
        class ACE_Actions : ACE_Actions {
            class ACE_MainActions {
                distance = 5;
                condition = "true";
                selection = "";
                class ACE_Teleport {
                    displayName = "Teleport to Rallypoint";
                    distance = 4;
                    condition = QUOTE(side group _player == east);
                    statement = QUOTE([ARR_3(_player, side group _player, false)] call FUNC(teleportToRallypoint));
                    showDisabled = 1;
                    priority = 1;
                };
            };
        };
    };

    class ACE_Rallypoint_Independent : Flag_AAF_F {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "Rallypoint Independent Base";
        vehicleClass = QGVAR(Rallypoints);

        class EventHandlers {
            init = QUOTE((_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_AAF_CO.paa'; _this call FUNC(initRallypoint));
        };
        class ACE_Actions : ACE_Actions {
            class ACE_MainActions {
                distance = 5;
                condition = "true";
                selection = "";
                class ACE_Teleport {
                    displayName = "Teleport to Rallypoint";
                    distance = 4;
                    condition = QUOTE(side group _player == independent);
                    statement = QUOTE([ARR_3(_player, side group _player, false)] call FUNC(teleportToRallypoint));
                    showDisabled = 1;
                    priority = 1;
                };
            };
        };
    };

    // moveable
    class ACE_RallypointExit_West : Flag_NATO_F {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "Rallypoint West";
        vehicleClass = QGVAR(Rallypoints);

        class EventHandlers {
            init = QUOTE((_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_nato_CO.paa'; _this call FUNC(initRallypoint));
        };
        class ACE_Actions : ACE_Actions {
            class ACE_MainActions {
                distance = 5;
                condition = "true";
                selection = "";
                class ACE_Teleport {
                    displayName = "Teleport to Base";
                    distance = 4;
                    condition = QUOTE(side group _player == west);
                    statement = QUOTE([ARR_3(_player, side group _player, true)] call FUNC(teleportToRallypoint));
                    showDisabled = 1;
                    priority = 1;
                };
            };
        };
    };

    class ACE_RallypointExit_East : Flag_CSAT_F {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "Rallypoint East";
        vehicleClass = QGVAR(Rallypoints);

        class EventHandlers {
            init = QUOTE((_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_CSAT_CO.paa'; _this call FUNC(initRallypoint));
        };
        class ACE_Actions : ACE_Actions {
            class ACE_MainActions {
                distance = 5;
                condition = "true";
                selection = "";
                class ACE_Teleport {
                    displayName = "Teleport to Base";
                    distance = 4;
                    condition = QUOTE(side group _player == east);
                    statement = QUOTE([ARR_3(_player, side group _player, true)] call FUNC(teleportToRallypoint));
                    showDisabled = 1;
                    priority = 1;
                };
            };
        };
    };

    class ACE_RallypointExit_Independent : Flag_AAF_F {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "Rallypoint Independent";
        vehicleClass = QGVAR(Rallypoints);

        class EventHandlers {
            init = QUOTE((_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_AAF_CO.paa'; _this call FUNC(initRallypoint));
        };
        class ACE_Actions : ACE_Actions {
            class ACE_MainActions {
                distance = 5;
                condition = "true";
                selection = "";
                class ACE_Teleport {
                    displayName = "Teleport to Base";
                    distance = 4;
                    condition = QUOTE(side group _player == independent);
                    statement = QUOTE([ARR_3(_player, side group _player, true)] call FUNC(teleportToRallypoint));
                    showDisabled = 1;
                    priority = 1;
                };
            };
        };
    };

    // team leader
    class Man;
    class CAManBase : Man {
        class ACE_SelfActions {
            class ACE_MoveRallypoint {
                displayName = "Move Rallypoint";
                condition = QUOTE([ARR_2(_player, side group _player)] call FUNC(canMoveRallypoint));
                statement = QUOTE([ARR_2(_player, side group _player)] call FUNC(moveRallypoint));
                showDisabled = 0;
                priority = -0.5;
            };
        };
    };
};
