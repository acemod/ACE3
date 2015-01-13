	cse_get_basic_bandage_menus_CMS = {
		_subMenus = [];
		if (([player,'cse_bandage_basic'] call cse_fnc_hasMagazine)) then {
			_subMenus set [ count _subMenus,
				["Bandage (Basic)",{([player,'cse_bandage_basic'] call cse_fnc_hasMagazine)},
				{
					[(_this select 1),player,"cse_bandage_basic"] spawn cse_fnc_basicBandage_CMS;
				}]
			];
		};
		if (([player,'cse_quikclot'] call cse_fnc_hasMagazine)) then {
			_subMenus set [ count _subMenus,
				["QuikClot",{([player,'cse_quikclot'] call cse_fnc_hasMagazine)},
				{
					[(_this select 1),player,"cse_quikclot"] spawn cse_fnc_basicBandage_CMS;
				}]
			];
		};
		if (([player,'cse_bandageElastic'] call cse_fnc_hasMagazine)) then {
			_subMenus set [ count _subMenus,
				["Bandage (Elastic)",{([player,'cse_bandageElastic'] call cse_fnc_hasMagazine)},
				{
					[(_this select 1),player,"cse_bandageElastic"] spawn cse_fnc_basicBandage_CMS;
				}]
			];
		};
		if (([player,'cse_packing_bandage'] call cse_fnc_hasMagazine)) then {
			_subMenus set [ count _subMenus,
				["Packing Bandage",{([player,'cse_packing_bandage'] call cse_fnc_hasMagazine)},
				{
					[(_this select 1),player,"cse_packing_bandage"] spawn cse_fnc_basicBandage_CMS;
				}]
			];
		};
		if (([player,'cse_tourniquet'] call cse_fnc_hasMagazine)) then {

		};

		_subMenus
	};
	cse_display_basic_bandage_menus_CMS = {
		["Bandage",_this select 2,call cse_get_basic_bandage_menus_CMS] call cse_fnc_gui_displaySubMenuButtons;
	};
	cse_display_basic_medication_menus_CMS = {
		_subMenus = [];
		if (([player,'cse_morphine'] call cse_fnc_hasMagazine)) then {
			_subMenus set [ count _subMenus,
				["Morphine",{([player,'cse_morphine'] call cse_fnc_hasMagazine)},
				{
					[(_this select 1),player,"","cse_morphine"] spawn cse_fnc_medication_CMS;
				}]
			];
		};
		if (([player,'cse_atropine'] call cse_fnc_hasMagazine)) then {
			_subMenus set [ count _subMenus,
				["Atropine",{([player,'cse_atropine'] call cse_fnc_hasMagazine)},
				{
					[(_this select 1),player,"","cse_atropine"] spawn cse_fnc_medication_CMS;
				}]
			];
		};
		if (([player,'cse_epinephrine'] call cse_fnc_hasMagazine)) then {
			_subMenus set [ count _subMenus,
				["Epinephrine",{([player,'cse_epinephrine'] call cse_fnc_hasMagazine)},
				{
					[(_this select 1),player,"","cse_epinephrine"] spawn cse_fnc_medication_CMS;
				}]
			];
		};
		["Medication",_this select 2,_subMenus] call cse_fnc_gui_displaySubMenuButtons;
	};




	/*["InteractionMenu","Treatment > ",{((cursortarget iskindof "Man") && !(surfaceIsWater position player))},{
		_subMenus = [];
		if ((_this select 1) call cse_fnc_getBloodLoss_CMS > 0) then {
			hintSilent format["%1 is bleeding", [_this select 1] call cse_fnc_getName];
		};
		_subMenus set [ count _subMenus,
			["Bandage >",{(isNull([player] call cse_fnc_getCarriedObj) && (count (call cse_get_basic_bandage_menus_CMS)) > 0)},
			{
				_this call cse_display_basic_bandage_menus_CMS;
			}]
		];
		_subMenus set [ count _subMenus,
			["Medication >",{(isNull([player] call cse_fnc_getCarriedObj))},
			{
				_this call cse_display_basic_medication_menus_CMS;
			}]
		];
		["Treatment",_this select 2,_subMenus] call cse_fnc_gui_displaySubMenuButtons;
	},1] call cse_fnc_gui_addMenuEntry;


	["SelfInteraction","Treatment > ",{!(surfaceIsWater position player)},{
		_subMenus = [];

		if ((_this select 1) call cse_fnc_getBloodLoss_CMS > 0) then {
			hintSilent format["%1 is bleeding", [_this select 1] call cse_fnc_getName];
		};

		_subMenus set [ count _subMenus,
			["Bandage >",{(isNull([player] call cse_fnc_getCarriedObj) && (count (call cse_get_basic_bandage_menus_CMS)) > 0)},
			{
				_this call cse_display_basic_bandage_menus_CMS;
			}]
		];
		_subMenus set [ count _subMenus,
			["Medication >",{(isNull([player] call cse_fnc_getCarriedObj))},
			{
				_this call cse_display_basic_medication_menus_CMS;
			}]
		];
		["Treatment",_this select 2,_subMenus] call cse_fnc_gui_displaySubMenuButtons;
	},1] call cse_fnc_gui_addMenuEntry;

	*/

	["InteractionMenu","Unload Casualties",{((_this call cse_fnc_interactWithVehicle_Crew_Condition) && (count ((_this select 1) getvariable ["cse_loaded_casualties_CMS",[]]) > 0))},
{
	closeDialog 0;
	_loaded = ((_this select 1) getvariable ["cse_loaded_casualties_CMS",[]]);
	{
		[player,_x,false] call cse_fnc_unload_CMS;
	}foreach _loaded
},1] call cse_fnc_gui_addMenuEntry;


/*
["InteractionMenu","Drag",{(isNull ([player] call cse_fnc_getCarriedObj))},
{
	closeDialog 0;
	[_this select 1,_this select 0] call CSE_fnc_drag_CMS;
},1] call cse_fnc_gui_addMenuEntry;


["InteractionMenu","Carry",{(isNull ([player] call cse_fnc_getCarriedObj))},
{
	closeDialog 0;
	[_this select 1,_this select 0] call cse_fnc_carry_CMS;
},1] call cse_fnc_gui_addMenuEntry;


["InteractionMenu","Drop",{!(isNull ([player] call cse_fnc_getCarriedObj))},
{
	closeDialog 0;
	[_this select 1,_this select 0] call cse_fnc_drop_CMS;
},1] call cse_fnc_gui_addMenuEntry;*/