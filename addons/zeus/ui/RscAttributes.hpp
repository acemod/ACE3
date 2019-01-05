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
class RscButton;

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
    h = H_PART(1.1);
    class controls {
        class Label: RscText {
            idc = -1;
            text = CSTRING(AttributeRadius);
            tooltip = CSTRING(AttributeRadius_Tooltip);
            x = 0;
            y = H_PART(0.1);
            w = W_PART(10);
            h = H_PART(1);
            colorBackground[] = {0, 0, 0, 0.5};
        };
        class Radius: RscEdit {
            idc = 26467;
            x = W_PART(10.1);
            y = H_PART(0.1);
            w = W_PART(15.9);
            h = H_PART(1);
            autocomplete = "";
        };
    };
};

class GVAR(RscDefendArea): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QQGVAR(RscDefendArea))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QQGVAR(RscDefendArea))] call FUNC(zeusAttributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class radius: GVAR(AttributeRadius) {};
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
                class editableObjects: RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(ui_editableObjects));
                    idc = 19180;
                    x = 0;
                    y = 0;
                    w = W_PART(26);
                    h = H_PART(3.2);
                    class controls {
                        class EditingModeLabel: RscText {
                            idc = -1;
                            text = CSTRING(ModuleEditableObjects_EditingMode);
                            tooltip = CSTRING(ModuleEditableObjects_EditingMode_Tooltip);
                            x = 0;
                            y = 0;
                            w = W_PART(10);
                            h = H_PART(1);
                            colorBackground[] = {0, 0, 0, 0.5};
                        };
                        class EditingMode: ctrlToolbox {
                            idc = 19181;
                            x = W_PART(10.1);
                            y = 0;
                            w = W_PART(15.9);
                            h = H_PART(1);
                            rows = 1;
                            columns = 2;
                            strings[] = {CSTRING(ModuleEditableObjects_RemoveObjects), CSTRING(ModuleEditableObjects_AddObjects)};
                        };
                        class AllCuratorsLabel: EditingModeLabel {
                            text = CSTRING(ModuleEditableObjects_AllCurators);
                            tooltip = CSTRING(ModuleEditableObjects_AllCurators_Tooltip);
                            y = H_PART(1.1);
                        };
                        class AllCurators: EditingMode {
                            idc = 19182;
                            y = H_PART(1.1);
                            strings[] = {ECSTRING(common,No), ECSTRING(common,Yes)};
                        };
                        class AdditionalObjectsLabel: EditingModeLabel {
                            text = CSTRING(ModuleEditableObjects_AdditionalObjects);
                            tooltip = CSTRING(ModuleEditableObjects_AdditionalObjects_Tooltip);
                            y = H_PART(2.2);
                        };
                        class AdditionalObjects: EditingMode {
                            idc = 19183;
                            y = H_PART(2.2);
                            columns = 3;
                            strings[] = {CSTRING(None), CSTRING(Players), CSTRING(PlayersAndAI)};
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
    onLoad = QUOTE([ARR_3('onLoad', _this, QQGVAR(RscGlobalSetSkill))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QQGVAR(RscGlobalSetSkill))] call FUNC(zeusAttributes));
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
    onLoad = QUOTE([ARR_3('onLoad', _this, QQGVAR(RscGroupSide))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QQGVAR(RscGroupSide))] call FUNC(zeusAttributes));
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
    onLoad = QUOTE([ARR_3('onLoad', _this, QQGVAR(RscPatrolArea))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QQGVAR(RscPatrolArea))] call FUNC(zeusAttributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class radius: GVAR(AttributeRadius) {};
            };
        };
        class ButtonOK: ButtonOK {
            onSetFocus = QUOTE(_this call FUNC(ui_patrolArea));
        };
        class ButtonCancel: ButtonCancel {};
    };
};

class GVAR(RscSearchArea): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QQGVAR(RscSearchArea))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QQGVAR(RscSearchArea))] call FUNC(zeusAttributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class radius: GVAR(AttributeRadius) {};
            };
        };
        class ButtonOK: ButtonOK {
            onSetFocus = QUOTE(_this call FUNC(ui_searchArea));
        };
        class ButtonCancel: ButtonCancel {};
    };
};

class GVAR(RscTeleportPlayers): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QQGVAR(RscTeleportPlayers))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QQGVAR(RscTeleportPlayers))] call FUNC(zeusAttributes));
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
                    h = H_PART(8.1);
                    class controls {
                        class Title: RscText {
                            idc = -1;
                            text = CSTRING(ModuleTeleportPlayers_player);
                            toolTip = CSTRING(ModuleTeleportPlayers_player_desc);
                            x = 0;
                            y = 0;
                            w = W_PART(26);
                            h = H_PART(1);
                            colorBackground[] = {0, 0, 0, 0.5};
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
            h = H_PART(2);
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
        class Unload: RscButton {
            idc = 80087;
            text = ECSTRING(cargo,unloadObject);
            x = 0;
            y = H_PART(2);
            w = W_PART(10);
            h = H_PART(1);
            colorBackground[] = {0, 0, 0, 0.7};
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
    onLoad = QUOTE([ARR_3('onLoad', _this, QQGVAR(RscGarrison))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QQGVAR(RscGarrison))] call FUNC(zeusAttributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class radius: GVAR(AttributeRadius) {};
                class Garrison: RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(ui_garrison));
                    idc = 73060;
                    x = 0;
                    y = 0;
                    w = W_PART(26);
                    h = H_PART(6.2);
                    class controls {
                        class TeleportLabel: RscText {
                            idc = -1;
                            text = CSTRING(ModuleGarrison_TeleportText);
                            x = 0;
                            y = 0;
                            w = W_PART(10);
                            h = H_PART(1);
                            colorBackground[] = {0, 0, 0, 0.5};
                        };
                        class Teleport: ctrlToolbox {
                            idc = 73061;
                            x = W_PART(10.1);
                            y = 0;
                            w = W_PART(15.9);
                            h = H_PART(1);
                            rows = 1;
                            columns = 2;
                            strings[] = {ECSTRING(common,No), ECSTRING(common,Yes)};
                        };
                        class TopDownLabel: TeleportLabel {
                            text = CSTRING(ModuleGarrison_TopDownFillingText);
                            tooltip = CSTRING(ModuleGarrison_TopDownFillingTooltip);
                            y = H_PART(1.1);
                        };
                        class TopDown: Teleport {
                            idc = 73062;
                            y = H_PART(1.1);
                        };
                        class FillingModeLabel: TeleportLabel {
                            text = CSTRING(ModuleGarrison_FillingModeText);
                            y = H_PART(2.2);
                            w = W_PART(26);
                        };
                        class FillingMode: RscListbox {
                            idc = 73063;
                            x = 0;
                            y = H_PART(3.2);
                            w = W_PART(26);
                            h = H_PART(3);
                            class Items {
                                class Even {
                                    text = CSTRING(ModuleGarrison_FillingModeEven);
                                    default = 1;
                                };
                                class Building {
                                    text = CSTRING(ModuleGarrison_FillingModeBuilding);
                                };
                                class Random {
                                    text = CSTRING(ModuleGarrison_FillingModeRandom);
                                };
                            };
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
    onLoad = QUOTE([ARR_3('onLoad', _this, QQGVAR(RscToggleNvg))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QQGVAR(RscToggleNvg))] call FUNC(zeusAttributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class toggleNvg: RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(ui_toggleNvg));
                    idc = 92854;
                    x = 0;
                    y = 0;
                    w = W_PART(26);
                    h = H_PART(2.1);
                    class controls {
                        class ToggleLabel: RscText {
                            idc = -1;
                            text = CSTRING(ModuleToggleNVG_NvgEquipment);
                            tooltip = CSTRING(ModuleToggleNVG_NvgEquipment_tooltip);
                            x = 0;
                            y = 0;
                            w = W_PART(10);
                            h = H_PART(1);
                            colorBackground[] = {0, 0, 0, 0.5};
                        };
                        class Toggle: ctrlToolbox {
                            idc = 92855;
                            x = W_PART(10.1);
                            y = 0;
                            w = W_PART(15.9);
                            h = H_PART(1);
                            rows = 1;
                            columns = 2;
                            strings[] = {ECSTRING(common,Disabled), ECSTRING(common,Enabled)};
                        };
                        class TargetLabel: ToggleLabel {
                            text = CSTRING(ToggleTarget);
                            tooltip = CSTRING(ToggleTarget_Tooltip);
                            y = H_PART(1.1);
                        };
                        class Target: RscCombo {
                            idc = 92856;
                            x = W_PART(10.1);
                            y = H_PART(1.1);
                            w = W_PART(15.9);
                            h = H_PART(1);
                            colorBackground[] = {0, 0, 0, 0.7};
                            class Items {
                                class Group {
                                    text = CSTRING(SelectedGroup);
                                    picture = "\a3\ui_f_curator\data\displays\rscdisplaycurator\modegroups_ca.paa";
                                    default = 1;
                                };
                                class BLUFOR {
                                    text = "$STR_WEST";
                                    picture = "\a3\ui_f\data\map\diary\icons\playerwest_ca.paa";
                                };
                                class OPFOR {
                                    text = "$STR_EAST";
                                    picture = "\a3\ui_f\data\map\diary\icons\playereast_ca.paa";
                                };
                                class Independent {
                                    text = "$STR_guerrila";
                                    picture = "\a3\ui_f\data\map\diary\icons\playerguer_ca.paa";
                                };
                                class Civilian {
                                    text = "$STR_Civilian";
                                    picture = "\a3\ui_f\data\map\diary\icons\playerciv_ca.paa";
                                };
                            };
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
    onLoad = QUOTE([ARR_3('onLoad', _this, QQGVAR(RscToggleFlashlight))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QQGVAR(RscToggleFlashlight))] call FUNC(zeusAttributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class toggleFlashlight: RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(ui_toggleFlashlight));
                    idc = 56217;
                    x = 0;
                    y = 0;
                    w = W_PART(26);
                    h = H_PART(3.2);
                    class controls {
                        class ToggleLabel: RscText {
                            idc = -1;
                            text = CSTRING(ModuleToggleFlashlight_Flashlights);
                            x = 0;
                            y = 0;
                            w = W_PART(10);
                            h = H_PART(1);
                            colorBackground[] = {0, 0, 0, 0.5};
                        };
                        class Toggle: ctrlToolbox {
                            idc = 56218;
                            x = W_PART(10.1);
                            y = 0;
                            w = W_PART(15.9);
                            h = H_PART(1);
                            rows = 1;
                            columns = 2;
                            strings[] = {ECSTRING(common,Disabled), ECSTRING(common,Enabled)};
                        };
                        class AddGearLabel: ToggleLabel {
                            text = CSTRING(ModuleToggleFlashlight_AddGear);
                            y = H_PART(1.1);
                        };
                        class AddGear: Toggle {
                            idc = 56219;
                            y = H_PART(1.1);
                            strings[] = {ECSTRING(common,No), ECSTRING(common,Yes)};
                        };
                        class TargetLabel: ToggleLabel {
                            text = CSTRING(ToggleTarget);
                            tooltip = CSTRING(ToggleTarget_Tooltip);
                            y = H_PART(2.2);
                        };
                        class Target: RscCombo {
                            idc = 56220;
                            x = W_PART(10.1);
                            y = H_PART(2.2);
                            w = W_PART(15.9);
                            h = H_PART(1);
                            colorBackground[] = {0, 0, 0, 0.7};
                            class Items {
                                class Group {
                                    text = CSTRING(SelectedGroup);
                                    picture = "\a3\ui_f_curator\data\displays\rscdisplaycurator\modegroups_ca.paa";
                                    default = 1;
                                };
                                class BLUFOR {
                                    text = "$STR_WEST";
                                    picture = "\a3\ui_f\data\map\diary\icons\playerwest_ca.paa";
                                };
                                class OPFOR {
                                    text = "$STR_EAST";
                                    picture = "\a3\ui_f\data\map\diary\icons\playereast_ca.paa";
                                };
                                class Independent {
                                    text = "$STR_guerrila";
                                    picture = "\a3\ui_f\data\map\diary\icons\playerguer_ca.paa";
                                };
                                class Civilian {
                                    text = "$STR_Civilian";
                                    picture = "\a3\ui_f\data\map\diary\icons\playerciv_ca.paa";
                                };
                            };
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
    onLoad = QUOTE([ARR_3('onLoad', _this, QQGVAR(RscSetEngineer))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QQGVAR(RscSetEngineer))] call FUNC(zeusAttributes));
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
    onLoad = QUOTE([ARR_3('onLoad', _this, QQGVAR(RscSuicideBomber))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QQGVAR(RscSuicideBomber))] call FUNC(zeusAttributes));
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
                            strings[] = {"$STR_small", "$STR_medium", "$STR_large"};
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
