#include "GaudiKernel/MsgStream.h"
#include "GaudiKernel/AlgFactory.h"
#include "GaudiKernel/ISvcLocator.h"
#include "GaudiKernel/SmartDataPtr.h"
#include "GaudiKernel/IDataProviderSvc.h"
#include "GaudiKernel/PropertyMgr.h"
#include "VertexFit/IVertexDbSvc.h"
#include "GaudiKernel/Bootstrap.h"
#include "GaudiKernel/ISvcLocator.h"

#include "EventModel/EventModel.h"
#include "EventModel/Event.h"
#include "EventModel/EventHeader.h"
#include "EvtRecEvent/EvtRecEvent.h"
#include "EvtRecEvent/EvtRecTrack.h"
#include "DstEvent/TofHitStatus.h"
#include "TrigEvent/TrigData.h"

#include "McTruth/McParticle.h"

#include "TMath.h"
#include "TVector2.h"
#include "TString.h"

#include "GaudiKernel/INTupleSvc.h"
#include "GaudiKernel/NTuple.h"
#include "GaudiKernel/Bootstrap.h"
#include "GaudiKernel/IHistogramSvc.h"
#include "CLHEP/Vector/ThreeVector.h"
#include "CLHEP/Vector/TwoVector.h"
using CLHEP::HepLorentzVector;
using CLHEP::Hep3Vector;
using CLHEP::Hep2Vector;
using namespace std;
#include "CLHEP/Geometry/Point3D.h"
#ifndef ENABLE_BACKWARDS_COMPATIBILITY
   typedef HepGeom::Point3D<double> HepPoint3D;
#endif
#include "../MyAnalysis/MyAnalysis.h"

//#include "VertexFit/KinematicFit.h"
#include "VertexFit/KalmanKinematicFit.h"
#include "VertexFit/VertexFit.h"
#include "VertexFit/Helix.h"
#include "ParticleID/ParticleID.h"

#include <vector>
#include <iostream>

//const double xmass[5] = {0.000511, 0.105658, 0.139570,0.493677, 0.938272};
//const double velc = 29.9792458;  tof_path unit in cm.
//const double velc = 299.792458;   // tof path unit in mm

const double g_mass_electron = 0.00051099892; //- Electron Mass in GeV
const double g_mass_pizero   = 0.1349766;     //- Pi0 Mass in GeV


/////////////////////////////////////////////////////////////////////////////




MyAnalysis::MyAnalysis(const std::string& name, ISvcLocator* pSvcLocator) :
  Algorithm(name, pSvcLocator) {
  
  //Declare the properties  
  declareProperty("MonteCarloAnalysis", m_MC_Analysis = false);
  declareProperty("MonteCarloAllTrue", m_MC_AllTrue = false);
  declareProperty("WithHistograms", m_WithHistos = false);

  declareProperty("CenterOfMassEnergy", m_CMS_Energy = 3.08);
  declareProperty("BeamCrossingAngle", m_CrossingAngle = 0.011);

  declareProperty("GammaMinEnergyBarrel", m_GamMinEngB = 0.025);
  declareProperty("GammaMinEnergyEndCap", m_GamMinEngE = 0.05);
  declareProperty("GammaMinTime", m_GamMinTime = 0);
  declareProperty("GammaMaxTime", m_GamMaxTime = 14);
  declareProperty("GammaClosestChargeCut", m_GamMinDistC = 20.0);
  declareProperty("GammaClosestPhotonCut", m_GamMinDistN = 20.0);

  declareProperty("PionMaxChiSq", m_PionMaxChiSq = 50.);

  declareProperty("ChargedVertexMaxR0Cut", m_ChargedMaxVtxR=1.0);
  declareProperty("ChargedVertexMaxZ0Cut", m_ChargedMaxVtxZ=10.0);

}




StatusCode MyAnalysis::initialize(){
  MsgStream log(msgSvc(), name());
  log << MSG::INFO << "in initialize()" << endmsg;
  
  StatusCode status;
  
  //!- Book Histograms
  if(m_WithHistos) {
    if(m_MC_Analysis) {
      hMCPosiMom   = histoSvc()->book("MonteCarlo",1,"PosiMom",250,0.,5.);
      hMCPosiThe   = histoSvc()->book("MonteCarlo",2,"PosiThe",45,0.,180.);
      hMCPosiPhi   = histoSvc()->book("MonteCarlo",3,"PosiPhi",90,-180.,180.);
      hMCElecMom   = histoSvc()->book("MonteCarlo",4,"ElecMom",250,0.,5.);
      hMCElecThe   = histoSvc()->book("MonteCarlo",5,"ElecThe",45,0.,180.);
      hMCElecPhi   = histoSvc()->book("MonteCarlo",6,"ElecPhi",90,-180.,180.);
      hMCGamMom   = histoSvc()->book("MonteCarlo",7,"GamMom",250,0.,5.);
      hMCGamThe   = histoSvc()->book("MonteCarlo",8,"GamThe",45,0.,180.);
      hMCGamPhi   = histoSvc()->book("MonteCarlo",9,"GamPhi",90,-180.,180.);
      hMCQSquare = histoSvc()->book("MonteCarlo",10,"MCQSquare",100,0.,10.);
    }
    
    hGamMult      = histoSvc()->book("Photons",1,"PhotonMultiplicity",100,0.,100.);
    for(int i=0; i<4; i++) {
      hGamEng[i]    = histoSvc()->book(Form("Photons/Stage%i",i),2,"PhotonEnergy",500,0.,5.);
      hGamEnBEC[i]  = histoSvc()->book(Form("Photons/Stage%i",i),3,"EnergyBackEC",1000,0.,2.);
      hGamEnBAR[i]  = histoSvc()->book(Form("Photons/Stage%i",i),4,"EnergyBarrel",1000,0.,2.);
      hGamEnFEC[i]  = histoSvc()->book(Form("Photons/Stage%i",i),5,"EnergyFrontEC",1000,0.,2.);
      hGamTime[i]   = histoSvc()->book(Form("Photons/Stage%i",i),6,"PhotonTime",2000,0.,200.);
      hGamTheta[i]  = histoSvc()->book(Form("Photons/Stage%i",i),7,"PhotonTheta",45,0.,180.);
      hGamPhi[i]    = histoSvc()->book(Form("Photons/Stage%i",i),8,"PhotonPhi",90,-180.,180.);
      hGamPhvTh[i]  = histoSvc()->book(Form("Photons/Stage%i",i),9,"PhiVsTheta",45,0.,180.,90,-180.,180.);
      hGamPOSPhvTh[i]  = histoSvc()->book(Form("Photons/Stage%i",i),10,"POSPhiVsTheta",60,0.5,60.5,400,0.5,400.5);
      hGamNCOA[i]   = histoSvc()->book(Form("Photons/Stage%i",i),11,"OpAngClosestCT",90,0.,180.);
      hGamNCdP[i]   = histoSvc()->book(Form("Photons/Stage%i",i),12,"dPhiClosestCT",90,-180.,180.);
      hGamNCdT[i]   = histoSvc()->book(Form("Photons/Stage%i",i),13,"dThetaClosestCT",90,-180.,180.);
      hGamNCdPvT[i] = histoSvc()->book(Form("Photons/Stage%i",i),14,"dThetaVdPhiClosestCT",180,-180.,180.,180,-180.,180.);
      hGamNCEvOA[i] = histoSvc()->book(Form("Photons/Stage%i",i),15,"EngVsOpAngClosestCT",200,0.,2.,90,0.,180.);
    }
    
    hGPairOpAng        = histoSvc()->book("PhotonPairs",1,"OpeningAngle",45,0.,180.);
    hGPairdPhi         = histoSvc()->book("PhotonPairs",2,"PhiDiff",180,-180.,180.);
    hGPairdTheta       = histoSvc()->book("PhotonPairs",3,"ThetaDiff",180,-180.,180.);
    hGPairdPhiVsdTheta = histoSvc()->book("PhotonPairs",4,"DiffsPhiVsTheta",90,-180.,180.,90,-180,180);
    hGPairIMass        = histoSvc()->book("PhotonPairs",5,"InvMass",500,0.,1.);
    hGPairChiSq        = histoSvc()->book("PhotonPairs",6,"PionChiSq",500,0.,100.);
    
    hCTrkMom    = histoSvc()->book("ChargedTracks",1,"CTrkMom",500,0.,5.);
    hCTrkPhi    = histoSvc()->book("ChargedTracks",2,"CTrkPhi",90,-180.,180.);
    hCTrkTheta  = histoSvc()->book("ChargedTracks",3,"CTrkTheta",45,0.,180.);
    hCTrkVtxX   = histoSvc()->book("ChargedTracks",4,"CTrkVtxX",200,-20.,20.);
    hCTrkVtxY   = histoSvc()->book("ChargedTracks",5,"CTrkVtxY",200,-20.,20.);
    hCTrkVtxZ   = histoSvc()->book("ChargedTracks",6,"CTrkVtxZ",200,-100.,100.);
    hCTrkVtxXvY = histoSvc()->book("ChargedTracks",7,"CTrkVtxXvY",100,-20.,20.,100,-20,20);
    hCTrkVtxRvZ = histoSvc()->book("ChargedTracks",8,"CTrkVtxRvZ",100,-100.,100.,60,0,30);
    hCTrkPcaR   = histoSvc()->book("ChargedTracks",9,"CTrkPcaR",200,0.,20.);
    hCTrkPcaZ   = histoSvc()->book("ChargedTracks",10,"CTrkPcaZ",200,-100.,100.);
    hCTrkPcaRvZ = histoSvc()->book("ChargedTracks",11,"CTrkPcaRvZ",100,-100.,100.,40,0,20);
    hCTrkEcal   = histoSvc()->book("ChargedTracks",12,"CTrkEcal",500,0.,5.);
    hCTrkEOP    = histoSvc()->book("ChargedTracks",13,"CTrkEOP",200,0.,2.);
    hCTrkEOPvP  = histoSvc()->book("ChargedTracks",14,"CTrkEOPvP",100,-1.,1.,100.,0.,2.);
    hCTrkNPos   = histoSvc()->book("ChargedTracks",15,"CTrkNPos",31,-0.5,30.5);
    
    for(int i=0; i<6; i++) {
      hRecPosiMom[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),1,"PosiMom",150,0.,3.);
      hRecPosiThe[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),2,"PosiThe",90,0.,180.);
      hRecPosiPhi[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),3,"PosiPhi",90,-180.,180.);
      hRecPionMom[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),4,"PionMom",150,0.,3.);
      hRecPionThe[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),5,"PionThe",90,0.,180.);
      hRecPionCTheCMS[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),6,"PionCosThetaCMS",200,-1.,1.);
      hRecPionPhi[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),7,"PionPhi",90,-180.,180.);
      hRecPionMass[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),8,"PionMass",500,0.,0.5);
      hRecPiGGOA[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),9,"GG_OpAng",90,0.,180.);
      hRecPiGGdT[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),10,"GG_dTheta",90,-90.,90.);
      hRecPiGGdP[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),11,"GG_dPhi",90,-90.,90.);
      hRecPiPoOA[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),12,"PiPo_OpAng",90,0.,180.);
      hRecPiPodT[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),13,"PiPo_dTheta",90,-90.,90.);
      hRecPiPodP[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),14,"PiPo_dPhi",90,90.,270.);
      hRecElecMom[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),15,"ElecMom",150,0.,3.);
      hRecElecThe[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),16,"ElecThe",90,0.,180.);
      hRecElecCThe[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),17,"ElecCosTheta",200,-1.,1.);
      hRecElecPhi[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),18,"ElecPhi",90,-180.,180.);
      hRecElecMass[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),19,"ElecMass^2",100,-1.,1.);
      hRecQSquare[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),20,"RecQSquare",100,0.,10.);
      hRecHelicity[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),21,"CosHelicity",51,-0.01,1.01);
      hRecRGamma[i] = histoSvc()->book(Form("Reconstructed/Stage%i",i),22,"RGamma",200,-1.,1.);
    }

  }
  
  //!- Book NTuples
  NTuplePtr nt1(ntupleSvc(), "FILE1/Trigger");
  if ( nt1 ) m_tuple1 = nt1;
  else {
    m_tuple1 = ntupleSvc()->book ("FILE1/Trigger", CLID_ColumnWiseTuple, "ks N-Tuple example");
    if ( m_tuple1 )    {
      status = m_tuple1->addItem("TrConds",m_trgconds,0,48);
      status = m_tuple1->addIndexedItem("TrCond",m_trgconds,m_trgcond);
      status = m_tuple1->addItem("TrChans",m_trgchans,0,16);
      status = m_tuple1->addIndexedItem("TrChan",m_trgchans,m_trgchan);
    }
    else    { 
      log << MSG::ERROR << "    Cannot book N-tuple:" << long(m_tuple1) << endmsg;
      return StatusCode::FAILURE;
    }
  }
  
  NTuplePtr nt2(ntupleSvc(), "FILE1/photon");
  if ( nt2 ) m_tuple2 = nt2;
  else {
    m_tuple2 = ntupleSvc()->book ("FILE1/photon", CLID_ColumnWiseTuple, "ks N-Tuple example");
    if ( m_tuple2 )    {
      status = m_tuple2->addItem("Ngam",m_ngam,0,50);
      status = m_tuple2->addItem("Mm2gamsX",m_Mm2gamsX);
      status = m_tuple2->addIndexedItem("BECID",m_ngam,m_becid);
      status = m_tuple2->addIndexedItem("Ring",m_ngam,m_ring);
      status = m_tuple2->addIndexedItem("Row",m_ngam,m_row);
      status = m_tuple2->addIndexedItem("Time",m_ngam,m_time);
      status = m_tuple2->addIndexedItem("Eraw",m_ngam,m_eraw);
      status = m_tuple2->addIndexedItem("PosX",m_ngam,m_posx);
      status = m_tuple2->addIndexedItem("PosY",m_ngam,m_posy);
      status = m_tuple2->addIndexedItem("PosZ",m_ngam,m_posz);
      status = m_tuple2->addIndexedItem("Theta",m_ngam,m_the);
      status = m_tuple2->addIndexedItem("Phi",m_ngam,m_phi);
      status = m_tuple2->addIndexedItem("dthe",m_ngam,m_dthe);
      status = m_tuple2->addIndexedItem("dphi",m_ngam,m_dphi);
      status = m_tuple2->addIndexedItem("dang",m_ngam,m_dang);
    }
    else    { 
      log << MSG::ERROR << "   Cannot book N-tuple:" << long(m_tuple2) << endmsg;
      return StatusCode::FAILURE;
    }
  }


  NTuplePtr nt3(ntupleSvc(), "FILE1/charged");
  if ( nt3 ) m_tuple3 = nt3;
  else {
    m_tuple3 = ntupleSvc()->book ("FILE1/charged", CLID_ColumnWiseTuple, "ks N-Tuple example");
    if ( m_tuple3 )    {
      status = m_tuple3->addItem ("NCTrks",       m_nctrk,0,50);
      status = m_tuple3->addIndexedItem ("rvxy0", m_nctrk,m_rvxy0);
      status = m_tuple3->addIndexedItem ("rvz0",  m_nctrk,m_rvz0);
      status = m_tuple3->addIndexedItem ("rvphi0",m_nctrk,m_rvphi0);
      status = m_tuple3->addIndexedItem ("px",    m_nctrk,m_px);
      status = m_tuple3->addIndexedItem ("py",    m_nctrk,m_py);
      status = m_tuple3->addIndexedItem ("pz",    m_nctrk,m_pz);
      status = m_tuple3->addIndexedItem ("q",     m_nctrk,m_q);
      status = m_tuple3->addIndexedItem ("ecal",  m_nctrk,m_ecal);
      status = m_tuple3->addIndexedItem ("trPosX",m_nctrk,m_trposx);
      status = m_tuple3->addIndexedItem ("trPosY",m_nctrk,m_trposy);
      status = m_tuple3->addIndexedItem ("trPosZ",m_nctrk,m_trposz);
    }
    else    {
      log << MSG::ERROR << "   Cannot book N-tuple:" << long(m_tuple3) << endmsg;
      return StatusCode::FAILURE;
    }
  }

  NTuplePtr nt4(ntupleSvc(), "FILE1/positron");
  if ( nt4 ) m_tuple4 = nt4;
  else {
    m_tuple4 = ntupleSvc()->book ("FILE1/positron", CLID_ColumnWiseTuple, "ks N-Tuple example");
    if ( m_tuple4 )    {
      status = m_tuple4->addItem ("NrLept",      m_nrlept,0,50);
      status = m_tuple4->addIndexedItem ("LeptPx",   m_nrlept,m_leptpx);
      status = m_tuple4->addIndexedItem ("LeptPy",   m_nrlept,m_leptpy);
      status = m_tuple4->addIndexedItem ("LeptPz",   m_nrlept,m_leptpz);
      status = m_tuple4->addIndexedItem ("LeptE",    m_nrlept,m_lepte);
      status = m_tuple4->addIndexedItem ("LeptQ",    m_nrlept,m_leptq);
      status = m_tuple4->addIndexedItem ("LeptID",   m_nrlept,m_leptid);
    }
    else    {
      log << MSG::ERROR << "   Cannot book N-tuple:" << long(m_tuple4) << endmsg;
      return StatusCode::FAILURE;
    }
  }

  //  if(m_MC_Analysis) {
  NTuplePtr nt5(ntupleSvc(), "FILE1/true");
  if ( nt5 ) m_tuple5 = nt5;
  else {
    m_tuple5 = ntupleSvc()->book ("FILE1/true", CLID_ColumnWiseTuple, "ks N-Tuple example");
    if ( m_tuple5 )    {
      status = m_tuple5->addItem ("NrTruePart", m_nrtruep,0,50);
      status = m_tuple5->addItem ("TruePID", m_nrtruep, m_true_id);
      status = m_tuple5->addItem ("TruePx", m_nrtruep, m_true_px);
      status = m_tuple5->addItem ("TruePy", m_nrtruep, m_true_py);
      status = m_tuple5->addItem ("TruePz", m_nrtruep, m_true_pz);
      status = m_tuple5->addItem ("TrueTheta", m_nrtruep, m_true_the);
      status = m_tuple5->addItem ("TruePhi", m_nrtruep, m_true_phi);
      status = m_tuple5->addItem ("TrueE", m_nrtruep, m_true_en);
      status = m_tuple5->addItem ("TruePrimary", m_nrtruep, m_true_pr);
      status = m_tuple5->addItem ("TrueLeaf", m_nrtruep, m_true_le);
      status = m_tuple5->addItem ("TrueGenerator", m_nrtruep, m_true_ge);
      status = m_tuple5->addItem ("TrueFlight", m_nrtruep, m_true_fl);
      status = m_tuple5->addItem ("TrueMother", m_nrtruep, m_true_mo);
    }
    else    {
      log << MSG::ERROR << "   Cannot book N-tuple:" << long(m_tuple5) << endmsg;
      return StatusCode::FAILURE;
    }
  }
    

    
  NTuplePtr nt6(ntupleSvc(), "FILE1/alltrue");
  if ( nt6 ) m_tuple6 = nt6;
  else {
    m_tuple6 = ntupleSvc()->book ("FILE1/alltrue", CLID_ColumnWiseTuple, "ks N-Tuple example");
    if ( m_tuple6 )    {
      status = m_tuple6->addItem ("NrATruePart", m_nratruep,0,50);
      status = m_tuple6->addItem ("ATruePID", m_nratruep, m_atrue_id);
      status = m_tuple6->addItem ("ATruePx", m_nratruep, m_atrue_px);
      status = m_tuple6->addItem ("ATruePy", m_nratruep, m_atrue_py);
      status = m_tuple6->addItem ("ATruePz", m_nratruep, m_atrue_pz);
      status = m_tuple6->addItem ("ATrueE", m_nratruep, m_atrue_en);
      status = m_tuple6->addItem ("ATruePrimary", m_nratruep, m_atrue_pr);
      status = m_tuple6->addItem ("ATrueLeaf", m_nratruep, m_atrue_le);
      status = m_tuple6->addItem ("ATrueGenerator", m_nratruep, m_atrue_ge);
      status = m_tuple6->addItem ("ATrueFlight", m_nratruep, m_atrue_fl);
      status = m_tuple6->addItem ("ATrueMother", m_nratruep, m_atrue_mo);
      status = m_tuple6->addItem ("ATrueTheta",m_nratruep,m_atrue_the);
      status = m_tuple6->addItem ("ATruePhi",m_nratruep,m_atrue_phi);
      status = m_tuple6->addItem ("ATrueMm2gamsX",m_atrue_Mm2gamsX);
    }
    else    {
      log << MSG::ERROR << "   Cannot book N-tuple:" << long(m_tuple6) << endmsg;
      return StatusCode::FAILURE;
    }
  }
  //  }
  //!--------end of booking--------


  //!-Set up Beam Positron Four Vector
  double TotEngBeam = m_CMS_Energy/2 + g_mass_electron;
  double Abs3MomBeam = sqrt(TotEngBeam*TotEngBeam - g_mass_electron*g_mass_electron);
  
  m_BeamElectron.setPx(0);
  m_BeamElectron.setPy(0);
  m_BeamElectron.setPz(-Abs3MomBeam);
  m_BeamElectron.setE(TotEngBeam);
  
  m_BeamPositron.setPx(Abs3MomBeam*sin(m_CrossingAngle));
  m_BeamPositron.setPy(0);
  m_BeamPositron.setPz(Abs3MomBeam*cos(m_CrossingAngle));
  m_BeamPositron.setE(TotEngBeam);



  log << MSG::INFO << "successfully return from initialize()" <<endmsg;
  return StatusCode::SUCCESS;
}








StatusCode MyAnalysis::execute()
{
  MsgStream log(msgSvc(), name());
  log << MSG::INFO << "in execute()" << endreq;

  SmartDataPtr<Event::EventHeader> eventHeader(eventSvc(),"/Event/EventHeader");
  int runNo=eventHeader->runNumber();
  int event=eventHeader->eventNumber();
  log << MSG::DEBUG <<"run, evtnum = "
      << runNo << " , "
      << event <<endreq;

  std::vector<CLHEP::HepLorentzVector> FourVectGammas;
  FourVectGammas.clear();

   double Mm2gamsX;

  //   return StatusCode::SUCCESS;
  //!-Do MC Stuff
  if(m_MC_Analysis) {
    SmartDataPtr<Event::McParticleCol> mcParticles(eventSvc(),"/Event/MC/McParticleCol");
    if(!mcParticles) {
      log << MSG::ERROR << " Unable to retrieve McParticleCol" << endreq;
      //    return StatusCode::FAILURE;
    }

    m_nratruep = 0;
    m_nrtruep = 0;
    for( Event::McParticleCol::iterator it_mc = mcParticles->begin();
	 it_mc != mcParticles->end(); it_mc++ ){
      int PID = (*it_mc)->particleProperty();
      HepLorentzVector Particle = (*it_mc)->initialFourMomentum();
      // HepLorentzVector iniPos = (*it_mc)->initialPosition();
      // HepLorentzVector finPos = (*it_mc)->finalPosition();
      
      bool primary = (*it_mc)->primaryParticle();
      bool leaf = (*it_mc)->leafParticle();
      bool generator = (*it_mc)->decayFromGenerator();
      bool flight = (*it_mc)->decayInFlight();
      
      Event::McParticle Mother = (*it_mc)->mother();
      int MPID = Mother.particleProperty();

      if(m_nratruep <= m_nratruep->range().distance()) {
	m_atrue_id[m_nratruep] = PID;
	m_atrue_px[m_nratruep] = Particle.px();
	m_atrue_py[m_nratruep] = Particle.py();
	m_atrue_pz[m_nratruep] = Particle.pz();
	m_atrue_the[m_nratruep] = Particle.theta()*TMath::RadToDeg();
	m_atrue_phi[m_nratruep] = Particle.phi()*TMath::RadToDeg();
	m_atrue_en[m_nratruep] = Particle.e();
	m_atrue_pr[m_nratruep] = primary;
	m_atrue_le[m_nratruep] = leaf;
	m_atrue_ge[m_nratruep] = generator;
	m_atrue_fl[m_nratruep] = flight;
	m_atrue_mo[m_nratruep] = MPID;
	m_nratruep++;
      }
      
      if(m_nrtruep <= m_nrtruep->range().distance()) {
	m_true_id[m_nrtruep] = PID;
	m_true_px[m_nrtruep] = Particle.px();
	m_true_py[m_nrtruep] = Particle.py();
	m_true_pz[m_nrtruep] = Particle.pz();
	m_true_the[m_nrtruep] = Particle.theta()*TMath::RadToDeg();
	m_true_phi[m_nrtruep] = Particle.phi()*TMath::RadToDeg();
	m_true_en[m_nrtruep] = Particle.e();
	m_true_pr[m_nrtruep] = primary;
	m_true_le[m_nrtruep] = leaf;
	m_true_ge[m_nrtruep] = generator;
	m_true_fl[m_nrtruep] = flight;
	m_true_mo[m_nrtruep] = MPID;
	m_nrtruep++;
      }

      if(primary){
	if(PID==11){
	  m_TrueElectron = Particle;
	  if(m_WithHistos){
	    hMCElecMom->fill(Particle.vect().mag(),1.);
	    hMCElecThe->fill(Particle.theta()*TMath::RadToDeg(),1.);
	    hMCElecPhi->fill(Particle.phi()*TMath::RadToDeg(),1.);
	  }
	}
	if(PID==-11){
	  m_TruePositron = Particle;
	  double QSquare = -(Particle - m_BeamPositron).m2();
	  if(m_WithHistos){
	    hMCPosiMom->fill(Particle.vect().mag(),1.);
	    hMCPosiThe->fill(Particle.theta()*TMath::RadToDeg(),1.);
	    hMCPosiPhi->fill(Particle.phi()*TMath::RadToDeg(),1.);
	    hMCQSquare->fill(QSquare,1.);
	  }
 	}
	if(PID==111){
	  m_TruePiZero = Particle;
	}
      }
      if(PID==22 && MPID==111) {
	if(m_WithHistos){
	  hMCGamMom->fill(Particle.vect().mag(),1.);
	  hMCGamThe->fill(Particle.theta()*TMath::RadToDeg(),1.);
	  hMCGamPhi->fill(Particle.phi()*TMath::RadToDeg(),1.);
	}
      }

      if(PID==22){
	CLHEP::HepLorentzVector FourVectGamma;
	FourVectGamma.setRThetaPhi(Particle.e(),Particle.theta(),Particle.phi());
	FourVectGamma.setE(Particle.e());

	FourVectGammas.push_back(FourVectGamma);
      }

    }

    
    
    if(m_MC_AllTrue) {
      CLHEP::HepLorentzVector VectSumGammas;
      for(int k=0;k<FourVectGammas.size();k++){
	VectSumGammas+=FourVectGammas[k];
      }
      Mm2gamsX=(m_BeamElectron+m_BeamPositron-VectSumGammas).m2();
      m_atrue_Mm2gamsX=Mm2gamsX;
      m_tuple6->write();
      FourVectGammas.clear();
    }
  }


  //!-TriggerPattern
  SmartDataPtr<TrigData> trigData(eventSvc(), "/Event/Trig/TrigData");
  if (trigData!=0) {
    Bool_t TrConds[48];
    for(m_trgconds = 0; m_trgconds < 48; m_trgconds++) {
      m_trgcond[m_trgconds] = false;
      if(trigData->getTrigCondition(m_trgconds)!=0) {
	m_trgcond[m_trgconds] = true;
      }
    }
    for(m_trgchans = 0; m_trgchans < 16; m_trgchans++) {
      m_trgchan[m_trgchans] = false;
      if(trigData->getTrigChannel(m_trgchans)!=0) {
	m_trgchan[m_trgchans] = true;
      }
    }
  }



  //!-Do Rec Stuff
  SmartDataPtr<EvtRecEvent> evtRecEvent(eventSvc(), EventModel::EvtRec::EvtRecEvent);

  log << MSG::DEBUG <<"ncharg, nneu, tottks = " 
      << evtRecEvent->totalCharged() << " , "
      << evtRecEvent->totalNeutral() << " , "
      << evtRecEvent->totalTracks() <<endreq;

  SmartDataPtr<EvtRecTrackCol> evtRecTrkCol(eventSvc(),  EventModel::EvtRec::EvtRecTrackCol);
  int IAllTracks = evtRecEvent->totalTracks();
  int IAllCharged = evtRecEvent->totalCharged();
  int IAllNeutral = evtRecEvent->totalTracks();
  int IFCTrack = 0;
  int ILCTrack = IAllCharged - 1;
  int IFNTrack = IAllCharged;
  int ILNTrack = IAllTracks -1;
 
  if(m_WithHistos) hGamMult->fill(IAllNeutral,1.);

  //-***Skip Event if basic requirements are not met***
  //if(IAllNeutral<2 || IAllCharged==0) return StatusCode::SUCCESS;
  //if(IAllCharged==0) return StatusCode::SUCCESS;
  //if(IAllCharged<2) return StatusCode::SUCCESS;
  if(IAllCharged>=1) return StatusCode::SUCCESS;

  //-***Select photon candidates***
  std:vector<int> IVGamma;
  IVGamma.clear();

  m_ngam = 0;

  
  for(int i = IFNTrack; i<=ILNTrack; i++) {
    EvtRecTrackIterator itTrk=evtRecTrkCol->begin() + i;
    if(!(*itTrk)->isEmcShowerValid()) continue;
    RecEmcShower *emcTrk = (*itTrk)->emcShower();
    int bec = EmcID::barrel_ec(emcTrk->getShowerId());
    int ring = EmcID::theta_module(emcTrk->getShowerId());
    int row = EmcID::phi_module(emcTrk->getShowerId());
    double ShwEng = emcTrk->energy();
    double ShwTime = emcTrk->time();
    HepPoint3D ShwPos = emcTrk->position();
    double Shwtheta = emcTrk->theta();
    double Shwphi = emcTrk->phi();

    Shwtheta *= TMath::RadToDeg();
    Shwphi *= TMath::RadToDeg();

    // find the closest charged track
    Hep3Vector emcpos(ShwPos.x(),ShwPos.y(),ShwPos.z());
    double dthe = 200.;
    double dphi = 200.;
    double dang = 200.; 
    //    /*
    for(int j = 0; j < evtRecEvent->totalCharged(); j++) {
      EvtRecTrackIterator jtTrk = evtRecTrkCol->begin() + j;
      if(!(*jtTrk)->isExtTrackValid()) continue;
      RecExtTrack *extTrk = (*jtTrk)->extTrack();
      if(extTrk->emcVolumeNumber() == -1) continue;
      Hep3Vector extpos = extTrk->emcPosition();
      double angd = extpos.angle(emcpos);
      double thed = TVector2::Phi_mpi_pi(extpos.theta() - emcpos.theta());
      double phid = TVector2::Phi_mpi_pi(extpos.phi() - emcpos.phi());
      if(angd < dang){
        dang = angd;
        dthe = thed;
        dphi = phid;
      }
    }

    
    dthe *= TMath::RadToDeg();
    dphi *= TMath::RadToDeg();
    dang *= TMath::RadToDeg();
    
    m_becid[m_ngam] = bec;
    m_ring[m_ngam] = ring;
    m_row[m_ngam] = row;
    m_time[m_ngam] = ShwTime;
    m_eraw[m_ngam] = ShwEng;
    m_posx[m_ngam] = ShwPos.x();
    m_posy[m_ngam] = ShwPos.y();
    m_posz[m_ngam] = ShwPos.z();
    m_the[m_ngam] = Shwtheta;
    m_phi[m_ngam] = Shwphi;
    m_dthe[m_ngam] = dthe;
    m_dphi[m_ngam] = dphi;
    m_dang[m_ngam] = dang;


    // here it was before    /*
    if(m_WithHistos){
      hGamEng[0]->fill(ShwEng,1.);
      hGamTime[0]->fill(ShwTime,1.);
      hGamPhi[0]->fill(ShwPos.phi()*TMath::RadToDeg(),1.);
      hGamTheta[0]->fill(ShwPos.theta()*TMath::RadToDeg(),1.);
      hGamPhvTh[0]->fill(ShwPos.theta()*TMath::RadToDeg(),ShwPos.phi()*TMath::RadToDeg(),1.);
      hGamPOSPhvTh[0]->fill(EmcID::theta_module(emcTrk->getShowerId()),130*EmcID::barrel_ec(emcTrk->getShowerId())+EmcID::phi_module(emcTrk->getShowerId()),1.);
      if(ShwPos.cosTheta()<-0.83 && ShwPos.cosTheta()>-0.93) {
	hGamEnBEC[0]->fill(ShwEng,1.);
      } else if(fabs(ShwPos.cosTheta())<0.82) {
	hGamEnBAR[0]->fill(ShwEng,1.);
      } else if(ShwPos.cosTheta()>0.83 && ShwPos.cosTheta()<0.93) {
	hGamEnFEC[0]->fill(ShwEng,1.);
      }
      hGamNCOA[0]->fill(dang,1.);
      hGamNCdP[0]->fill(dphi,1.);
      hGamNCdT[0]->fill(dthe,1.);
      hGamNCdPvT[0]->fill(dthe,dphi,1.);
      hGamNCEvOA[0]->fill(ShwEng,dang,1.);
    }

    //-Reject candidate if out of time
    //-Only apply absolute timing cuts if "recEvt->totalCharged() > 0"
    double deltaTime = 50;
    if(IAllCharged==0) {
      RecEmcShower *firstG = (*(evtRecTrkCol->begin()))->emcShower();
      deltaTime = fabs(ShwTime - firstG->time());
    }

    if( (IAllCharged > 0 && ShwTime >= m_GamMinTime && ShwTime <= m_GamMaxTime) ||
        (IAllCharged==0 && deltaTime <= 10)) {
      //    if(IAllCharged > 0) {
      //      if ( ShwTime < m_GamMinTime || ShwTime > m_GamMaxTime ) {
      //	log << MSG::DEBUG << "Photon out of Time Window: " << ShwTime << endreq;
      //	continue; 
      //      }
      //    } else {
      //      RecEmcShower *firstG = (*(evtRecTrkCol->begin()))->emcShower();
      //      double deltaTime = fabs(ShwTime - firstG->time());
      //      if ( deltaTime > 10 ) {
      //	log << MSG::DEBUG << "Neutral Event! Photon out of Time Window: " << deltaTime << endreq;
      //	continue; 
      //      }
      //    }
      if(m_WithHistos){
	hGamEng[1]->fill(ShwEng,1.);
	hGamTime[1]->fill(ShwTime,1.);
	hGamPhi[1]->fill(ShwPos.phi()*TMath::RadToDeg(),1.);
	hGamTheta[1]->fill(ShwPos.theta()*TMath::RadToDeg(),1.);
	hGamPhvTh[1]->fill(ShwPos.theta()*TMath::RadToDeg(),ShwPos.phi()*TMath::RadToDeg(),1.);
	hGamPOSPhvTh[1]->fill(EmcID::theta_module(emcTrk->getShowerId()),130*EmcID::barrel_ec(emcTrk->getShowerId())+EmcID::phi_module(emcTrk->getShowerId()),1.);
	if(ShwPos.cosTheta()<-0.83 && ShwPos.cosTheta()>-0.93) {
	  hGamEnBEC[1]->fill(ShwEng,1.);
	} 
	else if(fabs(ShwPos.cosTheta())<0.82) {
	  hGamEnBAR[1]->fill(ShwEng,1.);
	} 
	else if(ShwPos.cosTheta()>0.83 && ShwPos.cosTheta()<0.93) {
	  hGamEnFEC[1]->fill(ShwEng,1.);
	}
	hGamNCOA[1]->fill(dang,1.);
	hGamNCdP[1]->fill(dphi,1.);
	hGamNCdT[1]->fill(dthe,1.);
	hGamNCdPvT[1]->fill(dthe,dphi,1.);
	hGamNCEvOA[1]->fill(ShwEng,dang,1.);
      }      


    //-Reject candidate if energy deposit to small 
      //      if( (fabs(ShwPos.cosTheta()) <= 0.82 && ShwEng < m_GamMinEngB) ||
      //	  (fabs(ShwPos.cosTheta()) >= 0.83 && fabs(ShwPos.cosTheta()) <= 0.93 && ShwEng < m_GamMinEngE) ) {
      //      log << MSG::DEBUG << "Photon Energy below threshold: " << ShwEng << endreq;
      //      continue; 
      //    }
      if( (fabs(ShwPos.cosTheta()) <= 0.82 && ShwEng >= m_GamMinEngB) ||
	  //	  (fabs(ShwPos.cosTheta()) >= 0.83 && fabs(ShwPos.cosTheta()) <= 0.93 && ShwEng >= m_GamMinEngE) ) {
	  (fabs(ShwPos.cosTheta()) >= 0.83 && ShwEng >= m_GamMinEngE) ) {

	if(m_WithHistos){
	  hGamEng[2]->fill(ShwEng,1.);
	  hGamTime[2]->fill(ShwTime,1.);
	  hGamPhi[2]->fill(ShwPos.phi()*TMath::RadToDeg(),1.);
	  hGamTheta[2]->fill(ShwPos.theta()*TMath::RadToDeg(),1.);
	  hGamPhvTh[2]->fill(ShwPos.theta()*TMath::RadToDeg(),ShwPos.phi()*TMath::RadToDeg(),1.);
	  hGamPOSPhvTh[2]->fill(EmcID::theta_module(emcTrk->getShowerId()),130*EmcID::barrel_ec(emcTrk->getShowerId())+EmcID::phi_module(emcTrk->getShowerId()),1.);
	  if(ShwPos.cosTheta()<-0.83 && ShwPos.cosTheta()>-0.93) {
	    hGamEnBEC[2]->fill(ShwEng,1.);
	  } else if(fabs(ShwPos.cosTheta())<0.82) {
	    hGamEnBAR[2]->fill(ShwEng,1.);
	  } else if(ShwPos.cosTheta()>0.83 && ShwPos.cosTheta()<0.93) {
	    hGamEnFEC[2]->fill(ShwEng,1.);
	  }
	  hGamNCOA[2]->fill(dang,1.);
	  hGamNCdP[2]->fill(dphi,1.);
	  hGamNCdT[2]->fill(dthe,1.);
	  hGamNCdPvT[2]->fill(dthe,dphi,1.);
	  hGamNCEvOA[2]->fill(ShwEng,dang,1.);
	}

	/*
	//-Reject candidate if to close to charged track 
	//	if(fabs(dang) < m_GamMinDistC) {
	//	  log << MSG::DEBUG << "Photon to close to Charged Track: " << dang << endreq;
	//	  continue; 
	//	}
	if(fabs(dang) >= m_GamMinDistC) {
	  if(m_WithHistos){
	    hGamEng[3]->fill(ShwEng,1.);
	    hGamTime[3]->fill(ShwTime,1.);
	    hGamPhi[3]->fill(ShwPos.phi()*TMath::RadToDeg(),1.);
	    hGamTheta[3]->fill(ShwPos.theta()*TMath::RadToDeg(),1.);
	    hGamPhvTh[3]->fill(ShwPos.theta()*TMath::RadToDeg(),ShwPos.phi()*TMath::RadToDeg(),1.);
	    hGamPOSPhvTh[3]->fill(EmcID::theta_module(emcTrk->getShowerId()),130*EmcID::barrel_ec(emcTrk->getShowerId())+EmcID::phi_module(emcTrk->getShowerId()),1.);
	    if(ShwPos.cosTheta()<-0.83 && ShwPos.cosTheta()>-0.93) {
	    hGamEnBEC[3]->fill(ShwEng,1.);
	    } else if(fabs(ShwPos.cosTheta())<0.82) {
	      hGamEnBAR[3]->fill(ShwEng,1.);
	    } else if(ShwPos.cosTheta()>0.83 && ShwPos.cosTheta()<0.93) {
	      hGamEnFEC[3]->fill(ShwEng,1.);
	    }
	    hGamNCOA[3]->fill(dang,1.);
	    hGamNCdP[3]->fill(dphi,1.);
	    hGamNCdT[3]->fill(dthe,1.);
	    hGamNCdPvT[3]->fill(dthe,dphi,1.);
	    hGamNCEvOA[3]->fill(ShwEng,dang,1.);
	  }
    
	  //-store good photons
	  IVGamma.push_back(m_ngam);
	
	} 
	else {log << MSG::DEBUG << "Photon to close to Charged Track: " << dang << endreq;}
	*/

	//-store good photons
	  IVGamma.push_back(m_ngam);

	  CLHEP::HepLorentzVector FourVectGamma;
	  FourVectGamma.setRThetaPhi(ShwEng,Shwtheta/(TMath::RadToDeg()),Shwphi/(TMath::RadToDeg()));
	  FourVectGamma.setE(ShwEng);

	  FourVectGammas.push_back(FourVectGamma);
      }
      else {log << MSG::DEBUG << "Photon Energy below threshold: E=" << ShwEng 
		  << ", Th=" << ShwPos.theta()*TMath::RadToDeg() << endreq;}
    } 
    else {log << MSG::DEBUG << "Photon out of Time Window: " << ShwTime << endreq;}
    //*/
    m_ngam++;
    if(m_ngam > m_ngam->range().distance()) {
      log << MSG::DEBUG << "TOO MANY! CAN'T GO ON!" << endreq;
    break;
    }
    
    
  }//-End of Photon Loop

  //  
  int NOKGam = IVGamma.size();
  log << MSG::DEBUG << "num Good Photon " << NOKGam << " , " <<evtRecEvent->totalNeutral()<<endreq;


  //-Reject event if less than two good photons found
  //lumi: don't need this cut
  //if(NOKGam<0){
    //  if(NOKGam<2){
  //  return StatusCode::SUCCESS;
  //}

  //  */

  //-Get Vertex Info from DB
  Hep3Vector xorigin(0,0,0);

  IVertexDbSvc*  vtxsvc;
  Gaudi::svcLocator()->service("VertexDbSvc", vtxsvc);
  if(vtxsvc->isVertexValid()){
    double* dbv = vtxsvc->PrimaryVertex(); 
    double* vv = vtxsvc->SigmaPrimaryVertex();  
    xorigin.setX(dbv[0]);
    xorigin.setY(dbv[1]);
    xorigin.setZ(dbv[2]);
  }
  
  CLHEP::HepLorentzVector VectSumGammas;
    for(int k=0;k<FourVectGammas.size();k++){
      VectSumGammas+=FourVectGammas[k];
    }
    
   
    Mm2gamsX=(m_BeamElectron+m_BeamPositron-VectSumGammas).m2();
    //log << MSG::WARNING << (m_BeamElectron+m_BeamPositron).m2() << " " << VectSumGammas.m2() << " " << Mm2gamsX  << endreq;
    m_Mm2gamsX=Mm2gamsX;
  
  m_tuple1->write();
  m_tuple2->write();
  m_tuple3->write();
    
  if(m_MC_Analysis) {
               m_tuple5->write();
  }
   log << MSG::DEBUG << "NTuples written" << endreq;

   
  /*
  //-***Select charged tracks***
  //
  //-check x0, y0, z0, r0
  // suggest cut: |z0|<5 && r0<1
  //
  std::vector<HepLorentzVector> LVLepton;
  std::vector<int> IVLeptonQ;
  std::vector<int> IVLeptonID;
  m_nctrk = 0;
  double ntrkecal = 0;
  for(int i = IFCTrack; i <=ILCTrack; i++){
    EvtRecTrackIterator itTrk=evtRecTrkCol->begin() + i;
    if(!(*itTrk)->isMdcTrackValid()) continue;

    RecMdcTrack *mdcTrk = (*itTrk)->mdcTrack();
    double x0=mdcTrk->x();
    double y0=mdcTrk->y();
    double z0=mdcTrk->z();
    double phi0=mdcTrk->helix(1);
    double xv=xorigin.x();
    double yv=xorigin.y();
    double Rxy=(x0-xv)*cos(phi0)+(y0-yv)*sin(phi0);

    if(m_WithHistos){
      hCTrkVtxX->fill(x0-xv,1.);
      hCTrkVtxY->fill(y0-yv,1.);
      hCTrkVtxZ->fill(z0-xorigin.z(),1.);
      hCTrkVtxXvY->fill(x0,y0,1.);
      hCTrkVtxRvZ->fill(z0,Rxy,1.);
    }

    int chrg = mdcTrk->charge();
    Hep3Vector trk = mdcTrk->p3();
    if(m_WithHistos){
      hCTrkMom->fill(trk.mag(),1.);
      hCTrkPhi->fill(trk.phi()*TMath::RadToDeg(),1.);
      hCTrkTheta->fill(trk.theta()*TMath::RadToDeg(),1.);
    }

    HepVector a = mdcTrk->helix();
    HepSymMatrix Ea = mdcTrk->err();
    HepPoint3D point0(0.,0.,0.);   // the initial point for MDC recosntruction
    HepPoint3D IP(xorigin[0],xorigin[1],xorigin[2]); 
    VFHelix helixip(point0,a,Ea); 
    helixip.pivot(IP);
    HepVector vecipa = helixip.a();
    double  Rvxy0=fabs(vecipa[0]);  //the nearest distance to IP in xy plane
    double  Rvz0=vecipa[3];         //the nearest distance to IP in z direction
    double  Rvphi0=vecipa[1];

    if(m_WithHistos){
      hCTrkPcaR->fill(Rvxy0,1.);
      hCTrkPcaZ->fill(Rvz0,1.);
      hCTrkPcaRvZ->fill(Rvz0,Rvxy0,1.);
    }

    //- Check ECal information
    double ECal = -1;
    HepPoint3D ShwPosTr(0.,0.,0.);
    if((*itTrk)->isEmcShowerValid()) {
      RecEmcShower *emc = (*itTrk)->emcShower();
      ECal = emc->energy();

      //include shower position of track:
      ShwPosTr = emc->position();
      //      HepPoint3D ShwPosTr = emc->position();
      // vergleich mit folgender def:  Hep3Vector trk = mdcTrk->p3();

      if(ECal>1.0){
	ntrkecal=ntrkecal+1;
      }
      if(m_WithHistos){
	hCTrkEcal->fill(ECal,1.);
	hCTrkEOP->fill(ECal/trk.mag(),1.);
	hCTrkEOPvP->fill(trk.mag()*chrg,ECal/trk.mag(),1.);
      }
    }

    //- Check de/dx information
    if((*itTrk)->isMdcDedxValid()) {
      RecMdcDedx* dedxTrk = (*itTrk)->mdcDedx();
      
    }


    m_rvxy0[m_nctrk]  = Rvxy0;
    m_rvz0[m_nctrk]   = Rvz0;
    m_rvphi0[m_nctrk] = Rvphi0;
    m_px[m_nctrk]     = trk.x();
    m_py[m_nctrk]     = trk.y();
    m_pz[m_nctrk]     = trk.z();
    m_q[m_nctrk]      = chrg;
    m_ecal[m_nctrk]   = ECal;
    m_trposx[m_nctrk] = ShwPosTr.x();
    m_trposy[m_nctrk] = ShwPosTr.y();
    m_trposz[m_nctrk] = ShwPosTr.z();
    m_nctrk++;

   
    if(m_nctrk > m_nctrk->range().distance()) {
      log << MSG::DEBUG << "TOO MANY tracks! CAN'T GO ON!" << endreq;
      break;
    }



    //-Check Acceptance   
    if(fabs(trk.cosTheta())>0.93) {
      log << MSG::DEBUG << "CTrk: Fail CosTheta" << endreq;
      continue;
    }

    //-Check Z distance of PCA    
    if(fabs(Rvz0) >= 10.0) {
      log << MSG::DEBUG << "CTrk: Fail VTX dZ" << endreq;
      continue;
    }

    //-Check XY distance of PCA    
    if(fabs(Rvxy0) >= 1.0)  {
      log << MSG::DEBUG << "CTrk: Fail VTX dR" << endreq;
      continue;
    }

    //-Check Edep/Momentum ratio    
    if((ECal/trk.mag())<0.8){
      log << MSG::DEBUG << "CTrk: Fail EOP!" << endreq;
      continue;
    }
    
    //-Store Lepton candidates (4Vector+Charge)

    //!-PID can be set to electron, muon, pion, kaon and proton
    RecMdcKalTrack::setPidType  (RecMdcKalTrack::electron);
    //!-After ParticleID, use RecMdcKalTrack substitute RecMdcTrack
    if((*itTrk)->isMdcKalTrackValid()) {
      RecMdcKalTrack* mdcKalTrk = (*itTrk)->mdcKalTrack();
      HepLorentzVector posi = mdcKalTrk->p4(g_mass_electron);
      LVLepton.push_back(posi);
      IVLeptonQ.push_back(chrg);
      IVLeptonID.push_back(m_nctrk-1);
    } else {
      log << MSG::DEBUG << "CTrk: No MdcKalTrack!" << endreq;
      continue;
    }

  }

  log << MSG::DEBUG << "CTrkLoop finished" << endreq;

  int nlept = LVLepton.size();

  if(m_WithHistos) hCTrkNPos->fill(nlept,1.);
  log << MSG::INFO << "Number of lepton tracks = " << nlept <<endreq;
 
  //lvpions not defined
  //  if(LVPions.size() > 0 &&
  if( nlept > 0 && ntrkecal > 1) {
        m_tuple1->write();
        m_tuple2->write();
        m_tuple3->write();
    m_nrlept = 0;
    for(int i=0; i<nlept; i++) {
      m_leptpx[m_nrlept] = LVLepton[i].px();
      m_leptpy[m_nrlept] = LVLepton[i].py();
      m_leptpz[m_nrlept] = LVLepton[i].pz();
      m_lepte[m_nrlept] = LVLepton[i].e();
      m_leptq[m_nrlept] = IVLeptonQ[i];
      m_leptid[m_nrlept] = IVLeptonID[i];
      m_nrlept++;
      if(m_nrlept > m_nrlept->range().distance()) {
	log << MSG::DEBUG << "TOO MANY letps CAN'T GO ON!" << endreq;
	break;
      }
    }   
    //        m_tuple4->write();
    if(m_MC_Analysis) {
               m_tuple5->write();
    }
    log << MSG::DEBUG << "NTuples written" << endreq;
  }else {
    log << MSG::DEBUG << "NTuples not written" << endreq;
  }
*/

 

  return StatusCode::SUCCESS;
}




StatusCode MyAnalysis::finalize() {
  MsgStream log(msgSvc(), name());
  log << MSG::INFO << "in finalize()" << endmsg;
  return StatusCode::SUCCESS;
}

