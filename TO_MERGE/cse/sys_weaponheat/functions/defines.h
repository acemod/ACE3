#define PI 3.14159265
#define ABSOLUTE_ZERO_IN_CELSIUS -273.15
#define KELVIN(t) (t - ABSOLUTE_ZERO_IN_CELSIUS)
#define CELSIUS(t) (t + ABSOLUTE_ZERO_IN_CELSIUS)
#define CENTIMETER(i) (i * 2.54)
#define STEFAN_BOLTZMANN_CONSTANT 0.00000005670373 // W / (m^2 * K^4)
#define HEAT_TRANSFER_COEFFICIENT_STEEL 25.0       // W / (m^2 * K)
#define HEAT_CAPACITY_STEEL 0.466                  // J / (g   * K)

// Source: http://www.engineeringtoolbox.com/emissivity-coefficients-d_447.html
#define EMISSIVITY_STAINLESS_STEEL 0.54

// Source http://www.azom.com/properties.aspx?ArticleID=965 
// We have taken the average density for this 
// (7.85 + 8.06 / 2) min + max / 2
#define DENSITY_STAINLESS_STEEL 7.955                 // g / cm^3