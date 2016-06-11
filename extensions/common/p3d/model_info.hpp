#pragma once

#include "shared.hpp"
#include "vector.hpp"
#include "skeleton.hpp"
#include "lod_types.hpp"
#include <sstream>

namespace ace {
    namespace p3d {
        class model_info {
        public:
            model_info();
            model_info(std::istream &, const uint32_t lod_count, uint32_t version = 68);
            ~model_info();


        public:
            std::vector<int>    resolutions;
            float              *raw_resolutions;//LodTypes[Header.NoOfLods];// alias resolutions
            uint32_t            index;                    // appears to be a bit flag, 512, 256 eg
            float               lod_sphere_mem;
            float               lod_sphere_geo;             // mostly same as MemLodSphere
            uint32_t            point_flags[3];            // typically 00 00 00 00  00 00 00 00 00 00 0C 00 eg (last is same as user point flags)
            ace::vector3<float>  offset_1;                   // model offset (unknown functionality),//mostly same as offset2
            uint32_t            map_icon_color;             // RGBA 32 color
            uint32_t            map_selected_color;         // RGBA 32 color
            float               view_density;              //

            ace::vector3<float>  bbox_min_pos;          // minimum coordinates of bounding box
            ace::vector3<float>  bbox_max_pos;          // maximum coordinates of bounding box. Generally the complement of the 1st
                                                        // pew.GeometryBounds in Pew is bboxMinPosition-bboxMaxPosition for X and Z
                                                        // pew.ResolutionBounds mostly the same
            ace::vector3<float>  center_of_gravity;          // pew.GeometryAutoCenterPos (and mostly pew.ResolutionAutoCenterPos too)
            ace::vector3<float>  offset_2;                  // mostly same as Offset1 often same as CentreOfGravity (but it isn't ResolutionPos)
            ace::vector3<float>  cog_offset;                // see below
            ace::vector3<float>  mass_vectors[3];      // for ODOL7 this is a mixture of floats and index values
                                                       //// if Arma3 /////////////////
            uint8_t             thermal_profile_2[24];
            ///////////////////////////////
            bool                autocenter;
            bool                lock_autocenter;
            bool                allow_occlude;
            bool                allow_occluded;
            bool                allow_animation;
            ///////////ARMA/VBS2 ////////////
            uint8_t             u_bytes_1[6];      //
            uint8_t             thermal_profile[24];       // 
            uint32_t            u_long_1;              // V48 and beyond
                                                        //uint8_t             thermal_profile[24];      // TOH only (v52) see above for arma3

            skeleton_p          skeleton;                 //

            uint8_t             u_byte_1;
            uint32_t            u_floats_1_size;                  // always zero for arma
            float               *u_floats_1;   // potentially compressed
            float               mass;
            float               mass_reciprocal;           // see note
            float               mass_alt;                  // see note
            float               mass_alt_reciprocoal;        // see note
            uint8_t             u_bytes_2[14];    // see note generally FF FF FF FF FF FF FF FF FF FF FF FF
            uint8_t             u_short_1;              // often same as NoOfLods
            bool                u_bool_1;              // generally set if ascii below has strings
            std::string         class_type;             // asciiz      ClassType;                // class="House" See Named Properties
            std::string         destruct_type;     //DestructType;             // damage="Tent" See Named Properties
            bool                u_bool_2;             // rarely true
            bool                u_bool_3;             // rarely true
            uint32_t            u_long_2;                  //
            uint8_t             *default_indicators;//default_indicators[NoOfLods][12]; //generally FF FF FF FF FF FF FF FF FF FF FF FF
        };
        typedef std::shared_ptr<model_info> model_info_p;

    }
}
