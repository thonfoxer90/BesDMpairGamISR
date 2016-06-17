//#pragma once

#include "BesDMpairGamISR/Pi0recHelper.h"

using namespace Event;


//----------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------
// class ValidCombs2
//----------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------------------------
ValidCombs2::ValidCombs2()
//----------------------------------------------------------------------------------------------------------
{
  m_pTrack1 = 0;
  m_pTrack2 = 0;
}
//----------------------------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------------------------
void ValidCombs2::Set(cPi0Tracks* pT1,cPi0Tracks* pT2)
//----------------------------------------------------------------------------------------------------------
{
  m_pTrack1 = pT1;
  m_pTrack2 = pT2;
}
//----------------------------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------
// class ValidCombs3
//----------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------------------------
ValidCombs3::ValidCombs3()
//----------------------------------------------------------------------------------------------------------
{
  m_pTrack1 = 0;
  m_pTrack2 = 0;
  m_pTrack3 = 0;
}
//----------------------------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------------------------
void ValidCombs3::Set(cPi0Tracks* pT1,cPi0Tracks* pT2,cPi0Tracks* pT3)
//----------------------------------------------------------------------------------------------------------
{
  m_pTrack1 = pT1;
  m_pTrack2 = pT2;
  m_pTrack3 = pT3;
}
//----------------------------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------
// class cPi0Tracks
//----------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------------------------
cPi0Tracks::cPi0Tracks()
//----------------------------------------------------------------------------------------------------------
{
  m_pTrack1  = 0;
  m_pTrack2  = 0;
  m_dMass    = 0;
  //m_iT1      = -1;
  //m_iT2      = -1;
}
//----------------------------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------------------------
cPi0Tracks::cPi0Tracks(EvtRecTrack* pT1,EvtRecTrack* pT2,double dM)//,int iT1,int iT2)
//----------------------------------------------------------------------------------------------------------
{
  Set(pT1,pT2,dM);//,iT1,iT2);
}
//----------------------------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------------------------
void cPi0Tracks::Set(EvtRecTrack* pT1,EvtRecTrack* pT2,double dM)//,int iT1,int iT2)
//----------------------------------------------------------------------------------------------------------
{
  m_pTrack1  = pT1;
  m_pTrack2  = pT2;
  m_dMass    = dM;
  //m_iT1      = iT1;
  //m_iT2      = iT2;
  //cout<<"recording: "<<m_pTrack1->isEmcShowerValid()<<" , "<<m_pTrack2->isEmcShowerValid()<<" , mass= "<<m_dMass<<endl;
}
//----------------------------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------
// class cPi0TracksList
//----------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------


cPi0TracksList::cPi0TracksList() {}

//----------------------------------------------------------------------------------------------------------
void cPi0TracksList::Init(double mlow,double mhigh,double barrelEmin,double endcapEmin,double cosTbarrel,double time,double Ebeam)
//----------------------------------------------------------------------------------------------------------
{
  m_dBeamEnergy        = Ebeam;
  m_dPhEnergyCutBarrel = barrelEmin;
  m_dPhEnergyCutEndCap = endcapEmin;
  m_dPi0MassCutLow     = mlow;
  m_dPi0MassCutHigh    = mhigh;
  m_dCosThetaBarrel    = cosTbarrel;
  m_dMaxTime           = time;
  m_dDeltaAngleCut     = 0.349; // = 20 degrees
  //m_dDeltaAngleCut     = 0.1745; // = 10 degrees
}
//----------------------------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------------------------
void cPi0TracksList::SetIterators (EvtRecTrackIterator itBegin,EvtRecTrackIterator itEndCh,EvtRecTrackIterator itEndN)
//----------------------------------------------------------------------------------------------------------
{
  m_itBegin            = itBegin;
  m_itEndCharged       = itEndCh;
  m_itEndNeutral       = itEndN;  
  ClearLists();
}
//----------------------------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------------------------
void cPi0TracksList::Add(cPi0Tracks track)
//----------------------------------------------------------------------------------------------------------
{
  m_aPi0TracksTable.push_back (track);
}
//----------------------------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------------------------
void cPi0TracksList::Add(EvtRecTrack* pT1,EvtRecTrack* pT2,double dM)
//----------------------------------------------------------------------------------------------------------
{
  cPi0Tracks track;
  track.Set (pT1,pT2,dM);
  Add(track);
}
//----------------------------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------------------------
void cPi0TracksList::ClearLists()
//----------------------------------------------------------------------------------------------------------
{
  m_aPi0TracksTable.clear();
  m_aValidCombs2.clear();
  m_aValidCombs3.clear();  
}
//----------------------------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------------------------
void cPi0TracksList::FillList()
//----------------------------------------------------------------------------------------------------------
{
  EvtRecTrackIterator    itERT1;
  EvtRecTrackIterator    itERT2;
  double                 d2GMass;
  
  //int x = 0, y = 0;
  for (itERT1 = m_itEndCharged;itERT1 !=m_itEndNeutral;itERT1 ++) {
    //x ++; y = x;
    if (   !IsPhoton(*itERT1)
	|| (*itERT1)->emcShower()->energy() > m_dBeamEnergy
       ) {continue;}
    for (itERT2 = itERT1+1;itERT2 != m_itEndNeutral;itERT2 ++) {
      //y ++;     
      if (    !IsPhoton(*itERT2)
	   || (*itERT2)->emcShower()->energy() > m_dBeamEnergy
	 ) {continue;}
      d2GMass = GetM(*itERT1,0.0,*itERT2,0.0);
      if (d2GMass > m_dPi0MassCutHigh || d2GMass < m_dPi0MassCutLow) {continue;}
      Add(*itERT1,*itERT2,d2GMass);//,x,y);
     }
  }
}
//----------------------------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------------------------
void cPi0TracksList::CreatedValid2Combs()
//----------------------------------------------------------------------------------------------------------
{
  ValidCombs2 aVC2dummy;

  m_aValidCombs2.clear();
  //m_aValidCombs2.shrink_to_fit();
  for (int i=0;i<m_aPi0TracksTable.size();i++) {
    for (int k=i+1;k<m_aPi0TracksTable.size();k++) {
      // find combinations that have became invalid for the choice of first track
      if (m_aPi0TracksTable[k].m_pTrack1 == m_aPi0TracksTable[i].m_pTrack1 ||
	  m_aPi0TracksTable[k].m_pTrack1 == m_aPi0TracksTable[i].m_pTrack2 ||
	  m_aPi0TracksTable[k].m_pTrack2 == m_aPi0TracksTable[i].m_pTrack1 ||
	  m_aPi0TracksTable[k].m_pTrack2 == m_aPi0TracksTable[i].m_pTrack2
	  ) {continue;}
      aVC2dummy.Set(&m_aPi0TracksTable[i],&m_aPi0TracksTable[k]);
      m_aValidCombs2.push_back(aVC2dummy);
    }
  }
/*  if (m_aValidCombs2.size() > m_aPi0TracksTable.size()/2) {
    cout<<"ououou! #2* 2combs: "<<m_aValidCombs2.size()<<" >  #pi0tracks: "<<m_aPi0TracksTable.size()<<endl;
    for (int i=0;i<m_aValidCombs2.size();i++) {
       cout<<"2comb "<<i<<": ("<<m_aValidCombs2[i].m_pTrack1->m_iT1<<","<<m_aValidCombs2[i].m_pTrack1->m_iT2<<") , ("
                               <<m_aValidCombs2[i].m_pTrack2->m_iT1<<","<<m_aValidCombs2[i].m_pTrack2->m_iT2<<")"<<endl;
    }
*/
}
//----------------------------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------------------------
void cPi0TracksList::CreatedValid3Combs()
//----------------------------------------------------------------------------------------------------------
{
  ValidCombs3 aVC3dummy;

  m_aValidCombs3.clear();
  //m_aValidCombs3.shrink_to_fit();
  for (int i=0;i<m_aValidCombs2.size();i++) {
    for (int k=i+1;k<m_aPi0TracksTable.size();k++) {
      // find combinations that have became invalid the new choice
      if (m_aPi0TracksTable[k].m_pTrack1 == m_aValidCombs2[i].m_pTrack1->m_pTrack1 ||
	  m_aPi0TracksTable[k].m_pTrack1 == m_aValidCombs2[i].m_pTrack1->m_pTrack2 ||
	  m_aPi0TracksTable[k].m_pTrack1 == m_aValidCombs2[i].m_pTrack2->m_pTrack1 ||
	  m_aPi0TracksTable[k].m_pTrack1 == m_aValidCombs2[i].m_pTrack2->m_pTrack2 ||
	  m_aPi0TracksTable[k].m_pTrack2 == m_aValidCombs2[i].m_pTrack1->m_pTrack1 ||
	  m_aPi0TracksTable[k].m_pTrack2 == m_aValidCombs2[i].m_pTrack1->m_pTrack2 ||
	  m_aPi0TracksTable[k].m_pTrack2 == m_aValidCombs2[i].m_pTrack2->m_pTrack1 ||
	  m_aPi0TracksTable[k].m_pTrack2 == m_aValidCombs2[i].m_pTrack2->m_pTrack2
	  ) {continue;}
      aVC3dummy.Set(m_aValidCombs2[i].m_pTrack1,m_aValidCombs2[i].m_pTrack2,&m_aPi0TracksTable[k]);
      m_aValidCombs3.push_back(aVC3dummy);
    }
  }
  if (m_aPi0TracksTable.capacity() > 1024 || m_aValidCombs2.capacity() > 1024) {
    cout<<" , v3combs: "<<m_aValidCombs3.size()<<" , capacity: "<<m_aValidCombs3.capacity()<<endl;
  }
}
//----------------------------------------------------------------------------------------------------------


//---------------------------------------------------------------------------------------------------------- 
bool cPi0TracksList::IsPhoton (EvtRecTrack* pTrack)
//---------------------------------------------------------------------------------------------------------- 
{
  if (!pTrack->isEmcShowerValid()) {return (false);}
  if (   (abs(cos(pTrack->emcShower()->theta())) <= m_dCosThetaBarrel  && pTrack->emcShower()->energy() < m_dPhEnergyCutBarrel)
      || (abs(cos(pTrack->emcShower()->theta())) >  m_dCosThetaBarrel  && pTrack->emcShower()->energy() < m_dPhEnergyCutEndCap)
      || abs(pTrack->emcShower()->time()) >  m_dMaxTime 
     )
     {return (false);}
  if (abs(RejectEMCtrack(pTrack)) < m_dDeltaAngleCut) {return (false);}
  return (true);
}
//---------------------------------------------------------------------------------------------------------- 


//----------------------------------------------------------------------------------------------------------
HepLorentzVector cPi0TracksList::Get4VecFromEMC (EvtRecTrack* pCur,double dMass)
//----------------------------------------------------------------------------------------------------------
{
  HepLorentzVector result(0,0,0,0);
  result.setRThetaPhi(sqrt(pow(pCur->emcShower()->energy(),2)-pow(dMass,2)),
		      pCur->emcShower()->theta(),
		      pCur->emcShower()->phi());
  result.setE(pCur->emcShower()->energy());
  return (result);
}
//----------------------------------------------------------------------------------------------------------


//---------------------------------------------------------------------------------------------------------- 
double cPi0TracksList::GetM (EvtRecTrack* pCur1,double dMass1,EvtRecTrack* pCur2,double dMass2)
//---------------------------------------------------------------------------------------------------------- 
{
  if (!pCur1->isEmcShowerValid() || !pCur2->isEmcShowerValid()) {return (-1);}
  HepLorentzVector lv1 = Get4VecFromEMC(pCur1,dMass1);
  HepLorentzVector lv2 = Get4VecFromEMC(pCur2,dMass2);
  return((lv1+lv2).mag());
}
//---------------------------------------------------------------------------------------------------------- 


//---------------------------------------------------------------------------------------------------------- 
double cPi0TracksList::RejectEMCtrack (EvtRecTrack* pCur)
//---------------------------------------------------------------------------------------------------------- 
{

  EvtRecTrackIterator  itERT;
  double dAngMin = 200.0, dAng;
  Hep3Vector extpos;
  Hep3Vector emcpos(pCur->emcShower()->x(), pCur->emcShower()->y(), pCur->emcShower()->z());
  for (itERT  = m_itBegin;itERT != m_itEndCharged;itERT ++) {
    if(!(*itERT)->isExtTrackValid()) {continue;}
    if((*itERT)->extTrack()->emcVolumeNumber() == -1) {continue;}
    extpos = (*itERT)->extTrack()->emcPosition();
    double dAng = extpos.angle(emcpos);
    if(dAng < dAngMin){
      dAngMin = dAng;
    }
  }
  //if(dAngMin >= 200) {dAngMin = -4.0;}
  //if(dAngMin >= 200) {return (true);}
  //dAngMin *= 180.0/(CLHEP::pi);
  //if(fabs(dAngMin) < m_dDeltaAngleCut) {return (true);}

  return dAngMin;
}	      
//---------------------------------------------------------------------------------------------------------- 


//---------------------------------------------------------------------------------------------------------- 
bool cPi0TracksList::IsUsedForPi0(EvtRecTrack* pCur,cPi0Tracks* ptPi01,cPi0Tracks* ptPi02,cPi0Tracks* ptPi03)
//----------------------------------------------------------------------------------------------------------
{
  if (ptPi01 != 0 && ptPi01->m_pTrack1 != 0 &&  ptPi01->m_pTrack1 == pCur) {return true;}
  if (ptPi01 != 0 && ptPi01->m_pTrack2 != 0 &&  ptPi01->m_pTrack2 == pCur) {return true;}
  if (ptPi02 != 0 && ptPi02->m_pTrack1 != 0 &&  ptPi02->m_pTrack1 == pCur) {return true;}
  if (ptPi02 != 0 && ptPi02->m_pTrack2 != 0 &&  ptPi02->m_pTrack2 == pCur) {return true;}
  if (ptPi03 != 0 && ptPi03->m_pTrack1 != 0 &&  ptPi03->m_pTrack1 == pCur) {return true;}
  if (ptPi03 != 0 && ptPi03->m_pTrack2 != 0 &&  ptPi03->m_pTrack2 == pCur) {return true;}
  return false;
}
//----------------------------------------------------------------------------------------------------------


//---------------------------------------------------------------------------------------------------------- 
bool cPi0TracksList::IsInPi0List (EvtRecTrack* pCur)
//----------------------------------------------------------------------------------------------------------
{
  for (int i=0;i<m_aPi0TracksTable.size();i++) {
    if (m_aPi0TracksTable[i].m_pTrack1 == pCur || m_aPi0TracksTable[i].m_pTrack2 == pCur) {return true;}
    }
  return false;
}
//----------------------------------------------------------------------------------------------------------

