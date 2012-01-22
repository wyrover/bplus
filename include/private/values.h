#ifndef _PRIVATE_VALUES_H_
#define _PRIVATE_VALUES_H_

#include "private/tree.h"
#include <stdint.h>

#define BP__KV_HEADER_SIZE 24
#define BP__KV_SIZE(kv) BP__KV_HEADER_SIZE + kv.length

typedef struct bp__kv_s bp__kv_t;


int bp__value_load(bp_tree_t* t,
                   const uint64_t offset,
                   const uint64_t length,
                   bp_value_t* value,
                   bp__kv_t* previous);
int bp__value_save(bp_tree_t* t,
                   const bp_value_t* value,
                   const bp__kv_t* previous,
                   uint64_t* offset,
                   uint64_t* length);

int bp__kv_copy(const bp__kv_t* source, bp__kv_t* target, int alloc);

struct bp__kv_s {
  BP_KEY_FIELDS

  uint64_t offset;
  uint64_t config;

  uint8_t allocated;
};

#endif /* _PRIVATE_VALUES_H_ */