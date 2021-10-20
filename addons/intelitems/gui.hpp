class ctrlStatic;
class ctrlStaticMulti;
class ctrlEditMulti;
class ctrlButtonPicture;
class ctrlStaticPictureKeepAspect;
class ctrlControlsGroupNoScrollbars;

class GVAR(RscBase): ctrlControlsGroupNoScrollbars {
    idc = -1;
    x = 0;
    y = 0;
    w = POS_W(15);
    h = POS_H(18);
    class controls {
        class Border: ctrlStatic {
            idc = IDC_BORDER;
            x = 0;
            y = 0;
            w = POS_W(15);
            h = POS_H(18);
            colorBackground[] = {0, 0, 0, 1};
        };
        class Background: ctrlStatic {
            idc = IDC_BACKGROUND;
            x = pixelW;
            y = pixelH;
            w = POS_W(15) - 2 * pixelW;
            h = POS_H(18) - 2 * pixelH;
            colorBackground[] = {1, 1, 1, 1};
        };
        class Header: ctrlStatic {
            idc = IDC_HEADER;
            style = ST_MULTI + ST_NO_RECT;
            x = 0;
            y = 0;
            w = POS_W(14.3);
            h = POS_H(0.7);
            sizeEx = POS_H(0.65);
            colorBackground[] = {0.1, 0.1, 0.1, 1};
        };
        class Close: ctrlButtonPicture {
            idc = IDC_CLOSE;
            text = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
            x = POS_W(14.3);
            y = 0;
            w = POS_W(0.7);
            h = POS_H(0.7);
            offsetPressedX = 0;
            offsetPressedY = 0;
            colorBackground[] = {0.1, 0.1, 0.1, 1};
        };
    };
};

class GVAR(RscNotepad): GVAR(RscBase) {
    class controls: controls {
        class Border: Border {};
        class Background: Background {
            colorBackground[] = {0.97, 0.91, 0.77, 1};
        };
        class Header: Header {
            text = CSTRING(Notepad_DisplayName);
        };
        class Close: Close {};
        class Content: ctrlEditMulti {
            idc = IDC_CONTENT;
            style = ST_MULTI + ST_NO_RECT;
            font = "EtelkaMonospaceProBold";
            x = pixelW;
            y = POS_H(0.7);
            w = POS_W(15) - 2 * pixelW;
            h = POS_H(17.3) - pixelH;
            sizeEx = POS_H(0.9);
            shadow = 0;
            colorText[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0};
        };
    };
};

class GVAR(RscDocument): GVAR(RscBase) {
    class controls: controls {
        class Border: Border {};
        class Background: Background {
            colorBackground[] = {0.95, 0.95, 0.95, 1};
        };
        class Header: Header {
            text = CSTRING(Document_DisplayName);
        };
        class Close: Close {};
        class Content: ctrlStaticMulti {
            idc = IDC_CONTENT;
            font = "EtelkaMonospaceProBold";
            x = pixelW;
            y = POS_H(0.7);
            w = POS_W(15) - 2 * pixelW;
            h = POS_H(17.3) - pixelH;
            sizeEx = POS_H(0.9);
            shadow = 0;
            colorText[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0};
        };
    };
};

class GVAR(RscPhoto): GVAR(RscBase) {
    w = POS_W(18);
    class controls: controls {
        class Border: Border {
            w = POS_W(18);
        };
        class Background: Background {
            w = POS_W(18) - 2 * pixelW;
        };
        class Header: Header {
            text = CSTRING(Photo_DisplayName);
            w = POS_W(17.3);
        };
        class Close: Close {
            x = POS_W(17.3);
        };
        class Content: ctrlStaticPictureKeepAspect {
            idc = IDC_CONTENT;
            x = pixelW;
            y = POS_H(0.7);
            w = POS_W(18) - 2 * pixelW;
            h = POS_H(17.3) - pixelH;
        };
    };
};

// Zeus Attributes Display
class RscText;
class RscEditMulti;
class RscControlsGroup;
class RscControlsGroupNoScrollbars;

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

class GVAR(RscSetData): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QQGVAR(RscSetData))] call EFUNC(zeus,zeusAttributes));
    onUnload = QUOTE([ARR_3('onUnload', _this, QQGVAR(RscSetData))] call EFUNC(zeus,zeusAttributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class setData: RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(attributeFocus));
                    idc = IDC_ATTRIBUTE_GROUP;
                    x = 0;
                    y = 0;
                    w = POS_W(26);
                    h = POS_H(6);
                    class controls {
                        class Label: RscText {
                            idc = IDC_ATTRIBUTE_LABEL;
                            x = 0;
                            y = 0;
                            w = POS_W(26);
                            h = POS_H(1);
                            colorBackground[] = {0, 0, 0, 0.5};
                        };
                        class Edit: RscEditMulti {
                            idc = IDC_ATTRIBUTE_EDIT;
                            x = pixelW;
                            y = POS_H(1) + pixelH;
                            w = POS_W(26) - pixelW;
                            h = POS_H(5) - pixelH;
                            sizeEx = POS_H(0.9);
                        };
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};
