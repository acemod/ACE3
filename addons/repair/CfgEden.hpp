#define GET_NUMBER(config,default) (if (isNumber (config)) then {getNumber (config)} else {default})

#define DEFAULT_ISENGINEER ([ARR_2(0,1)] select (_this getUnitTrait 'engineer'))
#define DEFAULT_ISREPAIRVEHICLE GET_NUMBER(configFile >> 'CfgVehicles' >> typeOf _this >> QQGVAR(canRepair),0)

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
            attributeLoad = "(_this controlsGroupCtrl 100) lbSetCurSel (((_value + 1) min 3) max 0);";
            attributeSave = "(lbCurSel (_this controlsGroupCtrl 100)) - 1";
            class Controls: Controls {
                class Title: Title{};
                class Value: ctrlToolbox {
                    idc = 100;
                    style = "0x02";
                    x = "48 * (pixelW * pixelGrid * 0.50)";
                    w = "82 * (pixelW * pixelGrid * 0.50)";
                    h = "5 * (pixelH * pixelGrid * 0.50)";
                    rows = 1;
                    columns = 4;
                    strings[] = {"$STR_3DEN_Attributes_Lock_Default_text", CSTRING(AssignEngineerRole_role_none), CSTRING(AssignEngineerRole_role_engineer), CSTRING(AssignEngineerRole_role_advanced)};
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
                        expression = QUOTE(if !(_value == DEFAULT_ISENGINEER || {_value == -1}) then {_this setVariable [ARR_3('%s',_value,true)]});
                        typeName = "NUMBER";
                        condition = "objectBrain";
                        defaultValue = QUOTE(DEFAULT_ISENGINEER);
                        control = QGVAR(isEngineerControl);
                    };
                    class ace_isRepairVehicle {
                        property = QUOTE(ace_isRepairVehicle);
                        value = 0;
                        control = "CheckboxNumber";
                        displayName = CSTRING(AssignRepairVehicle_role_DisplayName);
                        tooltip = CSTRING(AssignRepairVehicle_role_Description);
                        expression = QUOTE(if (_value != DEFAULT_ISREPAIRVEHICLE) then {_this setVariable [ARR_3('%s',_value,true)]});
                        typeName = "NUMBER";
                        condition = "objectVehicle";
                        defaultValue = QUOTE(DEFAULT_ISREPAIRVEHICLE);
                    };
                    class ace_isRepairFacility: ace_isRepairVehicle {
                        property = QUOTE(ace_isRepairFacility);
                        displayName = CSTRING(AssignRepairFacility_role_DisplayName);
                        tooltip = CSTRING(AssignRepairFacility_role_Description);
                        condition = "(1 - objectBrain) * (1 - objectVehicle)";
                    };
                    class GVAR(editorLoadedTracks) {
                        displayName = CSTRING(editorLoadedTracks);
                        tooltip = CSTRING(editorLoadedTracks_tooltip);
                        property = QGVAR(editorLoadedTracks);
                        control = "Edit";
                        expression = "_this setVariable ['%s',_value];";
                        defaultValue = "[0,1] select (_this isKindOf 'Tank')"; // must match pre init script
                        validate = "number";
                        condition = "objectHasInventoryCargo";
                        typeName = "NUMBER";
                    };
                    class GVAR(editorLoadedWheels): GVAR(editorLoadedTracks) {
                        displayName = CSTRING(editorLoadedWheels);
                        tooltip = CSTRING(editorLoadedWheels_tooltip);
                        property = QGVAR(editorLoadedWheels);
                        defaultValue = "[0,1] select (_this isKindOf 'Car')"; // must match pre init script
                    };
                };
            };
        };
    };
};
