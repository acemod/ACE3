#define MX991_FLASHLIGHT_SIZE 1.75

class vn_pm;
class vn_fkb1_pm: vn_pm {
    ACE_Flashlight_Colour = "white";
    ACE_Flashlight_Beam = QPATHTOEF(flashlights,UI\Flashlight_beam_white_ca.paa);
    ACE_Flashlight_Size = MX991_FLASHLIGHT_SIZE;
};
class vn_fkb1_pm_sd: vn_fkb1_pm {
    ACE_Flashlight_Colour = "red";
    ACE_Flashlight_Beam = QPATHTOEF(flashlights,UI\Flashlight_beam_red_ca.paa);
};
class vn_fkb1;
class vn_fkb1_red: vn_fkb1 {
    ACE_Flashlight_Colour = "red";
    ACE_Flashlight_Beam = QPATHTOEF(flashlights,UI\Flashlight_beam_red_ca.paa);
};

class vn_m1911;
class vn_mx991_m1911: vn_m1911 {
    ACE_Flashlight_Colour = "white";
    ACE_Flashlight_Beam = QPATHTOEF(flashlights,UI\Flashlight_beam_white_ca.paa);
    ACE_Flashlight_Size = MX991_FLASHLIGHT_SIZE;
};
class vn_mx991_m1911_sd: vn_mx991_m1911 {
    ACE_Flashlight_Colour = "red";
    ACE_Flashlight_Beam = QPATHTOEF(flashlights,UI\Flashlight_beam_red_ca.paa);
};
class vn_mx991;
class vn_mx991_red: vn_mx991 {
    ACE_Flashlight_Colour = "red";
    ACE_Flashlight_Beam = QPATHTOEF(flashlights,UI\Flashlight_beam_red_ca.paa);
};
