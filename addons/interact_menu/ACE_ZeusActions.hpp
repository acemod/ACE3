class ACE_ZeusActions {
    class ZeusUnits {
        displayName = "Units";
        icon = "\A3\UI_F_Curator\Data\Displays\RscDisplayCurator\modeunits_ca.paa";
    };
    class ZeusGroups {
        displayName = "Groups";
        icon = "\A3\UI_F_Curator\Data\Displays\RscDisplayCurator\modegroups_ca.paa";

        class behaviour {
            displayName = "Behaviour";

            class aware {
                displayName = "Aware";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeBehaviour\aware_ca.paa";
                statement = "{ _x setBehaviour 'AWARE'; } forEach (curatorSelected select 1);";
            };
            class combat {
                displayName = "Combat";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeBehaviour\combat_ca.paa";
                statement = "{ _x setBehaviour 'COMBAT'; } forEach (curatorSelected select 1);";
            };
            class safe {
                displayName = "Safe";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeBehaviour\safe_ca.paa";
                statement = "{ _x setBehaviour 'SAFE'; } forEach (curatorSelected select 1);";
            };
            class stealth {
                displayName = "Stealth";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeBehaviour\stealth_ca.paa";
                statement = "{ _x setBehaviour 'STEALTH'; } forEach (curatorSelected select 1);";
            };
        };
    };
    class ZeusWaypoints {
        displayName = "Waypoints";
        icon = "\A3\UI_F_Curator\Data\CfgCurator\waypoint_ca.paa";
    };
    class ZeusMarkers {
        displayName = "Markers";
        icon = "\A3\UI_F_Curator\Data\Displays\RscDisplayCurator\modemarkers_ca.paa";
    };
};
