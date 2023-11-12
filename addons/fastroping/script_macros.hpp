#define EQUIP_FRIES_ATTRIBUTE class EGVAR(fastroping,equipFRIES) { \
    property = QEGVAR(fastroping,equipFRIES); \
    control = "Checkbox"; \
    displayName = ECSTRING(fastroping,Eden_equipFRIES); \
    tooltip = ECSTRING(fastroping,Eden_equipFRIES_Tooltip); \
    expression = QUOTE(if (_value) then {[_this] call EFUNC(fastroping,equipFRIES)}); \
    typeName = "BOOL"; \
    condition = "objectVehicle"; \
    defaultValue = "false"; \
}
