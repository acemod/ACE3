class RscControlsGroup;
class RscControlsGroupNoScrollbars;
class RscText;
class RscListbox;
class RscEdit;
class RscXSliderH;
class RscCheckBox;

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
                            text = "Skill: General";
                            toolTip = "Global AI Set Skill: general,commanding,courage";
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
                            text = "Skill: aimingAccuracy";
                            toolTip = "Global AI Set Skill: aimingAccuracy";
                            y = H_PART(1.1);
                        };
                        class Value2: Value1 {
                            idc = 16185;
                            y = H_PART(1.1);
                        };
                        class Title3: Title1 {
                            idc = -1;
                            text = "Skill: weaponHandling";
                            toolTip = "Global AI Set Skill: aimingShake,aimingSpeed,reloadSpeed";
                            y = H_PART(2.2);
                        };
                        class Value3: Value1 {
                            idc = 16186;
                            y = H_PART(2.2);
                        };
                        class Title4: Title1 {
                            idc = -1;
                            text = "Skill: spotting";
                            toolTip = "Global AI Set Skill: spotDistance,spotTime";
                            y = H_PART(3.3);
                        };
                        class Value4: Value1 {
                            idc = 16187;
                            y = H_PART(3.3);
                        };
                        class Title5: Title1 {
                            idc = -1;
                            text = "Seek Cover";
                            toolTip = "Global AI Set Skill: AI Seek Cover";
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
                            toolTip = "Global AI Set Skill: Ai Switch To Combat Mode";
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
            h = H_PART(2.5);
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
                class Cargo: GVAR(cargoAttribute) { };
            };
        };
    };
};
