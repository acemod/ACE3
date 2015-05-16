#pragma once

#include "game.hpp"
#include "base_vehicle.hpp"



namespace ace {
    namespace vehicledamage {
        class vehicle : public base_vehicle {
        public:
            vehicle(uint32_t id, ace::simulation::object_p object_, bool reversed_, ace::vector3<float> position_) : base_vehicle(id, object_, reversed_, position_) {}
        
            bool hit(gamehit *);    

        protected:
            
        };
        typedef std::shared_ptr<vehicle> vehicle_p;
    }
}