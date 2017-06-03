#include "shared.hpp"

#include <stdlib.h>
#include <string>
#include <vector>
#include <unordered_map>
#include <random>
#include <cmath>


#define DELTA_T 0.02f
#define GRAVITY 9.80665f
#define DEGREES(X) (X * 180 / M_PI)
#define ABSOLUTE_ZERO_IN_CELSIUS -273.15f
#define KELVIN(t) (t - ABSOLUTE_ZERO_IN_CELSIUS)
#define CELSIUS(t) (t + ABSOLUTE_ZERO_IN_CELSIUS)
#define EARTH_ANGULAR_SPEED 0.00007292f
#define UNIVERSAL_GAS_CONSTANT 8.314f
#define WATER_VAPOR_MOLAR_MASS 0.018016f
#define DRY_AIR_MOLAR_MASS 0.028964f
#define SPECIFIC_GAS_CONSTANT_DRY_AIR 287.058f
#define STD_AIR_DENSITY_ICAO 1.22498f
#define STD_AIR_DENSITY_ASM 1.20885f

struct Bullet {
    double airFriction;
    double caliber;
    double bulletLength;
    double bulletMass;
    std::vector<double> ballisticCoefficients;
    std::vector<double> velocityBoundaries;
    char* atmosphereModel;
    int dragModel;
    std::vector<double> muzzleVelocities;
    std::vector<double> barrelLengths;
    double stabilityFactor;
    double twistDirection;
    double transonicStabilityCoef;
    double muzzleVelocity;
    std::vector<double> origin;
    double latitude;
    double temperature;
    double altitude;
    double humidity;
    double overcast;
    double startTime;
    double lastFrame;
    double bcDegradation;
    unsigned randSeed;
    std::default_random_engine randGenerator;
};

struct Map {
    std::vector<int> gridHeights;
    std::vector<int> gridBuildingNums;
    std::vector<int> gridSurfaceIsWater;
    int mapSize;
    int mapGrids;
};

std::vector<Bullet> bulletDatabase;
std::unordered_map<std::string, Map> mapDatabase;
std::string worldName = "";
Map* map = &mapDatabase[""];

double calculateRoughnessLength(double posX, double posY) {
    // Source: http://es.ucsc.edu/~jnoble/wind/extrap/index.html
    double roughness_lengths[10] = {0.0002, 0.0005, 0.0024, 0.03, 0.055, 0.1, 0.2, 0.4, 0.8, 1.6};

    int gridX = (int)floor(posX / 50);
    int gridY = (int)floor(posY / 50);
    int gridCell = gridX * map->mapGrids + gridY;

    if (gridCell >= 0 && (std::size_t)gridCell < map->gridHeights.size() && (std::size_t)gridCell < map->gridBuildingNums.size()) {
        int nearBuildings = map->gridBuildingNums[gridCell];
        int surfaceIsWater = map->gridSurfaceIsWater[gridCell];

        if (nearBuildings == 0 && surfaceIsWater == 1) {
            return 0.0005;
        }

        if (nearBuildings >= 10) {
            return 1.6;
        }

        return roughness_lengths[2 + std::min(nearBuildings, 6)];
    }

    return 0.0024;
}

double calculateAirDensity(double temperature, double pressure, double relativeHumidity) {
    pressure = pressure * 100;

    if (relativeHumidity > 0) {
        // 610.78 gives pressure in Pa - https://en.wikipedia.org/wiki/Density_of_air
        double _pSat = 610.78 * pow(10, ((7.5 * temperature) / (temperature + 237.3)));
        double vaporPressure = relativeHumidity * _pSat;
        double partialPressure = pressure - vaporPressure;

        return (partialPressure * DRY_AIR_MOLAR_MASS + vaporPressure * WATER_VAPOR_MOLAR_MASS) / (UNIVERSAL_GAS_CONSTANT * KELVIN(temperature));
    } else {
        return pressure / (SPECIFIC_GAS_CONSTANT_DRY_AIR * KELVIN(temperature));
    }
}

double calculateAtmosphericCorrection(double ballisticCoefficient, double temperature, double pressure, double relativeHumidity, const char *atmosphereModel) {
    double airDensity = calculateAirDensity(temperature, pressure, relativeHumidity);

    if (!strcmp(atmosphereModel, "ICAO")) {
        return (STD_AIR_DENSITY_ICAO / airDensity) * ballisticCoefficient;
    } else {
        return (STD_AIR_DENSITY_ASM / airDensity) * ballisticCoefficient;
    }
}

double calculateRetard(int DragFunction, double DragCoefficient, double Velocity) {
    double vel = Velocity * 3.2808399;
    double val = -1;
    double A = -1;
    double M = -1;

    switch (DragFunction) {
    case 1:
        if (vel> 4230) { A = 1.477404177730177e-04; M = 1.9565; }
        else if (vel> 3680) { A = 1.920339268755614e-04; M = 1.925; }
        else if (vel> 3450) { A = 2.894751026819746e-04; M = 1.875; }
        else if (vel> 3295) { A = 4.349905111115636e-04; M = 1.825; }
        else if (vel> 3130) { A = 6.520421871892662e-04; M = 1.775; }
        else if (vel> 2960) { A = 9.748073694078696e-04; M = 1.725; }
        else if (vel> 2830) { A = 1.453721560187286e-03; M = 1.675; }
        else if (vel> 2680) { A = 2.162887202930376e-03; M = 1.625; }
        else if (vel> 2460) { A = 3.209559783129881e-03; M = 1.575; }
        else if (vel> 2225) { A = 3.904368218691249e-03; M = 1.55; }
        else if (vel> 2015) { A = 3.222942271262336e-03; M = 1.575; }
        else if (vel> 1890) { A = 2.203329542297809e-03; M = 1.625; }
        else if (vel> 1810) { A = 1.511001028891904e-03; M = 1.675; }
        else if (vel> 1730) { A = 8.609957592468259e-04; M = 1.75; }
        else if (vel> 1595) { A = 4.086146797305117e-04; M = 1.85; }
        else if (vel> 1520) { A = 1.954473210037398e-04; M = 1.95; }
        else if (vel> 1420) { A = 5.431896266462351e-05; M = 2.125; }
        else if (vel> 1360) { A = 8.847742581674416e-06; M = 2.375; }
        else if (vel> 1315) { A = 1.456922328720298e-06; M = 2.625; }
        else if (vel> 1280) { A = 2.419485191895565e-07; M = 2.875; }
        else if (vel> 1220) { A = 1.657956321067612e-08; M = 3.25; }
        else if (vel> 1185) { A = 4.745469537157371e-10; M = 3.75; }
        else if (vel> 1150) { A = 1.379746590025088e-11; M = 4.25; }
        else if (vel> 1100) { A = 4.070157961147882e-13; M = 4.75; }
        else if (vel> 1060) { A = 2.938236954847331e-14; M = 5.125; }
        else if (vel> 1025) { A = 1.228597370774746e-14; M = 5.25; }
        else if (vel>  980) { A = 2.916938264100495e-14; M = 5.125; }
        else if (vel>  945) { A = 3.855099424807451e-13; M = 4.75; }
        else if (vel>  905) { A = 1.185097045689854e-11; M = 4.25; }
        else if (vel>  860) { A = 3.566129470974951e-10; M = 3.75; }
        else if (vel>  810) { A = 1.045513263966272e-08; M = 3.25; }
        else if (vel>  780) { A = 1.291159200846216e-07; M = 2.875; }
        else if (vel>  750) { A = 6.824429329105383e-07; M = 2.625; }
        else if (vel>  700) { A = 3.569169672385163e-06; M = 2.375; }
        else if (vel>  640) { A = 1.839015095899579e-05; M = 2.125; }
        else if (vel>  600) { A = 5.71117468873424e-05; M = 1.950; }
        else if (vel>  550) { A = 9.226557091973427e-05; M = 1.875; }
        else if (vel>  250) { A = 9.337991957131389e-05; M = 1.875; }
        else if (vel>  100) { A = 7.225247327590413e-05; M = 1.925; }
        else if (vel>   65) { A = 5.792684957074546e-05; M = 1.975; }
        else if (vel>    0) { A = 5.206214107320588e-05; M = 2.000; }
        break;

    case 2:
        if (vel> 1674) { A = .0079470052136733;  M = 1.36999902851493; }
        else if (vel> 1172) { A = 1.00419763721974e-03;  M = 1.65392237010294; }
        else if (vel> 1060) { A = 7.15571228255369e-23;  M = 7.91913562392361; }
        else if (vel>  949) { A = 1.39589807205091e-10;  M = 3.81439537623717; }
        else if (vel>  670) { A = 2.34364342818625e-04;  M = 1.71869536324748; }
        else if (vel>  335) { A = 1.77962438921838e-04;  M = 1.76877550388679; }
        else if (vel>    0) { A = 5.18033561289704e-05;  M = 1.98160270524632; }
        break;

    case 5:
        if (vel> 1730) { A = 7.24854775171929e-03; M = 1.41538574492812; }
        else if (vel> 1228) { A = 3.50563361516117e-05; M = 2.13077307854948; }
        else if (vel> 1116) { A = 1.84029481181151e-13; M = 4.81927320350395; }
        else if (vel> 1004) { A = 1.34713064017409e-22; M = 7.8100555281422; }
        else if (vel>  837) { A = 1.03965974081168e-07; M = 2.84204791809926; }
        else if (vel>  335) { A = 1.09301593869823e-04; M = 1.81096361579504; }
        else if (vel>    0) { A = 3.51963178524273e-05; M = 2.00477856801111; }
        break;

    case 6:
        if (vel> 3236) { A = 0.0455384883480781; M = 1.15997674041274; }
        else if (vel> 2065) { A = 7.167261849653769e-02; M = 1.10704436538885; }
        else if (vel> 1311) { A = 1.66676386084348e-03; M = 1.60085100195952; }
        else if (vel> 1144) { A = 1.01482730119215e-07; M = 2.9569674731838; }
        else if (vel> 1004) { A = 4.31542773103552e-18; M = 6.34106317069757; }
        else if (vel>  670) { A = 2.04835650496866e-05; M = 2.11688446325998; }
        else if (vel>    0) { A = 7.50912466084823e-05; M = 1.92031057847052; }
        break;

    case 7:
        if (vel> 4200) { A = 1.29081656775919e-09; M = 3.24121295355962; }
        else if (vel> 3000) { A = 0.0171422231434847; M = 1.27907168025204; }
        else if (vel> 1470) { A = 2.33355948302505e-03; M = 1.52693913274526; }
        else if (vel> 1260) { A = 7.97592111627665e-04; M = 1.67688974440324; }
        else if (vel> 1110) { A = 5.71086414289273e-12; M = 4.3212826264889; }
        else if (vel>  960) { A = 3.02865108244904e-17; M = 5.99074203776707; }
        else if (vel>  670) { A = 7.52285155782535e-06; M = 2.1738019851075; }
        else if (vel>  540) { A = 1.31766281225189e-05; M = 2.08774690257991; }
        else if (vel>    0) { A = 1.34504843776525e-05; M = 2.08702306738884; }
        break;

    case 8:
        if (vel> 3571) { A = .0112263766252305; M = 1.33207346655961; }
        else if (vel> 1841) { A = .0167252613732636; M = 1.28662041261785; }
        else if (vel> 1120) { A = 2.20172456619625e-03; M = 1.55636358091189; }
        else if (vel> 1088) { A = 2.0538037167098e-16; M = 5.80410776994789; }
        else if (vel>  976) { A = 5.92182174254121e-12; M = 4.29275576134191; }
        else if (vel>    0) { A = 4.3917343795117e-05; M = 1.99978116283334; }
        break;

    default:
        break;

    }

    if (A != -1 && M != -1 && vel > 0 && vel < 10000) {
        val = A * pow(vel, M) / DragCoefficient;
        val = val / 3.2808399;
        return val;
    }

    return 0.0;
}

double calculateVanillaZeroAngle(double zeroRange, double muzzleVelocity, double airFriction, double boreHeight) {
    double zeroAngle = 0.0f;

    for (int i = 0; i < 10; i++) {
        double lx = 0.0f;
        double ly = 0.0f;

        double px = 0.0f;
        double py = -boreHeight / 100.0f;

        double gx = std::sin(zeroAngle) * -GRAVITY;
        double gy = std::cos(zeroAngle) * -GRAVITY;

        double vx = std::cos(zeroAngle) * muzzleVelocity;
        double vy = std::sin(zeroAngle) * muzzleVelocity;

        double tof = 0.0f;
        double v = 0.0f;

        while (tof < 8.0f && px < zeroRange) {
            lx = px;
            ly = py;

            v = std::sqrt(vx*vx + vy*vy);

            double ax = vx * v * airFriction;
            double ay = vy * v * airFriction;
            ax += gx;
            ay += gy;

            px += vx * DELTA_T * 0.5;
            py += vy * DELTA_T * 0.5;
            vx += ax * DELTA_T;
            vy += ay * DELTA_T;
            px += vx * DELTA_T * 0.5;
            py += vy * DELTA_T * 0.5;

            tof += DELTA_T;
        }

        double y = ly + (zeroRange - lx) * (py - ly) / (px - lx);
        double offset = -std::atan(y / zeroRange);
        zeroAngle += offset;

        if (std::abs(offset) < 0.0001f) {
            break;
        }
    }

    return zeroAngle;
}

double calculateZeroAngle(double zeroRange, double muzzleVelocity, double boreHeight, double temperature, double pressure, double humidity, double ballisticCoefficient, int dragModel, char*  atmosphereModel) {
    double zeroAngle = 0.0f;

    ballisticCoefficient = calculateAtmosphericCorrection(ballisticCoefficient, temperature, pressure, humidity, atmosphereModel);

    for (int i = 0; i < 10; i++) {
        double lx = 0.0f;
        double ly = 0.0f;

        double px = 0.0f;
        double py = -boreHeight / 100.0f;

        double gx = std::sin(zeroAngle) * -GRAVITY;
        double gy = std::cos(zeroAngle) * -GRAVITY;

        double vx = std::cos(zeroAngle) * muzzleVelocity;
        double vy = std::sin(zeroAngle) * muzzleVelocity;

        double tof = 0.0f;
        double v = 0.0f;

        while (tof < 8.0f && px < zeroRange) {
            lx = px; 
            ly = py;

            v = std::sqrt(vx*vx + vy*vy);

            double retard = calculateRetard(dragModel, ballisticCoefficient, v);
            double ax = vx / v * -retard;
            double ay = vy / v * -retard;
            ax += gx;
            ay += gy;

            px += vx * DELTA_T * 0.5;
            py += vy * DELTA_T * 0.5;
            vx += ax * DELTA_T;
            vy += ay * DELTA_T;
            px += vx * DELTA_T * 0.5;
            py += vy * DELTA_T * 0.5;

            tof += DELTA_T;
        }

        double y = ly + (zeroRange - lx) * (py - ly) / (px - lx);
        double offset = -std::atan(y / zeroRange);
        zeroAngle += offset;

        if (std::abs(offset) < 0.0001f) {
            break;
        }
    }

    return zeroAngle;
}

extern "C"
{
    EXPORT void __stdcall RVExtensionVersion(char *output, int outputSize);
    EXPORT void __stdcall RVExtension(char *output, int outputSize, const char *function);
}

void __stdcall RVExtensionVersion(char *output, int outputSize)
{
    strncpy_s(output, outputSize, ACE_FULL_VERSION_STR, _TRUNCATE);
}

void __stdcall RVExtension(char *output, int outputSize, const char *function)
{
    ZERO_OUTPUT();
    std::stringstream outputStr;
    if (!strcmp(function, "version")) {
        strncpy_s(output, outputSize, ACE_FULL_VERSION_STR, _TRUNCATE);
        EXTENSION_RETURN();
    }

    char* input = _strdup(function);
    char* token = NULL;
    char* next_token = NULL;
    char* mode = strtok_s(input, ":", &next_token);

    if (!strcmp(mode, "retard")) {
        double ballisticCoefficient = 1.0;
        int dragModel = 1;
        double velocity = 0.0;
        double retard = 0.0;

        dragModel = strtol(strtok_s(NULL, ":", &next_token), NULL, 10);
        ballisticCoefficient = strtod(strtok_s(NULL, ":", &next_token), NULL);
        velocity = strtod(strtok_s(NULL, ":", &next_token), NULL);

        retard = calculateRetard(dragModel, ballisticCoefficient, velocity);
        // int n = sprintf(output,  "%f", retard);

        outputStr << retard;
        strncpy_s(output, outputSize, outputStr.str().c_str(), _TRUNCATE);

        EXTENSION_RETURN();
    } else if (!strcmp(mode, "atmosphericCorrection")) {
        double ballisticCoefficient = 1.0;
        double temperature = 15.0;
        double pressure = 1013.25;
        double humidity = 0.0;
        char* atmosphereModel;

        ballisticCoefficient = strtod(strtok_s(NULL, ":", &next_token), NULL);
        temperature = strtod(strtok_s(NULL, ":", &next_token), NULL);
        pressure = strtod(strtok_s(NULL, ":", &next_token), NULL);
        humidity = strtod(strtok_s(NULL, ":", &next_token), NULL);
        atmosphereModel = strtok_s(NULL, ":", &next_token);

        ballisticCoefficient = calculateAtmosphericCorrection(ballisticCoefficient, temperature, pressure, humidity, atmosphereModel);
        //int n = sprintf(output,  "%f", ballisticCoefficient);
        outputStr << ballisticCoefficient;
        strncpy_s(output, outputSize, outputStr.str().c_str(), _TRUNCATE);
        EXTENSION_RETURN();
    } else if (!strcmp(mode, "new")) {
        unsigned int index = 0;
        double airFriction = 0.0;
        char* ballisticCoefficientArray;
        char* ballisticCoefficient;
        std::vector<double> ballisticCoefficients;
        char* velocityBoundaryArray;
        char* velocityBoundary;
        std::vector<double> velocityBoundaries;
        char* atmosphereModel;
        int dragModel = 1;
        double stabilityFactor = 1.5;
        int twistDirection = 1;
        double transonicStabilityCoef = 1;
        double muzzleVelocity = 850;
        char* originArray;
        char* originEntry;
        std::vector<double> origin;
        double latitude = 0.0;
        double temperature = 0.0;
        double altitude = 0.0;
        double humidity = 0.0;
        double overcast = 0.0;
        double tickTime = 0.0;

        index = strtol(strtok_s(NULL, ":", &next_token), NULL, 10);
        airFriction = strtod(strtok_s(NULL, ":", &next_token), NULL);
        ballisticCoefficientArray = strtok_s(NULL, ":", &next_token);
        ballisticCoefficientArray++;
        ballisticCoefficientArray[strlen(ballisticCoefficientArray) - 1] = 0;
        ballisticCoefficient = strtok_s(ballisticCoefficientArray, ",", &token);
        while (ballisticCoefficient != NULL) {
            ballisticCoefficients.push_back(strtod(ballisticCoefficient, NULL));
            ballisticCoefficient = strtok_s(NULL, ",", &token);
        }
        velocityBoundaryArray = strtok_s(NULL, ":", &next_token);
        velocityBoundaryArray++;
        velocityBoundaryArray[strlen(velocityBoundaryArray) - 1] = 0;
        velocityBoundary = strtok_s(velocityBoundaryArray, ",", &token);
        while (velocityBoundary != NULL) {
            velocityBoundaries.push_back(strtod(velocityBoundary, NULL));
            velocityBoundary = strtok_s(NULL, ",", &token);
        }
        atmosphereModel = strtok_s(NULL, ":", &next_token);
        dragModel = strtol(strtok_s(NULL, ":", &next_token), NULL, 10);
        stabilityFactor = strtod(strtok_s(NULL, ":", &next_token), NULL);
        twistDirection = strtol(strtok_s(NULL, ":", &next_token), NULL, 10);
        muzzleVelocity = strtod(strtok_s(NULL, ":", &next_token), NULL);
        transonicStabilityCoef = strtod(strtok_s(NULL, ":", &next_token), NULL);
        originArray = strtok_s(NULL, ":", &next_token);
        originArray++;
        originArray[strlen(originArray) - 1] = 0;
        originEntry = strtok_s(originArray, ",", &token);
        while (originEntry != NULL) {
            origin.push_back(strtod(originEntry, NULL));
            originEntry = strtok_s(NULL, ",", &token);
        }
        latitude = strtod(strtok_s(NULL, ":", &next_token), NULL);
        temperature = strtod(strtok_s(NULL, ":", &next_token), NULL);
        altitude = strtod(strtok_s(NULL, ":", &next_token), NULL);
        humidity = strtod(strtok_s(NULL, ":", &next_token), NULL);
        overcast = strtod(strtok_s(NULL, ":", &next_token), NULL);
        tickTime = strtod(strtok_s(NULL, ":", &next_token), NULL);
        tickTime += strtod(strtok_s(NULL, ":", &next_token), NULL);

        while (index >= bulletDatabase.size()) {
            Bullet bullet;
            bulletDatabase.push_back(bullet);
        }

        bulletDatabase[index].airFriction = airFriction;
        bulletDatabase[index].ballisticCoefficients = ballisticCoefficients;
        bulletDatabase[index].velocityBoundaries = velocityBoundaries;
        bulletDatabase[index].atmosphereModel = atmosphereModel;
        bulletDatabase[index].dragModel = dragModel;
        bulletDatabase[index].stabilityFactor = stabilityFactor;
        bulletDatabase[index].twistDirection = twistDirection;
        bulletDatabase[index].transonicStabilityCoef = transonicStabilityCoef;
        bulletDatabase[index].muzzleVelocity = muzzleVelocity;
        bulletDatabase[index].origin = origin;
        bulletDatabase[index].latitude = latitude / 180 * M_PI;
        bulletDatabase[index].temperature = temperature;
        bulletDatabase[index].altitude = altitude;
        bulletDatabase[index].humidity = humidity;
        bulletDatabase[index].overcast = overcast;
        bulletDatabase[index].startTime = tickTime;
        bulletDatabase[index].lastFrame = tickTime;
        bulletDatabase[index].bcDegradation = 1.0;
        bulletDatabase[index].randSeed = 0;

        strncpy_s(output, outputSize, "", _TRUNCATE);
        EXTENSION_RETURN();
    } else if (!strcmp(mode, "simulate")) {
        // simulate:0:[-0.109985,542.529,-3.98301]:[3751.57,5332.23,214.252]:[0.598153,2.38829,0]:28.6:0:0.481542:0:215.16
        unsigned int index = 0;
        char* velocityArray;
        double velocity[3] = { 0.0, 0.0, 0.0 };
        char* positionArray;
        double position[3] = { 0.0, 0.0, 0.0 };
        char* windArray;
        double wind[3];
        double heightAGL = 0.0;
        double tickTime = 0.0;

        index = strtol(strtok_s(NULL, ":", &next_token), NULL, 10);
        velocityArray = strtok_s(NULL, ":", &next_token);
        velocityArray++;
        velocityArray[strlen(velocityArray) - 1] = 0;
        velocity[0] = strtod(strtok_s(velocityArray, ",", &token), NULL);
        velocity[1] = strtod(strtok_s(NULL, ",", &token), NULL);
        velocity[2] = strtod(strtok_s(NULL, ",", &token), NULL);
        positionArray = strtok_s(NULL, ":", &next_token);
        positionArray++;
        positionArray[strlen(positionArray) - 1] = 0;
        position[0] = strtod(strtok_s(positionArray, ",", &token), NULL);
        position[1] = strtod(strtok_s(NULL, ",", &token), NULL);
        position[2] = strtod(strtok_s(NULL, ",", &token), NULL);
        windArray = strtok_s(NULL, ":", &next_token);
        windArray++;
        windArray[strlen(windArray) - 1] = 0;
        wind[0] = strtod(strtok_s(windArray, ",", &token), NULL);
        wind[1] = strtod(strtok_s(NULL, ",", &token), NULL);
        wind[2] = strtod(strtok_s(NULL, ",", &token), NULL);
        heightAGL = strtod(strtok_s(NULL, ":", &next_token), NULL);
        tickTime = strtod(strtok_s(NULL, ":", &next_token), NULL);
        tickTime += strtod(strtok_s(NULL, ":", &next_token), NULL);

        if (bulletDatabase[index].randSeed == 0) {
            int angle = (int)round(atan2(velocity[0], velocity[1]) * 360 / M_PI);
            bulletDatabase[index].randSeed = (unsigned)(720 + angle) % 720;
            bulletDatabase[index].randSeed *= 3;
            bulletDatabase[index].randSeed += (unsigned)round(abs(velocity[2]) / 2);
            bulletDatabase[index].randSeed *= 3;
            bulletDatabase[index].randSeed += (unsigned)round(abs(bulletDatabase[index].origin[0] / 2));
            bulletDatabase[index].randSeed *= 3;
            bulletDatabase[index].randSeed += (unsigned)round(abs(bulletDatabase[index].origin[1] / 2));
            bulletDatabase[index].randSeed *= 3;
            bulletDatabase[index].randSeed += (unsigned)abs(bulletDatabase[index].temperature) * 10;
            bulletDatabase[index].randSeed *= 3;
            bulletDatabase[index].randSeed += (unsigned)abs(bulletDatabase[index].humidity) * 10;
            bulletDatabase[index].randGenerator.seed(bulletDatabase[index].randSeed);
        }

        double ballisticCoefficient = 1.0;
        double dragRef = 0.0;
        double drag = 0.0;
        double accelRef[3] = { 0.0, 0.0, 0.0 };
        double accel[3] = { 0.0, 0.0, 0.0 };
        double TOF = 0.0;
        double deltaT = 0.0;
        double bulletSpeed;
        double trueVelocity[3] = { 0.0, 0.0, 0.0 };
        double trueSpeed = 0.0;
        double temperature = 0.0;
        double pressure = 1013.25;
        double windSpeed = 0.0;
        double windAttenuation = 1.0;
        double velocityOffset[3] = { 0.0, 0.0, 0.0 };

        TOF = tickTime - bulletDatabase[index].startTime;

        deltaT = tickTime - bulletDatabase[index].lastFrame;
        bulletDatabase[index].lastFrame = tickTime;

        bulletSpeed = sqrt(pow(velocity[0], 2) + pow(velocity[1], 2) + pow(velocity[2], 2));

        windSpeed = sqrt(pow(wind[0], 2) + pow(wind[1], 2) + pow(wind[2], 2));
        if (windSpeed > 0.1) {
            double windSourceTerrain[3];

            windSourceTerrain[0] = position[0] - wind[0] / windSpeed * 100;
            windSourceTerrain[1] = position[1] - wind[1] / windSpeed * 100;
            windSourceTerrain[2] = position[2] - wind[2] / windSpeed * 100;

            int gridX = (int)floor(windSourceTerrain[0] / 50);
            int gridY = (int)floor(windSourceTerrain[1] / 50);
            int gridCell = gridX * map->mapGrids + gridY;

            if (gridCell >= 0 && (std::size_t)gridCell < map->gridHeights.size() && (std::size_t)gridCell < map->gridBuildingNums.size()) {
                double gridHeight = map->gridHeights[gridCell];

                if (gridHeight > position[2]) {
                    double angle = atan((gridHeight - position[2]) / 100);
                    windAttenuation *= pow(abs(cos(angle)), 2);
                }
            }
        }

        if (windSpeed > 0.1) {
            double windSourceObstacles[3];

            windSourceObstacles[0] = position[0] - wind[0] / windSpeed * 25;
            windSourceObstacles[1] = position[1] - wind[1] / windSpeed * 25;
            windSourceObstacles[2] = position[2] - wind[2] / windSpeed * 25;

            if (heightAGL > 0 && heightAGL < 20) {
                double roughnessLength = calculateRoughnessLength(windSourceObstacles[0], windSourceObstacles[1]);
                windAttenuation *= abs(log(heightAGL / roughnessLength) / log(20 / roughnessLength));
            }
        }

        if (windAttenuation < 1) {
            wind[0] *= windAttenuation;
            wind[1] *= windAttenuation;
            wind[2] *= windAttenuation;
            windSpeed = sqrt(pow(wind[0], 2) + pow(wind[1], 2) + pow(wind[2], 2));
        }

        trueVelocity[0] = velocity[0] - wind[0];
        trueVelocity[1] = velocity[1] - wind[1];
        trueVelocity[2] = velocity[2] - wind[2];
        trueSpeed = sqrt(pow(trueVelocity[0], 2) + pow(trueVelocity[1], 2) + pow(trueVelocity[2], 2));

        double speedOfSound = 331.3 + (0.6 * temperature);
        double transonicSpeed = 394 + (0.6 * temperature);
        if (bulletDatabase[index].transonicStabilityCoef < 1.0f && bulletSpeed < transonicSpeed && bulletSpeed > speedOfSound) {
            std::uniform_real_distribution<double> distribution(-10.0, 10.0);
            double coef = 1.0f - bulletDatabase[index].transonicStabilityCoef;

            trueVelocity[0] += distribution(bulletDatabase[index].randGenerator) * coef;
            trueVelocity[1] += distribution(bulletDatabase[index].randGenerator) * coef;
            trueVelocity[2] += distribution(bulletDatabase[index].randGenerator) * coef;
            double speed = sqrt(pow(trueVelocity[0], 2) + pow(trueVelocity[1], 2) + pow(trueVelocity[2], 2));

            trueVelocity[0] *= trueSpeed / speed;
            trueVelocity[1] *= trueSpeed / speed;
            trueVelocity[2] *= trueSpeed / speed;

            bulletDatabase[index].bcDegradation *= pow(0.993, coef);
        };

        temperature = bulletDatabase[index].temperature - 0.0065 * position[2];
        pressure = (1013.25 - 10 * bulletDatabase[index].overcast) * pow(1 - (0.0065 * (bulletDatabase[index].altitude + position[2])) / (273.15 + temperature + 0.0065 * bulletDatabase[index].altitude), 5.255754495);

        if (bulletDatabase[index].ballisticCoefficients.size() == bulletDatabase[index].velocityBoundaries.size() + 1) {
            dragRef = deltaT * bulletDatabase[index].airFriction * bulletSpeed * bulletSpeed;

            accelRef[0] = (velocity[0] / bulletSpeed) * dragRef;
            accelRef[1] = (velocity[1] / bulletSpeed) * dragRef;
            accelRef[2] = (velocity[2] / bulletSpeed) * dragRef;

            velocityOffset[0] -= accelRef[0];
            velocityOffset[1] -= accelRef[1];
            velocityOffset[2] -= accelRef[2];

            ballisticCoefficient = bulletDatabase[index].ballisticCoefficients[0];
            for (int i = (int)bulletDatabase[index].velocityBoundaries.size() - 1; i >= 0; i = i - 1) {
                if (bulletSpeed < bulletDatabase[index].velocityBoundaries[i]) {
                    ballisticCoefficient = bulletDatabase[index].ballisticCoefficients[i + 1];
                    break;
                }
            }

            ballisticCoefficient = calculateAtmosphericCorrection(ballisticCoefficient, temperature, pressure, bulletDatabase[index].humidity, bulletDatabase[index].atmosphereModel);
            ballisticCoefficient *= bulletDatabase[index].bcDegradation;
            drag = deltaT * calculateRetard(bulletDatabase[index].dragModel, ballisticCoefficient, trueSpeed);
            accel[0] = (trueVelocity[0] / trueSpeed) * drag;
            accel[1] = (trueVelocity[1] / trueSpeed) * drag;
            accel[2] = (trueVelocity[2] / trueSpeed) * drag;

            velocityOffset[0] -= accel[0];
            velocityOffset[1] -= accel[1];
            velocityOffset[2] -= accel[2];
        } else {
            double airDensity = calculateAirDensity(temperature, pressure, bulletDatabase[index].humidity);
            double airFriction = bulletDatabase[index].airFriction * airDensity / STD_AIR_DENSITY_ICAO;

            if (airFriction != bulletDatabase[index].airFriction || windSpeed > 0) {
                dragRef = deltaT * bulletDatabase[index].airFriction * bulletSpeed * bulletSpeed;

                accelRef[0] = (velocity[0] / bulletSpeed) * dragRef;
                accelRef[1] = (velocity[1] / bulletSpeed) * dragRef;
                accelRef[2] = (velocity[2] / bulletSpeed) * dragRef;

                velocityOffset[0] -= accelRef[0];
                velocityOffset[1] -= accelRef[1];
                velocityOffset[2] -= accelRef[2];

                drag = deltaT * airFriction * trueSpeed * trueSpeed;
                accel[0] = (trueVelocity[0] / trueSpeed) * drag;
                accel[1] = (trueVelocity[1] / trueSpeed) * drag;
                accel[2] = (trueVelocity[2] / trueSpeed) * drag;

                velocityOffset[0] += accel[0];
                velocityOffset[1] += accel[1];
                velocityOffset[2] += accel[2];
            }
        }

        if (TOF > 0) {
            double bulletDir = atan2(velocity[0], velocity[1]);
            double r1 = pow(TOF - deltaT, 0.17);
            double r2 = pow(TOF, 0.17);
            double spinAccel = bulletDatabase[index].twistDirection * (0.0482251 * (bulletDatabase[index].stabilityFactor + 1.2)) / ((r1 + r2) / 2.0f);
            velocityOffset[0] += sin(bulletDir + M_PI / 2) * spinAccel * deltaT;
            velocityOffset[1] += cos(bulletDir + M_PI / 2) * spinAccel * deltaT;
        }

        double lat = bulletDatabase[index].latitude;
        accel[0] = 2 * EARTH_ANGULAR_SPEED * +(velocity[1] * sin(lat) - velocity[2] * cos(lat));
        accel[1] = 2 * EARTH_ANGULAR_SPEED * -(velocity[0] * sin(lat));
        accel[2] = 2 * EARTH_ANGULAR_SPEED * +(velocity[0] * cos(lat));

        velocityOffset[0] += accel[0] * deltaT;
        velocityOffset[1] += accel[1] * deltaT;
        velocityOffset[2] += accel[2] * deltaT;

        outputStr << "_bullet setVelocity (_bulletVelocity vectorAdd [" << velocityOffset[0] << "," << velocityOffset[1] << "," << velocityOffset[2] << "]);";
        strncpy_s(output, outputSize, outputStr.str().c_str(), _TRUNCATE);
        EXTENSION_RETURN();
    } else if (!strcmp(mode, "set")) {
        int height = 0;
        int numObjects = 0;
        int surfaceIsWater = 0;

        height = strtol(strtok_s(NULL, ":", &next_token), NULL, 10);
        numObjects = strtol(strtok_s(NULL, ":", &next_token), NULL, 10);
        surfaceIsWater = strtol(strtok_s(NULL, ":", &next_token), NULL, 10);

        map->gridHeights.push_back(height);
        map->gridBuildingNums.push_back(numObjects);
        map->gridSurfaceIsWater.push_back(surfaceIsWater);

        strncpy_s(output, outputSize, outputStr.str().c_str(), _TRUNCATE);
        EXTENSION_RETURN();
    } else if (!strcmp(mode, "init")) {
        int mapSize = 0;
        int mapGrids = 0;
        unsigned int gridCells = 0;

        worldName = strtok_s(NULL, ":", &next_token);
        mapSize = strtol(strtok_s(NULL, ":", &next_token), NULL, 10);

        mapGrids = (int)ceil((double)mapSize / 50.0) + 1;
        gridCells = mapGrids * mapGrids;

        map = &mapDatabase[worldName];
        if (map->gridHeights.size() == gridCells) {
            outputStr << "Terrain already initialized";
            strncpy_s(output, outputSize, outputStr.str().c_str(), _TRUNCATE);
            EXTENSION_RETURN();
        }

        map->mapSize = mapSize;
        map->mapGrids = mapGrids;
        map->gridHeights.clear();
        map->gridBuildingNums.clear();
        map->gridSurfaceIsWater.clear();
        map->gridHeights.reserve(gridCells);
        map->gridBuildingNums.reserve(gridCells);
        map->gridSurfaceIsWater.reserve(gridCells);

        strncpy_s(output, outputSize, outputStr.str().c_str(), _TRUNCATE);
        EXTENSION_RETURN();
    } else if (!strcmp(mode, "zeroAngleVanilla")) {
        double zeroRange = strtod(strtok_s(NULL, ":", &next_token), NULL);
        double initSpeed = strtod(strtok_s(NULL, ":", &next_token), NULL);
        double airFriction = strtod(strtok_s(NULL, ":", &next_token), NULL);
        double boreHeight = strtod(strtok_s(NULL, ":", &next_token), NULL);

        double zeroAngle = calculateVanillaZeroAngle(zeroRange, initSpeed, airFriction, boreHeight);

        outputStr << DEGREES(zeroAngle);
        strncpy_s(output, outputSize, outputStr.str().c_str(), _TRUNCATE);
        EXTENSION_RETURN();
    } else if (!strcmp(mode, "zeroAngle")) {
        double zeroRange = strtod(strtok_s(NULL, ":", &next_token), NULL);
        double muzzleVelocity = strtod(strtok_s(NULL, ":", &next_token), NULL);
        double boreHeight = strtod(strtok_s(NULL, ":", &next_token), NULL);
        double temperature = strtod(strtok_s(NULL, ":", &next_token), NULL);
        double pressure = strtod(strtok_s(NULL, ":", &next_token), NULL);
        double humidity = strtod(strtok_s(NULL, ":", &next_token), NULL);
        double ballisticCoefficient = strtod(strtok_s(NULL, ":", &next_token), NULL);
        int dragModel = strtol(strtok_s(NULL, ":", &next_token), NULL, 10);
        char* atmosphereModel = strtok_s(NULL, ":", &next_token);

        double zeroAngle = calculateZeroAngle(zeroRange, muzzleVelocity, boreHeight, temperature, pressure, humidity, ballisticCoefficient, dragModel, atmosphereModel);

        outputStr << DEGREES(zeroAngle);
        strncpy_s(output, outputSize, outputStr.str().c_str(), _TRUNCATE);
        EXTENSION_RETURN();
    }
    strncpy_s(output, outputSize, outputStr.str().c_str(), _TRUNCATE);
    EXTENSION_RETURN();
}
