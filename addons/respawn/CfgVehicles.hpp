
class CBA_Extended_EventHandlers;

class CfgVehicles {
    class ACE_Module;
    class ACE_ModuleRespawn: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Module_DisplayName);
        function = QFUNC(module);
        scope = 2;
        isGlobal = 0;
        icon = QPATHTOF(UI\Icon_Module_Respawn_ca.paa);

        class Arguments {
            class SavePreDeathGear {
                displayName = CSTRING(SavePreDeathGear_DisplayName);
                description = CSTRING(SavePreDeathGear_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };

            class RemoveDeadBodiesDisconnected {
                displayName = CSTRING(RemoveDeadBodiesDisconnected_DisplayName);
                description = CSTRING(RemoveDeadBodiesDisconnected_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };

        class ModuleDescription {
            description = CSTRING(Module_Description);
        };
    };

    class ACE_ModuleFriendlyFire: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(FriendlyFire_Module_DisplayName);
        function = QFUNC(moduleFriendlyFire);
        scope = 2;
        isGlobal = 1;
        icon = QPATHTOF(UI\Icon_Module_FriendlyFire_ca.paa);

        class Arguments {};
        class ModuleDescription {
            description = CSTRING(FriendlyFire_Module_Description);
        };
    };

    class ACE_ModuleRallypoint: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Rallypoint_Module_DisplayName);
        function = QFUNC(moduleRallypoint);
        scope = 2;
        isGlobal = 1;
        icon = QPATHTOF(UI\Icon_Module_Rallypoint_ca.paa);

        class Arguments {};
        class ModuleDescription {
            description = CSTRING(Rallypoint_Module_Description);
        };
    };

    // team leader
    class Man;
    class CAManBase : Man {
        class ACE_SelfActions {
            class ACE_MoveRallypoint {
                displayName = CSTRING(Rallypoint_MoveRallypoint);
                condition = QUOTE([ARR_2(_player, side group _player)] call FUNC(canMoveRallypoint));
                statement = QUOTE([ARR_2(_player, side group _player)] call FUNC(moveRallypoint));
                showDisabled = 0;
                priority = -0.5;
            };
        };
    };

    // rallypoints
    class FlagCarrier;
    class Flag_NATO_F: FlagCarrier {
        class EventHandlers;
        class ACE_Actions;
    };

    class Flag_CSAT_F: FlagCarrier {
        class EventHandlers;
        class ACE_Actions;
    };

    class Flag_AAF_F: FlagCarrier {
        class EventHandlers;
        class ACE_Actions;
    };

    // static
    class ACE_Rallypoint_West_Base: Flag_NATO_F {
        class EventHandlers: EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(RallypointWestBase);
        vehicleClass = QGVAR(Rallypoints);

        class ACE_Actions: ACE_Actions {
            class ACE_Teleport {
                displayName = CSTRING(TeleportToRallypoint);
                distance = 4;
                condition = QUOTE(side group _player == west);
                statement = QUOTE([ARR_3(_player,side group _player,'ACE_Rallypoint_West')] call FUNC(teleportToRallypoint));
                position = "[-0.05,-0.35,-2.6]";
                showDisabled = 1;
                priority = 1;
            };
        };
    };

    class ACE_Rallypoint_East_Base: Flag_CSAT_F {
        class EventHandlers: EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(RallypointEastBase);
        vehicleClass = QGVAR(Rallypoints);

        class ACE_Actions: ACE_Actions {
            class ACE_Teleport {
                displayName = CSTRING(TeleportToRallypoint);
                distance = 4;
                condition = QUOTE(side group _player == east);
                statement = QUOTE([ARR_3(_player,side group _player,'ACE_Rallypoint_East')] call FUNC(teleportToRallypoint));
                position = "[-0.05,-0.35,-2.6]";
                showDisabled = 1;
                priority = 1;
            };
        };
    };

    class ACE_Rallypoint_Independent_Base: Flag_AAF_F {
        class EventHandlers: EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(RallypointIndependentBase);
        vehicleClass = QGVAR(Rallypoints);

        class ACE_Actions: ACE_Actions {
            class ACE_Teleport {
                displayName = CSTRING(TeleportToRallypoint);
                distance = 4;
                condition = QUOTE(side group _player == independent);
                statement = QUOTE([ARR_3(_player,side group _player,'ACE_Rallypoint_Independent')] call FUNC(teleportToRallypoint));
                position = "[-0.05,-0.35,-2.6]";
                showDisabled = 1;
                priority = 1;
            };
        };
    };

    // moveable
    class ACE_Rallypoint_West: Flag_NATO_F {
        class EventHandlers: EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(RallypointWest);
        vehicleClass = QGVAR(Rallypoints);

        class ACE_Actions: ACE_Actions {
            class ACE_Teleport {
                displayName = CSTRING(TeleportToBase);
                distance = 4;
                condition = QUOTE(side group _player == west);
                statement = QUOTE([ARR_3(_player,side group _player,'ACE_Rallypoint_West_Base')] call FUNC(teleportToRallypoint));
                position = "[-0.05,-0.35,-2.6]";
                showDisabled = 1;
                priority = 1;
            };
        };
    };

    class ACE_Rallypoint_East: Flag_CSAT_F {
        class EventHandlers: EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(RallypointEast);
        vehicleClass = QGVAR(Rallypoints);

        class ACE_Actions: ACE_Actions {
            class ACE_Teleport {
                displayName = CSTRING(TeleportToBase);
                distance = 4;
                condition = QUOTE(side group _player == east);
                statement = QUOTE([ARR_3(_player,side group _player,'ACE_Rallypoint_East_Base')] call FUNC(teleportToRallypoint));
                position = "[-0.05,-0.35,-2.6]";
                showDisabled = 1;
                priority = 1;
            };
        };
    };

    class ACE_Rallypoint_Independent: Flag_AAF_F {
        class EventHandlers: EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(RallypointIndependent);
        vehicleClass = QGVAR(Rallypoints);

        class ACE_Actions: ACE_Actions {
            class ACE_Teleport {
                displayName = CSTRING(TeleportToBase);
                distance = 4;
                condition = QUOTE(side group _player == independent);
                statement = QUOTE([ARR_3(_player,side group _player,'ACE_Rallypoint_Independent_Base')] call FUNC(teleportToRallypoint));
                position = "[-0.05,-0.35,-2.6]";
                showDisabled = 1;
                priority = 1;
            };
        };
    };
};
