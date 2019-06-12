
#define GRID_3DEN_W (pixelW * pixelGrid * 0.5)
#define GRID_3DEN_H (pixelH * pixelGrid * 0.5)

#define DEFAULT_IS_MEDIC (parseNumber (_this getUnitTrait 'medic'))
#define DEFAULT_IS_MEDICAL_VEHICLE (getNumber (configFile >> 'CfgVehicles' >> typeOf _this >> 'attendant') > 0)
#define DEFAULT_IS_MEDICAL_FACILITY (typeOf _this in GVAR(facilityClasses))

class ctrlToolbox;

class Cfg3DEN {
    class Attributes {
        class Default;
        class Title: Default {
            class Controls {
                class Title;
            };
        };
        class GVAR(isMedicControl): Title {
            attributeLoad = QUOTE((_this controlsGroupCtrl 100) lbSetCurSel (0 max (_value + 1) min 3));
            attributeSave = QUOTE(lbCurSel (_this controlsGroupCtrl 100) - 1);
            class Controls: Controls {
                class Title: Title {};
                class Value: ctrlToolbox {
                    idc = 100;
                    x = 48 * GRID_3DEN_W;
                    w = 82 * GRID_3DEN_W;
                    h = 5  * GRID_3DEN_H;
                    rows = 1;
                    columns = 4;
                    strings[] = {
                        "$STR_3DEN_Attributes_Lock_Default_text",
                        CSTRING(AssignMedicRoles_role_none),
                        CSTRING(AssignMedicRoles_role_medic),
                        CSTRING(AssignMedicRoles_role_doctorShort)
                    };
                };
            };
        };
    };
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class ace_isMedic {
                        displayName = CSTRING(AssignMedicRoles_role_DisplayName);
                        tooltip = CSTRING(Attributes_isMedic_Description);
                        property = QUOTE(ace_isMedic);
                        control = QGVAR(isMedicControl);
                        expression = QUOTE(if (_value != -1 && {_value != DEFAULT_IS_MEDIC}) then {_this setVariable [ARR_3(QQEGVAR(medical,medicClass),_value,true)]});
                        defaultValue = QUOTE(DEFAULT_IS_MEDIC);
                        condition = "objectBrain";
                        typeName = "NUMBER";
                    };
                    class ace_isMedicalVehicle {
                        displayName = CSTRING(AssignMedicVehicle_enabled_DisplayName);
                        tooltip = CSTRING(Attributes_isMedicalVehicle_Description);
                        property = QUOTE(ace_isMedicalVehicle);
                        control = "Checkbox";
                        expression = QUOTE(_this setVariable [ARR_3(QQEGVAR(medical,isMedicalVehicle),_value,true)]);
                        defaultValue = QUOTE(DEFAULT_IS_MEDICAL_VEHICLE);
                        condition = "objectVehicle";
                        typeName = "BOOL";
                    };
                    class ace_isMedicalFacility {
                        displayName = CSTRING(AssignMedicalFacility_enabled_DisplayName);
                        tooltip = CSTRING(AssignMedicalFacility_enabled_Description);
                        property = QUOTE(ace_isMedicalFacility);
                        control = "Checkbox";
                        expression = QUOTE(_this setVariable [ARR_3(QQEGVAR(medical,isMedicalFacility),_value,true)];);
                        defaultValue = QUOTE(DEFAULT_IS_MEDICAL_FACILITY);
                        condition = "(1 - objectBrain) * (1 - objectVehicle)";
                        typeName = "BOOL";
                    };
                };
            };
        };
    };
};
