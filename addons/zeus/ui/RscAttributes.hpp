class RscControlsGroup;
class RscControlsGroupNoScrollbars;
class RscText;
class RscListbox;
class RscCombo;
class RscEdit;
class RscXSliderH;
class RscCheckBox;
class RscActivePicture;
class RscMapControl;
class RscPicture;
class ctrlToolbox;

class RscDisplayAttributes {
    class Controls {
        class Background;
        class Title;
        class Content: RscControlsGroup {
            class controls;
        };
        class ButtonOK;
        class ButtonCancel;
    };
};

class GVAR(AttributeRadius): RscControlsGroupNoScrollbars {
    onSetFocus = QUOTE(_this call FUNC(ui_attributeRadius));
    idc = 26466;
    x = 0;
    y = 0;
    w = W_PART(26);
    h = H_PART(1.2);
    class controls {
        class Title1: RscText {
            idc = -1;
            text = CSTRING(AttributeRadius);
            toolTip = CSTRING(AttributeRadius_desc);
            x = 0;
            y = H_PART(0.1);
            w = W_PART(10);
            h = H_PART(1);
            colorBackground[] = {0,0,0,0.5};
        };
        class Radius: RscEdit {
            idc = 26467;
            x = W_PART(10.1);
            y = H_PART(0.1);
            w = W_PART(15.8);
            h = H_PART(1);
            autocomplete = "";
        };
    };
};

class GVAR(AttributePosition): RscControlsGroupNoScrollbars {
    onSetFocus = QUOTE(_this call FUNC(ui_attributePosition));
    idc = 26468;
    x = 0;
    y = 0;
    w = W_PART(26);
    h = H_PART(26);
    class controls {
        class Title1: RscText {
            idc = -1;
            text = CSTRING(AttributePosition);
            toolTip = CSTRING(AttributePosition_desc);
            x = 0;
            y = 0;
            w = W_PART(26);
            h = H_PART(1);
            colorBackground[] = {0,0,0,0.5};
        };
        class Position: RscMapControl {
            idc = 26469;
            x = W_PART(0.5);
            y = H_PART(1.1);
            w = W_PART(25);
            h = H_PART(24.8);
        };
    };
};

class GVAR(RscDefendArea): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QUOTE(QGVAR(RscDefendArea)))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QUOTE(QGVAR(RscDefendArea)))] call FUNC(zeusAttributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class radius: GVAR(AttributeRadius) {};
                //class position: GVAR(AttributePosition) {};
            };
        };
        class ButtonOK: ButtonOK {
            onSetFocus = QUOTE(_this call FUNC(ui_defendArea));
        };
        class ButtonCancel: ButtonCancel {};
    };
};

class GVAR(RscEditableObjects): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QQGVAR(RscEditableObjects))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QQGVAR(RscEditableObjects))] call FUNC(zeusAttributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class radius: GVAR(AttributeRadius) {};
                //class position: GVAR(AttributePosition) {};
                class editableObjects: RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(ui_editableObjects));
                    idc = 26422;
                    x = 0;
                    y = 0;
                    w = W_PART(11.1);
                    h = H_PART(2.5);
                    class controls {
                        class Label: RscText {
                            idc = -1;
                            text = CSTRING(ModuleEditableObjects_curators);
                            toolTip = CSTRING(ModuleEditableObjects_curators_desc);
                            x = 0;
                            y = 0;
                            w = W_PART(10);
                            h = H_PART(1);
                            colorBackground[] = {0,0,0,0.5};
                        };
                        class AllCurators: RscCheckBox {
                            idc = 16188;
                            x = W_PART(10.1);
                            y = 0;
                            w = W_PART(1);
                            h = H_PART(1);
                        };
                        class Label2: Label {
                            text = CSTRING(ModuleEditableObjects_removal);
                            toolTip = CSTRING(ModuleEditableObjects_removal_desc);
                            y = H_PART(1.1);
                        };
                        class EditingMode: AllCurators {
                            idc = 16189;
                            y = H_PART(1.1);
                        };
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};

class GVAR(RscGlobalSetSkill): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QUOTE(QGVAR(RscGlobalSetSkill)))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QUOTE(QGVAR(RscGlobalSetSkill)))] call FUNC(zeusAttributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class globalSetSkill: RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(ui_globalSetSkill));
                    idc = 26422;
                    x = 0;
                    y = 0;
                    w = W_PART(26);
                    h = H_PART(6.5);
                    class controls {
                        class Title1: RscText {
                            idc = -1;
                            text = CSTRING(ModuleGlobalSetSkill_general);
                            toolTip = CSTRING(ModuleGlobalSetSkill_general_desc);
                            x = 0;
                            y = 0;
                            w = W_PART(10);
                            h = H_PART(1);
                            colorBackground[] = {0,0,0,0.5};
                        };
                        class General: RscXSliderH {
                            idc = 16184;
                            x = W_PART(10.1);
                            y = 0;
                            w = W_PART(15.9);
                            h = H_PART(1);
                        };
                        class Title2: Title1 {
                            idc = -1;
                            text = CSTRING(ModuleGlobalSetSkill_accuracy);
                            toolTip = CSTRING(ModuleGlobalSetSkill_accuracy_desc);
                            y = H_PART(1.1);
                        };
                        class Accuracy: General {
                            idc = 16185;
                            y = H_PART(1.1);
                        };
                        class Title3: Title1 {
                            idc = -1;
                            text = CSTRING(ModuleGlobalSetSkill_handling);
                            toolTip = CSTRING(ModuleGlobalSetSkill_handling_desc);
                            y = H_PART(2.2);
                        };
                        class Handling: General {
                            idc = 16186;
                            y = H_PART(2.2);
                        };
                        class Title4: Title1 {
                            idc = -1;
                            text = CSTRING(ModuleGlobalSetSkill_spotting);
                            toolTip = CSTRING(ModuleGlobalSetSkill_spotting_desc);
                            y = H_PART(3.3);
                        };
                        class Spotting: General {
                            idc = 16187;
                            y = H_PART(3.3);
                        };
                        class Title5: Title1 {
                            idc = -1;
                            text = CSTRING(ModuleGlobalSetSkill_cover);
                            toolTip = CSTRING(ModuleGlobalSetSkill_cover_desc);
                            y = H_PART(4.4);
                        };
                        class Cover: RscCheckBox {
                            idc = 16188;
                            x = W_PART(10.1);
                            y = H_PART(4.4);
                            w = W_PART(1);
                            h = H_PART(1);
                        };
                        class Title6: Title5 {
                            idc = -1;
                            text = CSTRING(ModuleGlobalSetSkill_combat);
                            toolTip = CSTRING(ModuleGlobalSetSkill_combat_desc);
                            y = H_PART(5.5);
                        };
                        class Combat: Cover {
                            idc = 16189;
                            y = H_PART(5.5);
                        };
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};

class GVAR(RscGroupSide): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QUOTE(QGVAR(RscGroupSide)))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QUOTE(QGVAR(RscGroupSide)))] call FUNC(zeusAttributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class groupSide: RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(ui_groupSide));
                    idc = 26422;
                    x = 0;
                    y = 0;
                    w = W_PART(26);
                    h = H_PART(2.5);
                    class controls {
                        class Title: RscText {
                            idc = 31002;
                            text = "$STR_disp_arcunit_side";
                            x = 0;
                            y = 0;
                            w = W_PART(10);
                            h = H_PART(2.5);
                            colorBackground[] = {0,0,0,0.5};
                        };
                        class Background: RscText {
                            idc = 31000;
                            x = W_PART(10);
                            y = 0;
                            w = W_PART(16);
                            h = H_PART(2.5);
                            colorBackground[] = {1,1,1,0.1};
                        };
                        class BLUFOR: RscActivePicture {
                            idc = 31200;
                            text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_west_ca.paa";
                            x = W_PART(12.5);
                            y = H_PART(0.25);
                            w = W_PART(2);
                            h = H_PART(2);
                            tooltip = "$STR_WEST";
                        };
                        class OPFOR: BLUFOR {
                            idc = 31201;
                            text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_east_ca.paa";
                            x = W_PART(15.5);
                            y = H_PART(0.25);
                            w = W_PART(2);
                            h = H_PART(2);
                            tooltip = "$STR_EAST";
                        };
                        class Independent: BLUFOR {
                            idc = 31202;
                            text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_guer_ca.paa";
                            x = W_PART(18.5);
                            y = H_PART(0.25);
                            w = W_PART(2);
                            h = H_PART(2);
                            tooltip = "$STR_guerrila";
                        };
                        class Civilian: BLUFOR {
                            idc = 31203;
                            text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_civ_ca.paa";
                            x = W_PART(21.5);
                            y = H_PART(0.25);
                            w = W_PART(2);
                            h = H_PART(2);
                            tooltip = "$STR_Civilian";
                        };
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};

class GVAR(RscPatrolArea): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QUOTE(QGVAR(RscPatrolArea)))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QUOTE(QGVAR(RscPatrolArea)))] call FUNC(zeusAttributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class radius: GVAR(AttributeRadius) {};
                //class position: GVAR(AttributePosition) {};
            };
        };
        class ButtonOK: ButtonOK {
            onSetFocus = QUOTE(_this call FUNC(ui_patrolArea));
        };
        class ButtonCancel: ButtonCancel {};
    };
};

class GVAR(RscSearchArea): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QUOTE(QGVAR(RscSearchArea)))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QUOTE(QGVAR(RscSearchArea)))] call FUNC(zeusAttributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class radius: GVAR(AttributeRadius) {};
                //class position: GVAR(AttributePosition) {};
            };
        };
        class ButtonOK: ButtonOK {
            onSetFocus = QUOTE(_this call FUNC(ui_searchArea));
        };
        class ButtonCancel: ButtonCancel {};
    };
};

class GVAR(RscTeleportPlayers): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QUOTE(QGVAR(RscTeleportPlayers)))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QUOTE(QGVAR(RscTeleportPlayers)))] call FUNC(zeusAttributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class teleportPlayers: RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(ui_teleportPlayers));
                    idc = 26422;
                    x = 0;
                    y = 0;
                    w = W_PART(26);
                    h = H_PART(8.5);
                    class controls {
                        class Title: RscText {
                            idc = -1;
                            text = CSTRING(ModuleTeleportPlayers_player);
                            toolTip = CSTRING(ModuleTeleportPlayers_player_desc);
                            x = 0;
                            y = 0;
                            w = W_PART(26);
                            h = H_PART(1);
                            colorBackground[] = {0,0,0,0.5};
                        };
                        class Unit: RscListbox {
                            idc = 16189;
                            x = 0;
                            y = H_PART(1.1);
                            w = W_PART(26);
                            h = H_PART(5.9);
                        };
                        class SearchBackground: RscText {
                            idc = -1;
                            x = 0;
                            y = H_PART(7.1);
                            w = W_PART(1);
                            h = H_PART(1);
                            colorBackground[] = {0, 0, 0, 0.5};
                        };
                        class SearchPicture: RscPicture {
                            idc = -1;
                            text = "\a3\Ui_f\data\GUI\RscCommon\RscButtonSearch\search_start_ca.paa";
                            x = 0;
                            y = H_PART(7.1);
                            w = W_PART(1);
                            h = H_PART(1);
                        };
                        class Search: RscEdit {
                            idc = 16190;
                            x = W_PART(1.2);
                            y = H_PART(7.1);
                            w = W_PART(14.5);
                            h = H_PART(1);
                            autocomplete = "";
                        };
                        class LabelGroup: Title {
                            idc = -1;
                            text = CSTRING(ModuleTeleportPlayers_group);
                            toolTip = CSTRING(ModuleTeleportPlayers_group_desc);
                            x = W_PART(15.9);
                            y = H_PART(7.1);
                            w = W_PART(9);
                        };
                        class UseGroup: RscCheckBox {
                            idc = 16188;
                            x = W_PART(25);
                            y = H_PART(7.1);
                            w = W_PART(1);
                            h = H_PART(1);
                        };
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};

class GVAR(AttributeCargo): RscControlsGroupNoScrollbars {
    onSetFocus = QUOTE(_this call FUNC(ui_attributeCargo));
    idc = -1;
    x = X_PART(7);
    y = Y_PART(10);
    w = W_PART(26);
    h = H_PART(3);
    class controls {
        class Title: RscText {
            idc = -1;
            text = CSTRING(AttributeCargo);
            x = 0;
            y = 0;
            w = W_PART(10);
            h = H_PART(3);
            colorBackground[] = {0,0,0,0.5};
        };
        class Background: RscText {
            idc = -1;
            x = W_PART(10);
            y = 0;
            w = W_PART(16);
            h = H_PART(3);
            colorBackground[] = {1,1,1,0.1};
        };
        class Cargo: RscListBox {
            idc = 80086;
            x = W_PART(10);
            y = 0;
            w = W_PART(16);
            h = H_PART(3);
        };

    };
};

class RscDisplayAttributesVehicle: RscDisplayAttributes {
    class Controls: Controls {
        class Content: Content {
            class Controls: controls {
                class ace_cargo: GVAR(AttributeCargo) { };
            };
        };
    };
};

class RscDisplayAttributesVehicleEmpty: RscDisplayAttributes {
    class Controls: Controls {
        class Content: Content {
            class Controls: controls {
                class ace_cargo: GVAR(AttributeCargo) { };
            };
        };
    };
};

class GVAR(RscGarrison): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QUOTE(QGVAR(RscGarrison)))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QUOTE(QGVAR(RscGarrison)))] call FUNC(zeusAttributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class Garrison: RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(ui_garrison));
                    idc = 73060;
                    x = 0;
                    y = 0;
                    w = W_PART(26);
                    h = H_PART(8.5);
                    class controls {
                        class radius: GVAR(AttributeRadius) {};
                        class TopDownFillingTitle: Title {
                            idc = -1;
                            text = CSTRING(ModuleGarrison_TopDownFillingText);
                            toolTip = CSTRING(ModuleGarrison_TopDownFillingTooltip);
                            x = 0;
                            y = H_PART(1.2);
                            w = W_PART(10);
                            h = H_PART(1);
                            colorBackground[] = {0,0,0,0.5};
                        };
                        class TopDownFilling: RscCheckBox {
                            idc = 73061;
                            x = W_PART(10.1);
                            y = H_PART(1.2);
                            w = W_PART(1);
                            h = H_PART(1);
                        };
                        class TeleportTitle: Title {
                            idc = -1;
                            text = CSTRING(ModuleGarrison_TeleportText);
                            x = 0;
                            y = H_PART(2.3);
                            w = W_PART(10);
                            h = H_PART(1);
                            colorBackground[] = {0,0,0,0.5};
                        };
                        class Teleport: RscCheckBox {
                            idc = 73062;
                            x = W_PART(10.1);
                            y = H_PART(2.3);
                            w = W_PART(1);
                            h = H_PART(1);
                        };
                        class FillingModeTitle: RscText {
                            idc = -1;
                            text = CSTRING(ModuleGarrison_FillingModeText);
                            x = 0;
                            y = H_PART(3.5);
                            w = W_PART(26);
                            h = H_PART(1);
                            colorBackground[] = {0,0,0,0.5};
                        };
                        class FillingMode: RscListbox {
                            idc = 73063;
                            x = 0;
                            y = H_PART(4.5);
                            w = W_PART(26);
                            h = H_PART(4);
                        };
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};

class GVAR(RscToggleNvg): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QUOTE(QGVAR(RscToggleNvg)))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QUOTE(QGVAR(RscToggleNvg)))] call FUNC(zeusAttributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class ToggleNvg: RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(ui_toggleNvg));
                    idc = 92854;
                    x = 0;
                    y = 0;
                    w = W_PART(26);
                    h = H_PART(3);
                    class controls {
                        class ToggleNvgTitle: Title {
                            idc = -1;
                            text = CSTRING(moduleToggleNVG_ToggleNvgTitle);
                            toolTip = CSTRING(moduleToggleNVG_ToggleNvgTitleTooltip);
                            x = H_PART(0);
                            y = H_PART(0);
                            w = W_PART(7);
                        };
                        class ToggleNvgCombo: RscCombo {
                            idc = 92855;
                            x = H_PART(6);
                            y = H_PART(0);
                            w = W_PART(10.1);
                            h = H_PART(1);
                        };
                        class ToggleNvgSideTitle: Title {
                            idc = -1;
                            text = CSTRING(moduleToggleNVG_ToggleNvgSide);
                            x = H_PART(0);
                            y = H_PART(1.2);
                            w = W_PART(7);
                        };
                        class ToggleNvgSideCombo: RscCombo {
                            idc = 92856;
                            x = H_PART(6);
                            y = H_PART(1.2);
                            w = W_PART(10.1);
                            h = H_PART(1);
                        };
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};

class GVAR(RscToggleFlashlight): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QUOTE(QGVAR(RscToggleFlashlight)))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QUOTE(QGVAR(RscToggleFlashlight)))] call FUNC(zeusAttributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class ToggleFlashlight: RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(ui_toggleFlashlight));
                    idc = 56217;
                    x = 0;
                    y = 0;
                    w = W_PART(26);
                    h = H_PART(5);
                    class controls {
                        class ToggleFlashlightTitle: Title {
                            idc = -1;
                            text = CSTRING(moduleToggleFlashlight_ToggleFlashlightTitle);
                            x = H_PART(0);
                            y = H_PART(0);
                            w = W_PART(7);
                        };
                        class ToggleFlashlightCombo: RscCombo {
                            idc = 56218;
                            x = H_PART(6);
                            y = H_PART(0);
                            w = W_PART(10.1);
                            h = H_PART(1);
                        };
                        class ToggleFlashlightSideTitle: Title {
                            idc = -1;
                            text = CSTRING(moduleToggleFlashlight_ToggleFlashlightSide);
                            x = H_PART(0);
                            y = H_PART(1.2);
                            w = W_PART(7);
                        };
                        class ToggleFlashlightSideCombo: RscCombo {
                            idc = 56219;
                            x = H_PART(6);
                            y = H_PART(1.2);
                            w = W_PART(10.1);
                            h = H_PART(1);
                        };
                        class ToggleFlashlightGearTitle: Title {
                            idc = -1;
                            text = CSTRING(moduleToggleFlashlight_ToggleFlashlightGear);
                            x = H_PART(0);
                            y = H_PART(2.4);
                            w = W_PART(7);
                        };
                        class ToggleFlashlightGearCombo: RscCombo {
                            idc = 56220;
                            x = H_PART(6);
                            y = H_PART(2.4);
                            w = W_PART(10.1);
                            h = H_PART(1);
                        };
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};

class GVAR(RscSetEngineer): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QUOTE(QGVAR(RscSetEngineer)))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QUOTE(QGVAR(RscSetEngineer)))] call FUNC(zeusAttributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class setEngineer: RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(ui_setEngineer));
                    idc = 86946;
                    x = 0;
                    y = 0;
                    w = W_PART(26);
                    h = H_PART(1.2);
                    class controls {
                        class Label: RscText {
                            idc = -1;
                            text = CSTRING(ModuleSetEngineer_skill);
                            toolTip = ECSTRING(repair,AssignEngineerRole_role_Description);
                            x = 0;
                            y = H_PART(0.1);
                            w = W_PART(10);
                            h = H_PART(1);
                            colorBackground[] = {0, 0, 0, 0.5};
                        };
                        class Roles: ctrlToolbox {
                            idc = 86947;
                            x = W_PART(10.1);
                            y = H_PART(0.1);
                            w = W_PART(15.9);
                            h = H_PART(1);
                            rows = 1;
                            columns = 2;
                            strings[] = {ECSTRING(repair,AssignEngineerRole_role_engineer), ECSTRING(repair,AssignEngineerRole_role_advanced)};
                        };
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};

class GVAR(RscSuicideBomber): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QUOTE(QGVAR(RscSuicideBomber)))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QUOTE(QGVAR(RscSuicideBomber)))] call FUNC(zeusAttributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class suicideBomber: RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(ui_suicideBomber));
                    idc = 83470;
                    x = 0;
                    y = 0;
                    w = W_PART(26);
                    h = H_PART(5.8);
                    class controls {
                        class ActivationSide: RscControlsGroupNoScrollbars {
                            idc = 83571;
                            x = 0;
                            y = 0;
                            w = W_PART(26);
                            h = H_PART(2.5);
                            class controls {
                                class Label: RscText {
                                    idc = -1;
                                    text = CSTRING(ModuleSuicideBomber_ActivationSide);
                                    x = 0;
                                    y = 0;
                                    w = W_PART(10);
                                    h = H_PART(2.5);
                                    colorBackground[] = {0, 0, 0, 0.5};
                                };
                                class Background: RscText {
                                    idc = -1;
                                    x = W_PART(10);
                                    y = 0;
                                    w = W_PART(16);
                                    h = H_PART(2.5);
                                    colorBackground[] = {1, 1, 1, 0.1};
                                };
                                class BLUFOR: RscActivePicture {
                                    idc = 83581;
                                    text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_west_ca.paa";
                                    x = W_PART(12.5);
                                    y = H_PART(0.25);
                                    w = W_PART(2);
                                    h = H_PART(2);
                                    tooltip = "$STR_WEST";
                                };
                                class OPFOR: BLUFOR {
                                    idc = 83580;
                                    text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_east_ca.paa";
                                    x = W_PART(15.5);
                                    tooltip = "$STR_EAST";
                                };
                                class Independent: BLUFOR {
                                    idc = 83582;
                                    text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_guer_ca.paa";
                                    x = W_PART(18.5);
                                    tooltip = "$STR_guerrila";
                                };
                                class Civilian: BLUFOR {
                                    idc = 83583;
                                    text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_civ_ca.paa";
                                    x = W_PART(21.5);
                                    tooltip = "$STR_Civilian";
                                };
                            };
                        };
                        class DistanceLabel: RscText {
                            idc = -1;
                            text = CSTRING(ModuleSuicideBomber_ActivationRadius);
                            x = 0;
                            y = H_PART(2.6);
                            w = W_PART(10);
                            h = H_PART(1);
                            colorBackground[] = {0, 0, 0, 0.5};
                        };
                        class DistanceSlider: RscXSliderH {
                            idc = 83572;
                            x = W_PART(10.1);
                            y = H_PART(2.6);
                            w = W_PART(13.9);
                            h = H_PART(1);
                        };
                        class DistanceEdit: RscEdit {
                            idc = 83573;
                            x = W_PART(24.1);
                            y = H_PART(2.6);
                            w = W_PART(1.9);
                            h = H_PART(1);
                            autocomplete = "";
                            maxChars = 3;
                            canModify = 0;
                        };
                        class ExplosionLabel: DistanceLabel {
                            idc = -1;
                            text = CSTRING(ModuleSuicideBomber_ExplosionSize);
                            y = H_PART(3.7);
                        };
                        class Explosion: ctrlToolbox {
                            idc = 83574;
                            x = W_PART(10.1);
                            y = H_PART(3.7);
                            w = W_PART(15.9);
                            h = H_PART(1);
                            rows = 1;
                            columns = 3;
                            strings[] = {CSTRING(ModuleSuicideBomber_Small), CSTRING(ModuleSuicideBomber_Medium), CSTRING(ModuleSuicideBomber_Large)};
                        };
                        class AutoSeekLabel: DistanceLabel {
                            idc = -1;
                            text = CSTRING(ModuleSuicideBomber_AutoSeek);
                            y = H_PART(4.8);
                            toolTip = CSTRING(ModuleSuicideBomber_AutoSeek_tooltip);
                        };
                        class AutoSeek: Explosion {
                            idc = 83575;
                            y = H_PART(4.8);
                            columns = 2;
                            strings[] = {ECSTRING(common,Disabled), ECSTRING(common,Enabled)};
                        };
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};
