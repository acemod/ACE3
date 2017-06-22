class RscTitles {
    class DAGR_Text {
        type = 0;
        idc = -1;
        style = 0x01;
        x = 0;
        y = 0;
        w = 0.15;
        h = 0.050;
        text = "";
        colorBackground[] = { 0, 0, 0, 0 };
        colorText[] = { 0.239, 0.216, 0.153, 1 };
        font = "RobotoCondensed";
        sizeEx = 0.04;
        waitForLoad = 0;
    };
    class DAGR_Pic {
        type = 0;
        idc = -1;
        style = 48;
        x = 0;
        y = 0;
        w = 0.50;
        h = 0.50;
        text = "";
        colorBackground[] = {};
        colorText[] = {};
        font = "RobotoCondensed";
        sizeEx = 0.02;
        waitForLoad = 0;
    };

    class DAGR_Display {
        idd = 266850;
        movingEnable = false;
        duration = 100000;
        fadein = 0;
        fadeout = 0;
        name = "Dagr_Display";
        onLoad="uiNamespace setVariable ['DAGR_Display', _this select 0]";
        controls[] = {"DAGR_UI", "DAGR_Grid", "DAGR_Speed", "DAGR_Elevation", "DAGR_Heading", "DAGR_Time", "DAGR_WP", "DAGR_Bearing", "DAGR_DIST"};

        class DAGR_UI : DAGR_Pic {
            idc = 266856;
            x = "(SafeZoneW + SafeZoneX) - 0.45";
            y = "(SafeZoneH + SafeZoneY) - 0.47";
        };

        class DAGR_Grid : DAGR_Text {
            idc = 266851;
            x = "(SafeZoneW + SafeZoneX) - 0.370";// 0.830
            y = "(SafeZoneH + SafeZoneY)- 0.250";// 0.845
            w = 0.25;
            h = 0.06;
            sizeEx = 0.07;
        };
        class DAGR_Speed : DAGR_Text {
            idc = 266852;
            x = "(SafeZoneW + SafeZoneX) - 0.388"; //0.812
            y = "(SafeZoneH + SafeZoneY) - 0.181"; //0.914
        };
        class DAGR_Elevation : DAGR_Text {
            idc = 266853;
            x = "(SafeZoneW + SafeZoneX) - 0.270"; //0.930
            y = "(SafeZoneH + SafeZoneY) - 0.181"; //0.914
        };
        class DAGR_Heading : DAGR_Text {
            idc = 266854;
            x = "(SafeZoneW + SafeZoneX) - 0.413"; //0.787
            y = "(SafeZoneH + SafeZoneY) - 0.1294"; //0.9656
        };
        class DAGR_Time : DAGR_Text {
            idc = 266855;
            x = "(SafeZoneW + SafeZoneX) - 0.275"; //0.925
            y = "(SafeZoneH + SafeZoneY) - 0.129"; //0.965
        };

        class DAGR_WP : DAGR_Text {
            idc = 266857;
            x = "(SafeZoneW + SafeZoneX) - 0.235"; //0.965
            y = "(SafeZoneH + SafeZoneY) - 0.181"; //0.914
        };

        class DAGR_Bearing : DAGR_Text {
            idc = 266858;
            x = "(SafeZoneW + SafeZoneX) - 0.413"; //0.787
            y = "(SafeZoneH + SafeZoneY) - 0.181"; //0.914
        };
        class DAGR_DIST : DAGR_Text {
            idc = 266859;
            x = "(SafeZoneW + SafeZoneX) - 0.265"; //0.935
            y = "(SafeZoneH + SafeZoneY) - 0.129"; //0.965
        };
    };
};
