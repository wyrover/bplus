#include <bplus.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <assert.h>

#define TEST_START(name, db_file)\
    int main(void) {\
      fprintf(stdout, "-- %s --\n", name);\
      if (access("/tmp/" db_file ".bp", F_OK) == 0) {\
        assert(unlink("/tmp/" db_file ".bp") == 0);\
      }\
      bp_tree_t db;\
      assert(bp_open(&db, "/tmp/" db_file ".bp") == 0);

#define TEST_END(name, db_file)\
      assert(bp_close(&db) == 0);\
      /* cleanup */\
      if (access("/tmp/" db_file ".bp", F_OK) == 0) {\
        assert(unlink("/tmp/" db_file ".bp") == 0);\
      }\
      return 0;\
    }