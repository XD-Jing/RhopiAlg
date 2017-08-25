if test "${CMTROOT}" = ""; then
  CMTROOT=/afs/ihep.ac.cn/bes3/offline/ExternalLib/contrib/CMT/v1r20p20081118; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
tempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then tempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=RhopiAlg -version=RhopiAlg-00-00-23 -path=/afs/.ihep.ac.cn/bes3/offline/Boss/6.6.4/Analysis/Physics $* >${tempfile}; . ${tempfile}
/bin/rm -f ${tempfile}

