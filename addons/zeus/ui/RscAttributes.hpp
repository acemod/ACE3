class RscControlsGroup;
class RscControlsGroupNoScrollbars;
class RscText;
class RscListbox;
class RscCombo;
class RscEdit;
class RscXSliderH;
class RscCheckBox;
class RscActivePicture;

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
                            text = "General Skill";
                            toolTip = "Changes: general, commanding, courage";
                            x = 0;
                            y = 0;
                            w = W_PART(10);
                            h = H_PART(1);
                            colorBackground[] = {0,0,0,0.5};
                        };
                        class Value1: RscXSliderH {
                            idc = 16184;
                            x = W_PART(10.1);
                            y = 0;
                            w = W_PART(15.9);
                            h = H_PART(1);
                        };
                        class Title2: Title1 {
                            idc = -1;
                            text = "Accuracy";
                            toolTip = "Changes: aimingAccuracy";
                            y = H_PART(1.1);
                        };
                        class Value2: Value1 {
                            idc = 16185;
                            y = H_PART(1.1);
                        };
                        class Title3: Title1 {
                            idc = -1;
                            text = "Weapon Handling";
                            toolTip = "Changes: aimingShake, aimingSpeed, reloadSpeed";
                            y = H_PART(2.2);
                        };
                        class Value3: Value1 {
                            idc = 16186;
                            y = H_PART(2.2);
                        };
                        class Title4: Title1 {
                            idc = -1;
                            text = "Spotting";
                            toolTip = "Changes: spotDistance, spotTime";
                            y = H_PART(3.3);
                        };
                        class Value4: Value1 {
                            idc = 16187;
                            y = H_PART(3.3);
                        };
                        class Title5: Title1 {
                            idc = -1;
                            text = "Seek Cover";
                            toolTip = "Will AI seek cover";
                            y = H_PART(4.4);
                        };
                        class Value5: RscCheckBox {
                            idc = 16188;
                            x = W_PART(10.1);
                            y = H_PART(4.4);
                            w = W_PART(1);
                            h = H_PART(1);
                        };
                        class Title6: Title5 {
                            idc = -1;
                            text = "AUTOCOMBAT";
                            toolTip = "Will AI automatically switch to combat mode";
                            y = H_PART(5.5);
                        };
                        class Value6: Value5 {
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
                class GroupSide: RscControlsGroupNoScrollbars {
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
                            text = "Teleport Player";
                            toolTip = "Teleport selected player to module position";
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
                            text = "Teleport Group";
                            toolTip = "Teleports all units in group";
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


class GVAR(cargoAttribute): RscControlsGroupNoScrollbars {
    onSetFocus = QUOTE(_this call FUNC(ui_vehCargo));
    idc = 80085;
    x = X_PART(7);
    y = Y_PART(10);
    w = W_PART(26);
    h = H_PART(3);
    class controls {
        class Title: RscText {
            idc = -1;
            text = "Cargo:";
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
                class ace_cargo: GVAR(cargoAttribute) { };
            };
        };
    };
};

class RscDisplayAttributesVehicleEmpty: RscDisplayAttributes {
    class Controls: Controls {
        class Content: Content {
            class Controls: controls {
                class ace_cargo: GVAR(cargoAttribute) { };
            };
        };
    };
};
