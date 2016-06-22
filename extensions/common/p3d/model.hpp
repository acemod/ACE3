#pragma once

#include "shared.hpp"

#include "animation.hpp"
#include "skeleton.hpp"
#include "model_info.hpp"
#include "lod_info.hpp"

namespace ace {
    namespace p3d {
        class face_settings {
        public:
            face_settings() {}
            face_settings(std::istream &stream_, uint32_t version = 68) {
                stream_.read((char *)&count, sizeof(uint32_t));
                stream_.read((char *)&unknown, sizeof(uint8_t) * 21);
            }

            uint32_t    count;
            uint8_t     unknown[21];
        };
        typedef std::shared_ptr<face_settings> face_settings_p;
        
        class model {
        public:
            model();
            model(std::istream &, const std::string &filename_ = "");
            ~model();

            // LOD info
            bool                                *useFaceDefaults;
            std::vector<face>                   defaultFaces;
            std::vector<lod_p>                  lods;

            size_t                              size;
            model_info_p                        info;
            skeleton_p                          skeleton;

            bool                                has_animations;
            std::vector<animation_p>            animations;
            

            std::vector<uint32_t>               start_lod;
            std::vector<uint32_t>               end_lod;

            // data root fileds
            std::string                         filename;
            uint32_t                            lod_count;
            uint32_t                            filetype;
            uint64_t                            version;
            std::string                         prefix_name;

        };
        typedef std::shared_ptr<model> model_p;
    }
}
