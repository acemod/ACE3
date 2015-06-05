class ACE_ZeusActions {
    // _target = curatorLogic
    // curatorSelected = [objects,groups,waypoints,markers]

    class ZeusUnits {
        displayName = "$STR_A3_RscDisplayCurator_ModeUnits_tooltip";
        icon = "\A3\UI_F_Curator\Data\Displays\RscDisplayCurator\modeUnits_ca.paa";

        class remoteControl {
            displayName = "$STR_A3_CfgVehicles_ModuleRemoteControl_F";
            icon = "\A3\Modules_F_Curator\Data\portraitRemoteControl_ca.paa";
            statement = "_unit = objNull; { if ((side _x in [east,west,resistance,civilian]) && !(isPlayer _x)) exitWith { _unit = _x; }; } forEach (curatorSelected select 0); bis_fnc_curatorObjectPlaced_mouseOver = ['OBJECT',_unit]; (group _target) createUnit ['ModuleRemoteControl_F',[0,0,0],[],0,''];";
        };
        class stance {
            displayName = "$STR_A3_RscAttributeUnitPos_Title";

            class limited {
                displayName = "$STR_A3_RscAttributeUnitPos_Down_tooltip";
                icon = "\A3\UI_F\Data\IGUI\RscIngameUI\RscUnitInfo\SI_prone_ca.paa";
                statement = "{_x setUnitPos 'DOWN';} forEach (curatorSelected select 0);";
            };
            class normal {
                displayName = "$STR_A3_RscAttributeUnitPos_Crouch_tooltip";
                icon = "\A3\UI_F\Data\IGUI\RscIngameUI\RscUnitInfo\SI_crouch_ca.paa";
                statement = "{_x setUnitPos 'MIDDLE';} forEach (curatorSelected select 0);";
            };
            class full {
                displayName = "$STR_A3_RscAttributeUnitPos_Up_tooltip";
                icon = "\A3\UI_F\Data\IGUI\RscIngameUI\RscUnitInfo\SI_stand_ca.paa";
                statement = "{_x setUnitPos 'UP';} forEach (curatorSelected select 0);";
            };
            class auto {
                displayName = "$STR_A3_RscAttributeUnitPos_Auto_tooltip";
                icon = "\A3\UI_F_Curator\Data\default_ca.paa";
                statement = "{_x setUnitPos 'AUTO';} forEach (curatorSelected select 0);";
            };
        };
    };
    class ZeusGroups {
        displayName = "$STR_A3_RscDisplayCurator_ModeGroups_tooltip";
        icon = "\A3\UI_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa";

        class behaviour {
            displayName = "$STR_disp_arcwp_semaphore";

            class careless {
                displayName = "$STR_careless";
                statement = "{ _x setBehaviour 'CARELESS'; } forEach (curatorSelected select 1);";
            };
            class safe {
                displayName = "$STR_safe";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeBehaviour\safe_ca.paa";
                statement = "{ _x setBehaviour 'SAFE'; } forEach (curatorSelected select 1);";
            };
            class aware {
                displayName = "$STR_aware";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeBehaviour\aware_ca.paa";
                statement = "{ _x setBehaviour 'AWARE'; } forEach (curatorSelected select 1);";
            };
            class combat {
                displayName = "$STR_combat";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeBehaviour\combat_ca.paa";
                statement = "{ _x setBehaviour 'COMBAT'; } forEach (curatorSelected select 1);";
            };
            class stealth {
                displayName = "$STR_stealth";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeBehaviour\stealth_ca.paa";
                statement = "{ _x setBehaviour 'STEALTH'; } forEach (curatorSelected select 1);";
            };
        };
        class speed {
            displayName = "$STR_disp_arcwp_speed";

            class limited {
                displayName = "$STR_speed_limited";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeSpeedMode\limited_ca.paa";
                statement = "{_x setSpeedMode 'LIMITED';} forEach (curatorSelected select 1);";
            };
            class normal {
                displayName = "$STR_speed_normal";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeSpeedMode\normal_ca.paa";
                statement = "{_x setSpeedMode 'NORMAL';} forEach (curatorSelected select 1);";
            };
            class full {
                displayName = "$STR_speed_full";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeSpeedMode\full_ca.paa";
                statement = "{_x setSpeedMode 'FULL';} forEach (curatorSelected select 1);";
            };
        };
        class stance {
            displayName = "$STR_A3_RscAttributeUnitPos_Title";

            class limited {
                displayName = "$STR_A3_RscAttributeUnitPos_Down_tooltip";
                icon = "\A3\UI_F\Data\IGUI\RscIngameUI\RscUnitInfo\SI_prone_ca.paa";
                statement = "{ {_x setUnitPos 'DOWN'} forEach (units _x); } forEach (curatorSelected select 1);";
            };
            class normal {
                displayName = "$STR_A3_RscAttributeUnitPos_Crouch_tooltip";
                icon = "\A3\UI_F\Data\IGUI\RscIngameUI\RscUnitInfo\SI_crouch_ca.paa";
                statement = "{ {_x setUnitPos 'MIDDLE'} forEach (units _x); } forEach (curatorSelected select 1);";
            };
            class full {
                displayName = "$STR_A3_RscAttributeUnitPos_Up_tooltip";
                icon = "\A3\UI_F\Data\IGUI\RscIngameUI\RscUnitInfo\SI_stand_ca.paa";
                statement = "{ {_x setUnitPos 'UP'} forEach (units _x); } forEach (curatorSelected select 1);";
            };
            class auto {
                displayName = "$STR_A3_RscAttributeUnitPos_Auto_tooltip";
                icon = "\A3\UI_F_Curator\Data\default_ca.paa";
                statement = "{ {_x setUnitPos 'AUTO'} forEach (units _x); } forEach (curatorSelected select 1);";
            };
        };
        class formation {
            displayName = "$STR_disp_arcwp_form";

            class wedge {
                displayName = "$STR_wedge";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\wedge_ca.paa";
                statement = "{_x setFormation 'WEDGE';} forEach (curatorSelected select 1);";
            };
            class vee {
                displayName = "$STR_vee";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\vee_ca.paa";
                statement = "{_x setFormation 'VEE';} forEach (curatorSelected select 1);";
            };
            class line {
                displayName = "$STR_line";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\line_ca.paa";
                statement = "{_x setFormation 'LINE';} forEach (curatorSelected select 1);";
            };
            class column {
                displayName = "$STR_column";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\column_ca.paa";
                statement = "{_x setFormation 'COLUMN';} forEach (curatorSelected select 1);";
            };
            class file {
                displayName = "$STR_file";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\file_ca.paa";
                statement = "{_x setFormation 'FILE';} forEach (curatorSelected select 1);";
            };
            class stag_column {
                displayName = "$STR_staggered";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\stag_column_ca.paa";
                statement = "{_x setFormation 'STAG COLUMN';} forEach (curatorSelected select 1);";
            };
            class ech_left {
                displayName = "$STR_echl";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\ech_left_ca.paa";
                statement = "{_x setFormation 'ECH LEFT';} forEach (curatorSelected select 1);";
            };
            class ech_right {
                displayName = "$STR_echr";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\ech_right_ca.paa";
                statement = "{_x setFormation 'ECH RIGHT';} forEach (curatorSelected select 1);";
            };
            class diamond {
                displayName = "$STR_diamond";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\diamond_ca.paa";
                statement = "{_x setFormation 'DIAMOND';} forEach (curatorSelected select 1);";
            };
        };
    };
    class ZeusWaypoints {
        displayName = "Waypoints";
        icon = "\A3\UI_F_Curator\Data\CfgCurator\waypoint_ca.paa";

        class behaviour {
            displayName = "$STR_disp_arcwp_semaphore";

            class careless {
                displayName = "$STR_careless";
                statement = "{ _x setWaypointBehaviour 'CARELESS'; } forEach (curatorSelected select 2);";
            };
            class safe {
                displayName = "$STR_safe";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeBehaviour\safe_ca.paa";
                statement = "{ _x setWaypointBehaviour 'SAFE'; } forEach (curatorSelected select 2);";
            };
            class aware {
                displayName = "$STR_aware";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeBehaviour\aware_ca.paa";
                statement = "{ _x setWaypointBehaviour 'AWARE'; } forEach (curatorSelected select 2);";
            };
            class combat {
                displayName = "$STR_combat";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeBehaviour\combat_ca.paa";
                statement = "{ _x setWaypointBehaviour 'COMBAT'; } forEach (curatorSelected select 2);";
            };
            class stealth {
                displayName = "$STR_stealth";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeBehaviour\stealth_ca.paa";
                statement = "{ _x setWaypointBehaviour 'STEALTH'; } forEach (curatorSelected select 2);";
            };
        };
        class speed {
            displayName = "$STR_disp_arcwp_speed";

            class limited {
                displayName = "$STR_speed_limited";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeSpeedMode\limited_ca.paa";
                statement = "{ _x setWaypointSpeed 'LIMITED'; } forEach (curatorSelected select 2);";
            };
            class normal {
                displayName = "$STR_speed_normal";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeSpeedMode\normal_ca.paa";
                statement = "{ _x setWaypointSpeed 'NORMAL'; } forEach (curatorSelected select 2);";
            };
            class full {
                displayName = "$STR_speed_full";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeSpeedMode\full_ca.paa";
                statement = "{ _x setWaypointSpeed 'FULL'; } forEach (curatorSelected select 2);";
            };
        };
        class formation {
            displayName = "$STR_disp_arcwp_form";

            class wedge {
                displayName = "$STR_wedge";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\wedge_ca.paa";
                statement = "{_x setWaypointFormation 'WEDGE';} forEach (curatorSelected select 1);";
            };
            class vee {
                displayName = "$STR_vee";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\vee_ca.paa";
                statement = "{_x setWaypointFormation 'VEE';} forEach (curatorSelected select 1);";
            };
            class line {
                displayName = "$STR_line";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\line_ca.paa";
                statement = "{_x setWaypointFormation 'LINE';} forEach (curatorSelected select 1);";
            };
            class column {
                displayName = "$STR_column";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\column_ca.paa";
                statement = "{_x setWaypointFormation 'COLUMN';} forEach (curatorSelected select 1);";
            };
            class file {
                displayName = "$STR_file";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\file_ca.paa";
                statement = "{_x setWaypointFormation 'FILE';} forEach (curatorSelected select 1);";
            };
            class stag_column {
                displayName = "$STR_staggered";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\stag_column_ca.paa";
                statement = "{_x setWaypointFormation 'STAG COLUMN';} forEach (curatorSelected select 1);";
            };
            class ech_left {
                displayName = "$STR_echl";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\ech_left_ca.paa";
                statement = "{_x setWaypointFormation 'ECH LEFT';} forEach (curatorSelected select 1);";
            };
            class ech_right {
                displayName = "$STR_echr";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\ech_right_ca.paa";
                statement = "{_x setWaypointFormation 'ECH RIGHT';} forEach (curatorSelected select 1);";
            };
            class diamond {
                displayName = "$STR_diamond";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\diamond_ca.paa";
                statement = "{_x setWaypointFormation 'DIAMOND';} forEach (curatorSelected select 1);";
            };
        };
    };
    class ZeusMarkers {
        displayName = "$STR_A3_RscDisplayCurator_ModeMarkers_tooltip";
        icon = "\A3\UI_F_Curator\Data\Displays\RscDisplayCurator\modeMarkers_ca.paa";
    };
};
