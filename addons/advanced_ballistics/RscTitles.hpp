class RscTitles
{
    class RscTurretDial
    {
        idd=-1;
        onLoad="with uiNameSpace do { RscTurretDial = _this select 0 };";
        movingEnable=0;
        duration=5;
        fadeIn="false";
        fadeOut="false";
        class controls
        {
            class RscTurretDial
            {
                idc=132949;
                type=0;
                style=128;
                font="TahomaB";
                colorBackground[]={0,0,0,0.8};
                colorText[]={1,1,1,1};
                x="SafeZoneX + 0.0025";
                y="SafeZoneY + 0.0025";
                w=0.10;
                h=0.05;
                sizeEx=0.03;
                text="";
            };
        };
    };

    class RscProtractor
    {
        idd=-1;
        onLoad="with uiNameSpace do { RscProtractor = _this select 0 };";
        movingEnable=0;
        duration=60;
        fadeIn="false";
        fadeOut="false";
        class controls
        {
            class RscProtractorBase
            {
                idc=132950;
                type=0;
                style=48;
                font="TahomaB";
                colorBackground[]={0,0,0,0};
                colorText[]={1,1,1,1};
                x="SafeZoneX + 0.001";
                y="SafeZoneY + 0.001";
                w=0.2;
                h=0.2*4/3;
                size=0.034;
                sizeEx=0.027;
                text="";
            };
            class RscProtractorMarker : RscProtractorBase
            {
                idc=132951;
            };
        };
    };
};