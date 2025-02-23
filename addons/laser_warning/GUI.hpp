class RscObject;
class RscButton;
class RscControlsGroup;

class GVAR(pushButton): RscButton {
    style = 2;
    x = 0;
    y = 0;
    w = 99;
    h = 99;
    soundEnter[] = {"", 0.2, 1};
    soundPush[] = {"", 0.2, 1};
    soundClick[] = {"", 0.2, 1};
    soundEscape[] = {"", 0.2, 1};
    color[] = {0,0,0,0};
    colorBackground[] = {0,0,1,0};
    colorBackgroundDisabled[] = {0,0,0,0};
    colorBackgroundActive[] = {0,0,0,0};
    colorFocused[] = {0,0,0,0};
    text = "";
};

class GVAR(box_dialog) {
    idd = -1;
    enableSimulation = 1;
    onLoad = QUOTE(with uiNamespace do {GVAR(box_dialog) = _this select 0});
    duration = 1e99;
    class ControlsBackground {};
    class Controls {};
    class Objects {
        class Box: RscObject {
            type = 82;
            idc = 100;
            model = QPATHTOF(data\laser_warning_box.p3d);
            direction[] = {0,0,1};
            up[] = {0,1,0};
            position[] = {0,0,0.3};
            positionBack[] = {0,0,0.3};
            enableZoom = 0;
            zoomDuration = 1;
            scale = 1;
            inBack = 0;
            class Areas {
                class Screen {
                    selection = "screen";
                    class Controls {
                        class Menu: RscControlsGroup {
                            x = 0;
                            y = 0;
                            w = 1;
                            h = 1;
                            shadow = 0;
                            style = 16;
                            class Controls {

                            };
                        };
                    };
                };
                class PowerSwitch {
                    selection = "powerswitch";
                    class Controls {
                        class Switch: GVAR(pushButton) {
                            idc = 212;
                            tooltip = "Toggle Power";
                        };
                    };
                };
                class PB1 {
                    selection = "pb1";
                    class Controls {
                        class PB: GVAR(pushButton) {
                            idc = 111;
                            tooltip = "Push Button 1";
                        };
                    };
                };
                class PB2 {
                    selection = "pb2";
                    class Controls {
                        class PB: GVAR(pushButton) {
                            idc = 112;
                            tooltip = "Push Button 2";
                        };
                    };
                };
                class PB3 {
                    selection = "pb3";
                    class Controls {
                        class PB: GVAR(pushButton) {
                            idc = 113;
                            tooltip = "Push Button 3";
                        };
                    };
                };
                class PB4 {
                    selection = "pb4";
                    class Controls {
                        class PB: GVAR(pushButton) {
                            idc = 114;
                            tooltip = "Push Button 4";
                        };
                    };
                };
                class PB5 {
                    selection = "pb5";
                    class Controls {
                        class PB: GVAR(pushButton) {
                            idc = 115;
                            tooltip = "Push Button 5";
                        };
                    };
                };
                class PB6 {
                    selection = "pb6";
                    class Controls {
                        class PB: GVAR(pushButton) {
                            idc = 116;
                            tooltip = "Push Button 6";
                        };
                    };
                };
                class PB7 {
                    selection = "pb7";
                    class Controls {
                        class PB: GVAR(pushButton) {
                            idc = 117;
                            tooltip = "Push Button 7";
                        };
                    };
                };
                class PB8 {
                    selection = "pb8";
                    class Controls {
                        class PB: GVAR(pushButton) {
                            idc = 118;
                            tooltip = "Push Button 8";
                        };
                    };
                };
            };
        };
    };
};