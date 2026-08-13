#ifdef CREATE_MOCK_PLATFORMS
class CfgAmmo {
    class G_40mm_HE;
    class GVAR(mock_airburst): G_40mm_HE  {
        class Eventhandlers {
            fired = QUOTE(call ace_xm157_fnc_airburst_ammoFired);
        };
    };
};
#endif
