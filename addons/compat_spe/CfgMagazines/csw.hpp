class CA_Magazine;

// M1919A4/A6
class SPE_50Rnd_762x63: CA_Magazine {
    ACE_isBelt = 1;
};

// M2
class VehicleMagazine;
class SPE_100Rnd_127x99_M2: VehicleMagazine {
    ACE_isBelt = 1;
};

// MG34/42
class SPE_50Rnd_792x57: CA_Magazine {
    ACE_isBelt = 0;
};
class SPE_100Rnd_792x57: SPE_50Rnd_792x57 {
    ACE_isBelt = 1;
};

class SPE_50Rnd_792x57_sS;
class SPE_100Rnd_792x57_sS: SPE_50Rnd_792x57_sS {
    ACE_isBelt = 1;
};

class SPE_50Rnd_792x57_SMK;
class SPE_100Rnd_792x57_SMK: SPE_50Rnd_792x57_SMK {
    ACE_isBelt = 1;
};
