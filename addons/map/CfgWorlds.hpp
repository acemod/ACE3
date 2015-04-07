class CfgWorlds {
    class DefaultWorld;
    class CAWorld: DefaultWorld {
        class Grid {};
    };
    class Stratis: CAWorld {
        class Grid: Grid {
            class Zoom1 {
                zoomMax = 1e-030;
                format = "XY";
                formatX = "0000";
                formatY = "0000";
                stepX = 10;
                stepY = -10;
            };
            class Zoom2 {
                zoomMax = 0.2;
                format = "XY";
                formatX = "000";
                formatY = "000";
                stepX = 100;
                stepY = -100;
            };
            class Zoom3 {
                zoomMax = 0.95;
                format = "XY";
                formatX = "00";
                formatY = "00";
                stepX = 1000;
                stepY = -1000;
            };
            class Zoom4 {
                zoomMax = 1e+030;
                format = "XY";
                formatX = "0";
                formatY = "0";
                stepX = 10000;
                stepY = -10000;
            };
        };
    };
    class Altis: CAWorld {
        class Grid: Grid {
            class Zoom1 {
                zoomMax = 1e-030;
                format = "XY";
                formatX = "0000";
                formatY = "0000";
                stepX = 10;
                stepY = -10;
            };
            class Zoom2 {
                zoomMax = 0.05;
                format = "XY";
                formatX = "000";
                formatY = "000";
                stepX = 100;
                stepY = -100;
            };
            class Zoom3 {
                zoomMax = 0.5;
                format = "XY";
                formatX = "00";
                formatY = "00";
                stepX = 1000;
                stepY = -1000;
            };
            class Zoom4 {
                zoomMax = 1e+030;
                format = "XY";
                formatX = "0";
                formatY = "0";
                stepX = 10000;
                stepY = -10000;
            };
        };
    };
};
