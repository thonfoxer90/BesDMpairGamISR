if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cluster/bes3/CMT/v1r20p20090520
endif
source ${CMTROOT}/mgr/setup.csh
set tempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set tempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt cleanup -csh -pack=BesDMpairGamISR -version=BesDMpairGamISR-00-00-01 -path=/home/bgarillo/boss/Analysis $* >${tempfile}; source ${tempfile}
/bin/rm -f ${tempfile}

