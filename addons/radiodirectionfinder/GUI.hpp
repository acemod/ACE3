class RscObject;
class RscText;
class RscControlsGroupNoScrollbars;

class RscButton;
class GVAR(menuButton): RscButton {
    colorText[] = {0.7,0.7,0.7,1};
    colorDisabled[] = {0,0,0,0};
    colorBackground[] = {0,0,0,0};
    colorBackgroundDisabled[] = {0,0,0,0};
    colorBackgroundActive[] = {0,0,0,0};
    colorFocused[] = {0,0,0,0};
    colorShadow[] = {0,0,0,0};
    colorBorder[] = {0.5,0.5,0.5,1};
    sizeEx = 0.05;
    shadow = 0;
};
class RscStructuredText;
class GVAR(structuredText): RscStructuredText {
    colorText[] = {0.7,0.7,0.7,1};
    size = 0.05;
    shadow = 0;
};
class GVAR(text5): RscText {
    colorText[] = {0.7,0.7,0.7,1};
    sizeEx = 0.05;
    shadow = 0;
};
class GVAR(text5right): GVAR(text5) {
    style = 1;
};
class GVAR(text15): GVAR(text5) {
    sizeEx = 0.15;
};
class RscListBox;
class GVAR(listBox): RscListBox {
    sizeEx = 0.05;
    arrowEmpty = "#(argb,8,8,3)color(0.7,0.7,0.7,1)";
    arrowFull = "#(argb,8,8,3)color(0.7,0.7,0.7,1)";
    colorText[] = {0.7,0.7,0.7,1};
    colorTextRight[] = {0.7,0.7,0.7,1};
};



class GVAR(dialog) {
    idd = -1;
    movingEnable = 1;
    duration = 9999999;
    fadein = 0;
    fadeout = 0;
    onLoad = QUOTE(with uiNamespace do {GVAR(dialog) = _this select 0;};);
    // onUnload = QUOTE(call FUNC());
    class objects {
        class GVAR(MapGpsDisplay): RscObject {
            // show = 0;
            idc = IDC_OBJECT_SCREEN;
            type = 82;
            model = QPATHTOF(data\ace_handheldDeviceDisplay.p3d);
            // useGlobalLight = 1;
            // minGlobalLightIntensity = -100;
            /*
                1.000 - normal model
                memory - has 4 points in selection "deviceScreen" and then those 4 as individual "deviceScreen tl", "deviceScreen br", "deviceScreen b'", "deviceScreen br"
                geometry - has a simpe box with a name selection component01 (needed to make it dragable)
                */
            scale = 0.333;
            direction[] = {0,1,0};
            up[] = {0,0,-1};
            x = 0.9;
            y = 0.9;
            z = 0.2;
            xBack = 0.9;
            yBack = 0.9;
            zBack = 0.3;
            inBack = 1;
            enableZoom = 1;
            zoomDuration = 0.001;
            class Areas {
                class deviceScreen {
                    selection = "deviceScreen";
                    class controls {
                        class test: RscControlsGroupNoScrollbars {
                            idc = IDC_SCREEN_GROUP;
                            x = 0;
                            y = 0;
                            w = 1;
                            h = 1;
                        };
                    };
                };
            };
        };
    };
};


class RscTitles {
    class GVAR(display) {
        idd = -1;
        movingEnable = 1;
        duration = 9999999;
        fadein = 0;
        fadeout = 0;
        onLoad = QUOTE(with uiNamespace do {GVAR(display) = _this select 0;};);
        class controls {};
        class objects {
            class GVAR(MapGpsDisplay): RscObject {
                // show = 0;
                idc = IDC_OBJECT_SCREEN;
                type = 82;
                model = QPATHTOF(data\ace_handheldDeviceDisplay.p3d);
                // useGlobalLight = 1;
                // minGlobalLightIntensity = -100;
                /*
                1.000 - normal model
                memory - has 4 points in selection "deviceScreen" and then those 4 as individual "deviceScreen tl", "deviceScreen br", "deviceScreen b'", "deviceScreen br"
                geometry - has a simpe box with a name selection component01 (needed to make it dragable)
                */
                scale = 0.333;
                direction[] = {0,1,0};
                up[] = {0,0,-1};
                x = 0.9;
                y = 0.9;
                z = 0.2;
                xBack = 0.9;
                yBack = 0.9;
                zBack = 0.3;
                inBack = 1;
                enableZoom = 1;
                zoomDuration = 0.001;
                class Areas {
                    class deviceScreen {
                        selection = "deviceScreen";
                        class controls {
                            class test: RscControlsGroupNoScrollbars {
                                idc = IDC_SCREEN_GROUP;
                                x = 0;
                                y = 0;
                                w = 1;
                                h = 1;
                            };
                        };
                    };
                };
            };
        };
    };
};
