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
        class Content;
        class ButtonOK;
        class ButtonCancel;
    };
};
class GVAR(RscDisplayAttributes_globalSetSkill): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QUOTE(QGVAR(RscDisplayAttributes_globalSetSkill)))] call FUNC(zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QUOTE(QGVAR(RscDisplayAttributes_globalSetSkill)))] call FUNC(zeusAttributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class globalSetSkill: RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(zeusAttributes_globalSetSkill));
                    idc = 26422;
                    x = "0";
                    y = "0";
                    w = "26 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "6.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    class controls {
                        class Title1: RscText {
                            idc = -1;
                            text = "Skill: General";
                            toolTip = "Global AI Set Skill: general,commanding,courage";
                            x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
                            y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                            w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                            h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                            colorBackground[] = {0,0,0,0.5};
                        };
                        class Value1: RscXSliderH {
                            idc = 16184;
                            x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
                            y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                            w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
                            h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                        };
                        class Title2: Title1 {
                            idc = -1;
                            text = "Skill: aimingAccuracy";
                            toolTip = "Global AI Set Skill: aimingAccuracy";
                            y = "1.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                        };
                        class Value2: Value1 {
                            idc = 16185;
                            y = "1.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                        };
                        class Title3: Title1 {
                            idc = -1;
                            text = "Skill: weaponHandling";
                            toolTip = "Global AI Set Skill: aimingShake,aimingSpeed,reloadSpeed";
                            y = "2.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                        };
                        class Value3: Value1 {
                            idc = 16186;
                            y = "2.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                        };
                        class Title4: Title1 {
                            idc = -1;
                            text = "Skill: spotting";
                            toolTip = "Global AI Set Skill: spotDistance,spotTime";
                            y = "3.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                        };
                        class Value4: Value1 {
                            idc = 16187;
                            y = "3.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                        };
                        class Title5: Title1 {
                            idc = -1;
                            text = "Seek Cover";
                            toolTip = "Global AI Set Skill: AI Seek Cover";
                            y = "4.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                        };
                        class Value5: RscCheckBox {
                            idc = 16188;
                            x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
                            y = "4.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                            w = "1 * (((safezoneW / safezoneH) min 1.2) / 40)";
                            h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                        };
                        class Title6: Title5 {
                            idc = -1;
                            text = "AUTOCOMBAT";
                            toolTip = "Global AI Set Skill: Ai Switch To Combat Mode";
                            y = "5.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                        };
                        class Value6: Value5 {
                            idc = 16189;
                            y = "5.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                        };
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};
