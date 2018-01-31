BOOK_CODE_PATH = "E:/book-code"
THIRD_PARTY = "E:/book-code/3rdparty"
WORK_PATH = os.getcwd()
includeexternal (BOOK_CODE_PATH .. "/premake-vs-include.lua")




workspace(path.getname(os.realpath(".")))
    language "C++"
    location "build/%{_ACTION}/%{wks.name}"    
    if _ACTION == "vs2015" then
        toolset "v140_xp"
    elseif _ACTION == "vs2013" then
        toolset "v120_xp"
    end

    --include (BOOK_CODE_PATH .. "/common.lua")    
    


    function create_example_project(name, dir)        
        project(name)          
        kind "ConsoleApp"                                             
        files
        {                                  
            dir .. "/%{prj.name}/**.h",
            dir .. "/%{prj.name}/**.cpp", 
            dir .. "/%{prj.name}/**.c", 
            dir .. "/%{prj.name}/**.rc",
            "3rdparty/scheduler/**"
        }
        removefiles
        {               
        }
        includedirs
        {               
            "3rdparty",          
        }         
        has_stdafx(name, dir)               
    end    
    

    group "BPlusTree"    

        project "bplus"          
            kind "ConsoleApp" 
            defines { "PTW32_STATIC_LIB" }
            files
            {              
                
                "src/*.c",
                "test/test_example01.cpp"
                
            }
            removefiles
            {     
            
            }
            includedirs
            {               
                "include",
                "3rdparty/pthread-win32"
            }  
            links
            {
                "pthread",
                "ws2_32.lib"
            }
           
        project "pthread"          
            kind "StaticLib" 
            defines { 
                "HAVE_CONFIG_H",
                "__CLEANUP_SEH",
                "_WINDOWS",
                "PTW32_STATIC_LIB",
                "_CRT_SECURE_NO_DEPRECATE",
                "PTW32_RC_MSC",
                "PTW32_ARCHx86"
            }
            files
            {      
                
                
                "3rdparty/pthread-win32/version.rc",
"3rdparty/pthread-win32/config.h",
"3rdparty/pthread-win32/context.h",
"3rdparty/pthread-win32/implement.h",
"3rdparty/pthread-win32/need_errno.h",
"3rdparty/pthread-win32/pthread.h",
"3rdparty/pthread-win32/sched.h",
"3rdparty/pthread-win32/semaphore.h",
"3rdparty/pthread-win32/autostatic.c",
"3rdparty/pthread-win32/cleanup.c",
"3rdparty/pthread-win32/create.c",
"3rdparty/pthread-win32/dll.c",
"3rdparty/pthread-win32/errno.c",
"3rdparty/pthread-win32/global.c",
--"3rdparty/pthread-win32/pthread.c",
"3rdparty/pthread-win32/pthread_attr_destroy.c",
"3rdparty/pthread-win32/pthread_attr_getdetachstate.c",
"3rdparty/pthread-win32/pthread_attr_getinheritsched.c",
"3rdparty/pthread-win32/pthread_attr_getschedparam.c",
"3rdparty/pthread-win32/pthread_attr_getschedpolicy.c",
"3rdparty/pthread-win32/pthread_attr_getscope.c",
"3rdparty/pthread-win32/pthread_attr_getstackaddr.c",
"3rdparty/pthread-win32/pthread_attr_getstacksize.c",
"3rdparty/pthread-win32/pthread_attr_init.c",
"3rdparty/pthread-win32/pthread_attr_setdetachstate.c",
"3rdparty/pthread-win32/pthread_attr_setinheritsched.c",
"3rdparty/pthread-win32/pthread_attr_setschedparam.c",
"3rdparty/pthread-win32/pthread_attr_setschedpolicy.c",
"3rdparty/pthread-win32/pthread_attr_setscope.c",
"3rdparty/pthread-win32/pthread_attr_setstackaddr.c",
"3rdparty/pthread-win32/pthread_attr_setstacksize.c",
"3rdparty/pthread-win32/pthread_barrier_destroy.c",
"3rdparty/pthread-win32/pthread_barrier_init.c",
"3rdparty/pthread-win32/pthread_barrier_wait.c",
"3rdparty/pthread-win32/pthread_barrierattr_destroy.c",
"3rdparty/pthread-win32/pthread_barrierattr_getpshared.c",
"3rdparty/pthread-win32/pthread_barrierattr_init.c",
"3rdparty/pthread-win32/pthread_barrierattr_setpshared.c",
"3rdparty/pthread-win32/pthread_cancel.c",
"3rdparty/pthread-win32/pthread_cond_destroy.c",
"3rdparty/pthread-win32/pthread_cond_init.c",
"3rdparty/pthread-win32/pthread_cond_signal.c",
"3rdparty/pthread-win32/pthread_cond_wait.c",
"3rdparty/pthread-win32/pthread_condattr_destroy.c",
"3rdparty/pthread-win32/pthread_condattr_getpshared.c",
"3rdparty/pthread-win32/pthread_condattr_init.c",
"3rdparty/pthread-win32/pthread_condattr_setpshared.c",
"3rdparty/pthread-win32/pthread_delay_np.c",
"3rdparty/pthread-win32/pthread_detach.c",
"3rdparty/pthread-win32/pthread_equal.c",
"3rdparty/pthread-win32/pthread_exit.c",
"3rdparty/pthread-win32/pthread_getconcurrency.c",
"3rdparty/pthread-win32/pthread_getschedparam.c",
"3rdparty/pthread-win32/pthread_getspecific.c",
"3rdparty/pthread-win32/pthread_getunique_np.c",
"3rdparty/pthread-win32/pthread_getw32threadhandle_np.c",
"3rdparty/pthread-win32/pthread_join.c",
"3rdparty/pthread-win32/pthread_key_create.c",
"3rdparty/pthread-win32/pthread_key_delete.c",
"3rdparty/pthread-win32/pthread_kill.c",
"3rdparty/pthread-win32/pthread_mutex_consistent.c",
"3rdparty/pthread-win32/pthread_mutex_destroy.c",
"3rdparty/pthread-win32/pthread_mutex_init.c",
"3rdparty/pthread-win32/pthread_mutex_lock.c",
"3rdparty/pthread-win32/pthread_mutex_timedlock.c",
"3rdparty/pthread-win32/pthread_mutex_trylock.c",
"3rdparty/pthread-win32/pthread_mutex_unlock.c",
"3rdparty/pthread-win32/pthread_mutexattr_destroy.c",
"3rdparty/pthread-win32/pthread_mutexattr_getkind_np.c",
"3rdparty/pthread-win32/pthread_mutexattr_getpshared.c",
"3rdparty/pthread-win32/pthread_mutexattr_getrobust.c",
"3rdparty/pthread-win32/pthread_mutexattr_gettype.c",
"3rdparty/pthread-win32/pthread_mutexattr_init.c",
"3rdparty/pthread-win32/pthread_mutexattr_setkind_np.c",
"3rdparty/pthread-win32/pthread_mutexattr_setpshared.c",
"3rdparty/pthread-win32/pthread_mutexattr_setrobust.c",
"3rdparty/pthread-win32/pthread_mutexattr_settype.c",
"3rdparty/pthread-win32/pthread_num_processors_np.c",
"3rdparty/pthread-win32/pthread_once.c",
"3rdparty/pthread-win32/pthread_rwlock_destroy.c",
"3rdparty/pthread-win32/pthread_rwlock_init.c",
"3rdparty/pthread-win32/pthread_rwlock_rdlock.c",
"3rdparty/pthread-win32/pthread_rwlock_timedrdlock.c",
"3rdparty/pthread-win32/pthread_rwlock_timedwrlock.c",
"3rdparty/pthread-win32/pthread_rwlock_tryrdlock.c",
"3rdparty/pthread-win32/pthread_rwlock_trywrlock.c",
"3rdparty/pthread-win32/pthread_rwlock_unlock.c",
"3rdparty/pthread-win32/pthread_rwlock_wrlock.c",
"3rdparty/pthread-win32/pthread_rwlockattr_destroy.c",
"3rdparty/pthread-win32/pthread_rwlockattr_getpshared.c",
"3rdparty/pthread-win32/pthread_rwlockattr_init.c",
"3rdparty/pthread-win32/pthread_rwlockattr_setpshared.c",
"3rdparty/pthread-win32/pthread_self.c",
"3rdparty/pthread-win32/pthread_setaffinity.c",
"3rdparty/pthread-win32/pthread_setcancelstate.c",
"3rdparty/pthread-win32/pthread_setcanceltype.c",
"3rdparty/pthread-win32/pthread_setconcurrency.c",
"3rdparty/pthread-win32/pthread_setschedparam.c",
"3rdparty/pthread-win32/pthread_setspecific.c",
"3rdparty/pthread-win32/pthread_spin_destroy.c",
"3rdparty/pthread-win32/pthread_spin_init.c",
"3rdparty/pthread-win32/pthread_spin_lock.c",
"3rdparty/pthread-win32/pthread_spin_trylock.c",
"3rdparty/pthread-win32/pthread_spin_unlock.c",
"3rdparty/pthread-win32/pthread_testcancel.c",
"3rdparty/pthread-win32/pthread_timechange_handler_np.c",
"3rdparty/pthread-win32/pthread_timedjoin_np.c",
"3rdparty/pthread-win32/pthread_tryjoin_np.c",
"3rdparty/pthread-win32/pthread_win32_attach_detach_np.c",
"3rdparty/pthread-win32/ptw32_calloc.c",
"3rdparty/pthread-win32/ptw32_callUserDestroyRoutines.c",
"3rdparty/pthread-win32/ptw32_cond_check_need_init.c",
"3rdparty/pthread-win32/ptw32_getprocessors.c",
"3rdparty/pthread-win32/ptw32_is_attr.c",
"3rdparty/pthread-win32/ptw32_MCS_lock.c",
"3rdparty/pthread-win32/ptw32_mutex_check_need_init.c",
"3rdparty/pthread-win32/ptw32_new.c",
"3rdparty/pthread-win32/ptw32_processInitialize.c",
"3rdparty/pthread-win32/ptw32_processTerminate.c",
"3rdparty/pthread-win32/ptw32_relmillisecs.c",
"3rdparty/pthread-win32/ptw32_reuse.c",
"3rdparty/pthread-win32/ptw32_rwlock_cancelwrwait.c",
"3rdparty/pthread-win32/ptw32_rwlock_check_need_init.c",
"3rdparty/pthread-win32/ptw32_semwait.c",
"3rdparty/pthread-win32/ptw32_spinlock_check_need_init.c",
"3rdparty/pthread-win32/ptw32_threadDestroy.c",
"3rdparty/pthread-win32/ptw32_threadStart.c",
"3rdparty/pthread-win32/ptw32_throw.c",
"3rdparty/pthread-win32/ptw32_timespec.c",
"3rdparty/pthread-win32/ptw32_tkAssocCreate.c",
"3rdparty/pthread-win32/ptw32_tkAssocDestroy.c",
"3rdparty/pthread-win32/sched_get_priority_max.c",
"3rdparty/pthread-win32/sched_get_priority_min.c",
"3rdparty/pthread-win32/sched_getscheduler.c",
"3rdparty/pthread-win32/sched_setaffinity.c",
"3rdparty/pthread-win32/sched_setscheduler.c",
"3rdparty/pthread-win32/sched_yield.c",
"3rdparty/pthread-win32/sem_close.c",
"3rdparty/pthread-win32/sem_destroy.c",
"3rdparty/pthread-win32/sem_getvalue.c",
"3rdparty/pthread-win32/sem_init.c",
"3rdparty/pthread-win32/sem_open.c",
"3rdparty/pthread-win32/sem_post.c",
"3rdparty/pthread-win32/sem_post_multiple.c",
"3rdparty/pthread-win32/sem_timedwait.c",
"3rdparty/pthread-win32/sem_trywait.c",
"3rdparty/pthread-win32/sem_unlink.c",
"3rdparty/pthread-win32/sem_wait.c",
"3rdparty/pthread-win32/signal.c",
"3rdparty/pthread-win32/w32_CancelableWait.c",
                
                
            }
            removefiles
            {     
            
            }
            includedirs
            {               
                "3rdparty/pthread-win32" 
            }         
        