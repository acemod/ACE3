class RscTitles {
    class GVAR(display) {
        idd = -1;
        onLoad = QUOTE( with uiNameSpace do { GVAR(display) = _this select 0 }; );
        movingEnable = 0;
        duration = 9999999;
        fadeIn = 0;
        fadeOut = 0;
        class controls {};
    };
};
