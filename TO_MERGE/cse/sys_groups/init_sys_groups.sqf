
private ["_args", "_entries"];
_args =  _this;
if (!hasInterface) exitwith {};
CSE_SYS_GROUPS_ALLOW_GROUPSWITCH_GRP = false;
CSE_SYS_GROUPS_ALLOW_FORMATIONSWITCH_GRP = false;
CSE_SYS_GROUPS_ALLOW_SHOULDER_TAPS_GRP = false;

{
	if (_x select 0 == "allowGroupSwitch") then {
		CSE_SYS_GROUPS_ALLOW_GROUPSWITCH_GRP = (_x select 1);
	};
	if (_x select 0 == "allowFormationSwitch") then {
		CSE_SYS_GROUPS_ALLOW_FORMATIONSWITCH_GRP = (_x select 1);
	};
	if (_x select 0 == "allowShoulderTap") then {
		CSE_SYS_GROUPS_ALLOW_SHOULDER_TAPS_GRP = (_x select 1);
	};
}foreach _args;
waituntil {!isnil "cse_gui"};

if (CSE_SYS_GROUPS_ALLOW_GROUPSWITCH_GRP) then {
	_entries = [
		[localize "STR_CSE_GROUP_LEAVEGRP_SHORT", {([player] call cse_fnc_unitsInGroupLeft_GRP)}, "cse\cse_sys_groups\data\icons\icon_group.paa", {closeDialog 0; [player] call cse_fnc_unitLeaveGroup_GRP}, localize "STR_CSE_GROUP_LEAVEGRP_TOOLTIP"],

		[localize "STR_CSE_GROUP_REQUESTJOINGRP_SHORT", {(([_this select 0, _this select 1] call cse_fnc_unitCanJoinTargetGroup_GRP))}, "cse\cse_sys_groups\data\icons\icon_group.paa", {
			closeDialog 0;
			[player, _this select 1, "cse_sys_Groups_requestJoinGrp", "STR_CSE_GROUP_REQUESTJOINGRP_MESSAGE", "if !(_this select 2) exitwith {}; [player, _this select 1] call cse_fnc_unitJoinGroup_GRP;"] call cse_fnc_sendRequest_f;
		}, localize "STR_CSE_GROUP_REQUESTJOINGRP_TOOLTIP"]
	];
	["ActionMenu","group_actions", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;
};

if (CSE_SYS_GROUPS_ALLOW_GROUPSWITCH_GRP) then {
	cse_displaygroupActions_switchFormationMenu_GRP = {
		[ _this select 3,
			[
				[localize "STR_CSE_GROUP_FORM_COLUMN_SHORT", "cse\cse_sys_groups\data\icons\icon_column.paa", {closeDialog 0; [player, "COLUMN"] call CSE_fnc_setGroupFormation_GRP}, true, localize "STR_CSE_GROUP_FORM_COLUMN_TOOLTIP"],
				[localize "STR_CSE_GROUP_FORM_STAG_SHORT","cse\cse_sys_groups\data\icons\icon_stag_column.paa", {closeDialog 0; [player, "STAG COLUMN"] call CSE_fnc_setGroupFormation_GRP}, true, localize "STR_CSE_GROUP_FORM_STAG_TOOLTIP"],
				[localize "STR_CSE_GROUP_FORM_WEDGE_SHORT", "cse\cse_sys_groups\data\icons\icon_wedge.paa", {closeDialog 0; [player, "WEDGE"] call CSE_fnc_setGroupFormation_GRP}, true, localize "STR_CSE_GROUP_FORM_WEDGE_TOOLTIP"],
				[localize "STR_CSE_GROUP_FORM_ECHL_SHORT", "cse\cse_sys_groups\data\icons\icon_ech_l.paa", {closeDialog 0; [player, "ECH LEFT"] call CSE_fnc_setGroupFormation_GRP}, true, localize "STR_CSE_GROUP_FORM_ECHL_TOOLTIP"],
				[localize "STR_CSE_GROUP_FORM_ECHR_SHORT", "cse\cse_sys_groups\data\icons\icon_ech_r.paa", {closeDialog 0; [player, "ECH RIGHT"] call CSE_fnc_setGroupFormation_GRP}, true, localize "STR_CSE_GROUP_FORM_ECHR_TOOLTIP"],
				[localize "STR_CSE_GROUP_FORM_VEE_SHORT", "cse\cse_sys_groups\data\icons\icon_vee.paa", {closeDialog 0; [player, "VEE"] call CSE_fnc_setGroupFormation_GRP}, true, localize "STR_CSE_GROUP_FORM_VEE_TOOLTIP"],
				[localize "STR_CSE_GROUP_FORM_LINE_SHORT", "cse\cse_sys_groups\data\icons\icon_line.paa", {closeDialog 0; [player, "LINE"] call CSE_fnc_setGroupFormation_GRP}, true, localize "STR_CSE_GROUP_FORM_LINE_TOOLTIP"],
				[localize "STR_CSE_GROUP_FORM_FILE_SHORT", "cse\cse_sys_groups\data\icons\icon_column.paa", {closeDialog 0; [player, "FILE"] call CSE_fnc_setGroupFormation_GRP}, true, localize "STR_CSE_GROUP_FORM_FILE_TOOLTIP"],
				[localize "STR_CSE_GROUP_FORM_DIAMOND_SHORT", "cse\cse_sys_groups\data\icons\icon_diamond.paa", {closeDialog 0; [player, "DIAMOND"] call CSE_fnc_setGroupFormation_GRP}, true, localize "STR_CSE_GROUP_FORM_DIAMOND_TOOLTIP"]
			],
			_this select 1, CSE_SELECTED_RADIAL_OPTION_N_GUI, true
		] call cse_fnc_openRadialSecondRing_GUI;
	};

	_entries = [
		[localize "STR_CSE_GROUP_SWITCHFORMATION_SHORT", {(([player] call cse_fnc_canInteract) && (formationLeader player == player))}, "cse\cse_sys_groups\data\icons\icon_group.paa", cse_displaygroupActions_switchFormationMenu_GRP, localize "STR_CSE_GROUP_SWITCHFORMATION_TOOLTIP"]
	];

	["ActionMenu","group_actions", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;


	_requestGroupLeader = {
		closeDialog 0;
		[player, leader (group player), "cse_sys_Groups_requestLeader", "STR_CSE_GROUP_REQUESTLEADER_MESSAGE", "if !(_this select 2) exitwith {};
			[player] call cse_fnc_setUnitGroupLeader_GRP;
		"] call cse_fnc_sendRequest_f;
	};

	_entries = [
		[localize "STR_CSE_GROUP_REQUESTLEADER_SHORT", {(([player] call cse_fnc_canInteract) && (leader (group player) != player))}, "cse\cse_sys_groups\data\icons\icon_group.paa", _requestGroupLeader, localize "STR_CSE_GROUP_REQUESTLEADER_TOOLTIP"]
	];

	["ActionMenu","group_actions", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;
};

if (CSE_SYS_GROUPS_ALLOW_SHOULDER_TAPS_GRP) then {

	_entries = [
		[localize "STR_CSE_SHOULDER_TAP_TITLE", {(([player, _this select 1] call cse_fnc_canTapShoulder_GRP) && (isPlayer (_this select 1)))}, CSE_ICON_PATH + "icon_interact.paa", {closeDialog 0; [player, _this select 1] call cse_fnc_tapShoulder_GRP;}, localize "STR_CSE_SHOULDER_TAP_TITLE"]
	];

	["ActionMenu","interaction", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;
};