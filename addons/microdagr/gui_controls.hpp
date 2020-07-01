class controlsBackground {
    class BackgroundBlackScreen: GVAR(RscText) {
        idc = -1;
        x = X_PART(-1);
        y = Y_PART(-1);
        //Cover the "seams" and make it bigger
        w = W_PART(27);
        h = H_PART(27);
        colorBackground[] = {0,0,0,1};
    };
    class StatusBarBS: RscPicture {
        idc = -1;
        text = QPATHTOF(images\microDAGR_topBar.paa);
        x = X_PART(0);
        y = Y_PART(0);
        w = W_PART(25);
        h = H_PART(2);
    };
    class RangefinderConnectedIcon: RscPicture {
        idc = IDC_RANGEFINDERCONNECTEDICON;
        text = QUOTE(PATHTOF(images\icon_menuLaser.paa));
        x = X_PART(6.35);
        y = Y_PART(0.1);
        w = W_PART(2.7);
        h = H_PART(1.8);
    };
    class ClockText: GVAR(RscText) {
        idc = IDC_CLOCKTEXT;
        style = ST_RIGHT;
        // text = "12:00";
        x = X_PART(0);
        y = Y_PART(0.2);
        w = W_PART(15);
        h = H_PART(1.8);
        sizeEx = H_PART(1.5);
        colorText[] = {0,0.67,0.22,1};
    };
    class ClockText2: GVAR(RscText) {
        idc = -1;
        style = ST_LEFT;
        text = "L";
        x = X_PART(14.75);
        y = Y_PART(0.2);
        w = W_PART(2);
        h = H_PART(1.8);
        sizeEx = H_PART(1.5);
    };
    class MapPlain: RscMapControl {
        idc = IDC_MAPPLAIN;
        x = X_PART(0);
        y = Y_PART(2);
        w = W_PART(25);
        h = H_PART(19);
        onDraw = QUOTE(_this call FUNC(mapOnDrawEH));
        onMouseButtonDblClick = QUOTE(_this call FUNC(mapDoubleTapEH));
        onMouseButtonDown = QUOTE(_this call FUNC(mapButtonDownEH));

        scaleMin = 0.005;
        scaleMax = 10;  //Lets the mini display zoom out far enough
        drawObjects = 0;
        text = "#(argb,8,8,3)color(1,1,1,1)";
        maxSatelliteAlpha = 0;
        alphaFadeStartScale = 100;
        alphaFadeEndScale = 100;
        colorSea[] = {0.467,0.631,0.851,0.25};
        colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
        colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
        colorGrid[] = {0,0,0,0.15};
        colorGridMap[] = {0,0,0,0.2};

        //Text sizes:
        sizeExLabel = 0;
        sizeExGrid = H_PART(0.5);
        sizeExUnits = 0;
        sizeExNames = H_PART(2); //Marker's Text
        sizeExInfo = 0;
        sizeExLevel = 0;
        sizeEx = H_PART(1);

        ptsPerSquareRoad = 0.75;
        ptsPerSquareObj = 2000; //don't show buildings

        showCountourInterval = 0;

        //Copy style from ace_map's config.cpp:
        colorTracks[] = {1.0,0.0,0.0,1};
        colorTracksFill[] = {1.0,1.0,0.0,1};
        colorRoads[] = {0.0,0.0,0.0,1};
        colorRoadsFill[] = {1,1,0,1};
        colorMainRoads[] = {0.0,0.0,0.0,1};
        colorMainRoadsFill[] = {1,0.6,0.4,1};
        colorRailWay[] = {0.8,0.2,0,1};

        colorBackground[] = {0.929412, 0.929412, 0.929412, 1.0};
        colorOutside[] = {0.929412, 0.929412, 0.929412, 1.0};
        colorCountlines[] = {0.647059, 0.533333, 0.286275, 0.5};
        colorMainCountlines[] = {0.858824, 0, 0,0.5};
        colorForest[] = {0.6, 0.8, 0.2, 0.1};
        colorForestBorder[] = {0,1,0,0.25};
        colorLevels[] = {0.0, 0.0, 0.0, 0.5};
        colorRocks[] = {0.50, 0.50, 0.50, 0};
    };
    class MapDetails: MapPlain {
        idc = IDC_MAPDETAILS;
        x = X_PART(0);
        y = Y_PART(2);
        w = W_PART(25);
        h = H_PART(19);
        onDraw = QUOTE(_this call FUNC(mapOnDrawEH));
        onMouseButtonDblClick = QUOTE(_this call FUNC(mapDoubleTapEH));
        onMouseButtonDown = QUOTE(_this call FUNC(mapButtonDownEH));

        ptsPerSquareObj = 9;

        maxSatelliteAlpha = 0.5;

        colorRocks[] = {0.50, 0.50, 0.50, 0.50};

        class hospital: Hospital {color[] = {0,0,0,0.25};};
        class church: Church {color[] = {0,0,0,0.25};};
        class lighthouse: Lighthouse {color[] = {0,0,0,0.25};};
        class power: power {color[] = {0,0,0,0.25};};
        class fuelstation: Fuelstation {color[] = {0,0,0,0.25};};
        class transmitter: Transmitter {color[] =  {0,0,0,0.25};};

    };
    class MapCompass: RscMapControlEmpty {
        idc = IDC_MAPCOMPASS;
        x = X_PART(0);
        y = Y_PART(2);
        w = W_PART(25);
        h = H_PART(19);
        onDraw = QUOTE(_this call FUNC(mapOnDrawEH));

        showMarkers = 0;
        colorBackground[] = {0,0,0,1};
        colorOutside[] = {0,0,0,1};
        moveOnEdges = 0;
    };
};

class controls {
    class TopMenuClick: GVAR(RscActiveTextPicture) {
        idc = IDC_TOPMENUBUTTON;
        text = "#(argb,8,8,3)color(0,0,0,0)";
        x = X_PART(0);
        y = Y_PART(0);
        w = W_PART(25);
        h = H_PART(2);
        onbuttonclick = QUOTE([3] call FUNC(saveCurrentAndSetNewMode));
    };

    //Mode: Display
    class ModeDisplay: RscControlsGroupNoScrollbars {
        idc = IDC_MODEDISPLAY;
        x = X_PART(0);
        y = Y_PART(2);
        w = W_PART(25);
        h = H_PART(19);
        class Controls {
            class MGRSNew: GVAR(RscText) {
                idc = -1;
                text = CSTRING(controlMGRS);
                x = W_PART(0.5);
                y = H_PART(0);
                w = W_PART(10);
                h = H_PART(1);
                sizeEx = H_PART(1);
            };
            class WGD: GVAR(RscText) {
                idc = -1;
                style = ST_RIGHT;
                text = CSTRING(controlWGD);
                x = W_PART(14.5);
                y = H_PART(0);
                w = W_PART(10);
                h = H_PART(1);
                sizeEx = H_PART(1);
            };
            class UTMGrid: GVAR(RscText) {
                idc = IDC_MODEDISPLAY_UTMGRID;
                // text = "15T XG";
                x = W_PART(4.5);
                y = H_PART(1.5);
                w = W_PART(10);
                h = H_PART(2);
                sizeEx = H_PART(2);
            };
            class selfIcon: RscPicture {
                idc = -1;
                text = QPATHTOF(images\icon_self.paa);
                x = W_PART(0.5);
                y = H_PART(2);
                w = W_PART(4);
                h = H_PART(3);
            };
            class Easting: GVAR(RscText) {
                idc = IDC_MODEDISPLAY_EASTING;
                // text = "11994e"; //--- ToDo: Localize;
                style = ST_RIGHT;
                x = W_PART(14.5);
                y = H_PART(1.5);
                w = W_PART(10);
                h = H_PART(2);
                sizeEx = H_PART(2);
            };
            class Northing: GVAR(RscText) {
                idc = IDC_MODEDISPLAY_NORTHING;
                // text = "11994n"; //--- ToDo: Localize;
                style = ST_RIGHT;
                x = W_PART(14.5);
                y = H_PART(3.5);
                w = W_PART(10);
                h = H_PART(2);
                sizeEx = H_PART(2);
            };
            class ElevationText: GVAR(RscText) {
                idc = -1;
                text = "$STR_A3_disp_editor_elevation";
                x = W_PART(0.5);
                y = H_PART(6);
                w = W_PART(10);
                h = H_PART(1.5);
                sizeEx = H_PART(1.25);
            };
            class ElevationNum: GVAR(RscText) {
                idc = IDC_MODEDISPLAY_ELEVATIONNUM;
                // text = "+000232 MSL"; //--- ToDo: Localize;
                style = ST_RIGHT;
                x = W_PART(12);
                y = H_PART(6);
                w = W_PART(12.5);
                h = H_PART(1.5);
                sizeEx = H_PART(1.5);
            };
            class RscPicture_1201: RscPicture {
                idc = -1;
                text = "#(argb,8,8,3)color(1,1,1,0.75)";
                x = W_PART(0.5);
                y = H_PART(8.115);
                w = W_PART(24);
                h = H_PART(0.05);
            };
            class CompasIcon: RscPicture {
                idc = -1;
                text = QPATHTOF(images\icon_infoCompass.paa);
                x = W_PART(0.5);
                y = H_PART(8.5);
                w = W_PART(2);
                h = H_PART(1.5);
            };
            class HeadingNum: GVAR(RscText) {
                idc = IDC_MODEDISPLAY_HEADINGNUM;
                // text = "097.2oM"; //--- ToDo: Localize;
                x = W_PART(4);
                y = H_PART(8.5);
                w = W_PART(10);
                h = H_PART(1.5);
                sizeEx = H_PART(1.5);
            };
            class SpeedNum: GVAR(RscText) {
                idc = IDC_MODEDISPLAY_SPEEDNUM;
                // text = "34kph"; //--- ToDo: Localize;
                style = ST_RIGHT;
                x = W_PART(14.5);
                y = H_PART(8.5);
                w = W_PART(7.5);
                h = H_PART(1.5);
                sizeEx = H_PART(1.5);
            };
            class RscPicture_1204: RscPicture {
                idc = -1;
                text = "#(argb,8,8,3)color(1,1,1,0.75)";
                x = W_PART(0.5);
                y = H_PART(10.45);
                w = W_PART(24);
                h = H_PART(0.05);
            };
            class modePosTimeCG: RscControlsGroupNoScrollbars {
                idc = IDC_MODEDISPLAY_MODEPOSTIMECG;
                x = W_PART(0);
                y = H_PART(10.5);
                w = W_PART(25);
                h = H_PART(8.5);
                class controls {
                    class TimeIcon: RscPicture {
                        idc = -1;
                        text = QPATHTOF(images\icon_infoClock.paa);
                        x = W_PART(0.5);
                        y = H_PART(3.5);
                        w = W_PART(2);
                        h = H_PART(1.5);
                    };
                    class TimeDisplayGreen1: GVAR(RscText) {
                        idc = IDC_MODEDISPLAY_TIMEDISPLAYGREEN1;
                        x = W_PART(5);
                        y = H_PART(2.75);
                        w = W_PART(15);
                        h = H_PART(1.5);
                        style = ST_CENTER;
                        sizeEx = H_PART(1.5);
                        colorText[] = {0,0.67,0.22,1};
                    };
                    class TimeDisplayGreen2: TimeDisplayGreen1 {
                        idc = IDC_MODEDISPLAY_TIMEDISPLAYGREEN2;
                        y = H_PART(4.25);
                    };
                };
            };
            class modePosTargetCG: RscControlsGroupNoScrollbars {
                idc = IDC_MODEDISPLAY_MODEPOSTARGETCG;
                x = W_PART(0);
                y = H_PART(10.5);
                w = W_PART(25);
                h = H_PART(8.5);
                class controls {
                    class TargetIcon: RscPicture {
                        idc = IDC_MODEDISPLAY_TARGETICON;
                        text = QPATHTOF(images\icon_menuMark.paa);
                        x = W_PART(0.5);
                        y = H_PART(0.5);
                        w = W_PART(2);
                        h = H_PART(1.5);
                    };
                    class TrackNum: GVAR(RscText) {
                        idc = IDC_MODEDISPLAY_TRACKNUM;
                        // text = "097.2oM"; //--- ToDo: Localize;
                        x = W_PART(4);
                        y = H_PART(0.5);
                        w = W_PART(10);
                        h = H_PART(1.5);
                        sizeEx = H_PART(1.5);
                    };
                    class TargetRangeText: GVAR(RscText) {
                        idc = -1;
                        text = CSTRING(controlRange);
                        x = W_PART(0.5);
                        y = H_PART(2);
                        w = W_PART(7.5);
                        h = H_PART(1.5);
                        sizeEx = H_PART(1.25);
                    };
                    class TargetRangeNum: GVAR(RscText) {
                        idc = IDC_MODEDISPLAY_TARGETRANGENUM;
                        // text = "1250 m";
                        style = ST_RIGHT;
                        x = W_PART(14.5);
                        y = H_PART(2);
                        w = W_PART(10);
                        h = H_PART(1.5);
                        sizeEx = H_PART(1.5);
                    };
                    class TargetElevationText: GVAR(RscText) {
                        idc = -1;
                        text = "$STR_A3_disp_editor_elevation"; //--- ToDo: Localize;
                        x = W_PART(0.5);
                        y = H_PART(3.5);
                        w = W_PART(10);
                        h = H_PART(1.5);
                        sizeEx = H_PART(1.25);
                    };
                    class TargetElevationNum: GVAR(RscText) {
                        idc = IDC_MODEDISPLAY_TARGETELEVATIONNUM;
                        // text = "+000232 MSL"; //--- ToDo: Localize;
                        style = ST_RIGHT;
                        x = W_PART(12);
                        y = H_PART(3.5);
                        w = W_PART(12.5);
                        h = H_PART(1.5);
                        sizeEx = H_PART(1.5);
                    };
                    class TargetName: GVAR(RscText) {
                        idc = IDC_MODEDISPLAY_TARGETNAME;
                        // text = "43243 33432"; //--- ToDo: Localize;
                        style = ST_CENTER;
                        x = W_PART(1);
                        y = H_PART(5.5);
                        w = W_PART(23);
                        h = H_PART(2);
                        sizeEx = H_PART(2);
                    };
                };
            };
        };
    };

    //Mode: Compass
    class ModeCompass: RscControlsGroupNoScrollbars {
        idc = IDC_MODECOMPASS;
        x = X_PART(0);
        y = Y_PART(2);
        w = W_PART(25);
        h = H_PART(19);
        class Controls {

            class CompassHeader: GVAR(RscText) {
                idc = -1;
                style = ST_CENTER;
                text = CSTRING(compasDirection);
                x = W_PART(0);
                y = H_PART(0);
                w = W_PART(25);
                h = H_PART(1.5);
                sizeEx = H_PART(1.5);
            };
            class CompassHeading: GVAR(RscText) {
                idc = IDC_MODECOMPASS_HEADING;
                style = ST_LEFT;
                x = W_PART(0);
                y = H_PART(1.5);
                w = W_PART(25);
                h = H_PART(1.25);
                sizeEx = H_PART(1.25);
                colorText[] = {0.533,0.769,0.76,1};
            };
            class CompassSpeed: CompassHeading {
                idc = IDC_MODECOMPASS_SPEED;
                style = ST_RIGHT;
            };
            class CompassBearing: CompassHeading {
                idc = IDC_MODECOMPASS_BEARING;
                y = H_PART(16.25);
                style = ST_LEFT;
                colorText[] = {1,0.564,0.564,1};
            };
            class CompassRange: CompassHeading {
                idc = IDC_MODECOMPASS_RANGE;
                y = H_PART(16.25);
                style = ST_RIGHT;
                colorText[] = {1,0.564,0.564,1};
            };
            class CompassTARGET: CompassHeader {
                idc = IDC_MODECOMPASS_TARGET;
                y = H_PART(17.5);
            };
        };
    };


    //Mode: Map
    class mapTrackButton: GVAR(RscActiveTextPicture) {
        onbuttonclick = QUOTE(['autotrack'] call FUNC(modeMapButtons));
        idc = IDC_MODEMAP_MAPTRACKBUTTON;
        text = QPATHTOF(images\icon_mapTrack.paa);
        x = X_PART(11);
        y = Y_PART(18.75);
        w = W_PART(3);
        h = H_PART(2.25);
    };
    class mapZoomIn: mapTrackButton {
        onbuttonclick = QUOTE(['zoomin'] call FUNC(modeMapButtons));
        idc = IDC_MODEMAP_MAPZOOMIN;
        text = QPATHTOF(images\icon_mapPlus.paa);
        color[] = {1,1,1,0.4};
        x = X_PART(4);
    };
    class mapZoomOut: mapTrackButton {
        onbuttonclick = QUOTE(['zoomout'] call FUNC(modeMapButtons));
        idc = IDC_MODEMAP_MAPZOOMOUT;
        text = QPATHTOF(images\icon_mapMinus.paa);
        color[] = {1,1,1,0.4};
        x = X_PART(18);
    };


    // Mode: Menu
    class ModeMenu: RscControlsGroupNoScrollbars {
        idc = IDC_MODEMENU;
        x = X_PART(0);
        y = Y_PART(2);
        w = W_PART(25);
        h = H_PART(19);
        class Controls {
            class ButtonTL: GVAR(RscActiveTextPicture) {
                idc = -1;
                text = QPATHTOF(images\icon_menuMark.paa);
                x = W_PART(3);
                y = H_PART(1.5);
                w = W_PART(8);
                h = H_PART(6);
                onbuttonclick = QUOTE([4] call FUNC(saveCurrentAndSetNewMode));
            };
            class ButtonTR: ButtonTL {
                text = QPATHTOF(images\icon_menuWaypoints.paa);
                x = W_PART(14);
                y = H_PART(1.5);
                onbuttonclick = QUOTE([5] call FUNC(saveCurrentAndSetNewMode));
            };
            class ButtonBL: ButtonTL {
                text = QUOTE(PATHTOF(images\icon_menuLaser.paa));
                x = W_PART(3);
                y = H_PART(10.5);
                onbuttonclick = QUOTE(_this call FUNC(appMenuButtonConnectRangefinder));
            };
            class ButtonBR: ButtonTL {
                text = QPATHTOF(images\icon_menuSettings.paa);
                x = W_PART(14);
                y = H_PART(10.5);
                onbuttonclick = QUOTE([6] call FUNC(saveCurrentAndSetNewMode));
            };
            class TextTL: GVAR(RscText) {
                idc = -1;
                style = ST_CENTER;
                text = CSTRING(menuMark);
                x = W_PART(0);
                y = H_PART(7.5);
                w = W_PART(14);
                h = H_PART(1.2);
                sizeEx = H_PART(1.2);
            };
            class TextTR: TextTL {
                text = CSTRING(menuWaypoints);
                x = W_PART(11);
                y = H_PART(7.5);
            };
            class TextBL: TextTL {
                text = CSTRING(menuConnectTo);
                x = W_PART(0);
                y = H_PART(16.5);
            };
            class TextBR: TextTL {
                text = CSTRING(menuSettings);
                x = W_PART(11);
                y = H_PART(16.5);
            };
        };
    };

    // Mode: Mark
    class ModeMark: RscControlsGroupNoScrollbars {
        idc = IDC_MODEMARK;
        x = X_PART(0);
        y = Y_PART(2);
        w = W_PART(25);
        h = H_PART(19);
        class Controls {
            class InfoText: GVAR(RscText) {
                idc = IDC_MODEMARK_HEADER;
                x = W_PART(3);
                y = H_PART(1);
                w = W_PART(19);
                h = H_PART(1.5);
                sizeEx = H_PART(1.5);
                colorText[] = {0.95,0.95,0.95,1};
            };
            class RscEdit_1400: RscEdit {
                idc = IDC_MODEMARK_CORDSEDIT;
                x = W_PART(3);
                y = H_PART(2.75);
                w = W_PART(17);
                h = H_PART(1.5);
                size = H_PART(1.5);
                sizeEx = H_PART(1.5);
                colorText[] = {0.95,0.95,0.95,1};
                font = "EtelkaMonospacePro";
            };
            class DeleteButton: GVAR(RscActiveTextPicture) {
                idc = -1;
                text = QPATHTOF(images\icon_deleteButton.paa);
                x = W_PART(20);
                y = H_PART(2.75);
                w = W_PART(2);
                h = H_PART(1.5);
                sizeEx = H_PART(1.5);
                onbuttonclick = QUOTE(['del'] call FUNC(appMarkKeypadEntry));
            };
            class Keypad1: RscButton {
                idc = -1;
                text = "1";
                x = W_PART(3);
                y = H_PART(5);
                w = W_PART(6);
                h = H_PART(3);
                sizeEx = H_PART(3);
                colorText[] = {0.95,0.95,0.95,1};
                colorBackground[] = {0.3,0.3,0.3,1};
                colorBackgroundDisabled[] = {0.3,0.3,0.3,1};
                colorBackgroundActive[] = {0.3,0.3,0.3,1};
                colorFocused[] = {0.3,0.3,0.3,1};
                onbuttonclick = QUOTE(['1'] call FUNC(appMarkKeypadEntry));
            };
            class Keypad2: Keypad1 {
                text = "2";
                x = W_PART(9.5);
                onbuttonclick = QUOTE(['2'] call FUNC(appMarkKeypadEntry));
            };
            class Keypad3: Keypad1 {
                text = "3";
                x = W_PART(16);
                onbuttonclick = QUOTE(['3'] call FUNC(appMarkKeypadEntry));
            };
            class Keypad4: Keypad1 {
                text = "4";
                x = W_PART(3);
                y = H_PART(8.5);
                onbuttonclick = QUOTE(['4'] call FUNC(appMarkKeypadEntry));
            };
            class Keypad5: Keypad4 {
                text = "5";
                x = W_PART(9.5);
                onbuttonclick = QUOTE(['5'] call FUNC(appMarkKeypadEntry));
            };
            class Keypad6: Keypad4 {
                text = "6";
                x = W_PART(16);
                onbuttonclick = QUOTE(['6'] call FUNC(appMarkKeypadEntry));
            };
            class Keypad7: Keypad1 {
                text = "7";
                x = W_PART(3);
                y = H_PART(12);
                onbuttonclick = QUOTE(['7'] call FUNC(appMarkKeypadEntry));
            };
            class Keypad8: Keypad7 {
                text = "8";
                x = W_PART(9.5);
                onbuttonclick = QUOTE(['8'] call FUNC(appMarkKeypadEntry));
            };
            class Keypad9: Keypad7 {
                text = "9";
                x = W_PART(16);
                onbuttonclick = QUOTE(['9'] call FUNC(appMarkKeypadEntry));
            };
            class Keypad0: Keypad1 {
                text = "0";
                x = W_PART(3);
                y = H_PART(15.5);
                w = W_PART(12.5);
                onbuttonclick = QUOTE(['0'] call FUNC(appMarkKeypadEntry));
            };
            class KeypadEnter: Keypad1 {
                text = "OK";
                x = W_PART(16);
                y = H_PART(15.5);
                onbuttonclick = QUOTE(['ok'] call FUNC(appMarkKeypadEntry));
            };
        };
    };

    // Mode: Waypoints
    class ModeWaypoints: RscControlsGroupNoScrollbars {
        idc = IDC_MODEWAYPOINTS;
        x = X_PART(0);
        y = Y_PART(2);
        w = W_PART(25);
        h = H_PART(19);
        class Controls {
            class ListOfWaypoints: RscListBox {
                idc = IDC_MODEWAYPOINTS_LISTOFWAYPOINTS;
                sizeEx = H_PART(1.5);
                sizeEx2 = H_PART(1.5);
                rowHeight = H_PART(1.75);
                colorText[] = {0.75,0.75,0.75,1};
                colorSelect[] = {0.75,0.75,0.75,1};
                colorSelect2[] = {0.75,0.75,0.75,1};
                colorBackground[] = {0,0,0,1};
                colorSelectBackground[] = {0.3,0.3,0.3,1};
                colorSelectBackground2[] = {0.3,0.3,0.3,1};

                itemSpacing = 0.001;
                x = W_PART(0.2);
                y = H_PART(0.5);
                w = W_PART(24.6);
                h = H_PART(16.5);
            };

            class ButtonSetWP: RscButton {
                idc = -1;
                text = CSTRING(waypointsSet);
                x = W_PART(1);
                y = H_PART(17);
                w = W_PART(7);
                h = H_PART(1.5);
                sizeEx = H_PART(1.5);
                font = "EtelkaMonospacePro";
                colorText[] = {0.95,0.95,0.95,1};
                colorBackground[] = {0.3,0.3,0.3,1};
                colorBackgroundDisabled[] = {0.3,0.3,0.3,1};
                colorBackgroundActive[] = {0.3,0.3,0.3,1};
                colorFocused[] = {0.3,0.3,0.3,1};
                onbuttonclick = QUOTE(_this call FUNC(appWaypointsButtonSetWP));
            };
            class ButtonAdd: ButtonSetWP {
                text = CSTRING(waypointsAdd);
                x = W_PART(9);
                onbuttonclick = QUOTE([APP_MODE_MARK] call FUNC(saveCurrentAndSetNewMode));
            };
            class ButtonDelete: ButtonSetWP {
                text = CSTRING(waypointsDelete);
                x = W_PART(17);
                onbuttonclick = QUOTE(_this call FUNC(appWaypointsButtonDeleteWP));
            };
        };
    };

    class SettingsMenu: RscListBox {
        idc = IDC_MODESETTINGS;
        x = X_PART(0.2);
        y = Y_PART(2);
        w = W_PART(24.6);
        h = H_PART(19);
        // onLBDblClick = QUOTE(_this call FUNC(appSettingsLBClick));
        onLBSelChanged = QUOTE(_this call FUNC(appSettingsLBClick));
        sizeEx = H_PART(1.5);
        sizeEx2 = H_PART(1.5);
        rowHeight = H_PART(1.75);
        itemSpacing = 0.001;
        colorText[] = {0.75,0.75,0.75,1};
        colorTextRight[] = {0.75,0.75,0.75,1};
        colorSelect[] = {0.75,0.75,0.75,1};
        colorSelect2[] = {0.75,0.75,0.75,1};
        colorSelectRight[] = {0.75,0.75,0.75,1};
        colorSelect2Right[] = {0.75,0.75,0.75,1};
        colorBackground[] = {0.05,0.05,0.05,1};
        colorSelectBackground[] = {0.05,0.05,0.05,1};
        colorSelectBackground2[] = {0.05,0.05,0.05,1};
    };

    class ButtonBG0: RscPicture {
        idc = IDC_BUTTONBG0;
        text = QPATHTOF(images\button_pushedDown.paa);
        x = X_PART(0 * (25/3));
        y = Y_PART(21);
        w = W_PART((25/3));
        h = H_PART(4);
    };
    class ButtonBG1: ButtonBG0 {
        idc = IDC_BUTTONBG1;
        x = X_PART(1 * (25/3));
    };
    class ButtonBG2: ButtonBG0 {
        idc = IDC_BUTTONBG2;
        x = X_PART(2 * (25/3));
    };
    class ButtonIcon0: GVAR(RscActiveTextPicture) {
        idc = -1;
        text = QPATHTOF(images\icon_info.paa);
        x = X_PART(0 * (25/3));
        y = Y_PART(21);
        w = W_PART((25/3));
        h = H_PART(4);
        onbuttonclick = QUOTE([APP_MODE_INFODISPLAY] call FUNC(saveCurrentAndSetNewMode));
    };
    class ButtonIcon1: ButtonIcon0 {
        text = QPATHTOF(images\icon_compass.paa);
        x = X_PART(1 * (25/3));
        onbuttonclick = QUOTE([APP_MODE_COMPASS] call FUNC(saveCurrentAndSetNewMode));
    };
    class ButtonIcon2: ButtonIcon0 {
        text = QPATHTOF(images\icon_map.paa);
        x = X_PART(2 * (25/3));
        onbuttonclick = QUOTE([APP_MODE_MAP] call FUNC(saveCurrentAndSetNewMode));
    };
    //At the end: The Big Shell overlay
    class MicroDagrShell: RscPicture {
        idc = IDC_MICRODAGRSHELL;
        text = QPATHTOF(images\microDAGR_shellPicture.paa);
        x = X_PART(-14.77);
        y = Y_PART(-5.875);
        w = W_PART(53.62);
        h = H_PART(39.9);
    };
};
