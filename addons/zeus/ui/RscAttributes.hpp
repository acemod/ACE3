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
                            text = "\a3\Ui_f\data\Map\Markers\NATO\b_unknown.paa";
                            x = W_PART(12.5);
                            y = H_PART(0.25);
                            w = W_PART(2);
                            h = H_PART(2);
                            tooltip = "$STR_WEST";
                        };
                        class OPFOR: BLUFOR {
                            idc = 31201;
                            text = "\a3\Ui_f\data\Map\Markers\NATO\o_unknown.paa";
                            x = W_PART(15.5);
                            y = H_PART(0.25);
                            w = W_PART(2);
                            h = H_PART(2);
                            tooltip = "$STR_EAST";
                        };
                        class Independent: BLUFOR {
                            idc = 31202;
                            text = "\a3\Ui_f\data\Map\Markers\NATO\n_unknown.paa";
                            x = W_PART(18.5);
                            y = H_PART(0.25);
                            w = W_PART(2);
                            h = H_PART(2);
                            tooltip = "$STR_guerrila";
                        };
                        class Civilian: BLUFOR {
                            idc = 31203;
                            text = "\a3\Ui_f\data\Map\Markers\NATO\n_unknown.paa";
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
                        class Label: Title {
                            idc = -1;
                            text = CSTRING(ModuleTeleportPlayers_group);
                            toolTip = CSTRING(ModuleTeleportPlayers_group_desc);
                            y = H_PART(7.1);
                            w = W_PART(10);
                        };
                        class UseGroup: RscCheckBox {
                            idc = 16188;
                            x = W_PART(10.1);
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
