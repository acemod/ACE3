#pragma once

#include "materials.hpp"
#include "longrod.hpp"
#include <algorithm>

/* http://www.longrods.ch/bilder/perf_eq.jpg

D = _projectileDiameter
L = _length, length of penetrator mm
Lw = _workingLength, working length
Vt = _impactVelocity, impact velocity km/s
0/ = _impactAngle, angle of oblquity
Pp = _projectileDensity, kg/m3
Pt = _targetDensity, kg/m3
d = _targetThickness, mm
BHNP = _projectileHardness, hardness number penetration
BHNT = _targetHardness, hardness number of targets

// WOrking lengths:
// http://www.longrods.ch/wlength.php
// frustrum
Lw = L - #L
#L = Lf * (1-1/3(1+d/D+(d/D)^2))
// cylindric penetration
_workingLength = Lw = L

@TODO: We need to implement full frustrum


    case 'tu': { _materialCoefficients = [0.994, 134.5, -0.148, 0, 0]; };
    case 'du': { _materialCoefficients = [0.825, 90.0, -0.0849, 0, 0]; };
    case 'steel': { _materialCoefficients = [1.104, 9874, 0, 0.3598, -0.2342]; };
*/

using namespace ace::vehicledamage;

namespace ace {
    namespace vehicledamage {
        namespace penetration {

            const float longrod::material_coefficients[][5] = {        // HARDNESS IS LAST!
                { 0.994f, 134.5f, -0.148f, 0.0f, 0.0f },
                { 0.825f, 90.0f, -0.0849f, 0.0f, 0.0f },
                { 1.104f, 9874.0f, 0.0f, 0.3598f, -0.2342f }
            };
            float longrod::_working_length() {
                if(_hit->projectile.type == PROJECTILE_TYPE::CYLINDER)
                    return _hit->projectile.length;
                if (_hit->projectile.type != PROJECTILE_TYPE::FRUSTUM)
                    return -1;

                // Frustum math
                float x = 1 - ((1/3) *(1 + _hit->projectile.frustum_diameter / _hit->projectile.diameter + (std::pow(_hit->projectile.frustum_diameter / _hit->projectile.diameter, 2))));
                float Ldelta = _hit->projectile.frustum_length * x;
                float Lw = _hit->projectile.length - Ldelta;

                return Lw;
            }
            bool longrod::process() {
                float b0 = 0.283;
                float b1 = 0.0656;
                float m = -0.224;
                
                float Lw = _working_length();
                float impact_velocity = _hit->projectile.velocity.magnitude() / 1000;
                ace::vector3<float> vel_norm = _hit->projectile.velocity.normalize();
                ace::vector3<float> surface_norm = _hit->surface.normalize();
                float impact_angle = surface_norm.dot(vel_norm);
                
                uint32_t material_index = 2;
                
                float targetHardness = material_properties[material_index][0];
                float projectileHardness = material_properties[material_index][0];
                float target_density = material_properties[material_index][1];

                float a = material_coefficients[material_index][0];
                float c0 = material_coefficients[material_index][1];
                float c1 = material_coefficients[material_index][2];
                float k = material_coefficients[material_index][3];
                float n = material_coefficients[material_index][4];

                float s2 = 0;

                if (material_index < 2) {
                    s2 = (c0 + c1 * targetHardness) * targetHardness / _hit->projectile.density;
                } else {
                    s2 = c0 * (std::pow(projectileHardness, k)) * (std::pow(targetHardness, n)) / _hit->projectile.density;
                };

                float tanX = b0 + b1 * (Lw / _hit->projectile.diameter);

                float w = 1 / std::tanh(tanX);
                float x = std::pow(std::cos(impact_angle), m);
                float y = sqrt(_hit->projectile.density / target_density);
                float z = std::pow(std::exp(1), (-(s2) / std::pow(impact_velocity, 2)));

                float P = a * w * x * y * z;
                float solution = P * Lw;

                _result.linear_depth = solution;

                return true;
            }
        }
    }
};