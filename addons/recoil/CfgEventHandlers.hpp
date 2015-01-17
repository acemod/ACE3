class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit) );
    };
};

class Extended_FiredBis_EventHandlers {
    class CAManBase {
        class ADDON {
            clientFiredBis = QUOTE(if (_this select 0 == ACE_player) then {_this call FUNC(camShake); _this call FUNC(burstDispersion);};);
        };
    };
    class Tank {
        class ADDON {
            clientFiredBis = QUOTE(if (_this select 0 == vehicle ACE_player) then {_this call FUNC(camShake);};);
        };
    };
    class Car {
        class ADDON {
            clientFiredBis = QUOTE(if (_this select 0 == vehicle ACE_player) then {_this call FUNC(camShake);};);
        };
    };
    class Helicopter {
        class ADDON {
            clientFiredBis = QUOTE(if (_this select 0 == vehicle ACE_player) then {_this call FUNC(camShake);};);
        };
    };
    class Plane {
        class ADDON {
            clientFiredBis = QUOTE(if (_this select 0 == vehicle ACE_player) then {_this call FUNC(camShake);};);
        };
    };
    class Ship_F {
        class ADDON {
            clientFiredBis = QUOTE(if (_this select 0 == vehicle ACE_player) then {_this call FUNC(camShake);};);
        };
    };
    class StaticWeapon {
        class ADDON {
            clientFiredBis = QUOTE(if (_this select 0 == vehicle ACE_player) then {_this call FUNC(camShake);};);
        };
    };
};
