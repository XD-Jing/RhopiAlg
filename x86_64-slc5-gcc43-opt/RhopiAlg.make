#-- start of make_header -----------------

#====================================
#  Library RhopiAlg
#
#   Generated Thu Dec 25 19:03:24 2014  by maqm
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_RhopiAlg_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_RhopiAlg_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_RhopiAlg

RhopiAlg_tag = $(tag)

ifdef READONLY
cmt_local_tagfile_RhopiAlg = /tmp/CMT_$(RhopiAlg_tag)_RhopiAlg.make$(cmt_lock_pid)
else
#cmt_local_tagfile_RhopiAlg = $(RhopiAlg_tag)_RhopiAlg.make
cmt_local_tagfile_RhopiAlg = $(bin)$(RhopiAlg_tag)_RhopiAlg.make
endif

else

tags      = $(tag),$(CMTEXTRATAGS)

RhopiAlg_tag = $(tag)

ifdef READONLY
cmt_local_tagfile_RhopiAlg = /tmp/CMT_$(RhopiAlg_tag).make$(cmt_lock_pid)
else
#cmt_local_tagfile_RhopiAlg = $(RhopiAlg_tag).make
cmt_local_tagfile_RhopiAlg = $(bin)$(RhopiAlg_tag).make
endif

endif

-include $(cmt_local_tagfile_RhopiAlg)

ifdef cmt_RhopiAlg_has_target_tag

ifdef READONLY
cmt_final_setup_RhopiAlg = /tmp/CMT_RhopiAlg_RhopiAlgsetup.make
cmt_local_RhopiAlg_makefile = /tmp/CMT_RhopiAlg$(cmt_lock_pid).make
else
cmt_final_setup_RhopiAlg = $(bin)RhopiAlg_RhopiAlgsetup.make
cmt_local_RhopiAlg_makefile = $(bin)RhopiAlg.make
endif

else

ifdef READONLY
cmt_final_setup_RhopiAlg = /tmp/CMT_RhopiAlgsetup.make
cmt_local_RhopiAlg_makefile = /tmp/CMT_RhopiAlg$(cmt_lock_pid).make
else
cmt_final_setup_RhopiAlg = $(bin)RhopiAlgsetup.make
cmt_local_RhopiAlg_makefile = $(bin)RhopiAlg.make
endif

endif

ifdef READONLY
cmt_final_setup = /tmp/CMT_RhopiAlgsetup.make
else
cmt_final_setup = $(bin)RhopiAlgsetup.make
endif

RhopiAlg ::


ifdef READONLY
RhopiAlg ::
	@echo tags=$(tags)
	@echo cmt_local_tagfile=$(cmt_local_tagfile)
endif


dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'RhopiAlg'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = RhopiAlg/
RhopiAlg::
	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

#-- end of make_header ------------------

#-- start of libary_header ---------------

RhopiAlglibname   = $(bin)$(library_prefix)RhopiAlg$(library_suffix)
RhopiAlglib       = $(RhopiAlglibname).a
RhopiAlgstamp     = $(bin)RhopiAlg.stamp
RhopiAlgshstamp   = $(bin)RhopiAlg.shstamp

RhopiAlg :: dirs  RhopiAlgLIB
	$(echo) "RhopiAlg ok"

#-- end of libary_header ----------------

RhopiAlgLIB :: $(RhopiAlglib) $(RhopiAlgshstamp)
	@/bin/echo "------> RhopiAlg : library ok"

$(RhopiAlglib) :: $(bin)Rhopi.o $(bin)Rhopi_entries.o $(bin)Rhopi_load.o
	$(lib_echo) library
	$(lib_silent) cd $(bin); \
	  $(ar) $(RhopiAlglib) $?
	$(lib_silent) $(ranlib) $(RhopiAlglib)
	$(lib_silent) cat /dev/null >$(RhopiAlgstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

$(RhopiAlglibname).$(shlibsuffix) :: $(RhopiAlglib) $(RhopiAlgstamps)
	$(lib_silent) cd $(bin); QUIET=$(QUIET); $(make_shlib) "$(tags)" RhopiAlg $(RhopiAlg_shlibflags)

$(RhopiAlgshstamp) :: $(RhopiAlglibname).$(shlibsuffix)
	@if test -f $(RhopiAlglibname).$(shlibsuffix) ; then cat /dev/null >$(RhopiAlgshstamp) ; fi

RhopiAlgclean ::
	$(cleanup_echo) objects
	$(cleanup_silent) cd $(bin); /bin/rm -f $(bin)Rhopi.o $(bin)Rhopi_entries.o $(bin)Rhopi_load.o

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

ifeq ($(INSTALLAREA),)
installarea = $(CMTINSTALLAREA)
else
ifeq ($(findstring `,$(INSTALLAREA)),`)
installarea = $(shell $(subst `,, $(INSTALLAREA)))
else
installarea = $(INSTALLAREA)
endif
endif

install_dir = ${installarea}/${CMTCONFIG}/lib
RhopiAlginstallname = $(library_prefix)RhopiAlg$(library_suffix).$(shlibsuffix)

RhopiAlg :: RhopiAlginstall

install :: RhopiAlginstall

RhopiAlginstall :: $(install_dir)/$(RhopiAlginstallname)
	@if test ! "${installarea}" = ""; then\
	  echo "installation done"; \
	fi

$(install_dir)/$(RhopiAlginstallname) :: $(bin)$(RhopiAlginstallname)
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test ! -d "$(install_dir)"; then \
	      mkdir -p $(install_dir); \
	    fi ; \
	    if test -d "$(install_dir)"; then \
	      echo "Installing library $(RhopiAlginstallname) into $(install_dir)"; \
	      if test -e $(install_dir)/$(RhopiAlginstallname); then \
	        $(cmt_uninstall_area_command) $(install_dir)/$(RhopiAlginstallname); \
	        $(cmt_uninstall_area_command) $(install_dir)/$(RhopiAlginstallname).cmtref; \
	      fi; \
	      $(cmt_install_area_command) `pwd`/$(RhopiAlginstallname) $(install_dir)/$(RhopiAlginstallname); \
	      echo `pwd`/$(RhopiAlginstallname) >$(install_dir)/$(RhopiAlginstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot install library $(RhopiAlginstallname), no installation directory specified"; \
	  fi; \
	fi

RhopiAlgclean :: RhopiAlguninstall

uninstall :: RhopiAlguninstall

RhopiAlguninstall ::
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test -d "$(install_dir)"; then \
	      echo "Removing installed library $(RhopiAlginstallname) from $(install_dir)"; \
	      $(cmt_uninstall_area_command) $(install_dir)/$(RhopiAlginstallname); \
	      $(cmt_uninstall_area_command) $(install_dir)/$(RhopiAlginstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot uninstall library $(RhopiAlginstallname), no installation directory specified"; \
	  fi; \
	fi




#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),RhopiAlgclean)

#$(bin)RhopiAlg_dependencies.make :: dirs

ifndef QUICK
$(bin)RhopiAlg_dependencies.make : ../src/Rhopi.cxx ../src/components/Rhopi_entries.cxx ../src/components/Rhopi_load.cxx $(use_requirements) $(cmt_final_setup_RhopiAlg)
	$(echo) "(RhopiAlg.make) Rebuilding $@"; \
	  $(build_dependencies) RhopiAlg -all_sources -out=$@ ../src/Rhopi.cxx ../src/components/Rhopi_entries.cxx ../src/components/Rhopi_load.cxx
endif

#$(RhopiAlg_dependencies)

-include $(bin)RhopiAlg_dependencies.make

endif
#-- end of dependency -------------------
#-- start of cpp_library -----------------

$(bin)RhopiAlg_dependencies.make : $(Rhopi_cxx_dependencies)

$(bin)$(binobj)Rhopi.o : $(Rhopi_cxx_dependencies)
	$(cpp_echo) $(src)Rhopi.cxx
	$(cpp_silent) $(cppcomp) -o $(@) $(use_pp_cppflags) $(RhopiAlg_pp_cppflags) $(lib_RhopiAlg_pp_cppflags) $(Rhopi_pp_cppflags) $(use_cppflags) $(RhopiAlg_cppflags) $(lib_RhopiAlg_cppflags) $(Rhopi_cppflags) $(Rhopi_cxx_cppflags)  $(src)Rhopi.cxx

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

$(bin)RhopiAlg_dependencies.make : $(Rhopi_entries_cxx_dependencies)

$(bin)$(binobj)Rhopi_entries.o : $(Rhopi_entries_cxx_dependencies)
	$(cpp_echo) $(src)components/Rhopi_entries.cxx
	$(cpp_silent) $(cppcomp) -o $(@) $(use_pp_cppflags) $(RhopiAlg_pp_cppflags) $(lib_RhopiAlg_pp_cppflags) $(Rhopi_entries_pp_cppflags) $(use_cppflags) $(RhopiAlg_cppflags) $(lib_RhopiAlg_cppflags) $(Rhopi_entries_cppflags) $(Rhopi_entries_cxx_cppflags) -I../src/components $(src)components/Rhopi_entries.cxx

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

$(bin)RhopiAlg_dependencies.make : $(Rhopi_load_cxx_dependencies)

$(bin)$(binobj)Rhopi_load.o : $(Rhopi_load_cxx_dependencies)
	$(cpp_echo) $(src)components/Rhopi_load.cxx
	$(cpp_silent) $(cppcomp) -o $(@) $(use_pp_cppflags) $(RhopiAlg_pp_cppflags) $(lib_RhopiAlg_pp_cppflags) $(Rhopi_load_pp_cppflags) $(use_cppflags) $(RhopiAlg_cppflags) $(lib_RhopiAlg_cppflags) $(Rhopi_load_cppflags) $(Rhopi_load_cxx_cppflags) -I../src/components $(src)components/Rhopi_load.cxx

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: RhopiAlgclean
	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(RhopiAlg.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
else
.DEFAULT::
	$(echo) "(RhopiAlg.make) PEDANTIC: $@: No rule for such target" >&2
	if test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_RhopiAlg)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(RhopiAlg.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr index $@ '/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(RhopiAlg.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(RhopiAlg.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

RhopiAlgclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(binobj)$(library_prefix)RhopiAlg$(library_suffix).a $(binobj)$(library_prefix)RhopiAlg$(library_suffix).s? $(binobj)RhopiAlg.stamp $(binobj)RhopiAlg.shstamp
#-- end of cleanup_library ---------------

