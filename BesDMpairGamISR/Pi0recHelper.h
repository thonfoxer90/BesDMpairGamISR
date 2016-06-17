#include "EventModel/EventHeader.h"
#include "EventModel/Event.h"
#include "EvtRecEvent/EvtRecTrack.h"
#include "VertexFit/WTrackParameter.h"


class cPi0Tracks {

 public:

  // operations
  cPi0Tracks();
  cPi0Tracks(EvtRecTrack* pT1,EvtRecTrack* pT2,double dM);//,int iT1,int iT2);
  void Set(EvtRecTrack* pT1,EvtRecTrack* pT2,double dM);//,int iT1,int iT2);

  // attributes
  EvtRecTrack* m_pTrack1;
  EvtRecTrack* m_pTrack2;
  double       m_dMass;
  //int          m_iT1;
  //int          m_iT2;

};

class ValidCombs2 {
 
public:

  // operations
  ValidCombs2();
  void Set(cPi0Tracks* pT1,cPi0Tracks* pT2);

  // attributes
  cPi0Tracks* m_pTrack1;
  cPi0Tracks* m_pTrack2;

};

class ValidCombs3 {

 public:

  // operations
  ValidCombs3();
  void Set(cPi0Tracks* pT1,cPi0Tracks* pT2,cPi0Tracks* pT3);

  // attributes
  cPi0Tracks* m_pTrack1;
  cPi0Tracks* m_pTrack2;
  cPi0Tracks* m_pTrack3;

};

class cPi0TracksList {

 public:

  // operations
  cPi0TracksList();
  void Init(double mlow,double mhigh,double barrelEmin,double endcapEmin,double cosTbarrel,double time,double Ebeam);
  void SetIterators (EvtRecTrackIterator itBegin,EvtRecTrackIterator itEndCh,EvtRecTrackIterator itEndN);
  void Add(cPi0Tracks track);
  void Add(EvtRecTrack* pT1,EvtRecTrack* pT2,double dM);
  void ClearLists();
  void FillList();
  void CreatedValid2Combs();
  void CreatedValid3Combs();
  bool IsPhoton(EvtRecTrack* pTrack);
  double RejectEMCtrack (EvtRecTrack* pCur);
  double GetM(EvtRecTrack* pCur1,double dMass1,EvtRecTrack* pCur2,double dMass2);
  HepLorentzVector Get4VecFromEMC (EvtRecTrack* pCur,double dMass);
  bool   IsUsedForPi0 (EvtRecTrack* pCur,cPi0Tracks* ptPi01,cPi0Tracks* ptPi02,cPi0Tracks* ptPi03);
  bool   IsInPi0List (EvtRecTrack* pCur);

  // attributes
  vector<cPi0Tracks>       m_aPi0TracksTable;
  vector<ValidCombs2>      m_aValidCombs2;
  vector<ValidCombs3>      m_aValidCombs3;

  double              m_dPi0MassCutLow;
  double              m_dPi0MassCutHigh;
  double              m_dPhEnergyCutBarrel;
  double              m_dPhEnergyCutEndCap;
  double              m_dCosThetaBarrel;
  double              m_dMaxTime;
  double              m_dBeamEnergy;
  double              m_dDeltaAngleCut;
  EvtRecTrackIterator m_itBegin;
  EvtRecTrackIterator m_itEndCharged;
  EvtRecTrackIterator m_itEndNeutral;

};

