#ifndef _PRIVATE_PAGES_H_
#define _PRIVATE_PAGES_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "private/tree.h"
#include "private/values.h"

typedef struct bp__page_s bp__page_t;
typedef struct bp__page_search_res_s bp__page_search_res_t;

enum page_type {
  kPage = 0,
  kLeaf = 1
};

enum search_type {
  kNotLoad = 0,
  kLoad = 1
};

int bp__page_create(bp_tree_t* t,
                    const enum page_type type,
                    const uint64_t offset,
                    const uint64_t config,
                    bp__page_t** page);
void bp__page_destroy(bp_tree_t* t, bp__page_t* page);
int bp__page_clone(bp_tree_t* t, bp__page_t* page, bp__page_t** clone);

int bp__page_read(bp_tree_t* t, bp__page_t* page);
int bp__page_load(bp_tree_t* t,
                  const uint64_t offset,
                  const uint64_t config,
                  bp__page_t** page);
int bp__page_save(bp_tree_t* t, bp__page_t* page);

int bp__page_load_value(bp_tree_t* t,
                        bp__page_t* page,
                        const uint64_t index,
                        bp_value_t* value);
int bp__page_save_value(bp_tree_t* t,
                        bp__page_t* page,
                        const uint64_t index,
                        const int cmp,
                        const bp_key_t* key,
                        const bp_value_t* value);

int bp__page_search(bp_tree_t* t,
                    bp__page_t* page,
                    const bp_key_t* key,
                    const enum search_type type,
                    bp__page_search_res_t* result);
int bp__page_get(bp_tree_t* t,
                 bp__page_t* page,
                 const bp_key_t* key,
                 bp_value_t* value);
int bp__page_get_range(bp_tree_t* t,
                       bp__page_t* page,
                       const bp_key_t* start,
                       const bp_key_t* end,
                       bp_filter_cb filter,
                       bp_range_cb cb,
                       void* arg);
int bp__page_insert(bp_tree_t* t,
                    bp__page_t* page,
                    const bp_key_t* key,
                    const bp_value_t* value);
int bp__page_bulk_insert(bp_tree_t* t,
                         bp__page_t* page,
                         const bp_key_t* limit,
                         uint64_t* count,
                         bp_key_t** keys,
                         bp_value_t** values);
int bp__page_remove(bp_tree_t* t, bp__page_t* page, const bp_key_t* key);
int bp__page_copy(bp_tree_t* source, bp_tree_t* target, bp__page_t* page);

int bp__page_remove_idx(bp_tree_t* t, bp__page_t* page, const uint64_t index);
int bp__page_split(bp_tree_t* t,
                   bp__page_t* parent,
                   const uint64_t index,
                   bp__page_t* child);
int bp__page_split_head(bp_tree_t* t, bp__page_t** page);

void bp__page_shiftr(bp_tree_t* t, bp__page_t* page, const uint64_t index);
void bp__page_shiftl(bp_tree_t* t, bp__page_t* page, const uint64_t index);

struct bp__page_s {
  enum page_type type;

  uint64_t length;
  uint64_t byte_size;

  uint64_t offset;
  uint64_t config;

  void* buff_;
  int is_head;

  bp__kv_t keys[1];
};

struct bp__page_search_res_s {
  bp__page_t* child;

  uint64_t index;
  int cmp;
};

#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /* _PRIVATE_PAGES_H_ */
