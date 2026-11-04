class ctrlToolbox;
class ctrlStatic;
class ctrlListNBox;
class ctrlTree;
class ctrlXSliderH;


class Cfg3DEN {
    class Attributes {
        class Default;
        class TitleWide: Default {
            class Controls {
                class Title;
            };
        };
        class GVAR(vehAmmoAttribute): TitleWide {
            attributeLoad = QUOTE([ARR_2(_this,_value)] call FUNC(attributeLoad));
            attributeSave = QUOTE([_this] call FUNC(attributeSave));

            h = "(15 * 5 + 1) * (pixelH * pixelGrid * 0.5)";
            class Controls: Controls {
                class Type: ctrlToolbox {
                    idc = 100;
                    x = "5 * (pixelW * pixelGrid * 0.5)";
                    y = "0 * 	5 * (pixelH * pixelGrid * 0.5)";
                    w = "(	48 + 	82 - 	5) * (pixelW * pixelGrid * 0.5)";
                    h = "1 * 	5 * (pixelH * pixelGrid * 0.5)";
                    rows = 1;
                    columns = 2;
                    strings[] = {"Default","Custom"};
                };
                class ListBackground: ctrlStatic {
                    x = "5 * (pixelW * pixelGrid * 0.5)";
                    y = "1 * 	5 * (pixelH * pixelGrid * 0.5)";
                    w = "(	48 + 	82 - 	5) * (pixelW * pixelGrid * 0.5)";
                    h = "13 * 	5 * (pixelH * pixelGrid * 0.5)";
                    colorBackground[] = {1,1,1,0.1};
                };
                class List: ctrlTree {
                    idc = 101;
                    x = "5 * (pixelW * pixelGrid * 0.5)";
                    y = "1 * 	5 * (pixelH * pixelGrid * 0.5)";
                    w = "(	48 + 	82 - 	5) * (pixelW * pixelGrid * 0.5)";
                    h = "13 * 	5 * (pixelH * pixelGrid * 0.5)";
                };
                class ammoSlider: ctrlXSliderH {
                    idc = 102;
                    x = "5 * (pixelW * pixelGrid * 0.5)";
                    y = "14 * 	5 * (pixelH * pixelGrid * 0.5)";
                    w = "(	48 + 	82 - 	5) * (pixelW * pixelGrid * 0.5)";
                    h = "1 * 	5 * (pixelH * pixelGrid * 0.5)";
                };
            };
        };
    };

    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class GVAR(vehicleCustomizationSet) {
                        displayName = "Copy Custom Garage Apperence";
                        tooltip = "Apply this vehicle's camo customiation to ALL other vehicles spawned with the SAME classname";
                        property = QGVAR(vehicleCustomizationSet);
                        control = "Checkbox";
                        expression = QUOTE(if (_value) then { call FUNC(vehicleCustomizationSet) });
                        typeName = "BOOL";
                        condition = "objectVehicle";
                        defaultValue = "(false)";
                    };
                    class GVAR(rearmCustom) {
                        displayName = "Set as Rearm-Scripted Loadouts";
                        tooltip = "ACE-Rearm will try to rearm the custom loadout instead of the config default";
                        property = QGVAR(rearmCustom);
                        control = "Checkbox";
                        expression = QUOTE(if (_value) then { _this setVariable [ARR_3('ace_rearm_scriptedLoadout',true,true)] });
                        typeName = "BOOL";
                        condition = "objectVehicle";
                        defaultValue = "(false)";
                    };
                    class ADDON {
                        displayName = "Set Vehicle Ammo";
                        tooltip = "";
                        property = QGVAR(vehAmmoAttribute);
                        control = QGVAR(vehAmmoAttribute);
                        defaultValue = "''";
                        typeName = "STRING";
                        expression = QUOTE([ARR_2(_this,_value)] call FUNC(initVehicle));
                        condition = "objectVehicle";
                    };
                };
            };
        };
    };
};
