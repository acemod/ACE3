class RscDisplayMainMap {
    class objects {
        class GVAR(MapGpsDisplay): RscObject {
            show = 0;
            idc = 913589;
            type = 82;
            model = QPATHTOF(data\MapGpsDisplay.p3d);
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
                        class Picture: RscPicture {
                            text = QPATHTOF(UI\MapGpsDisplay_background_ca.paa);
                            // gets displayed in game a little bit washed out depending on rotation angle
                            x = 0;
                            y = 0;
                            w = 1;
                            h = 0.77;
                        };

                        class heading: RscText {
                            idc = 913590;
                            x = 0.15;
                            y = 0;
                            w = 0.35;
                            h = 0.2;
                            style = 0; // ST_LEFT
                            text = "225";
                            colorBackground[] = {0,0,0,0};
                            colorText[] = {0.1235,0.1255,0.0785,1};
                            shadowColor[] = {0,0,0,0};
                            // EtelkaNarrowMediumPro broke with 1.72 hotfix, can revert back to that font if fixed (following 3 uses of PuristaSemibold) [ still broken ]
                            font = "PuristaSemibold";
                            shadow = 0;
                            sizeEx = 0.18;
                        };
                        class altitude: RscText{
                            idc = 913591;
                            x = 0.5;
                            y = 0;
                            w = 0.35;
                            h = 0.2;
                            style = 1; // ST_RIGHT
                            text = "55 m";
                            colorBackground[] = {0,0,0,0};
                            colorText[] = {0.1235,0.1255,0.0785,1};
                            shadowColor[] = {0,0,0,0};
                            font = "PuristaSemibold";
                            shadow = 0;
                            sizeEx = 0.18;
                        };
                        class coordinates: RscText{
                            idc = 913592;
                            x = 0;
                            y = 0.225;
                            w = 1;
                            h = 0.35;
                            style = 2; // ST_CENTER
                            text = "12345 12345";
                            colorBackground[] = {0,0,0,0};
                            colorText[] = {0.1235,0.1255,0.0785,1};
                            shadowColor[] = {0,0,0,0};
                            font = "PuristaSemibold";
                            shadow = 0;
                            sizeEx = 0.333;
                        };
                    };
                };
            };
        };
    };
};
