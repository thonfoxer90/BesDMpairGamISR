#ifndef Physics_Analysis_BesDMpairGamISR_H
#define Physics_Analysis_BesDMpairGamISR_H 

#include "GaudiKernel/AlgFactory.h"
#include "GaudiKernel/Algorithm.h"
#include "GaudiKernel/NTuple.h"

#include "CLHEP/Vector/LorentzVector.h"

#include "AIDA/IHistogram1D.h"
#include "AIDA/IHistogram2D.h"

//#include "VertexFit/ReadBeamParFromDb.h"

class BesDMpairGamISR : public Algorithm {

public:
  BesDMpairGamISR(const std::string& name, ISvcLocator* pSvcLocator);
  StatusCode initialize();
  StatusCode execute();
  StatusCode finalize();  

private:

  //!-Parameters to be read from jobOptions file
  bool m_MC_Analysis;
  bool m_MC_AllTrue;
  bool m_WithHistos;
  double m_CMS_Energy;
  double m_CrossingAngle;

  //!--cuts for gammas
  double m_GamMinEngB;
  double m_GamMinEngE;
  double m_GamMinTime;
  double m_GamMaxTime;
  double m_GamMinDistC;
  double m_GamMinDistN;

  //!--Declare cuts for pions
  double m_PionMaxChiSq;

  //!--Declare r0, z0 cut for charged tracks
  double m_ChargedMaxVtxR;
  double m_ChargedMaxVtxZ;
  double m_ChargedMinEOP;
  double m_ChargedMaxEOP;

  //!-Four Vectors
  CLHEP::HepLorentzVector m_BeamPositron;
  CLHEP::HepLorentzVector m_BeamElectron;
  CLHEP::HepLorentzVector m_TruePositron;
  CLHEP::HepLorentzVector m_TrueElectron;
  CLHEP::HepLorentzVector m_TruePiZero;

  //std::vector<CLHEP::HepLorentzVector> m_4VectGammas;
  // define Histos
  IHistogram1D *hMCPosiMom;
  IHistogram1D *hMCPosiThe;
  IHistogram1D *hMCPosiPhi;
  IHistogram1D *hMCElecMom;
  IHistogram1D *hMCElecThe;
  IHistogram1D *hMCElecPhi;
  IHistogram1D *hMCGamMom;
  IHistogram1D *hMCGamThe;
  IHistogram1D *hMCGamPhi;
  IHistogram1D *hMCQSquare;

  IHistogram1D *hGamMult;
  IHistogram1D *hGamEng[4];
  IHistogram1D *hGamTime[4];
  IHistogram1D *hGamPhi[4];
  IHistogram1D *hGamTheta[4];
  IHistogram1D *hGamEnBEC[4];
  IHistogram1D *hGamEnBAR[4];
  IHistogram1D *hGamEnFEC[4];
  IHistogram2D *hGamPhvTh[4];
  IHistogram2D *hGamPOSPhvTh[4];
  IHistogram1D *hGamNCOA[4];
  IHistogram1D *hGamNCdP[4];
  IHistogram1D *hGamNCdT[4];
  IHistogram2D *hGamNCdPvT[4];
  IHistogram2D *hGamNCEvOA[4];

  IHistogram1D *hGPairOpAng;
  IHistogram1D *hGPairdPhi;
  IHistogram1D *hGPairdTheta;
  IHistogram2D *hGPairdPhiVsdTheta;
  IHistogram1D *hGPairIMass;
  IHistogram1D *hGPairChiSq;

  IHistogram1D *hCTrkMom;
  IHistogram1D *hCTrkPhi;
  IHistogram1D *hCTrkTheta;
  IHistogram1D *hCTrkVtxX;
  IHistogram1D *hCTrkVtxY;
  IHistogram1D *hCTrkVtxZ;
  IHistogram2D *hCTrkVtxXvY;
  IHistogram2D *hCTrkVtxRvZ;
  IHistogram1D *hCTrkPcaR;
  IHistogram1D *hCTrkPcaZ;
  IHistogram2D *hCTrkPcaRvZ;
  IHistogram1D *hCTrkEcal;
  IHistogram1D *hCTrkEOP;
  IHistogram2D *hCTrkEOPvP;
  IHistogram1D *hCTrkNPos;

  IHistogram1D *hRecPosiMom[6];
  IHistogram1D *hRecPosiThe[6];
  IHistogram1D *hRecPosiPhi[6];
  IHistogram1D *hRecPionMom[6];
  IHistogram1D *hRecPionThe[6];
  IHistogram1D *hRecPionCTheCMS[6];
  IHistogram1D *hRecPionPhi[6];
  IHistogram1D *hRecPionMass[6];
  IHistogram1D *hRecPiGGOA[6];
  IHistogram1D *hRecPiGGdT[6];
  IHistogram1D *hRecPiGGdP[6];
  IHistogram1D *hRecPiPoOA[6];
  IHistogram1D *hRecPiPodT[6];
  IHistogram1D *hRecPiPodP[6];
  IHistogram1D *hRecElecMom[6];
  IHistogram1D *hRecElecThe[6];
  IHistogram1D *hRecElecCThe[6];
  IHistogram1D *hRecElecPhi[6];
  IHistogram1D *hRecElecMass[6];
  IHistogram1D *hRecQSquare[6];
  IHistogram1D *hRecHelicity[6];
  IHistogram1D *hRecRGamma[6];

  // define Ntuples here
  NTuple::Tuple*  m_tuple1;      //-Trigger Info
  NTuple::Item<int>  m_trgconds;
  NTuple::Array<double>  m_trgcond;
  NTuple::Item<int>  m_trgchans;
  NTuple::Array<double>  m_trgchan;

  NTuple::Tuple*  m_tuple2;      //-Neutral Tracks
  NTuple::Item<int>  m_ngam;
  NTuple::Array<double>  m_becid;
  NTuple::Array<double>  m_ring;
  NTuple::Array<double>  m_row;
  NTuple::Array<double>  m_time;
  NTuple::Array<double>  m_eraw;
  NTuple::Array<double>  m_posx;
  NTuple::Array<double>  m_posy;
  NTuple::Array<double>  m_posz;
  NTuple::Array<double>  m_the;
  NTuple::Array<double>  m_phi;
  NTuple::Array<double>  m_dthe;
  NTuple::Array<double>  m_dphi;
  NTuple::Array<double>  m_dang;
  NTuple::Item<double> m_Mm2gamsX;

  NTuple::Tuple*  m_tuple3;      //-Charged Tracks
  NTuple::Item<int>  m_nctrk;
  NTuple::Array<double>  m_rvxy0;
  NTuple::Array<double>  m_rvz0;
  NTuple::Array<double>  m_rvphi0;
  NTuple::Array<double>  m_px;
  NTuple::Array<double>  m_py;
  NTuple::Array<double>  m_pz;
  NTuple::Array<double>  m_q;
  NTuple::Array<double>  m_ecal;
  NTuple::Array<double>  m_trposx;
  NTuple::Array<double>  m_trposy;
  NTuple::Array<double>  m_trposz;

  NTuple::Tuple*  m_tuple4;      //-lepton Candidates
  NTuple::Item<int>  m_nrlept;
  NTuple::Array<double>  m_leptpx;
  NTuple::Array<double>  m_leptpy;
  NTuple::Array<double>  m_leptpz;
  NTuple::Array<double>  m_lepte;
  NTuple::Array<double>  m_leptq;
  NTuple::Array<double>  m_leptid;
  

  NTuple::Tuple*  m_tuple5;      //-True MCInfo if reconstructed
  NTuple::Item<int> m_nrtruep;
  NTuple::Array<double> m_true_id;
  NTuple::Array<double> m_true_px;
  NTuple::Array<double> m_true_py;
  NTuple::Array<double> m_true_pz;
  NTuple::Array<double> m_true_en;
  NTuple::Array<double> m_true_pr;
  NTuple::Array<double> m_true_le;
  NTuple::Array<double> m_true_ge;
  NTuple::Array<double> m_true_fl;
  NTuple::Array<double> m_true_mo;
  NTuple::Array<double> m_true_the;
  NTuple::Array<double> m_true_phi;

  NTuple::Tuple*  m_tuple6;      //-All True MCInfo
  NTuple::Item<int> m_nratruep;
  NTuple::Array<double> m_atrue_id;
  NTuple::Array<double> m_atrue_px;
  NTuple::Array<double> m_atrue_py;
  NTuple::Array<double> m_atrue_pz;
  NTuple::Array<double> m_atrue_en;
  NTuple::Array<double> m_atrue_pr;
  NTuple::Array<double> m_atrue_le;
  NTuple::Array<double> m_atrue_ge;
  NTuple::Array<double> m_atrue_fl;
  NTuple::Array<double> m_atrue_mo;
  NTuple::Array<double> m_atrue_the;
  NTuple::Array<double> m_atrue_phi;
  NTuple::Item<double> m_atrue_Mm2gamsX;
 };

#endif 
