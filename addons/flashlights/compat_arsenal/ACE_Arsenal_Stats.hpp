class EGVAR(arsenal,stats) {
    class statBase;
    class ACE_flashlightColor: statBase {
        scope = 2;
        priority = 1;
        stats[] = {"ACE_Flashlight_Colour"};
        displayName = CSTRING(statMapLightColor);
        showText = 1;
        textStatement = QUOTE(getText (_this select 1 >> 'itemInfo' >> 'FlashLight' >> (_this select 0) select 0));
        condition =  QUOTE(getText (_this select 1 >> 'itemInfo' >> 'FlashLight' >> (_this select 0) select 0) != '');
        tabs[] = {{}, {1,7}};
    };
};
