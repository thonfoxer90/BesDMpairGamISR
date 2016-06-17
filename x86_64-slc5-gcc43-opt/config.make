#-- start of make_header -----------------

#====================================
#  Document config
#
#   Generated Wed May 18 12:36:17 2016  by bgarillo
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_config_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_config_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_config

BesDMpairGamISR_tag = $(tag)

#cmt_local_tagfile_config = $(BesDMpairGamISR_tag)_config.make
cmt_local_tagfile_config = $(bin)$(BesDMpairGamISR_tag)_config.make

else

tags      = $(tag),$(CMTEXTRATAGS)

BesDMpairGamISR_tag = $(tag)

#cmt_local_tagfile_config = $(BesDMpairGamISR_tag).make
cmt_local_tagfile_config = $(bin)$(BesDMpairGamISR_tag).make

endif

include $(cmt_local_tagfile_config)
#-include $(cmt_local_tagfile_config)

ifdef cmt_config_has_target_tag

cmt_final_setup_config = $(bin)setup_config.make
#cmt_final_setup_config = $(bin)BesDMpairGamISR_configsetup.make
cmt_local_config_makefile = $(bin)config.make

else

cmt_final_setup_config = $(bin)setup.make
#cmt_final_setup_config = $(bin)BesDMpairGamISRsetup.make
cmt_local_config_makefile = $(bin)config.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)BesDMpairGamISRsetup.make

#config :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'config'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = config/
#config::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------

config :: ../BesDMpairGamISR/config.h
	@/bin/echo "------> config.h ok"

../BesDMpairGamISR/config.h :: ../BesDMpairGamISR/config.h.in
	@if test -f ../BesDMpairGamISR/config.h.in; then \
	  cd ../BesDMpairGamISR; \
	  $(config_command) config.h.in config.h; \
        fi


#-- start of cleanup_header --------------

clean :: configclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(config.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(config.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(config.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(config.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_config)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(config.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(config.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(config.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

configclean ::
#-- end of cleanup_header ---------------
