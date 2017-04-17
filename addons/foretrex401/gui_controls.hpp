#define GUI_GRID_X  (0.0880682)
#define GUI_GRID_Y  (-0.257576)
#define GUI_GRID_W  (0.0284091)
#define GUI_GRID_H  (0.050505)
#define GUI_GRID_WAbs   (1)
#define GUI_GRID_HAbs   (1)

#define ALTITUDE_MEDIAN(ID,XR) class median_##ID: RscPicture { \
        idc = 2320 + ID; \
        x = XR * GUI_GRID_W; \
        y = 2.5 * GUI_GRID_H; \
        w = 0.5 * GUI_GRID_W; \
        h = 6 * GUI_GRID_H; \
    }

/* #Jisopa
$[
    1.063,
    ["ace_foretrex401",[["0.0880682","-0.257576","1","1"],"0.0284091","0.050505","GUI_GRID"],0,0,0],
    [-2300,"MenuAltitude",[2,"",["6 * GUI_GRID_W + GUI_GRID_X","8.5 * GUI_GRID_H + GUI_GRID_Y","20 * GUI_GRID_W","10 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
    [1000,"Title",[2300,"ALTITUDE",["0 * GUI_GRID_W","0 * GUI_GRID_H","20 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
    [1001,"Altitude",[2300,"385m",["0.2 * GUI_GRID_W","1.1 * GUI_GRID_H","19.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","1.3"],[]]
]
*/


class controlsBackground {    
    // Device body
    class ForetrexShell: RscPicture {
        idc = 1200;
        text = QUOTE(PATHTOF(images\shell_day_ca.paa));
        x = -6 * GUI_GRID_W + GUI_GRID_X;
        y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
        w = 40 * GUI_GRID_W;
        h = 29 * GUI_GRID_H;
    };
};

class controls {
    ////////////////////////////////////////////////////////
    // MENU TRACK 1
    ////////////////////////////////////////////////////////
    class MenuTrack1: RscControlsGroupNoScrollbars {
        idc = 2100;
        x = 6 * GUI_GRID_W + GUI_GRID_X;
        y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
        w = 20 * GUI_GRID_W;
        h = 10 * GUI_GRID_H;
        class controls {            
            class Background: RscPicture {
                idc = -1;
                text = QUOTE(PATHTOF(images\menu_track_1_ca.paa));
                x = 0;
                y = 0;
                w = 20 * GUI_GRID_W;
                h = 10 * GUI_GRID_H;
            };

            class TitleMaxSpeed: GVAR(RscText) {
                idc = -1;
                style = ST_LEFT;
                text = "MAX SPEED";
                x = 0 * GUI_GRID_W;
                y = 0 * GUI_GRID_H;
                w = 9 * GUI_GRID_W;
                h = 1 * GUI_GRID_H;
                sizeEx = 0.7 * GUI_GRID_H;
            };

            class MaxSpeed: GVAR(RscText) {
                idc = 2101;
                style = ST_CENTER;
                text = "6.7km";
                x = 0 * GUI_GRID_W;
                y = 1 * GUI_GRID_H;
                w = 9 * GUI_GRID_W;
                h = 4 * GUI_GRID_H;
                sizeEx = 1.5 * GUI_GRID_H;
            };

            class TitleTripOdom: GVAR(RscText) {
                idc = -1;
                style = ST_LEFT;
                text = "TRIP ODOM";
                x = 10.1 * GUI_GRID_W;
                y = 0 * GUI_GRID_H;
                w = 9 * GUI_GRID_W;
                h = 1 * GUI_GRID_H;
                sizeEx = 0.7 * GUI_GRID_H;
            };

            class TripOdom: GVAR(RscText) {
                idc = 2102;
                style = ST_CENTER;
                text = "16.8km";
                x = 10.1 * GUI_GRID_W;
                y = 1 * GUI_GRID_H;
                w = 9 * GUI_GRID_W;
                h = 4 * GUI_GRID_H;
                sizeEx = 1.5 * GUI_GRID_H;
            };

            class TitleMovAvg: GVAR(RscText) {
                idc = -1;
                style = ST_LEFT;
                text = "MOVM AVG";
                x = 0 * GUI_GRID_W;
                y = 5 * GUI_GRID_H;
                w = 9 * GUI_GRID_W;
                h = 1 * GUI_GRID_H;
                sizeEx = 0.7 * GUI_GRID_H;
            };

            class MovAvg: GVAR(RscText) {
                idc = 2101;
                style = ST_CENTER;
                text = "2.1mh";
                x = 0 * GUI_GRID_W;
                y = 6 * GUI_GRID_H;
                w = 9 * GUI_GRID_W;
                h = 4 * GUI_GRID_H;
                sizeEx = 1.5 * GUI_GRID_H;
            };

            class TitleMovTime: GVAR(RscText) {
                idc = -1;
                style = ST_LEFT;
                text = "MOVM TIME";
                x = 10.1 * GUI_GRID_W;
                y = 5 * GUI_GRID_H;
                w = 9 * GUI_GRID_W;
                h = 1 * GUI_GRID_H;
                sizeEx = 0.7 * GUI_GRID_H;
            };

            class MovTime: GVAR(RscText) {
                idc = 2101;
                style = ST_CENTER;
                text = "08:01";
                x = 10.1 * GUI_GRID_W;
                y = 6 * GUI_GRID_H;
                w = 9 * GUI_GRID_W;
                h = 4 * GUI_GRID_H;
                sizeEx = 1.5 * GUI_GRID_H;
            };
        };
    };
    ////////////////////////////////////////////////////////
    // END MENU TRACK 1
    ////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////
    // MENU TRACK 2
    ////////////////////////////////////////////////////////
    class MenuTrack2: RscControlsGroupNoScrollbars {
        idc = 2110;
        x = 6 * GUI_GRID_W + GUI_GRID_X;
        y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
        w = 20 * GUI_GRID_W;
        h = 10 * GUI_GRID_H;
        class controls {            
            class Background: RscPicture {
                idc = -1;
                text = QUOTE(PATHTOF(images\menu_track_2_ca.paa));
                x = 0;
                y = 0;
                w = 20 * GUI_GRID_W;
                h = 10 * GUI_GRID_H;
            };

            class TitleMovAvg: GVAR(RscText) {
                idc = -1;
                style = ST_LEFT;
                text = "MOVN AVG";
                x = 0 * GUI_GRID_W;
                y = 0 * GUI_GRID_H;
                w = 9 * GUI_GRID_W;
                h = 1 * GUI_GRID_H;
                sizeEx = 0.7 * GUI_GRID_H;
            };

            class MovAvg: GVAR(RscText) {
                idc = 2111;
                style = ST_CENTER;
                text = "12.5kmh";
                x = 0 * GUI_GRID_W;
                y = 1 * GUI_GRID_H;
                w = 9 * GUI_GRID_W;
                h = 4 * GUI_GRID_H;
                sizeEx = 1.5 * GUI_GRID_H;
            };

            class TitleElevation: GVAR(RscText) {
                idc = -1;
                style = ST_LEFT;
                text = "ELEVATION";
                x = 10.1 * GUI_GRID_W;
                y = 0 * GUI_GRID_H;
                w = 9 * GUI_GRID_W;
                h = 1 * GUI_GRID_H;
                sizeEx = 0.7 * GUI_GRID_H;
            };

            class Elevation: GVAR(RscText) {
                idc = 2112;
                style = ST_CENTER;
                text = "16.8km";
                x = 10.1 * GUI_GRID_W;
                y = 1 * GUI_GRID_H;
                w = 9 * GUI_GRID_W;
                h = 4 * GUI_GRID_H;
                sizeEx = 1.5 * GUI_GRID_H;
            };

            class TitleLocation: GVAR(RscText) {
                idc = -1;
                style = ST_LEFT;
                text = "LOCATION";
                x = 0 * GUI_GRID_W;
                y = 5 * GUI_GRID_H;
                w = 19 * GUI_GRID_W;
                h = 1 * GUI_GRID_H;
                sizeEx = 0.7 * GUI_GRID_H;
            };

            class Location1: GVAR(RscText) {
                idc = 2113;
                style = ST_CENTER;
                text = "N 38*51.395";
                x = 0 * GUI_GRID_W;
                y = 6 * GUI_GRID_H;
                w = 19 * GUI_GRID_W;
                h = 2 * GUI_GRID_H;
                sizeEx = 1.2 * GUI_GRID_H;
            };
            class Location2: GVAR(RscText) {
                idc = 2114;
                style = ST_CENTER;
                text = "W094*47.950";
                x = 0 * GUI_GRID_W;
                y = 8 * GUI_GRID_H;
                w = 19 * GUI_GRID_W;
                h = 2 * GUI_GRID_H;
                sizeEx = 1.2 * GUI_GRID_H;
            };
        };
    };
    ////////////////////////////////////////////////////////
    // END MENU TRACK 2
    ////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////
    // MENU TRACK 3
    ////////////////////////////////////////////////////////
    class MenuTrack3: RscControlsGroupNoScrollbars {
        idc = 2120;
        x = 6 * GUI_GRID_W + GUI_GRID_X;
        y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
        w = 20 * GUI_GRID_W;
        h = 10 * GUI_GRID_H;
        class controls {            
            class Background: RscPicture {
                idc = -1;
                text = QUOTE(PATHTOF(images\menu_track_3_ca.paa));
                x = 0;
                y = 0;
                w = 20 * GUI_GRID_W;
                h = 10 * GUI_GRID_H;
            };

            class TitleLocation: GVAR(RscText) {
                idc = -1;
                style = ST_LEFT;
                text = "LOCATION";
                x = 0 * GUI_GRID_W;
                y = 0 * GUI_GRID_H;
                w = 19 * GUI_GRID_W;
                h = 1 * GUI_GRID_H;
                sizeEx = 0.7 * GUI_GRID_H;
            };

            class Location1: GVAR(RscText) {
                idc = 2123;
                style = ST_CENTER;
                text = "N 38*51.395";
                x = 0 * GUI_GRID_W;
                y = 1 * GUI_GRID_H;
                w = 19 * GUI_GRID_W;
                h = 2 * GUI_GRID_H;
                sizeEx = 1.2 * GUI_GRID_H;
            };
            class Location2: GVAR(RscText) {
                idc = 2124;
                style = ST_CENTER;
                text = "W094*47.950";
                x = 0 * GUI_GRID_W;
                y = 3 * GUI_GRID_H;
                w = 19 * GUI_GRID_W;
                h = 2 * GUI_GRID_H;
                sizeEx = 1.2 * GUI_GRID_H;
            };

            class TitleElevation: GVAR(RscText) {
                idc = -1;
                style = ST_LEFT;
                text = "ELEVATION";
                x = 0 * GUI_GRID_W;
                y = 5 * GUI_GRID_H;
                w = 19 * GUI_GRID_W;
                h = 1 * GUI_GRID_H;
                sizeEx = 0.7 * GUI_GRID_H;
            };

            class Elevation: GVAR(RscText) {
                idc = 2125;
                style = ST_CENTER;
                text = "4425ft";
                x = 0 * GUI_GRID_W;
                y = 6 * GUI_GRID_H;
                w = 19 * GUI_GRID_W;
                h = 4 * GUI_GRID_H;
                sizeEx = 2.2 * GUI_GRID_H;
            };
        };
    };
    ////////////////////////////////////////////////////////
    // END MENU TRACK 3
    ////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////
    // MENU TIMER
    ////////////////////////////////////////////////////////
    class MenuTimer: RscControlsGroupNoScrollbars {
        idc = 2400;
        x = 6 * GUI_GRID_W + GUI_GRID_X;
        y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
        w = 20 * GUI_GRID_W;
        h = 10 * GUI_GRID_H;
        class controls {
            class Title: GVAR(RscText) {
                idc = -1;
                style = ST_LEFT;
                text = "TIMER";
                x = 0 * GUI_GRID_W;
                y = 0 * GUI_GRID_H;
                w = 10 * GUI_GRID_W;
                h = 2 * GUI_GRID_H;
                sizeEx = 2 * GUI_GRID_H;
            };
            class LegendIncrement: GVAR(RscText) {
                idc = 2402;
                style = ST_RIGHT;
                text = "BACK TO 5:00";
                x = 10 * GUI_GRID_W;
                y = 0 * GUI_GRID_H;
                w = 10 * GUI_GRID_W;
                h = 1 * GUI_GRID_H;
                sizeEx = 0.8 * GUI_GRID_H;
            };
            class LegendDecrement: GVAR(RscText) {
                idc = 2403;
                style = ST_RIGHT;
                text = "SKIP TO 4:00";
                x = 10 * GUI_GRID_W;
                y = 1 * GUI_GRID_H;
                w = 10 * GUI_GRID_W;
                h = 1 * GUI_GRID_H;
                sizeEx = 0.8 * GUI_GRID_H;
            };
            class Time: GVAR(RscText) {
                idc = 2404;
                style = ST_CENTER;
                text = "04:43";
                x = 0 * GUI_GRID_W;
                y = 2 * GUI_GRID_H;
                w = 20 * GUI_GRID_W;
                h = 6 * GUI_GRID_H;
                sizeEx = 4 * GUI_GRID_H;
            };
            class Button: GVAR(RscText) {
                idc = 2405;
                style = ST_CENTER;
                text = "STOP";
                x = 5 * GUI_GRID_W;
                y = 8.8 * GUI_GRID_H;
                w = 10 * GUI_GRID_W;
                h = 1.1 * GUI_GRID_H;
                sizeEx = 0.8 * GUI_GRID_H;
                colorText[] = {0.67, 0.71, 0.64, 1};
                colorBackground[] = {0.1, 0.1, 0.1, 1};
            };
        };
    };
    ////////////////////////////////////////////////////////
    // END MENU TIMER
    ////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////
    // MENU ALTITUDE
    ////////////////////////////////////////////////////////
    class MenuAltitude: RscControlsGroupNoScrollbars {
        idc = 2300;
        x = 6 * GUI_GRID_W + GUI_GRID_X;
        y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
        w = 20 * GUI_GRID_W;
        h = 10 * GUI_GRID_H;
        class controls {
            class Background: RscPicture {
                idc = -1;
                text = QUOTE(PATHTOF(images\menu_altitude_ca.paa));
                x = 0;
                y = 0;
                w = 20 * GUI_GRID_W;
                h = 10 * GUI_GRID_H;
            };
            class Title: GVAR(RscText) {
                idc = 2301;
                style = ST_CENTER;
                text = "ALTITUDE";
                x = 0 * GUI_GRID_W;
                y = 0 * GUI_GRID_H;
                w = 20 * GUI_GRID_W;
                h = 1 * GUI_GRID_H;
                sizeEx = 0.9 * GUI_GRID_H;
            };
            class Altitude: GVAR(RscText) {
                idc = 2302;
                style = ST_CENTER;
                text = "385m";
                x = 0 * GUI_GRID_W;
                y = 0.9 * GUI_GRID_H;
                w = 20 * GUI_GRID_W;
                h = 1.5 * GUI_GRID_H;
                sizeEx = 1.1 * GUI_GRID_H;
            };
            class Distance: GVAR(RscText) {
                idc = 2303;
                style = ST_CENTER;
                text = "1km";
                x = 0 * GUI_GRID_W;
                y = 8.5 * GUI_GRID_H;
                w = 20 * GUI_GRID_W;
                h = 1.5 * GUI_GRID_H;
                sizeEx = 0.8 * GUI_GRID_H;
            };

            ALTITUDE_MEDIAN(39,0);
            ALTITUDE_MEDIAN(38,0.5);
            ALTITUDE_MEDIAN(37,1);
            ALTITUDE_MEDIAN(36,1.5);
            ALTITUDE_MEDIAN(35,2);
            ALTITUDE_MEDIAN(34,2.5);
            ALTITUDE_MEDIAN(33,3);
            ALTITUDE_MEDIAN(32,3.5);
            ALTITUDE_MEDIAN(31,4);
            ALTITUDE_MEDIAN(30,4.5,10);
            ALTITUDE_MEDIAN(29,5);
            ALTITUDE_MEDIAN(28,5.5);
            ALTITUDE_MEDIAN(27,6);
            ALTITUDE_MEDIAN(26,6.5);
            ALTITUDE_MEDIAN(25,7);
            ALTITUDE_MEDIAN(24,7.5);
            ALTITUDE_MEDIAN(23,8,10);
            ALTITUDE_MEDIAN(22,8.5);
            ALTITUDE_MEDIAN(21,9);
            ALTITUDE_MEDIAN(20,9.5,10);
            ALTITUDE_MEDIAN(19,10);
            ALTITUDE_MEDIAN(18,10.5);
            ALTITUDE_MEDIAN(17,11);
            ALTITUDE_MEDIAN(16,11.5);
            ALTITUDE_MEDIAN(15,12);
            ALTITUDE_MEDIAN(14,12.5);
            ALTITUDE_MEDIAN(13,13);
            ALTITUDE_MEDIAN(12,13.5);
            ALTITUDE_MEDIAN(11,14);
            ALTITUDE_MEDIAN(10,14.5);
            ALTITUDE_MEDIAN(9,15);
            ALTITUDE_MEDIAN(8,15.5);
            ALTITUDE_MEDIAN(7,16);
            ALTITUDE_MEDIAN(6,16.5);
            ALTITUDE_MEDIAN(5,17);
            ALTITUDE_MEDIAN(4,17.5);
            ALTITUDE_MEDIAN(3,18);
            ALTITUDE_MEDIAN(2,18.5);
            ALTITUDE_MEDIAN(1,19);
            ALTITUDE_MEDIAN(0,19.5);
        };
    };
    ////////////////////////////////////////////////////////
    // END MENU ALTITUDE
    ////////////////////////////////////////////////////////


    ////////////////////////////////////////////////////////
    //  INTERACTION BUTTONS
    ////////////////////////////////////////////////////////
    class ButtonPage: GVAR(HiddenButton) {
        idc = -1;
        x = 5.5 * GUI_GRID_W + GUI_GRID_X;
        y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
        w = 3.52 * GUI_GRID_W;
        h = 1.98 * GUI_GRID_H;
    };
    class ButtonMenu: GVAR(HiddenButton) {
        idc = -1;
        x = 10 * GUI_GRID_W + GUI_GRID_X;
        y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
        w = 3.52 * GUI_GRID_W;
        h = 1.98 * GUI_GRID_H;
    };
    class ButtonDown: GVAR(HiddenButton) {
        idc = -1;
        x = 17.4 * GUI_GRID_W + GUI_GRID_X;
        y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
        w = 3.52 * GUI_GRID_W;
        h = 1.98 * GUI_GRID_H;
    };
    class ButtonUp: GVAR(HiddenButton) {
        idc = -1;
        x = 22.5 * GUI_GRID_W + GUI_GRID_X;
        y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
        w = 3.52 * GUI_GRID_W;
        h = 1.98 * GUI_GRID_H;
    };
    class ButtonPower: GVAR(HiddenButton) {
        idc = -1;
        x = 1 * GUI_GRID_W + GUI_GRID_X;
        y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
        w = 3.52 * GUI_GRID_W;
        h = 1.98 * GUI_GRID_H;
    };
    ////////////////////////////////////////////////////////
    // END INTERACTION BUTTONS
    ////////////////////////////////////////////////////////
};