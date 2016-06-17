#-- start of make_header -----------------

#====================================
#  Library BesDMpairGamISR
#
#   Generated Wed May 18 12:35:43 2016  by bgarillo
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_BesDMpairGamISR_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_BesDMpairGamISR_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_BesDMpairGamISR

BesDMpairGamISR_tag = $(tag)

#cmt_local_tagfile_BesDMpairGamISR = $(BesDMpairGamISR_tag)_BesDMpairGamISR.make
cmt_local_tagfile_BesDMpairGamISR = $(bin)$(BesDMpairGamISR_tag)_BesDMpairGamISR.make

else

tags      = $(tag),$(CMTEXTRATAGS)

BesDMpairGamISR_tag = $(tag)

#cmt_local_tagfile_BesDMpairGamISR = $(BesDMpairGamISR_tag).make
cmt_local_tagfile_BesDMpairGamISR = $(bin)$(BesDMpairGamISR_tag).make

endif

include $(cmt_local_tagfile_BesDMpairGamISR)
#-include $(cmt_local_tagfile_BesDMpairGamISR)

ifdef cmt_BesDMpairGamISR_has_target_tag

cmt_final_setup_BesDMpairGamISR = $(bin)setup_BesDMpairGamISR.make
#cmt_final_setup_BesDMpairGamISR = $(bin)BesDMpairGamISR_BesDMpairGamISRsetup.make
cmt_local_BesDMpairGamISR_makefile = $(bin)BesDMpairGamISR.make

else

cmt_final_setup_BesDMpairGamISR = $(bin)setup.make
#cmt_final_setup_BesDMpairGamISR = $(bin)BesDMpairGamISRsetup.make
cmt_local_BesDMpairGamISR_makefile = $(bin)BesDMpairGamISR.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)BesDMpairGamISRsetup.make

#BesDMpairGamISR :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'BesDMpairGamISR'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = BesDMpairGamISR/
#BesDMpairGamISR::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

BesDMpairGamISRlibname   = $(bin)$(library_prefix)BesDMpairGamISR$(library_suffix)
BesDMpairGamISRlib       = $(BesDMpairGamISRlibname).a
BesDMpairGamISRstamp     = $(bin)BesDMpairGamISR.stamp
BesDMpairGamISRshstamp   = $(bin)BesDMpairGamISR.shstamp

BesDMpairGamISR :: dirs  BesDMpairGamISRLIB
	$(echo) "BesDMpairGamISR ok"

#-- end of libary_header ----------------

BesDMpairGamISRLIB :: $(BesDMpairGamISRlib) $(BesDMpairGamISRshstamp)
	@/bin/echo "------> BesDMpairGamISR : library ok"

$(BesDMpairGamISRlib) :: $(bin)ParticleContainer.o $(bin)Pi0recHelper.o $(bin)BesDMpairGamISR.o $(bin)BesDMpairGamISR_entries.o $(bin)BesDMpairGamISR_load.o
	$(lib_echo) library
	$(lib_silent) cd $(bin); \
	  $(ar) $(BesDMpairGamISRlib) $?
	$(lib_silent) $(ranlib) $(BesDMpairGamISRlib)
	$(lib_silent) cat /dev/null >$(BesDMpairGamISRstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

$(BesDMpairGamISRlibname).$(shlibsuffix) :: $(BesDMpairGamISRlib) $(BesDMpairGamISRstamps)
	$(lib_silent) cd $(bin); QUIET=$(QUIET); $(make_shlib) "$(tags)" BesDMpairGamISR $(BesDMpairGamISR_shlibflags)

$(BesDMpairGamISRshstamp) :: $(BesDMpairGamISRlibname).$(shlibsuffix)
	@if test -f $(BesDMpairGamISRlibname).$(shlibsuffix) ; then cat /dev/null >$(BesDMpairGamISRshstamp) ; fi

BesDMpairGamISRclean ::
	$(cleanup_echo) objects
	$(cleanup_silent) cd $(bin); /bin/rm -f $(bin)ParticleContainer.o $(bin)Pi0recHelper.o $(bin)BesDMpairGamISR.o $(bin)BesDMpairGamISR_entries.o $(bin)BesDMpairGamISR_load.o

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
BesDMpairGamISRinstallname = $(library_prefix)BesDMpairGamISR$(library_suffix).$(shlibsuffix)

BesDMpairGamISR :: BesDMpairGamISRinstall

install :: BesDMpairGamISRinstall

BesDMpairGamISRinstall :: $(install_dir)/$(BesDMpairGamISRinstallname)
	@if test ! "${installarea}" = ""; then\
	  echo "installation done"; \
	fi

$(install_dir)/$(BesDMpairGamISRinstallname) :: $(bin)$(BesDMpairGamISRinstallname)
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test ! -d "$(install_dir)"; then \
	      mkdir -p $(install_dir); \
	    fi ; \
	    if test -d "$(install_dir)"; then \
	      echo "Installing library $(BesDMpairGamISRinstallname) into $(install_dir)"; \
	      if test -e $(install_dir)/$(BesDMpairGamISRinstallname); then \
	        $(cmt_uninstall_area_command) $(install_dir)/$(BesDMpairGamISRinstallname); \
	        $(cmt_uninstall_area_command) $(install_dir)/$(BesDMpairGamISRinstallname).cmtref; \
	      fi; \
	      $(cmt_install_area_command) `pwd`/$(BesDMpairGamISRinstallname) $(install_dir)/$(BesDMpairGamISRinstallname); \
	      echo `pwd`/$(BesDMpairGamISRinstallname) >$(install_dir)/$(BesDMpairGamISRinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot install library $(BesDMpairGamISRinstallname), no installation directory specified"; \
	  fi; \
	fi

BesDMpairGamISRclean :: BesDMpairGamISRuninstall

uninstall :: BesDMpairGamISRuninstall

BesDMpairGamISRuninstall ::
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test -d "$(install_dir)"; then \
	      echo "Removing installed library $(BesDMpairGamISRinstallname) from $(install_dir)"; \
	      $(cmt_uninstall_area_command) $(install_dir)/$(BesDMpairGamISRinstallname); \
	      $(cmt_uninstall_area_command) $(install_dir)/$(BesDMpairGamISRinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot uninstall library $(BesDMpairGamISRinstallname), no installation directory specified"; \
	  fi; \
	fi




#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),BesDMpairGamISRclean)
ifneq ($(MAKECMDGOALS),uninstall)

#$(bin)BesDMpairGamISR_dependencies.make :: dirs

ifndef QUICK
$(bin)BesDMpairGamISR_dependencies.make : $(src)ParticleContainer.cxx $(src)Pi0recHelper.cxx $(src)BesDMpairGamISR.cxx $(src)components/BesDMpairGamISR_entries.cxx $(src)components/BesDMpairGamISR_load.cxx $(use_requirements) $(cmt_final_setup_BesDMpairGamISR)
	$(echo) "(BesDMpairGamISR.make) Rebuilding $@"; \
	  $(build_dependencies) BesDMpairGamISR -all_sources -out=$@ $(src)ParticleContainer.cxx $(src)Pi0recHelper.cxx $(src)BesDMpairGamISR.cxx $(src)components/BesDMpairGamISR_entries.cxx $(src)components/BesDMpairGamISR_load.cxx
endif

#$(BesDMpairGamISR_dependencies)

-include $(bin)BesDMpairGamISR_dependencies.make

endif
endif
#-- end of dependency -------------------
#-- start of cpp_library -----------------

ifneq ($(cppdepflags),)

ifneq ($(MAKECMDGOALS),BesDMpairGamISRclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ParticleContainer.d

$(bin)$(binobj)ParticleContainer.d : $(use_requirements) $(cmt_final_setup_BesDMpairGamISR)

$(bin)$(binobj)ParticleContainer.d : $(src)ParticleContainer.cxx
	$(dep_echo) $@
	$(cpp_silent) $(cppcomp) $(cppdepflags) -o $(@D)/ParticleContainer.dep $(use_pp_cppflags) $(BesDMpairGamISR_pp_cppflags) $(lib_BesDMpairGamISR_pp_cppflags) $(ParticleContainer_pp_cppflags) $(use_cppflags) $(BesDMpairGamISR_cppflags) $(lib_BesDMpairGamISR_cppflags) $(ParticleContainer_cppflags) $(ParticleContainer_cxx_cppflags)  $(src)ParticleContainer.cxx
	$(cpp_silent) $(format_dependencies) $@ $(@D)/ParticleContainer.o $(src)ParticleContainer.cxx $(@D)/ParticleContainer.dep
endif
endif

$(bin)$(binobj)ParticleContainer.o : $(src)ParticleContainer.cxx
else
$(bin)BesDMpairGamISR_dependencies.make : $(ParticleContainer_cxx_dependencies)

$(bin)$(binobj)ParticleContainer.o : $(ParticleContainer_cxx_dependencies)
endif
	$(cpp_echo) $(src)ParticleContainer.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(BesDMpairGamISR_pp_cppflags) $(lib_BesDMpairGamISR_pp_cppflags) $(ParticleContainer_pp_cppflags) $(use_cppflags) $(BesDMpairGamISR_cppflags) $(lib_BesDMpairGamISR_cppflags) $(ParticleContainer_cppflags) $(ParticleContainer_cxx_cppflags)  $(src)ParticleContainer.cxx

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(cppdepflags),)

ifneq ($(MAKECMDGOALS),BesDMpairGamISRclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)Pi0recHelper.d

$(bin)$(binobj)Pi0recHelper.d : $(use_requirements) $(cmt_final_setup_BesDMpairGamISR)

$(bin)$(binobj)Pi0recHelper.d : $(src)Pi0recHelper.cxx
	$(dep_echo) $@
	$(cpp_silent) $(cppcomp) $(cppdepflags) -o $(@D)/Pi0recHelper.dep $(use_pp_cppflags) $(BesDMpairGamISR_pp_cppflags) $(lib_BesDMpairGamISR_pp_cppflags) $(Pi0recHelper_pp_cppflags) $(use_cppflags) $(BesDMpairGamISR_cppflags) $(lib_BesDMpairGamISR_cppflags) $(Pi0recHelper_cppflags) $(Pi0recHelper_cxx_cppflags)  $(src)Pi0recHelper.cxx
	$(cpp_silent) $(format_dependencies) $@ $(@D)/Pi0recHelper.o $(src)Pi0recHelper.cxx $(@D)/Pi0recHelper.dep
endif
endif

$(bin)$(binobj)Pi0recHelper.o : $(src)Pi0recHelper.cxx
else
$(bin)BesDMpairGamISR_dependencies.make : $(Pi0recHelper_cxx_dependencies)

$(bin)$(binobj)Pi0recHelper.o : $(Pi0recHelper_cxx_dependencies)
endif
	$(cpp_echo) $(src)Pi0recHelper.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(BesDMpairGamISR_pp_cppflags) $(lib_BesDMpairGamISR_pp_cppflags) $(Pi0recHelper_pp_cppflags) $(use_cppflags) $(BesDMpairGamISR_cppflags) $(lib_BesDMpairGamISR_cppflags) $(Pi0recHelper_cppflags) $(Pi0recHelper_cxx_cppflags)  $(src)Pi0recHelper.cxx

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(cppdepflags),)

ifneq ($(MAKECMDGOALS),BesDMpairGamISRclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)BesDMpairGamISR.d

$(bin)$(binobj)BesDMpairGamISR.d : $(use_requirements) $(cmt_final_setup_BesDMpairGamISR)

$(bin)$(binobj)BesDMpairGamISR.d : $(src)BesDMpairGamISR.cxx
	$(dep_echo) $@
	$(cpp_silent) $(cppcomp) $(cppdepflags) -o $(@D)/BesDMpairGamISR.dep $(use_pp_cppflags) $(BesDMpairGamISR_pp_cppflags) $(lib_BesDMpairGamISR_pp_cppflags) $(BesDMpairGamISR_pp_cppflags) $(use_cppflags) $(BesDMpairGamISR_cppflags) $(lib_BesDMpairGamISR_cppflags) $(BesDMpairGamISR_cppflags) $(BesDMpairGamISR_cxx_cppflags)  $(src)BesDMpairGamISR.cxx
	$(cpp_silent) $(format_dependencies) $@ $(@D)/BesDMpairGamISR.o $(src)BesDMpairGamISR.cxx $(@D)/BesDMpairGamISR.dep
endif
endif

$(bin)$(binobj)BesDMpairGamISR.o : $(src)BesDMpairGamISR.cxx
else
$(bin)BesDMpairGamISR_dependencies.make : $(BesDMpairGamISR_cxx_dependencies)

$(bin)$(binobj)BesDMpairGamISR.o : $(BesDMpairGamISR_cxx_dependencies)
endif
	$(cpp_echo) $(src)BesDMpairGamISR.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(BesDMpairGamISR_pp_cppflags) $(lib_BesDMpairGamISR_pp_cppflags) $(BesDMpairGamISR_pp_cppflags) $(use_cppflags) $(BesDMpairGamISR_cppflags) $(lib_BesDMpairGamISR_cppflags) $(BesDMpairGamISR_cppflags) $(BesDMpairGamISR_cxx_cppflags)  $(src)BesDMpairGamISR.cxx

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(cppdepflags),)

ifneq ($(MAKECMDGOALS),BesDMpairGamISRclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)BesDMpairGamISR_entries.d

$(bin)$(binobj)BesDMpairGamISR_entries.d : $(use_requirements) $(cmt_final_setup_BesDMpairGamISR)

$(bin)$(binobj)BesDMpairGamISR_entries.d : $(src)components/BesDMpairGamISR_entries.cxx
	$(dep_echo) $@
	$(cpp_silent) $(cppcomp) $(cppdepflags) -o $(@D)/BesDMpairGamISR_entries.dep $(use_pp_cppflags) $(BesDMpairGamISR_pp_cppflags) $(lib_BesDMpairGamISR_pp_cppflags) $(BesDMpairGamISR_entries_pp_cppflags) $(use_cppflags) $(BesDMpairGamISR_cppflags) $(lib_BesDMpairGamISR_cppflags) $(BesDMpairGamISR_entries_cppflags) $(BesDMpairGamISR_entries_cxx_cppflags) -I../src/components $(src)components/BesDMpairGamISR_entries.cxx
	$(cpp_silent) $(format_dependencies) $@ $(@D)/BesDMpairGamISR_entries.o $(src)components/BesDMpairGamISR_entries.cxx $(@D)/BesDMpairGamISR_entries.dep
endif
endif

$(bin)$(binobj)BesDMpairGamISR_entries.o : $(src)components/BesDMpairGamISR_entries.cxx
else
$(bin)BesDMpairGamISR_dependencies.make : $(BesDMpairGamISR_entries_cxx_dependencies)

$(bin)$(binobj)BesDMpairGamISR_entries.o : $(BesDMpairGamISR_entries_cxx_dependencies)
endif
	$(cpp_echo) $(src)components/BesDMpairGamISR_entries.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(BesDMpairGamISR_pp_cppflags) $(lib_BesDMpairGamISR_pp_cppflags) $(BesDMpairGamISR_entries_pp_cppflags) $(use_cppflags) $(BesDMpairGamISR_cppflags) $(lib_BesDMpairGamISR_cppflags) $(BesDMpairGamISR_entries_cppflags) $(BesDMpairGamISR_entries_cxx_cppflags) -I../src/components $(src)components/BesDMpairGamISR_entries.cxx

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(cppdepflags),)

ifneq ($(MAKECMDGOALS),BesDMpairGamISRclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)BesDMpairGamISR_load.d

$(bin)$(binobj)BesDMpairGamISR_load.d : $(use_requirements) $(cmt_final_setup_BesDMpairGamISR)

$(bin)$(binobj)BesDMpairGamISR_load.d : $(src)components/BesDMpairGamISR_load.cxx
	$(dep_echo) $@
	$(cpp_silent) $(cppcomp) $(cppdepflags) -o $(@D)/BesDMpairGamISR_load.dep $(use_pp_cppflags) $(BesDMpairGamISR_pp_cppflags) $(lib_BesDMpairGamISR_pp_cppflags) $(BesDMpairGamISR_load_pp_cppflags) $(use_cppflags) $(BesDMpairGamISR_cppflags) $(lib_BesDMpairGamISR_cppflags) $(BesDMpairGamISR_load_cppflags) $(BesDMpairGamISR_load_cxx_cppflags) -I../src/components $(src)components/BesDMpairGamISR_load.cxx
	$(cpp_silent) $(format_dependencies) $@ $(@D)/BesDMpairGamISR_load.o $(src)components/BesDMpairGamISR_load.cxx $(@D)/BesDMpairGamISR_load.dep
endif
endif

$(bin)$(binobj)BesDMpairGamISR_load.o : $(src)components/BesDMpairGamISR_load.cxx
else
$(bin)BesDMpairGamISR_dependencies.make : $(BesDMpairGamISR_load_cxx_dependencies)

$(bin)$(binobj)BesDMpairGamISR_load.o : $(BesDMpairGamISR_load_cxx_dependencies)
endif
	$(cpp_echo) $(src)components/BesDMpairGamISR_load.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(BesDMpairGamISR_pp_cppflags) $(lib_BesDMpairGamISR_pp_cppflags) $(BesDMpairGamISR_load_pp_cppflags) $(use_cppflags) $(BesDMpairGamISR_cppflags) $(lib_BesDMpairGamISR_cppflags) $(BesDMpairGamISR_load_cppflags) $(BesDMpairGamISR_load_cxx_cppflags) -I../src/components $(src)components/BesDMpairGamISR_load.cxx

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: BesDMpairGamISRclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(BesDMpairGamISR.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(BesDMpairGamISR.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(BesDMpairGamISR.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(BesDMpairGamISR.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_BesDMpairGamISR)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(BesDMpairGamISR.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(BesDMpairGamISR.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(BesDMpairGamISR.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

BesDMpairGamISRclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library BesDMpairGamISR
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)BesDMpairGamISR$(library_suffix).a $(library_prefix)BesDMpairGamISR$(library_suffix).s? BesDMpairGamISR.stamp BesDMpairGamISR.shstamp
#-- end of cleanup_library ---------------
