if test "${CMTROOT}" = ""; then
  CMTROOT=/cluster/bes3/CMT/v1r20p20090520; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
tempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then tempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=BesDMpairGamISR -version=BesDMpairGamISR-00-00-01 -path=/home/bgarillo/boss/Analysis $* >${tempfile}; . ${tempfile}
/bin/rm -f ${tempfile}

