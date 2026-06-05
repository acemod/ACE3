class EGVAR(arsenal,stats) {
    class statBase {};
    class GVAR(minedetectorRadius): statBase {
        scope = 2;
        priority = -3;
        stats[] = {"radius"};
        displayName = CSTRING(arsenalStatRadius);
        showText = 1;
        textStatement = QUOTE(private _radius = getNumber (configFile >> 'ACE_detector' >> 'detectors' >> (configName (_this select 1)) >> (_this select 0 select 0)); _radius = _radius + ( round (GVAR(BoostRadius) * 10) / 10 ); format [ARR_3('%1m (%2ft)',_radius,(_radius / 0.3048) toFixed 1)]);
        condition = QUOTE(getNumber (configFile >> 'ACE_detector' >> 'detectors' >> (configName (_this select 1)) >> (_this select 0 select 0)) > 0);
        tabs[] = {{1}, {}};
    };
};
