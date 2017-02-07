class ACE_UI {
    class gunnerZeroing {
        class conditions {
            ADDON = QUOTE(getNumber ([ARR_2(vehicle ACE_player, ACE_player call CBA_fnc_turretPath)] call CBA_fnc_getTurret >> 'ace_fcs_enabled') != 1);
        };
    };
};
