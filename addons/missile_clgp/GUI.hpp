class RscObject;
class RscButton;

class GVAR(copperhead_dialButton): RscButton {
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
    // colorBackground[] = {0,0,1,0.1};
    colorBackgroundDisabled[] = {0,0,0,0};
    colorBackgroundActive[] = {0,0,0,0};
    colorFocused[] = {0,0,0,0};
    text = "";
};

class GVAR(copperhead_dialog) {
    idd = -1;
    enableSimulation = 1;
    onLoad = QUOTE(with uiNamespace do {GVAR(copperhead_dialog) = _this select 0});
    duration = 1e99;
    class ControlsBackground {};
    class Controls {};
    class Objects {
        class TheThing: RscObject {
            type = 82; 
            idc = 100;
            model = QPATHTOF(data\ace_copperhead_interactive.p3d);
            direction[] = {0,0,1};
            up[] = {0,1,0};
            position[] = {0,-0.338,0.5};
            positionBack[] = {0,-0.338,0.5};
            enableZoom = 0;
            zoomDuration = 1;
            scale = 1;
            inBack = 0;
            class Areas {
                class Dial1 {
                    selection = "dial1";
                    class Controls {
                        class ButtonDial: GVAR(copperhead_dialButton) {
                            idc = 111;
                            tooltip = CSTRING(copperhead_dial_FlightProfile);
                        };
                    };
                };
                class Dial2 {
                    selection = "dial2";
                    class Controls {
                        class ButtonDial: GVAR(copperhead_dialButton) {
                            idc = 112;
                            tooltip = CSTRING(copperhead_dial_GuidanceDelay);
                        };
                    };
                };
                class Dial3 {
                    selection = "dial3";
                    class Controls {
                        class ButtonDial: GVAR(copperhead_dialButton) {
                            idc = 113;
                            tooltip = ECSTRING(laser,laserCode);
                        };
                    };
                };
                class Dial4 {
                    selection = "dial4";
                    class Controls {
                        class ButtonDial: GVAR(copperhead_dialButton) {
                            idc = 114;
                            tooltip = ECSTRING(laser,laserCode);
                        };
                    };
                };
                class Dial5 {
                    selection = "dial5";
                    class Controls {
                        class ButtonDial: GVAR(copperhead_dialButton) {
                            idc = 115;
                            tooltip = ECSTRING(laser,laserCode);
                        };
                    };
                };
            };
        };
    };
};
