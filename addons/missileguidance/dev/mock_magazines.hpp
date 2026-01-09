class 1Rnd_GAA_missiles;
class GVAR(mock_m_Malyutka): 1Rnd_GAA_missiles {
    ammo = QGVAR(mock_a_Malyutka);
};

class Titan_AA;
class GVAR(mock_m_blowpipe): Titan_AA {
    displayName = "Mock Blowpipe";
    ammo = QGVAR(mock_a_blowpipe);
};
