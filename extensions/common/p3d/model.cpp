#include "p3d/model.hpp"

#include "read_helpers.hpp"

namespace ace {
    namespace p3d {
        model::model() : skeleton(nullptr), info(nullptr), useFaceDefaults(nullptr) {}
        model::model(std::istream &stream_, const std::string &filename_) {
            filename = filename_;

            // get the full file size
            stream_.seekg(0, std::ios::end);
            size = stream_.tellg();
            stream_.seekg(0, std::ios::beg);

            // Parse header here
            stream_.read((char *)&filetype, sizeof(uint32_t));
            stream_.read((char *)&version, sizeof(uint64_t));
            if (version >= 48) {
                READ_STRING(prefix_name);
            }

            stream_.read((char *)&lod_count, sizeof(uint32_t));

            // parse model info here
            info = std::make_shared<model_info>(stream_, lod_count);
            skeleton = info->skeleton;

            READ_BOOL(has_animations);
            if (has_animations) {
                uint32_t animation_count = 0;
                stream_.read((char *)&animation_count, sizeof(uint32_t));
                for (int x = 0; x < animation_count; x++) {
                    animations.push_back(std::make_shared<animation>(stream_, version));
                }
           

                // Now we re-walk, and association animations and bones
                uint32_t bone_count, local_lod_count;
                stream_.read((char *)&local_lod_count, sizeof(uint32_t));
                for (int lod = 0; lod < local_lod_count; lod++) {
                    stream_.read((char *)&bone_count, sizeof(uint32_t));
                    std::vector<uint32_t> lod_bone2anim;
                    for (int x = 0; x < bone_count; x++) {
                        uint32_t anim_count;
                        stream_.read((char *)&anim_count, sizeof(uint32_t));

                        for (int anim = 0; anim < anim_count; anim++) {
                            uint32_t anim_index;
                            stream_.read((char *)&anim_index, sizeof(uint32_t));
                            if(std::find(skeleton->all_bones[x]->animations.begin(), skeleton->all_bones[x]->animations.end(), anim_index) == skeleton->all_bones[x]->animations.end()) {
                                skeleton->all_bones[x]->animations.push_back(anim_index);
                            }
                        };
                    }
                }

                // Anims2Bones
                for (int lod = 0; lod < lod_count; lod++) {
                    for (animation_p & anim : animations) {
                        animate_bone_p next = std::make_shared<animate_bone>();
                        next->lod = lod;
                        stream_.read((char *)&next->index, sizeof(int32_t));
                        if (next->index != -1 && anim->type != 8 && anim->type != 9) {
                            next->axis_position = ace::vector3<float>(stream_);
                            next->axis_direction = ace::vector3<float>(stream_);
                        }
                        anim->bones.push_back(next);
                    }
                }
            }
            // LOD indexes
            for (int lod = 0; lod < lod_count; lod++) {
                uint32_t offset;
                stream_.read((char *)&offset, sizeof(uint32_t));
                start_lod.push_back(offset);
                LOG(DEBUG) << "LOD Offset: #" << lod << " : " << offset;
            }
            for (int lod = 0; lod < lod_count; lod++) {
                uint32_t offset;
                stream_.read((char *)&offset, sizeof(uint32_t));
                end_lod.push_back(offset);
                LOG(DEBUG) << "LOD Offset: #" << lod << " : " << offset;
            }

            // Attempt to read the faces?
            useFaceDefaults = new bool[lod_count];
            for (int lod = 0; lod < lod_count; lod++) {
                READ_BOOL(useFaceDefaults[lod]);
            }
            for (int x = 0; x < lod_count; x++) {
                if (!useFaceDefaults[x]) {
                    face_settings tface(stream_);       // @TODO: we dont save these because WHY!?
                }
            }

            for (int lod = 0; lod < lod_count; lod++) {
                char buffer[64]; 
                #ifdef _DEBUG
                sprintf_s(buffer, "\t\t%08X",  info->resolutions[lod]);
                LOG(DEBUG) << "LOD #" << lod << ", type: " << buffer;
                #endif
                //if (info->resolutions[lod] == LOD_TYPE_GEOMETRY_FIRE) {
                //    LOG(DEBUG) << "Found a desired geometry";
                    stream_.clear();
                    stream_.seekg(start_lod[lod], stream_.beg);
                    lods.push_back(std::make_shared<ace::p3d::lod>(stream_, lod, version));
               //} 
            }
        }
        model::~model() {
            if(useFaceDefaults)
                delete[] useFaceDefaults;
        }
    }
}
