/*
 * Generated by Bluespec Compiler, version 2014.07.A (build 34078, 2014-07-30)
 * 
 * On Thu May 31 10:20:58 KST 2018
 * 
 */

/* Generation options: */
#ifndef __model_mkTestBench_h__
#define __model_mkTestBench_h__

#include "bluesim_types.h"
#include "bs_module.h"
#include "bluesim_primitives.h"
#include "bs_vcd.h"

#include "bs_model.h"
#include "mkTestBench.h"

/* Class declaration for a model of mkTestBench */
class MODEL_mkTestBench : public Model {
 
 /* Top-level module instance */
 private:
  MOD_mkTestBench *mkTestBench_instance;
 
 /* Handle to the simulation kernel */
 private:
  tSimStateHdl sim_hdl;
 
 /* Constructor */
 public:
  MODEL_mkTestBench();
 
 /* Functions required by the kernel */
 public:
  void create_model(tSimStateHdl simHdl, bool master);
  void destroy_model();
  void reset_model(bool asserted);
  void get_version(unsigned int *year,
		   unsigned int *month,
		   char const **annotation,
		   char const **build);
  time_t get_creation_time();
  void * get_instance();
  void dump_state();
  void dump_VCD_defs();
  void dump_VCD(tVCDDumpType dt);
  tUInt64 skip_license_check();
};

/* Function for creating a new model */
extern "C" {
  void * new_MODEL_mkTestBench();
}

#endif /* ifndef __model_mkTestBench_h__ */
