#define EQUIP_FRIES_ATTRIBUTE class Attributes { \
    class EGVAR(fastroping,equipFRIES) { \
        property = QEGVAR(fastroping,equipFRIES); \
        control = "Checkbox"; \
        displayName = ECSTRING(fastroping,Eden_equipFRIES); \
        tooltip = ECSTRING(fastroping,Eden_equipFRIES_Tooltip); \
        expression = QUOTE([_this] call EFUNC(fastroping,equipFRIES)); \
        typeName = "BOOL"; \
        condition = "objectVehicle"; \
        defaultValue = false; \
    }; \
}

class CfgVehicles {
    #include "CfgVehicles\boxes.hpp"
    #include "CfgVehicles\explosives.hpp"
    #include "CfgVehicles\helicopters.hpp"
    #include "CfgVehicles\planes.hpp"
    #include "CfgVehicles\tracked.hpp"
    #include "CfgVehicles\turrets.hpp"
    #include "CfgVehicles\units.hpp"
    #include "CfgVehicles\wheeled.hpp"
};
