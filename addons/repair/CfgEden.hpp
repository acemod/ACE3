class ctrlToolbox;

class Cfg3DEN {
    class Attributes {
        class Default;
        class Title: Default {
            class Controls {
                class Title;
            };
        };
        class GVAR(isEngineerControl): Title {
            attributeLoad = "(_this controlsGroupCtrl 100) lbsetcursel (((_value + 1) min 3) max 0);";
            attributeSave = "(missionnamespace getvariable ['ace_isEng_temp',0]) - 1;";
            class Controls: Controls {
                class Title: Title{};
                class Value: ctrlToolbox {
                    idc = 100;
                    style = "0x02";
                    x = "48 * (pixelW * 1.25 * 4)";
                    w = "82 * (pixelW * 1.25 * 4)";
                    h = "5 * (pixelH * 1.25 * 4)";
                    rows = 1;
                    columns = 4;
                    strings[] = {"$STR_3DEN_Attributes_Lock_Default_text", CSTRING(AssignEngineerRole_role_none), CSTRING(AssignEngineerRole_role_engineer), CSTRING(AssignEngineerRole_role_specialist)};
                    onToolboxSelChanged = "missionnamespace setvariable ['ace_isEng_temp',_this select 1];";
                };
            };
        };
    };

    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class ace_isEngineer {
                        property = QUOTE(ace_isEngineer);
                        displayName = CSTRING(AssignEngineerRole_role_DisplayName);
                        tooltip = CSTRING(AssignEngineerRole_role_Description);
                        expression = "if (_value != -1) then {_this setVariable ['%s',_value, true];}";
                        typeName = "NUMBER";
                        condition = "objectBrain";
                        defaultValue = "-1";
                        control = QGVAR(isEngineerControl);
                    };
                    class ace_isRepairVehicle {
                        property = QUOTE(ace_isRepairVehicle);
                        value = 0;
                        control = "CheckboxNumber";
                        displayName = CSTRING(AssignRepairVehicle_role_DisplayName);
                        tooltip = CSTRING(AssignRepairVehicle_role_Description);
                        expression = "_this setVariable ['%s',_value, true];";
                        typeName = "NUMBER";
                        condition = "objectVehicle";
                        defaultValue = 0;
                    };
                    class ace_isRepairFacility {
                        property = QUOTE(ace_isRepairFacility);
                        value = 0;
                        control = "CheckboxNumber";
                        displayName = CSTRING(AssignRepairFacility_role_DisplayName);
                        tooltip = CSTRING(AssignRepairFacility_role_Description);
                        expression = "_this setVariable ['%s',_value, true];";
                        typeName = "NUMBER";
                        condition = "(1 - objectBrain) * (1 - objectVehicle)";
                        defaultValue = 0;
                    };
                };
            };
        };
    };
};
