#define GRID_3DEN_W (pixelW * pixelGrid * 0.5)
#define GRID_3DEN_H (pixelH * pixelGrid * 0.5)

class ctrlToolbox;

class Cfg3DEN {
    class Attributes {
        class Default;
        class Title: Default {
            class Controls {
                class Title;
            };
        };
        class GVAR(OverrideAIMedicalSettingsControl): Title {
            attributeLoad = QUOTE((_this controlsGroupCtrl 100) lbSetCurSel _value);
            attributeSave = QUOTE(lbCurSel (_this controlsGroupCtrl 100));
            class Controls: Controls {
                class Title: Title {};
                class Value: ctrlToolbox {
                    idc = 100;
                    x = 48 * GRID_3DEN_W;
                    w = 82 * GRID_3DEN_W;
                    h = 5  * GRID_3DEN_H;
                    rows = 1;
                    columns = 3;
                    strings[] = {
                        "$STR_3DEN_Attributes_Lock_Default_text",
                        CSTRING(OverrideAIMedicalSettings_AlwaysPlayer),
                        CSTRING(OverrideAIMedicalSettings_AlwaysAI)
                    };
                };
            };
        };
    };
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class GVAR(OverrideAIMedicalSettings) {
                        displayName = CSTRING(OverrideAIMedicalSettings_DisplayName);
                        tooltip = CSTRING(OverrideAIMedicalSettings_Description);
                        property = QUOTE(OverrideAIMedicalSettings);
                        control = QGVAR(OverrideAIMedicalSettingsControl);
                        expression = QUOTE(if (_value != 0) then {_this setVariable [ARR_3(QQEGVAR(medical,OverrideAIMedicalSettings),_value,true)]});
                        defaultValue = 0;
                        condition = "objectControllable";
                        typeName = "NUMBER";
                    };
                };
            };
        };
    };
};
