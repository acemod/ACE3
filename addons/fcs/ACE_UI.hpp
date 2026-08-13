class ACE_UI {
    class gunnerZeroing {
        class conditions {
            ADDON = QUOTE(private _vehicle = vehicle ACE_player; getNumber ([ARR_2(_vehicle,_vehicle unitTurret ACE_player)] call CBA_fnc_getTurret >> QQGVAR(enabled)) != 1);
        };
    };
};
