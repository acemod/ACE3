#define CREATE_CSW_PROXY(weapon) class ##weapon; class GVAR(weapon): ##weapon { magazineReloadTime = 0.5; }

// Need to be careful about breaking Attributes inheritance, doesn't seem to be any standard
#define ENABLE_CSW_ATTRIBUTE class Attributes { \
        class EGVAR(CSW,assemblyMode) { \
            property = QEGVAR(CSW,assemblyMode); \
            control = QEGVAR(CSW,assemblyModeControl); \
            displayName = ECSTRING(CSW,eden_enableCSW); \
            tooltip = ECSTRING(CSW,eden_enableCSW_tooltip); \
            expression = QUOTE( if (_value != 3) then {_this setVariable [ARR_3('%s',_value,true)]} ); \
            typeName = "NUMBER"; \
            condition = "objectVehicle"; \
            defaultValue = 3; \
        }; \
    }
