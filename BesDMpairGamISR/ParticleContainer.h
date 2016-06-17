#include "GaudiKernel/Bootstrap.h"
#include "GaudiKernel/IJobOptionsSvc.h"
#include "GaudiKernel/MsgStream.h"
#include "GaudiKernel/ISvcLocator.h"
#include "GaudiKernel/SmartDataPtr.h"
#include "GaudiKernel/Algorithm.h"
#include "GaudiKernel/NTuple.h"

#include "EventModel/EventHeader.h"
#include "EventModel/Event.h"
#include "EvtRecEvent/EvtRecEvent.h"
#include "EvtRecEvent/EvtRecTrack.h"
#include "EvtRecEvent/EvtRecVeeVertex.h"

//#include "CLHEP/Matrix/Vector.h"
//#include "CLHEP/Vector/LorentzVector.h"
//#include "CLHEP/Vector/ThreeVector.h"



class cParticleContainer {

 public:

  // operations
  cParticleContainer();
  cParticleContainer(const std::string& name,bool bIsPhoton=false);
  void AttachToNtuple(NTuple::Tuple* pTuple);
  void AttachToNtuple(NTuple::Tuple* pTuple,const std::string& name,bool bIsPhoton=false);
  void Clear();
  void Fill(double dEnergy,double dMomentum,double dTheta,double dPhi);
  void Fill(const CLHEP::HepLorentzVector* lv);
  //void FillPhoton(dEnergy,dTheta,dPhi);
  void FillFromEMC(RecEmcShower* shower);

  // attributes
  std::string            m_sName;
  bool                   m_bIsPhoton;
  NTuple::Item<double>   m_dEnergy;
  NTuple::Item<double>   m_dMomentum;
  NTuple::Item<double>   m_dTheta;
  NTuple::Item<double>   m_dPhi;

};

