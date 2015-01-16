/**
 * fn_displayArrestOptions_aim.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

	_subMenus = [
		["Arrest",{!(CSE_interactionTarget getvariable ["cse_unitArrested",false])},
		{
			[(_this select 0),(_this select 1)] call cse_fnc_arrest_AIM;

		}],

		["Release",{(CSE_interactionTarget getvariable ["cse_unitArrested",false])},{
			[(_this select 0),(_this select 1)] call cse_fnc_release_AIM;
		}],

		["Move",{(CSE_interactionTarget getvariable ["cse_unitArrested",false])},{
			[(_this select 0),(_this select 1)] call cse_fnc_move_AIM;
		}],

		["Place down",{(CSE_interactionTarget getvariable ["cse_unitArrested",false])},{
			[(_this select 0),(_this select 1)] call cse_fnc_placedown_AIM;
		}]
	];
	["Arresting",_this select 2,_subMenus] call cse_fnc_gui_displaySubMenuButtons;

