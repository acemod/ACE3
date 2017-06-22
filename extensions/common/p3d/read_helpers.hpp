#pragma once

#define READ_BOOL(output) { uint8_t temp; stream_.read((char *)&temp, 1); if(temp != 0) { output = true; } else { output = false; } }
#define READ_DATA(output, size) stream_.read((char *)&output, size);
#define READ_STRING(output) { \
                                    std::stringstream ss; \
                                      for(int x = 0; x < 2056;x++) { char byte = 0; stream_.read((char *)&byte, 1);  if(byte == 0x00) break; ss << byte;  } \
                                    output = ss.str(); \
                                    }
// @TODO:
#define READ_COMPRESSED_DATA(output, size) stream_.read((char *)&output, size)
