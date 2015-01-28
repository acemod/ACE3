/*
 * ace_fcs.cpp
 *
 * Calculates firing solution.
 *
 * Takes:
 * initSpeed,airFriction,angle,distance as string
 * Example: "900,-0.0004,2,1050"
 *
 * Returns:
 * Correction to angle
 */

#include "stdafx.h"

#define _USE_MATH_DEFINES

#include <math.h>
#include <sstream>
#include <vector>
#include <string>

#define MAXELEVATION 20
#define SIMULATIONSTEP 0.05
#define MAXITERATIONS 120
#define PRECISION 0.1
#define RADIANS(X) (X / (180 / M_PI))

static char version[] = "1.0";

extern "C" {
    __declspec (dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function);
};

std::vector<std::string> splitString(std::string input) {
    std::istringstream ss(input);
    std::string token;

    std::vector<std::string> output;
    while (std::getline(ss, token, ',')) {
        output.push_back(token);
    }

    return output;
}

double traceBullet(double initSpeed, double airFriction, double angle, double angleTarget, double distance) {
    double velX, velY, posX, posY, posTargetX, posTargetY, velMag;
    velX = cos(RADIANS(angle)) * initSpeed;
    velY = sin(RADIANS(angle)) * initSpeed;
    posX = 0;
    posY = 0;
    posTargetX = cos(RADIANS(angleTarget)) * distance;
    posTargetY = sin(RADIANS(angleTarget)) * distance;

    int i = 0;
    while (i < MAXITERATIONS) {
        velMag = sqrt(pow(velX, 2) + pow(velY, 2));
        velX += SIMULATIONSTEP * (velX * velMag * airFriction);
        velY += SIMULATIONSTEP * (velY * velMag * airFriction - 9.81);
        posX += velX * SIMULATIONSTEP;
        posY += velY * SIMULATIONSTEP;
        if (posX >= posTargetX) { break; }
        i++;
    }

    return posY - posTargetY;
}

double getSolution(double initSpeed, double airFriction, double angleTarget, double distance) {
    double posTargetX, posTargetY;
    posTargetX = cos(RADIANS(angleTarget)) * distance;
    posTargetY = sin(RADIANS(angleTarget)) * distance;

    if (traceBullet(initSpeed, airFriction, MAXELEVATION, angleTarget, distance) < 0) {
        return MAXELEVATION - angleTarget;
    }

    double a1 = angleTarget;
    double a2 = MAXELEVATION;
    double f1, f2, tmp;
    f1 = traceBullet(initSpeed, airFriction, a1, angleTarget, distance);
    if (fabs(f1) <= PRECISION) { return 0; }
    while (fabs(f1) > PRECISION) {
        f2 = traceBullet(initSpeed, airFriction, a2, angleTarget, distance);
        tmp = a2 - f2 * (a2 - a1) / (f2 - f1);
        a1 = a2;
        a2 = tmp;
        f1 = f2;
    }

    return a2 - angleTarget;
}

// i like to live dangerously. jk, fix strncpy sometime pls.
#pragma warning( push )
#pragma warning( disable : 4996 )

void __stdcall RVExtension(char *output, int outputSize, const char *function) {
    if (!strcmp(function, "version")) {
        strncpy(output, version, outputSize);
    } else {
        std::vector<std::string> argStrings = splitString(function);
        double initSpeed = std::stod(argStrings[0]);
        double airFriction = std::stod(argStrings[1]);
        double angleTarget = std::stod(argStrings[2]);
        double distance = std::stod(argStrings[3]);

        double result = getSolution(initSpeed, airFriction, angleTarget, distance);
        std::string resultString = std::to_string(result);

        strcpy(output, resultString.c_str());
        output[outputSize - 1] = '\0';
    }
}

#pragma warning( pop )
