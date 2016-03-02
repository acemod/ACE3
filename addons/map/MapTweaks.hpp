// Hide Bushes
class Bush {
    icon = "";
    color[] = {0.450000, 0.640000, 0.330000, 0.0};
    size = 14;
    importance = "0.2 * 14 * 0.05";
    coefMin = 0.250000;
    coefMax = 4;
};

// Hide Trees
class SmallTree {
    icon = "";
    color[] = {0.450000, 0.640000, 0.330000, 0.0};
    size = 12;
    importance = "0.6 * 12 * 0.05";
    coefMin = 0.250000;
    coefMax = 4;
};
class Tree {
    icon = "";
    color[] = {0.450000, 0.640000, 0.330000, 0.0};
    size = 12;
    importance = "0.9 * 16 * 0.05";
    coefMin = 0.250000;
    coefMax = 4;
};

class Legend {
    x = SafeZoneX+SafeZoneW-.340;
    y = SafeZoneY+SafeZoneH-.152;
    font = "RobotoCondensed";
    w = .340;
    h = .152;
    sizeEx = 0.039210;
    colorBackground[] = {0.906000, 0.901000, 0.880000, 0.5};
    color[] = {0, 0, 0, 0.75};
};
