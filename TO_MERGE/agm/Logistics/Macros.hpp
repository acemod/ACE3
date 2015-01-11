
#define KEY_WHEEL_4X4 \
	AGM_Wheels[] = {"HitLFWheel", "HitRFWheel", "HitLF2Wheel", "HitRF2Wheel"}; \
	AGM_WheelsLocalized[] = {STR_AGM_Repair_HitLFWheel, STR_AGM_Repair_HitRFWheel, STR_AGM_Repair_HitLBWheel, STR_AGM_Repair_HitRBWheel};

#define KEY_WHEEL_6X6_FRONT \
	AGM_Wheels[] = {"HitLFWheel", "HitRFWheel", "HitLF2Wheel", "HitRF2Wheel", "HitLBWheel", "HitRBWheel"}; \
	AGM_WheelsLocalized[] = {STR_AGM_Repair_HitLFWheel, STR_AGM_Repair_HitRFWheel, STR_AGM_Repair_HitLF2Wheel, STR_AGM_Repair_HitRF2Wheel, STR_AGM_Repair_HitLBWheel, STR_AGM_Repair_HitRBWheel};

#define KEY_WHEEL_6X6_REAR \
	AGM_Wheels[] = {"HitLFWheel", "HitRFWheel", "HitLMWheel", "HitRMWheel", "HitLBWheel", "HitRBWheel"}; \
	AGM_WheelsLocalized[] = {STR_AGM_Repair_HitLFWheel, STR_AGM_Repair_HitRFWheel, STR_AGM_Repair_HitLMWheel, STR_AGM_Repair_HitRMWheel, STR_AGM_Repair_HitLBWheel, STR_AGM_Repair_HitRBWheel};

#define KEY_WHEEL_6X6_REAR_KAMAZ \
	AGM_Wheels[] = {"HitLFWheel", "HitRFWheel", "HitLMWheel", "HitRMWheel", "HitLF2Wheel", "HitRF2Wheel"}; \
	AGM_WheelsLocalized[] = {STR_AGM_Repair_HitLFWheel, STR_AGM_Repair_HitRFWheel, STR_AGM_Repair_HitLMWheel, STR_AGM_Repair_HitRMWheel, STR_AGM_Repair_HitLBWheel, STR_AGM_Repair_HitRBWheel};

#define KEY_WHEEL_6X6_STOMPER \
	AGM_Wheels[] = {"HitLFWheel", "HitRFWheel", "HitLF2Wheel", "HitRF2Wheel", "HitLMWheel", "HitRMWheel"}; \
	AGM_WheelsLocalized[] = {STR_AGM_Repair_HitLFWheel, STR_AGM_Repair_HitRFWheel, STR_AGM_Repair_HitLMWheel, STR_AGM_Repair_HitRMWheel, STR_AGM_Repair_HitLBWheel, STR_AGM_Repair_HitRBWheel};

#define KEY_WHEEL_8X8 \
	AGM_Wheels[] = {"HitLFWheel", "HitRFWheel", "HitLF2Wheel", "HitRF2Wheel", "HitLMWheel", "HitRMWheel", "HitLBWheel", "HitRBWheel"}; \
	AGM_WheelsLocalized[] = {STR_AGM_Repair_HitLFWheel, STR_AGM_Repair_HitRFWheel, STR_AGM_Repair_HitLF2Wheel, STR_AGM_Repair_HitRF2Wheel, STR_AGM_Repair_HitLMWheel, STR_AGM_Repair_HitRMWheel, STR_AGM_Repair_HitLBWheel, STR_AGM_Repair_HitRBWheel};


#define MACRO_LOADABLE \
	class AGM_loadItem { \
		displayName = "$STR_AGM_Logistics_LoadItem"; \
		distance = 4; \
		condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_canLoadItem"; \
		statement = "[AGM_Interaction_Target, AGM_Logistics_targetVehicle] call AGM_Logistics_fnc_openLoadUI"; \
		showDisabled = 1; \
		priority = 1.6; \
		icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa"; \
	};

#define MACRO_NOT_LOADABLE \
	class AGM_loadItem { \
		condition = "false"; \
	};

#define MACRO_UNLOAD \
	class AGM_loadItemCarried { \
		displayName = "$STR_AGM_Logistics_LoadItem"; \
		distance = 4; \
		condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_canLoadItemCarried"; \
		statement = "[player getVariable 'AGM_carriedItem', AGM_Interaction_Target] call AGM_Logistics_fnc_openLoadUI"; \
		exceptions[] = {"AGM_Drag_isNotDragging"}; \
		showDisabled = 0; \
		priority = 1.6; \
		icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa"; \
	}; \
	class AGM_unloadBox { \
		displayName = "$STR_AGM_Logistics_Unload"; \
		distance = 4; \
		condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_hasLoadedItems && {alive AGM_Interaction_Target}"; \
		statement = "[AGM_Interaction_Target] call AGM_Logistics_fnc_openUnloadUI"; \
		showDisabled = 1; \
		priority = 1.5; \
		icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa"; \
	};

#define MACRO_RELOAD_MAGS \
	class AGM_reloadMagazines { \
		displayName = "$STR_AGM_Logistics_ReloadMagazines"; \
		distance = 4; \
		condition = "count ([player, AGM_Interaction_Target] call AGM_Logistics_fnc_getLoadableMagazines) > 0"; \
		statement = "[AGM_Interaction_Target] call AGM_Logistics_fnc_openMagazineMenu"; \
		showDisabled = 1; \
		priority = 1.45; \
		icon = "\A3\ui_f\data\igui\cfg\actions\reammo_ca.paa"; \
	};

#define MACRO_DRAGABLE \
	class AGM_DragItem { \
		displayName = "$STR_AGM_Drag_StartDrag"; \
		distance = 4; \
		condition = "!(player call AGM_Drag_fnc_isDraggingObject)"; \
		conditionShow = "[AGM_Interaction_Target, player] call AGM_Drag_fnc_isDraggable"; \
		statement = "[AGM_Interaction_Target, player] call AGM_Drag_fnc_dragObject"; \
		showDisabled = 0; \
		priority = 3; \
		icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa"; \
		hotkey = "R"; \
	};
//		tooltip = "Drag this object."; \

#define MACRO_NOT_DRAGABLE \
	class AGM_DragItem { \
		condition = "false"; \
	};
#define MACRO_GETIN_STATIC \
	class AGM_GetIn { \
		displayName = "$STR_AGM_StaticWeapons_GetIn"; \
		distance = 4; \
		condition = "[AGM_Interaction_Target] call AGM_StaticWeapons_fnc_canGetIn"; \
		statement = "[AGM_Interaction_Target] call AGM_StaticWeapons_fnc_getIn"; \
		showDisabled = 0; \
		priority = 1; \
	}; \
	class AGM_RotateClockwise { \
		displayName = "$STR_AGM_StaticWeapons_RotateClockwise"; \
		distance = 4; \
		condition = "[AGM_Interaction_Target, true] call AGM_StaticWeapons_fnc_canRotate"; \
		statement = "[AGM_Interaction_Target, true] call AGM_StaticWeapons_fnc_rotate"; \
		showDisabled = 1; \
		priority = 2.1; \
		icon = "AGM_Logistics\ui\rotate_cw_ca.paa"; \
	}; \
	class AGM_RotateCounterclockwise { \
		displayName = "$STR_AGM_StaticWeapons_RotateCounterclockwise"; \
		distance = 4; \
		condition = "[AGM_Interaction_Target, false] call AGM_StaticWeapons_fnc_canRotate"; \
		statement = "[AGM_Interaction_Target, false] call AGM_StaticWeapons_fnc_rotate"; \
		showDisabled = 1; \
		priority = 2; \
		icon = "AGM_Logistics\ui\rotate_ccw_ca.paa"; \
	};

#define MACRO_NOT_GETINABLE_STATIC \
	class AGM_GetIn { \
		condition = "false"; \
	}; \
	class AGM_RotateClockwise { \
		condition = "false"; \
	}; \
	class AGM_RotateCounterclockwise { \
		condition = "false"; \
	}; \

#define MACRO_CUTWIRE \
	class AGM_Wirecutter_cut { \
		displayName = "$STR_AGM_CutFence"; \
		distance = 4; \
		condition = "'ToolKit' in items player && {alive AGM_Interaction_Target}"; \
		statement = "[5, AGM_Interaction_Target] call AGM_Wirecutter_fnc_cutDownFence"; \
		showDisabled = 1; \
		priority = 2.1; \
		icon = "AGM_Logistics\ui\wirecutter_ca.paa"; \
	};

#define MACRO_CUTWIRE_LONG \
	class AGM_Wirecutter_cut { \
		displayName = "$STR_AGM_CutFence"; \
		distance = 4; \
		condition = "'ToolKit' in items player && {alive AGM_Interaction_Target}"; \
		statement = "[5, AGM_Interaction_Target] call AGM_Wirecutter_fnc_cutDownFence"; \
		showDisabled = 1; \
		priority = 2.1; \
		icon = "AGM_Logistics\ui\wirecutter_ca.paa"; \
	};

#define MACRO_CARRYJERRYCAN \
	class AGM_CarryJerrycan { \
		displayName = "$STR_AGM_Drag_StartCarry"; \
		distance = 4; \
		condition = "[player, AGM_Interaction_Target] call AGM_Drag_fnc_isCarryable"; \
		statement = "[player, AGM_Interaction_Target] call AGM_Drag_fnc_carryJerrycan"; \
		showDisabled = 1; \
		priority = 3; \
		icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa"; \
	}; \
	class AGM_DropJerrycan { \
		displayName = "$STR_AGM_Drag_EndCarry"; \
		distance = 4; \
		condition = "[player, AGM_Interaction_Target] call AGM_Drag_fnc_isCarryingObject"; \
		statement = "[player, AGM_Interaction_Target] call AGM_Drag_fnc_dropJerrycan"; \
		exceptions[] = {"AGM_Drag_isNotDragging"}; \
		showDisabled = 0; \
		priority = 3; \
		icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa"; \
	}; \
	class AGM_CheckFuelJerrycan { \
		displayName = "$STR_AGM_Resupply_CheckFuelJerryCan"; \
		distance = 4; \
		condition = "alive AGM_Interaction_Target"; \
		statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmountJerrycan"; \
		exceptions[] = {"AGM_Drag_isNotDragging"}; \
		showDisabled = 0; \
		priority = 3; \
		icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa"; \
	};

#define MACRO_CHECKFUEL \
	class AGM_CheckFuelSelf { \
		displayName = "$STR_AGM_Resupply_CheckFuelJerryCan"; \
		condition = "(player getVariable ['AGM_carriedItem', objNull]) isKindOf 'AGM_JerryCan'"; \
		statement = "[player] call AGM_Resupply_fnc_getFuelAmountJerrycan"; \
		exceptions[] = {"AGM_Drag_isNotDragging"}; \
		showDisabled = 0; \
		priority = 3; \
		icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa"; \
	};

#define MACRO_REFUEL \
	class AGM_RefuelCargo { \
		displayName = "$STR_AGM_Resupply_RefuelVehicleCargo"; \
		distance = 4; \
		condition = "[AGM_Interaction_Target] call AGM_Resupply_fnc_canRefuelCargo"; \
		statement = "[AGM_Interaction_Target] call AGM_Resupply_fnc_refuelVehicleCargo"; \
		showDisabled = 0; \
		priority = 1.225; \
		icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa"; \
	}; \
	class AGM_Refuel { \
		displayName = "$STR_AGM_Resupply_RefuelVehicle"; \
		distance = 4; \
		condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canRefuel"; \
		statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_refuelVehicle"; \
		exceptions[] = {"AGM_Drag_isNotDragging"}; \
		showDisabled = 0; \
		priority = 1.245; \
		icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa"; \
	}; \
	class AGM_DrainFuel { \
		displayName = "$STR_AGM_Resupply_DrainFuel"; \
		distance = 4; \
		condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canDrainFuel"; \
		statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_drainFuel"; \
		exceptions[] = {"AGM_Drag_isNotDragging"}; \
		showDisabled = 0; \
		priority = 1.235; \
		icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa"; \
	}; \
	class AGM_CheckFuel { \
		displayName = "$STR_AGM_Resupply_CheckFuel"; \
		distance = 4; \
		condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0}"; \
		statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmount"; \
		exceptions[] = {"AGM_Drag_isNotDragging"}; \
		showDisabled = 0; \
		priority = 1.295; \
		icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa"; \
	};

#define MACRO_REFUELCARGO \
	class AGM_DrainFuelCargo { \
		displayName = "$STR_AGM_Resupply_DrainFuelCargo"; \
		distance = 4; \
		condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canDrainFuelCargo"; \
		statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_drainFuelCargo"; \
		exceptions[] = {"AGM_Drag_isNotDragging"}; \
		showDisabled = 0; \
		priority = 1.22; \
		icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa"; \
	}; \
	class AGM_CheckFuelCargo { \
		displayName = "$STR_AGM_Resupply_CheckFuelCargo"; \
		distance = 4; \
		condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0}"; \
		statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmountCargo"; \
		exceptions[] = {"AGM_Drag_isNotDragging"}; \
		showDisabled = 0; \
		priority = 1.24; \
		icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa"; \
	};

#define MACRO_REFUEL_UAV \
	class AGM_RefuelUAV { \
		displayName = "$STR_AGM_UAVs_Recharge"; \
		distance = 4; \
		condition = "'AGM_UAVBattery' in items player && {fuel cursorTarget < 1}"; \
		statement = "[cursorTarget, player] call AGM_UAVs_fnc_refuel"; \
		showDisabled = 0; \
		priority = 1.245; \
		icon = "AGM_Logistics\ui\AGM_battery.paa"; \
	};

#define MACRO_PARADROP \
	class AGM_DropCargo { \
		displayName = "$STR_AGM_Paradrop_Unload"; \
		distance = 4; \
		condition = "getNumber(configFile >> 'CfgVehicles' >> typeOf vehicle player >> 'AGM_Paradrop') == 1 && {getPosATL vehicle player select 2 > 60} && {count (vehicle player getVariable ['AGM_Logistics_loadedItems', []]) > 0}"; \
		conditionShow = "getNumber(configFile >> 'CfgVehicles' >> typeOf vehicle player >> 'AGM_Paradrop') == 1"; \
		statement = "[vehicle player] call AGM_Paradrop_fnc_paradrop"; \
		priority = 1; \
		enableInside = 1; \
	};
