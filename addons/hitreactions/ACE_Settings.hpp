
class ACE_Settings {
    class GVAR(minDamageToTrigger) {
        //Minimum mamage needed to trigger falling down while moving. Set to -1 to disable completely.
        typeName = "SCALAR";
        value = 0.1;
        displayName = CSTRING(minDamageToTrigger_displayName);
        sliderSettings[] = {-1, 1, 0.1, 1};
    };
};
