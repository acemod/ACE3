
class ACE_ZeusActions {
    class ZeusUnits {
        displayName = "$STR_A3_RscDisplayCurator_ModeUnits_tooltip";
        icon = "\A3\UI_F_Curator\Data\Displays\RscDisplayCurator\modeUnits_ca.paa";
        condition = QUOTE(!([] isEqualTo (curatorSelected select 0)));

        class stance {
            displayName = "$STR_A3_RscAttributeUnitPos_Title";
            condition = QUOTE(ZEUS_ACTION_CONDITION && {-1 < (curatorSelected select 0) findIf {_x isKindOf 'CAManBase'}});

            class prone {
                displayName = "$STR_Pos_Down";
                icon = "\A3\UI_F\Data\IGUI\RscIngameUI\RscUnitInfo\SI_prone_ca.paa";
                statement = QUOTE([ARR_3(QQGVAR(zeusStance),[ARR_2('DOWN',curatorSelected select 0)],curatorSelected select 0)] call CBA_fnc_targetEvent;);
            };
            class crouch {
                displayName = "$STR_Pos_Crouch";
                icon = "\A3\UI_F\Data\IGUI\RscIngameUI\RscUnitInfo\SI_crouch_ca.paa";
                statement = QUOTE([ARR_3(QQGVAR(zeusStance),[ARR_2('MIDDLE',curatorSelected select 0)],curatorSelected select 0)] call CBA_fnc_targetEvent;);
            };
            class stand {
                displayName = "$STR_Pos_Up";
                icon = "\A3\UI_F\Data\IGUI\RscIngameUI\RscUnitInfo\SI_stand_ca.paa";
                statement = QUOTE([ARR_3(QQGVAR(zeusStance),[ARR_2('UP',curatorSelected select 0)],curatorSelected select 0)] call CBA_fnc_targetEvent;);
            };
            class auto {
                displayName = "$STR_Pos_Automatic";
                icon = "\A3\UI_F_Curator\Data\default_ca.paa";
                statement = QUOTE([ARR_3(QQGVAR(zeusStance),[ARR_2('AUTO',curatorSelected select 0)],curatorSelected select 0)] call CBA_fnc_targetEvent;);
            };
        };

        class remoteControl {
            displayName = "$STR_A3_CfgVehicles_ModuleRemoteControl_F";
            icon = "\A3\Modules_F_Curator\Data\portraitRemoteControl_ca.paa";
            condition = QUOTE(ZEUS_ACTION_CONDITION && {-1 < (curatorSelected select 0) findIf {!isNull effectiveCommander _x}});
            statement = QUOTE( \
                private _units = curatorSelected select 0; \
                private _unit = _units param [ARR_2( \
                    _units findIf { \
                        side _x in [ARR_4(east,west,resistance,civilian)] \
                        && !(isPlayer _x) \
                    }, \
                    objNull \
                )]; \
                bis_fnc_curatorObjectPlaced_mouseOver = [ARR_2('OBJECT',_unit)]; \
                private _rc = group _target createUnit [ARR_5('ModuleRemoteControl_F',[ARR_3(0,0,0)],[],0,'NONE')]; \
                _rc setVariable [ARR_2('BIS_fnc_initModules_disableAutoActivation',false)]; \
            );
        };

        class GVAR(repair) {
            displayName = "$STR_repair";
            icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
            condition = QUOTE(ZEUS_ACTION_CONDITION && {-1 < (curatorSelected select 0) findIf {_x isKindOf 'AllVehicles' && {!(_x isKindOf 'Man')}}});
            statement = QUOTE(call FUNC(repair_Statement));
        };
    };

    class ZeusGroups {
        displayName = "$STR_A3_RscDisplayCurator_ModeGroups_tooltip";
        icon = "\A3\UI_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa";
        condition = QUOTE(!([] isEqualTo (curatorSelected select 1)));

        class behaviour {
            displayName = "$STR_Combat_Mode";
            condition = QUOTE(ZEUS_ACTION_CONDITION);

            class careless {
                displayName = "$STR_Combat_Careless";
                statement = QUOTE([ARR_3(QQGVAR(zeusBehaviour),[ARR_2('CARELESS',curatorSelected select 1)],curatorSelected select 1)] call CBA_fnc_targetEvent;);
            };
            class safe {
                displayName = "$STR_Combat_Safe";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeBehaviour\safe_ca.paa";
                statement = QUOTE([ARR_3(QQGVAR(zeusBehaviour),[ARR_2('SAFE',curatorSelected select 1)],curatorSelected select 1)] call CBA_fnc_targetEvent;);
            };
            class aware {
                displayName = "$STR_Combat_Aware";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeBehaviour\aware_ca.paa";
                statement = QUOTE([ARR_3(QQGVAR(zeusBehaviour),[ARR_2('AWARE',curatorSelected select 1)],curatorSelected select 1)] call CBA_fnc_targetEvent;);
            };
            class combat {
                displayName = "$STR_Combat_Combat";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeBehaviour\combat_ca.paa";
                statement = QUOTE([ARR_3(QQGVAR(zeusBehaviour),[ARR_2('COMBAT',curatorSelected select 1)],curatorSelected select 1)] call CBA_fnc_targetEvent;);
            };
            class stealth {
                displayName = "$STR_Combat_Stealth";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeBehaviour\stealth_ca.paa";
                statement = QUOTE([ARR_3(QQGVAR(zeusBehaviour),[ARR_2('STEALTH',curatorSelected select 1)],curatorSelected select 1)] call CBA_fnc_targetEvent;);
            };
        };

        class speed {
            displayName = "$STR_HC_Menu_Speed";
            condition = QUOTE(ZEUS_ACTION_CONDITION);

            class limited {
                displayName = "$STR_Speed_Limited";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeSpeedMode\limited_ca.paa";
                statement = QUOTE([ARR_3(QQGVAR(zeusSpeed),[ARR_2('LIMITED',curatorSelected select 1)],curatorSelected select 1)] call CBA_fnc_targetEvent;);
            };
            class normal {
                displayName = "$STR_Speed_Normal";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeSpeedMode\normal_ca.paa";
                statement = QUOTE([ARR_3(QQGVAR(zeusSpeed),[ARR_2('NORMAL',curatorSelected select 1)],curatorSelected select 1)] call CBA_fnc_targetEvent;);
            };
            class full {
                displayName = "$STR_Speed_Full";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeSpeedMode\full_ca.paa";
                statement = QUOTE([ARR_3(QQGVAR(zeusSpeed),[ARR_2('FULL',curatorSelected select 1)],curatorSelected select 1)] call CBA_fnc_targetEvent;);
            };
        };

        class formation {
            displayName = "$STR_Formation";
            condition = QUOTE(ZEUS_ACTION_CONDITION);

            class wedge {
                displayName = "$STR_Wedge";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\wedge_ca.paa";
                statement = QUOTE([ARR_3(QQGVAR(zeusFormation),[ARR_2('WEDGE',curatorSelected select 1)],curatorSelected select 1)] call CBA_fnc_targetEvent;);
            };
            class vee {
                displayName = "$STR_Vee";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\vee_ca.paa";
                statement = QUOTE([ARR_3(QQGVAR(zeusFormation),[ARR_2('VEE',curatorSelected select 1)],curatorSelected select 1)] call CBA_fnc_targetEvent;);
            };
            class line {
                displayName = "$STR_Line";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\line_ca.paa";
                statement = QUOTE([ARR_3(QQGVAR(zeusFormation),[ARR_2('LINE',curatorSelected select 1)],curatorSelected select 1)] call CBA_fnc_targetEvent;);
            };
            class column {
                displayName = "$STR_Column";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\column_ca.paa";
                statement = QUOTE([ARR_3(QQGVAR(zeusFormation),[ARR_2('COLUMN',curatorSelected select 1)],curatorSelected select 1)] call CBA_fnc_targetEvent;);
            };
            class file {
                displayName = "$STR_File";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\file_ca.paa";
                statement = QUOTE([ARR_3(QQGVAR(zeusFormation),[ARR_2('FILE',curatorSelected select 1)],curatorSelected select 1)] call CBA_fnc_targetEvent;);
            };
            class stag_column {
                displayName = "$STR_Staggered";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\stag_column_ca.paa";
                statement = QUOTE([ARR_3(QQGVAR(zeusFormation),[ARR_2('STAG COLUMN',curatorSelected select 1)],curatorSelected select 1)] call CBA_fnc_targetEvent;);
            };
            class ech_left {
                displayName = "$STR_EchL";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\ech_left_ca.paa";
                statement = QUOTE([ARR_3(QQGVAR(zeusFormation),[ARR_2('ECH LEFT',curatorSelected select 1)],curatorSelected select 1)] call CBA_fnc_targetEvent;);
            };
            class ech_right {
                displayName = "$STR_EchR";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\ech_right_ca.paa";
                statement = QUOTE([ARR_3(QQGVAR(zeusFormation),[ARR_2('ECH RIGHT',curatorSelected select 1)],curatorSelected select 1)] call CBA_fnc_targetEvent;);
            };
            class diamond {
                displayName = "$STR_Diamond";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\diamond_ca.paa";
                statement = QUOTE([ARR_3(QQGVAR(zeusFormation),[ARR_2('DIAMOND',curatorSelected select 1)],curatorSelected select 1)] call CBA_fnc_targetEvent;);
            };
        };
    };

    class ZeusWaypoints {
        displayName = "Waypoints";
        icon = "\A3\UI_F_Curator\Data\Displays\RscDisplayCurator\modeRecent_ca.paa";
        condition = QUOTE(!([] isEqualTo (curatorSelected select 2)));

        class behaviour {
            displayName = "$STR_Combat_Mode";
            condition = QUOTE(ZEUS_ACTION_CONDITION);

            class careless {
                displayName = "$STR_Combat_Careless";
                statement = QUOTE([ARR_2(QQGVAR(zeusBehaviour),[ARR_3('CARELESS',curatorSelected select 2,true)])] call CBA_fnc_serverEvent;);
            };
            class safe {
                displayName = "$STR_Combat_Safe";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeBehaviour\safe_ca.paa";
                statement = QUOTE([ARR_2(QQGVAR(zeusBehaviour),[ARR_3('SAFE',curatorSelected select 2,true)])] call CBA_fnc_serverEvent;);
            };
            class aware {
                displayName = "$STR_Combat_Aware";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeBehaviour\aware_ca.paa";
                statement = QUOTE([ARR_2(QQGVAR(zeusBehaviour),[ARR_3('AWARE',curatorSelected select 2,true)])] call CBA_fnc_serverEvent;);
            };
            class combat {
                displayName = "$STR_Combat_Combat";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeBehaviour\combat_ca.paa";
                statement = QUOTE([ARR_2(QQGVAR(zeusBehaviour),[ARR_3('COMBAT',curatorSelected select 2,true)])] call CBA_fnc_serverEvent;);
            };
            class stealth {
                displayName = "$STR_Combat_Stealth";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeBehaviour\stealth_ca.paa";
                statement = QUOTE([ARR_2(QQGVAR(zeusBehaviour),[ARR_3('STEALTH',curatorSelected select 2,true)])] call CBA_fnc_serverEvent;);
            };
        };

        class speed {
            displayName = "$STR_HC_Menu_Speed";
            condition = QUOTE(ZEUS_ACTION_CONDITION);

            class limited {
                displayName = "$STR_Speed_Limited";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeSpeedMode\limited_ca.paa";
                statement = QUOTE([ARR_2(QQGVAR(zeusSpeed),[ARR_3('LIMITED',curatorSelected select 2,true)])] call CBA_fnc_serverEvent;);
            };
            class normal {
                displayName = "$STR_Speed_Normal";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeSpeedMode\normal_ca.paa";
                statement = QUOTE([ARR_2(QQGVAR(zeusSpeed),[ARR_3('NORMAL',curatorSelected select 2,true)])] call CBA_fnc_serverEvent;);
            };
            class full {
                displayName = "$STR_Speed_Full";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeSpeedMode\full_ca.paa";
                statement = QUOTE([ARR_2(QQGVAR(zeusSpeed),[ARR_3('FULL',curatorSelected select 2,true)])] call CBA_fnc_serverEvent;);
            };
        };

        class formation {
            displayName = "$STR_Formation";
            condition = QUOTE(ZEUS_ACTION_CONDITION);

            class wedge {
                displayName = "$STR_Wedge";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\wedge_ca.paa";
                statement = QUOTE([ARR_2(QQGVAR(zeusFormation),[ARR_3('WEDGE',curatorSelected select 2,true)])] call CBA_fnc_serverEvent;);
            };
            class vee {
                displayName = "$STR_Vee";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\vee_ca.paa";
                statement = QUOTE([ARR_2(QQGVAR(zeusFormation),[ARR_3('VEE',curatorSelected select 2,true)])] call CBA_fnc_serverEvent;);
            };
            class line {
                displayName = "$STR_Line";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\line_ca.paa";
                statement = QUOTE([ARR_2(QQGVAR(zeusFormation),[ARR_3('LINE',curatorSelected select 2,true)])] call CBA_fnc_serverEvent;);
            };
            class column {
                displayName = "$STR_Column";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\column_ca.paa";
                statement = QUOTE([ARR_2(QQGVAR(zeusFormation),[ARR_3('COLUMN',curatorSelected select 2,true)])] call CBA_fnc_serverEvent;);
            };
            class file {
                displayName = "$STR_File";
                icon = "\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\file_ca.paa";
                statement = QUOTE([ARR_2(QQGVAR(zeusFormation),[ARR_3('FILE',curatorSelected select 2,true)])] call CBA_fnc_serverEvent;);
            };
            class stag_column {
                displayName = "$STR_Staggered";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\stag_column_ca.paa";
                statement = QUOTE([ARR_2(QQGVAR(zeusFormation),[ARR_3('COLUMN',curatorSelected select 2,true)])] call CBA_fnc_serverEvent;);
            };
            class ech_left {
                displayName = "$STR_EchL";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\ech_left_ca.paa";
                statement = QUOTE([ARR_2(QQGVAR(zeusFormation),[ARR_3('LEFT',curatorSelected select 2,true)])] call CBA_fnc_serverEvent;);
            };
            class ech_right {
                displayName = "$STR_EchR";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\ech_right_ca.paa";
                statement = QUOTE([ARR_2(QQGVAR(zeusFormation),[ARR_3('RIGHT',curatorSelected select 2,true)])] call CBA_fnc_serverEvent;);
            };
            class diamond {
                displayName = "$STR_Diamond";
                icon="\A3\UI_F_Curator\Data\RscCommon\RscAttributeFormation\diamond_ca.paa";
                statement = QUOTE([ARR_2(QQGVAR(zeusFormation),[ARR_3('DIAMOND',curatorSelected select 2,true)])] call CBA_fnc_serverEvent;);
            };
        };
    };

    class ZeusMarkers {
        displayName = "$STR_A3_RscDisplayCurator_ModeMarkers_tooltip";
        icon = "\A3\UI_F_Curator\Data\Displays\RscDisplayCurator\modeMarkers_ca.paa";
        condition = QUOTE(!([] isEqualTo (curatorSelected select 3)));
    };
};
