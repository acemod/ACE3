#define MACRO_LOADABLE \
    class ACE_Actions { \
	    class ACE_MainActions { \
            class GVAR(LoadItem) { \
                displayName = "$STR_ACE_Cargo_LoadItem"; \
                distance = 8; \
                condition = "_target call ace_cargo_fnc_canLoadItem"; \
                statement = QUOTE([ARR_2(_target, ACE_Cargo_targetVehicle)] call FUNC(openLoadUI)); \
                showDisabled = 0; \
                priority = 1.245; \
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa"; \
            }; \
        }; \
    };

#define MACRO_NOT_LOADABLE \
    class ACE_Actions { \
	    class ACE_MainActions { \
            class GVAR(LoadItem) { \
                condition = "false"; \
            }; \
        }; \
    };

#define MACRO_UNLOAD \
    class ACE_Actions { \
	    class ACE_MainActions { \
            class GVAR(loadItemDragged) { \
                displayName = "$STR_ACE_Cargo_LoadItem"; \
                distance = 4; \
				exceptions[] = {"isNotDragging"}; \
                condition = "(!isNull (_player getVariable ['ace_dragging_draggedObject', objNull])) and (_target call ace_cargo_fnc_canLoadItemCarried)"; \
				statement = QUOTE(ARR_2([_player getVariable QUOTE(QEGVAR(dragging,draggedObject)), _target] call FUNC(openLoadUI))); \
                showDisabled = 0; \
                priority = 1.6; \
                icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa"; \
            }; \
            class GVAR(loadItemCarried) { \
                displayName = "$STR_ACE_Cargo_LoadItem"; \
                distance = 4; \
                exceptions[] = {"isNotCarrying"}; \
				condition = "(!isNull (_player getVariable ['ace_dragging_carriedObject', objNull])) and (_target call ace_cargo_fnc_canLoadItemCarried)"; \
                statement = QUOTE(ARR_2([_player getVariable QUOTE(QEGVAR(dragging,carriedObject)), _target] call FUNC(openLoadUI))); \
                showDisabled = 0; \
                priority = 1.6; \
                icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa"; \
            }; \
            class GVAR(unloadBox) { \
                displayName = "$STR_ACE_Cargo_Unload"; \
                distance = 4; \
				exceptions[] = {}; \
                condition = QUOTE([_target] call FUNC(hasLoadedItems) && {alive _target}); \
                insertChildren = QUOTE(_this call FUNC(getChildrenUnloadActions)); \
                showDisabled = 1; \
                priority = 1.5; \
                icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa"; \
            }; \
        }; \
    };
		
	
class CfgVehicles {
    class LandVehicle;
    
    class Car: LandVehicle {
        ACE_Vehicle_Cargo = 4;
		MACRO_UNLOAD
    };

    class Tank: LandVehicle {
        ACE_Vehicle_Cargo = 4;
        MACRO_UNLOAD
    };
	
    class StaticWeapon: LandVehicle {
        ACE_Size = 2; // 1 = small, 2 = large
	    MACRO_LOADABLE
    };
    
    class Pod_Heli_Transport_04_base_F: StaticWeapon {
        MACRO_NOT_LOADABLE
    };
    
    class StaticMortar;
	class Mortar_01_base_F: StaticMortar {
        ACE_Size = 2; // 1 = small, 2 = large
		MACRO_LOADABLE
    };
    
    class ThingX;
    class ReammoBox_F: ThingX {
	    ACE_Size = 2; // 1 = small, 2 = large
        MACRO_LOADABLE
    };
    
    class Slingload_base_F: ReammoBox_F {
        MACRO_NOT_LOADABLE
    };
	
	class Truck_01_base_F;
    class B_Truck_01_transport_F: Truck_01_base_F {
        class AGM_Load {                      //@todo
            class MidLoad {
                displayName = "Middle of truck";
                loadSize = 2; // Size of object, 1 = small, 2 = large
                LoadPosition[]={0.05,-4,-0.6}; // Offset when attaching.
                memoryPoint = "exhaustEnd"; // the memory position on the vehicle to use for the attaching and offset.
            };
            UnLoadPosition[]={0,-6,-1.0}; // Position objects will be unloaded to. modelToWorld offset.
        };
    };
};