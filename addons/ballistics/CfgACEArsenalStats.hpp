class CfgACEArsenalStats {
    class statBase;
    class barrelTwist: statBase {
        scope = 2;
        priority = 1;
        stats[]= {"ACE_barrelTwist"};
        displayName= CSTRING(statBarrelTwist);
        showText= 1;
        textStatement = QUOTE(params [ARR_2('_stat', '_config')]; private _barrelTwist = getNumber (_config >> _stat select 0); format [ARR_3('%1mm (%2in)',_barrelTwist toFixed 0, (_barrelTwist / 25.4) toFixed 1)]);
        tabs[]= {{0,1}, {}};
    };
    class barrelLength: statBase {
        scope = 2;
        priority = 0;
        stats[]= {"ACE_barrelLength"};
        displayName= CSTRING(statBarrelLength);
        showText= 1;
        textStatement = QUOTE(params [ARR_2('_stat', '_config')]; private _barrelLength = getNumber (_config >> _stat select 0); format [ARR_3('%1mm (%2in)',_barrelLength toFixed 0, (_barrelLength / 25.4) toFixed 1)]);
        tabs[]= {{0,1}, {}};
    };
    class ammo: statBase {
        scope = 2;
        priority = 5;
        stats[]= {"ammo", "displayName"};
        displayName= "$STR_dn_ammo";
        showText= 1;
        textStatement = QUOTE(params [ARR_2('_stat', '_config')]; private _ammoDisplayName = getText (configFile >> 'CfgAmmo' >> (getText (_config >> 'ammo')) >> _stat select 1); [ARR_2(_ammoDisplayName, getText (_config >> _stat select 0))] select (_ammoDisplayName == ''));
        tabs[]= {{}, {4}};
    };
    class ballisticCoef: statBase {
        scope = 2;
        priority = 4;
        stats[]= {"ACE_dragModel","ACE_ballisticCoefficients"};
        displayName= CSTRING(statBallisticCoef);
        showText= 1;
        textStatement = QUOTE(params[ARR_2('_stat', '_config')]; private _ammoCfg = (configFile >> 'CfgAmmo' >> (getText (_config >> 'ammo'))); private _dragModel = (_ammoCfg >> _stat select 0); private _ballisticCoef = getArray (_ammoCfg >> _stat select 1); _ballisticCoef sort false; format [ARR_3('%1 G%2', _ballisticCoef select 0 ,getNumber _dragModel)]);
        tabs[]= {{}, {4}};
    };
    class bulletMass: statBase {
        scope = 2;
        priority = 3;
        stats[]= {"ACE_bulletMass"};
        displayName= CSTRING(statBulletMass);
        showText= 1;
        textStatement = QUOTE(params[ARR_2('_stat', '_config')]; private _ammoWeight = getNumber (configFile >> 'CfgAmmo' >> (getText (_config >> 'ammo')) >> _stat select 0); format [ARR_3('%1g (%2gr)', _ammoWeight toFixed 1, (_ammoWeight * 15.43) toFixed 1)]);
        tabs[]= {{}, {4}};
    };
};
