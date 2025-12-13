class GVAR(mouseInputDialog) {
    idd = -1;
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = QUOTE(with uiNameSpace do { GVAR(mouseInputDialog) = _this select 0 };);
    class controlsBackground {
        class Background: RscText {
            idc = 1000;
            x = 0;
            y = 0;
            w = 1;
            h = 1;
            colorBackground[] = {0, 0, 0, 0.2};
        };
    };
    class controls {
        class MousePositionMarker: RscPicture {
            idc = 2000;
            text = "\A3\ui_f\data\map\markers\military\circle_CA.paa";
            colorText[] = {1, 0, 0, 1};
        };
    };
};
