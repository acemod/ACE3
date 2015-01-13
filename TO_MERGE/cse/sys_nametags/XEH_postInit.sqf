/**
 * XEH_postInit.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

if (!hasInterface) exitwith {}; // No need for this module on HC or dedicated server.

#include "script_component.hpp"

// Settings
if (isNil QUOTE(ACE_NameTagsModule)) then {
	GVAR(INDIRECT_TAGS_DISTANCE) = 7.5;
	GVAR(DIRECT_TAG_DISTANCE) = 20;
	GVAR(ENABLE_SOUNDWAVES) = false;
	GVAR(ALLOW_OWN_SIDE_ONLY) = true;
	GVAR(ENABLE_MODULE) = true;
};

// In case the module has been placed and the enable setting has been put to false
if (!GVAR(ENABLE_MODULE)) exitwith {};

// Client side options
// TODO Implement a framework for adjusting client side settings.
GVAR(DRAW_TAG_ICONS) = true;
GVAR(ENABLE_INDIRECT) = false;
GVAR(TAG_DISPLAY_COLOR) = [1,1,1,1];
GVAR(SHOW_SOUNDWAVES) = false;
GVAR(DISPLAY_RANK) = false;

// If the distance values are set incorrectly, ensure we handle this
if (GVAR(DIRECT_TAG_DISTANCE) < GVAR(INDIRECT_TAGS_DISTANCE)) then {
	GVAR(DIRECT_TAG_DISTANCE) = GVAR(INDIRECT_TAGS_DISTANCE);
};

// If both are below 1m, exit because they will not show up.
if (GVAR(DIRECT_TAG_DISTANCE) < 1) exitwith {};

// Draw the icons for each nametag
// TODO Look into replacement with cutRsc instead of icon3d
addMissionEventHandler ["Draw3D", FUNC(drawNameTags)];

if (GVAR(ENABLE_SOUNDWAVES)) then {

	GVAR(SOUNDWAVE_ICONS) = [QUOTE(PATHTOF(data\soundwaves\soundwave1.paa)),QUOTE(PATHTOF(data\soundwaves\soundwave2.paa)), QUOTE(PATHTOF(data\soundwaves\soundwave3.paa)), QUOTE(PATHTOF(data\soundwaves\soundwave4.paa)), QUOTE(PATHTOF(data\soundwaves\soundwave5.paa)), QUOTE(PATHTOF(data\soundwaves\soundwave6.paa)), QUOTE(PATHTOF(data\soundwaves\soundwave7.paa)), QUOTE(PATHTOF(data\soundwaves\soundwave8.paa)), QUOTE(PATHTOF(data\soundwaves\soundwave9.paa)), QUOTE(PATHTOF(data\soundwaves\soundwave_silent.paa))];

	// TODO Implement function for checking if an addon is loaded
	//if (["task_force_radio"] call ace_fnc_isModLoaded_F) then {
		if (isnil "TFAR_fnc_isSpeaking") then {
			TFAR_fnc_isSpeaking = { if (!isnil "TF_tangent_lr_pressed") then {(TF_tangent_lr_pressed || TF_tangent_sw_pressed || TF_tangent_dd_pressed)} else { false }; };
		};
	//};

	// TODO Move to unscheduled environment with PFH
	[] spawn {
		waituntil{
			waituntil {alive player};
			/*ACE_player*/ player call FUNC(handleSpeaking);
			!GVAR(ENABLE_SOUNDWAVES); // exit when the soundwaves have been disabled
		};
	};
};