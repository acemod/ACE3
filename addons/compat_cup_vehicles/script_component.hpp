#define COMPONENT compat_cup_vehicles
#define COMPONENT_BEAUTIFIED CUP Vehicles Compatibility

#include "\z\ace\addons\main\script_mod.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

// Fries Macro
#define EQUIP_FRIES_ATTRIBUTE \
    class Attributes { \
        class ace_fastroping_equipFRIES { \
            property = "ace_fastroping_equipFRIES"; \
            control = "Checkbox"; \
            displayName = ECSTRING(fastroping,Eden_equipFRIES); \
            tooltip = ECSTRING(fastroping,Eden_equipFRIES_Tooltip); \
            expression = "[_this] call ace_fastroping_fnc_equipFRIES"; \
            typeName = "BOOL"; \
            condition = "objectVehicle"; \
            defaultValue = 0; \
        }; \
    }
