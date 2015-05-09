#include "bullet.hpp"

#include <algorithm>
#include <cmath>

namespace ace {
    namespace vehicledamage {
        namespace penetration {
            
            // 
            bool bullet::process() {
                return true;
            }

            /* Hydrodramatic deformation and regid body penetration beinning
            bool bullet::process() {
            float projectileLength = 0; // L??????
            float projectileDensity = 0.0f; // Projectile density
            float projectileVelocity = 0.0f;
            float targetDensity = 0.0f; // target density
            float impactVelocity = 0.0f;

            float tys = 0.0f; // yield strengths, target and projectile
            float pys = 0.0f;

            float v = 0.0f; //v = instantaneous velocity, WTF IS THIS?
            float v0 = impactVelocity;

            float y = std::pow( (targetDensity / projectileDensity), 0.5);

            float A0 = (2.0f * (tys - pys) * (1 - std::pow(y, 2.0f)) ) / targetDensity;

            // u is penetration velocity
            float u = (1 / (1 - std::powf(y, 2.0f)) ) * (v - ( y * ( (std::pow(v + A0,2.0f)) * 0.5) ) );

            // differential deformed length
            float A1 = v + std::pow(( std::pow(v,2.0f) + A0 ), 0.5f);
            float A2 = v0 + std::pow((std::pow(v0, 2.0f) + A0), 0.5f);
            float A3 = (tys - pys) / (y * pys);
            float A4 = (y * projectileDensity) / ( (2 * pys) * (1 - std::pow(y, 2)) );
            float A5 = v + std::pow(std::pow(v, 2) + A0, 0.5f) - (y * std::pow(v, 2));
            float A6 = v0 + std::pow((std::pow(v0, 2) + A0), 0.5) - (y * std::pow(v0,2));

            float dL = projectileLength * (A1 / A2) * A3 * std::exp(1) * ( A4 * ( A5 - A6) );

            float _dP = (projectileDensity / pys) * u * dL * projectileVelocity;

            // Hydrodynamic  flow  conditions  cease  at  this  velocity  threshold,  when  the  penetration
            // velocity  equals  the  velocity  of  the  rear  portion  of  the  projectile.Note  that  the  following  relation
            // is only valid where the strength of the projectile is greater than that of the target
            //
            float vHT = std::pow( (2 * (pys - tys)) / projectileDensity, 0.5f );


            return true;
            }
            */
        }
    }
}