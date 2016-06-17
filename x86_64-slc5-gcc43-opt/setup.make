----------> uses
# use BesPolicy BesPolicy-* 
#   use BesCxxPolicy BesCxxPolicy-* 
#     use GaudiPolicy v*  (no_version_directory)
#       use LCG_Settings *  (no_version_directory)
#         use LCG_SettingsCompat *  (no_version_directory)
#       use Python * LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=2.5.4p2)
#         use LCG_Configuration v*  (no_version_directory)
#         use LCG_Settings v*  (no_version_directory)
#       use tcmalloc v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=1.4)
#         use LCG_Configuration v*  (no_version_directory)
#         use LCG_Settings v*  (no_version_directory)
#   use BesFortranPolicy BesFortranPolicy-* 
#     use LCG_Settings v*  (no_version_directory)
#   use SLC5_Compat * External (native_version=SLC5_Compat-00-00-01)
#     use BesExternalArea BesExternalArea-* External
# use GaudiInterface GaudiInterface-* External
#   use GaudiKernel *  (no_version_directory)
#     use GaudiPolicy v*  (no_version_directory)
#     use ROOT v* LCG_Interfaces (no_version_directory) (native_version=5.24.00b)
#       use LCG_Configuration v*  (no_version_directory)
#       use LCG_Settings v*  (no_version_directory)
#       use GCCXML v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=0.9.0_20090601)
#         use LCG_Configuration v*  (no_version_directory)
#         use LCG_Settings v*  (no_version_directory)
#       use Python v* LCG_Interfaces (no_auto_imports) (no_version_directory)
#     use Reflex v* LCG_Interfaces (no_version_directory)
#       use LCG_Configuration v*  (no_version_directory)
#       use LCG_Settings v*  (no_version_directory)
#       use ROOT v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=5.24.00b)
#     use Boost v* LCG_Interfaces (no_version_directory) (native_version=1.39.0_python2.5)
#       use LCG_Configuration v*  (no_version_directory)
#       use LCG_Settings v*  (no_version_directory)
#       use Python v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=2.5.4p2)
#     use CppUnit v* LCG_Interfaces (private) (no_auto_imports) (no_version_directory) (native_version=1.12.1_p1)
#       use LCG_Configuration v*  (no_version_directory)
#       use LCG_Settings v*  (no_version_directory)
#   use GaudiSvc *  (no_version_directory)
#     use GaudiKernel v*  (no_version_directory)
#     use Reflex v* LCG_Interfaces (no_auto_imports) (no_version_directory)
#     use CLHEP v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=2.0.4.5)
#       use LCG_Configuration v*  (no_version_directory)
#       use LCG_Settings v*  (no_version_directory)
#     use AIDA v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=3.2.1)
#       use LCG_Configuration v*  (no_version_directory)
#       use LCG_Settings v*  (no_version_directory)
#     use Boost v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=1.39.0_python2.5)
#     use ROOT v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=5.24.00b)
#     use PCRE v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=4.4)
#       use LCG_Configuration v*  (no_version_directory)
#       use LCG_Settings v*  (no_version_directory)
# use MdcGeomSvc MdcGeomSvc-* Mdc
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-* External
#   use calibUtil * Calibration
#     use GaudiInterface GaudiInterface-01-* External
#     use facilities * Calibration
#       use BesPolicy BesPolicy-* 
#     use xmlBase * Calibration
#       use BesPolicy * 
#       use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#         use LCG_Configuration v*  (no_version_directory)
#         use LCG_Settings v*  (no_version_directory)
#       use facilities * Calibration
#     use rdbModel * Calibration
#       use BesPolicy * 
#       use facilities * Calibration
#       use xmlBase * Calibration
#       use MYSQL * External
#         use mysql * LCG_Interfaces (no_version_directory) (native_version=5.0.18)
#           use LCG_Configuration v*  (no_version_directory)
#           use LCG_Settings v*  (no_version_directory)
#     use BesROOT BesROOT-00-* External
#       use CASTOR v* LCG_Interfaces (no_version_directory) (native_version=2.1.8-10)
#         use LCG_Configuration v*  (no_version_directory)
#         use LCG_Settings v*  (no_version_directory)
#       use ROOT v* LCG_Interfaces (no_version_directory) (native_version=5.24.00b)
#     use DatabaseSvc DatabaseSvc-* Database
#       use BesPolicy BesPolicy-* 
#       use GaudiInterface GaudiInterface-* External
#       use mysql * LCG_Interfaces (no_version_directory) (native_version=5.0.18)
#       use sqlite * LCG_Interfaces (no_version_directory) (native_version=3.6.11)
#         use LCG_Configuration v*  (no_version_directory)
#         use LCG_Settings v*  (no_version_directory)
#       use BesROOT * External
#   use CalibData * Calibration
#     use facilities facilities-* Calibration
#     use GaudiInterface * External
#     use BesROOT BesROOT-00-* External
#   use EventModel EventModel-* Event
#     use BesPolicy BesPolicy-* 
#     use GaudiInterface GaudiInterface-* External
#   use BesCLHEP BesCLHEP-00-* External (private)
#     use CLHEP v* LCG_Interfaces (no_version_directory) (native_version=2.0.4.5)
#     use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
#       use LCG_Configuration v*  (no_version_directory)
#       use LCG_Settings v*  (no_version_directory)
#     use HepPDT * LCG_Interfaces (no_version_directory) (native_version=2.05.04)
#       use LCG_Configuration v*  (no_version_directory)
#       use LCG_Settings v*  (no_version_directory)
#     use BesExternalArea BesExternalArea-* External
# use EventWriter EventWriter-* EvtPreSelect
#   use BesPolicy BesPolicy-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use GaudiSvc *  (no_version_directory)
#   use RootPolicy RootPolicy-* 
#     use BesPolicy BesPolicy-* 
#     use BesROOT BesROOT-00-* External
#   use BesROOT BesROOT-* External
#   use BesCLHEP BesCLHEP-* External
#   use EvtRecEvent EvtRecEvent-* Event
#     use BesPolicy BesPolicy-* 
#     use GaudiInterface GaudiInterface-* External
#     use BesCLHEP BesCLHEP-* External
#     use EventModel EventModel-* Event
#     use EvTimeEvent EvTimeEvent-* Event
#       use BesPolicy BesPolicy-01-* 
#       use GaudiInterface GaudiInterface-01-* External
#       use BesCLHEP BesCLHEP-* External
#       use MdcGeomSvc MdcGeomSvc-* Mdc
#       use RelTable RelTable-* Event
#         use BesPolicy BesPolicy-01-* 
#         use GaudiInterface GaudiInterface-01-* External
#       use EventModel EventModel-* Event
#       use Identifier Identifier-* DetectorDescription
#         use BesPolicy BesPolicy-* 
#     use MdcRecEvent MdcRecEvent-* Mdc
#       use BesPolicy BesPolicy-01-* 
#       use GaudiInterface GaudiInterface-01-* External
#       use MdcGeomSvc MdcGeomSvc-* Mdc
#       use RelTable RelTable-* Event
#       use EventModel EventModel-* Event
#       use Identifier Identifier-* DetectorDescription
#       use DstEvent DstEvent-* Event
#         use BesPolicy BesPolicy-* 
#         use GaudiInterface GaudiInterface-* External
#         use BesCLHEP BesCLHEP-* External
#         use EventModel EventModel-* Event
#       use BesCLHEP BesCLHEP-* External (private)
#     use TofRecEvent TofRecEvent-* Tof
#       use BesPolicy BesPolicy-01-* 
#       use GaudiInterface GaudiInterface-01-* External
#       use Identifier Identifier-* DetectorDescription
#       use EventModel EventModel-* Event
#       use DstEvent * Event
#     use EmcRecEventModel EmcRecEventModel-* Emc
#       use BesPolicy BesPolicy-* 
#       use Identifier Identifier-* DetectorDescription
#       use BesCLHEP BesCLHEP-* External
#       use EventModel EventModel-* Event
#       use DstEvent DstEvent-* Event
#       use EmcRecGeoSvc EmcRecGeoSvc-* Emc
#         use BesPolicy BesPolicy-* 
#         use Identifier Identifier-* DetectorDescription
#         use ROOTGeo ROOTGeo-* DetectorDescription
#           use BesPolicy BesPolicy-01-* 
#           use GaudiInterface GaudiInterface-* External
#           use BesCLHEP BesCLHEP-* External
#           use BesROOT BesROOT-* External
#           use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#           use GdmlToRoot GdmlToRoot-* External
#             use BesExternalArea BesExternalArea-* External
#             use BesROOT BesROOT-* External
#           use GdmlManagement GdmlManagement-* DetectorDescription
#             use BesExternalArea BesExternalArea-* External
#         use BesCLHEP BesCLHEP-* External
#         use GaudiInterface GaudiInterface-* External
#     use MucRecEvent MucRecEvent-* Muc
#       use BesPolicy BesPolicy-01-* 
#       use GaudiInterface GaudiInterface-01-* External
#       use Identifier Identifier-* DetectorDescription
#       use EventModel EventModel-* Event
#       use ExtEvent ExtEvent-* Event
#         use BesPolicy BesPolicy-01-* 
#         use GaudiInterface GaudiInterface-01-* External
#         use BesCLHEP BesCLHEP-* External
#         use EventModel EventModel-* Event
#         use DstEvent DstEvent-* Event
#       use MucGeomSvc MucGeomSvc-* Muc
#         use BesPolicy BesPolicy-01-* 
#         use GaudiInterface GaudiInterface-* External
#         use Identifier Identifier-* DetectorDescription
#         use ROOTGeo ROOTGeo-* DetectorDescription
#         use BesCLHEP BesCLHEP-* External
#         use BesROOT BesROOT-* External
#         use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#         use GdmlToRoot GdmlToRoot-* External
#         use G4Geo G4Geo-* DetectorDescription
#           use BesPolicy BesPolicy-01-* 
#           use GaudiInterface GaudiInterface-* External
#           use BesCLHEP BesCLHEP-* External
#           use BesGeant4 BesGeant4-* External
#             use BesExternalArea BesExternalArea-00-* External
#             use BesCLHEP BesCLHEP-00-* External
#           use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#           use GdmlToG4 GdmlToG4-* External
#             use BesExternalArea BesExternalArea-* External
#             use BesGeant4 BesGeant4-* External
#             use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#           use GdmlManagement GdmlManagement-* DetectorDescription
#           use Identifier Identifier-* DetectorDescription
#           use SimUtil SimUtil-* Simulation/BOOST
#             use BesPolicy BesPolicy-01-* 
#             use BesGeant4 BesGeant4-00-* External
#       use DstEvent DstEvent-* Event
#       use BesCLHEP BesCLHEP-* External (private)
#     use ExtEvent ExtEvent-* Event
#     use DstEvent DstEvent-* Event
#   use MdcRecEvent MdcRecEvent-* Mdc
#   use TofRecEvent TofRecEvent-* Tof
#   use EmcRecEventModel EmcRecEventModel-* Emc
#   use MucRecEvent MucRecEvent-* Muc
#   use EmcRec EmcRec-* Reconstruction
#     use BesPolicy BesPolicy-* 
#     use Identifier Identifier-* DetectorDescription
#     use GaudiInterface GaudiInterface-01-* External
#     use BesROOT BesROOT-00-* External
#     use EmcRecEventModel EmcRecEventModel-01-* Emc
#     use EmcRecGeoSvc EmcRecGeoSvc-01-* Emc
#     use EmcCalibConstSvc EmcCalibConstSvc-* Emc
#       use BesPolicy BesPolicy-* 
#       use GaudiInterface GaudiInterface-* External
#       use CalibData CalibData-* Calibration
#       use CalibDataSvc CalibDataSvc-* Calibration/CalibSvc
#         use BesPolicy * 
#         use BesROOT * External
#         use calibUtil * Calibration
#         use CalibData * Calibration
#         use DstEvent DstEvent-* Event
#         use EventModel EventModel-* Event
#         use GaudiInterface * External
#       use CalibROOTCnv CalibROOTCnv-* Calibration/CalibSvc
#         use BesPolicy * 
#         use calibUtil * Calibration
#         use CalibData * Calibration
#         use GaudiInterface * External
#         use BesROOT BesROOT-00-* External
#         use EventModel EventModel-* Event
#         use CalibDataSvc * Calibration/CalibSvc
#         use CalibMySQLCnv * Calibration/CalibSvc
#           use BesPolicy * 
#           use calibUtil * Calibration
#           use CalibData * Calibration
#           use GaudiInterface * External
#           use MYSQL MYSQL-00-* External
#           use CalibDataSvc * Calibration/CalibSvc
#       use EmcRecGeoSvc EmcRecGeoSvc-* Emc
#       use EmcGeneralClass EmcGeneralClass-* Emc
#         use BesPolicy BesPolicy-* 
#         use Identifier Identifier-* DetectorDescription
#       use BesCLHEP BesCLHEP-* External
#     use RawDataProviderSvc RawDataProviderSvc-* Event
#       use BesPolicy BesPolicy-01-* 
#       use RootPolicy RootPolicy-* 
#       use GaudiInterface GaudiInterface-01-* External
#       use BesCLHEP BesCLHEP-* External
#       use MdcRawEvent MdcRawEvent-* Mdc
#         use BesPolicy BesPolicy-* 
#         use GaudiInterface GaudiInterface-01-* External
#         use RawEvent RawEvent-* Event
#           use BesPolicy BesPolicy-* 
#           use GaudiInterface GaudiInterface-01-* External
#           use Identifier Identifier-* DetectorDescription
#           use EventModel EventModel-* Event
#         use EventModel EventModel-* Event
#       use MdcRecEvent MdcRecEvent-* Mdc
#       use TofRawEvent TofRawEvent-* Tof
#         use BesPolicy BesPolicy-* 
#         use GaudiInterface GaudiInterface-01-* External
#         use RawEvent RawEvent-* Event
#         use EventModel EventModel-* Event
#       use TofCaliSvc TofCaliSvc-* Tof
#         use BesPolicy BesPolicy-01-* 
#         use GaudiInterface GaudiInterface-* External
#         use calibUtil * Calibration
#         use CalibData * Calibration
#         use CalibSvc * Calibration
#           use CalibMySQLCnv * Calibration/CalibSvc
#           use CalibROOTCnv * Calibration/CalibSvc
#           use CalibDataSvc * Calibration/CalibSvc
#           use CalibXmlCnvSvc * Calibration/CalibSvc
#             use BesPolicy * 
#             use calibUtil * Calibration
#             use GaudiInterface * External
#             use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#             use CalibDataSvc * Calibration/CalibSvc
#           use CalibTreeCnv * Calibration/CalibSvc
#             use BesPolicy * 
#             use calibUtil * Calibration
#             use CalibData * Calibration
#             use MYSQL MYSQL-00-* External
#             use GaudiInterface * External
#             use BesROOT BesROOT-00-* External
#             use DstEvent DstEvent-* Event
#             use EventModel EventModel-* Event
#             use CalibDataSvc * Calibration/CalibSvc
#             use CalibMySQLCnv * Calibration/CalibSvc
#             use DatabaseSvc DatabaseSvc-* Database
#         use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#         use MYSQL MYSQL-00-00-* External
#         use BesROOT BesROOT-* External
#         use BesCLHEP BesCLHEP-* External (private)
#       use TofQCorrSvc TofQCorrSvc-* Tof
#         use BesPolicy BesPolicy-01-* 
#         use GaudiInterface GaudiInterface-* External
#         use CalibData * Calibration
#         use EventModel EventModel-* Event
#         use DatabaseSvc DatabaseSvc-* Database
#         use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#         use MYSQL MYSQL-00-00-* External
#         use BesROOT BesROOT-* External
#         use BesCLHEP BesCLHEP-* External (private)
#       use TofQElecSvc TofQElecSvc-* Tof
#         use BesPolicy BesPolicy-01-* 
#         use GaudiInterface GaudiInterface-* External
#         use calibUtil * Calibration
#         use CalibData * Calibration
#         use CalibSvc * Calibration
#         use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#         use MYSQL MYSQL-00-00-* External
#         use BesROOT BesROOT-* External
#         use BesCLHEP BesCLHEP-* External (private)
#       use EmcRawEvent EmcRawEvent-* Emc
#         use BesPolicy BesPolicy-* 
#         use GaudiInterface GaudiInterface-01-* External
#         use RawEvent RawEvent-* Event
#         use EventModel EventModel-* Event
#         use Identifier Identifier-* DetectorDescription
#         use EmcWaveform EmcWaveform-* Emc
#           use BesPolicy BesPolicy-* 
#           use GaudiInterface GaudiInterface-* External
#       use EmcCalibConstSvc EmcCalibConstSvc-* Emc
#       use MdcCalibFunSvc MdcCalibFunSvc-* Mdc
#         use BesPolicy BesPolicy-01-* 
#         use GaudiInterface GaudiInterface-01-* External
#         use CalibData CalibData-* Calibration
#         use CalibSvc CalibSvc-* Calibration
#         use MdcGeomSvc MdcGeomSvc-* Mdc
#         use BesCLHEP BesCLHEP-* External
#       use EvTimeEvent EvTimeEvent-* Event
#     use MdcRawEvent MdcRawEvent-* Mdc
#     use TofRawEvent TofRawEvent-* Tof
#     use EmcRawEvent EmcRawEvent-* Emc
#     use EventModel EventModel-* Event
#     use ReconEvent ReconEvent-* Event
#       use BesPolicy BesPolicy-* 
#       use GaudiInterface GaudiInterface-* External
#       use BesCLHEP BesCLHEP-* External
#       use EventModel EventModel-* Event
#       use ExtEvent ExtEvent-* Event
#     use McTruth McTruth-* Event
#       use BesPolicy BesPolicy-01-* 
#       use EventModel EventModel-* Event
#       use GaudiInterface GaudiInterface-01-* External
#       use Identifier Identifier-* DetectorDescription
#       use RelTable RelTable-* Event
#       use BesCLHEP BesCLHEP-* External (private)
#     use RootHistCnv v*  (no_version_directory)
#       use GaudiKernel v*  (no_version_directory)
#       use AIDA v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=3.2.1)
#       use ROOT v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=5.24.00b)
#       use PCRE v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=4.4)
#   use RootCnvSvc RootCnvSvc-* Event
#     use BesCLHEP BesCLHEP-* External
#     use BesPolicy BesPolicy-01-* 
#     use DataInfoSvc DataInfoSvc-* Control
#       use BesPolicy BesPolicy-01-* 
#       use GaudiInterface GaudiInterface-01-* External
#     use BesROOT BesROOT-00-* External
#     use GaudiInterface GaudiInterface-* External
#     use Identifier Identifier-* DetectorDescription
#     use RawEvent RawEvent-* Event
#     use RootEventData RootEventData-* Event
#       use RootPolicy RootPolicy-* 
#       use BesROOT BesROOT-* External
#       use MucRecEvent MucRecEvent-* Muc
#       use Identifier Identifier-* DetectorDescription
#     use MdcRawEvent MdcRawEvent-* Mdc
#     use EventModel EventModel-* Event
#     use EmcRawEvent EmcRawEvent-* Emc
#     use TofRawEvent TofRawEvent-* Tof
#     use TofRecEvent TofRecEvent-* Tof
#     use MucRawEvent MucRawEvent-* Muc
#       use BesPolicy BesPolicy-* 
#       use GaudiInterface GaudiInterface-01-* External
#       use RawEvent RawEvent-* Event
#       use EventModel EventModel-* Event
#     use MucRecEvent MucRecEvent-* Muc
#     use EmcRecEventModel EmcRecEventModel-* Emc
#     use MdcRecEvent MdcRecEvent-* Mdc
#     use EvTimeEvent EvTimeEvent-* Event
#     use EvtRecEvent EvtRecEvent-* Event
#     use EventNavigator EventNavigator-* Event
#       use BesPolicy * 
#       use GaudiInterface * External
#       use McTruth McTruth-* Event
#       use EmcRecEventModel * Emc
#       use MdcRecEvent * Mdc
#       use MdcRawEvent * Mdc
#       use MucRecEvent * Muc
#       use TofRecEvent * Tof
#     use McTruth McTruth-* Event
#     use ExtEvent ExtEvent-* Event
#     use DstEvent DstEvent-* Event
#     use ReconEvent ReconEvent-* Event
#     use TrigEvent TrigEvent-* Event
#       use BesPolicy BesPolicy-* 
#       use GaudiInterface GaudiInterface-01-* External
#     use HltEvent HltEvent-* Event
#       use BesPolicy BesPolicy-* 
#       use GaudiInterface GaudiInterface-01-* External
#       use RawEvent RawEvent-* Event
#       use EventModel EventModel-* Event
#       use Identifier Identifier-* DetectorDescription
#     use LumiDigi LumiDigi-* Event
#       use BesPolicy BesPolicy-* 
#       use GaudiInterface GaudiInterface-01-* External
#       use RawEvent RawEvent-* Event
#       use TofRawEvent TofRawEvent-* Tof
#   use EventModel EventModel-* Event
#   use ExtEvent ExtEvent-* Event
#   use DstEvent DstEvent-* Event
#   use RootEventData RootEventData-* Event
#   use DataInfoSvc DataInfoSvc-* Control
#   use DistBossUtil DistBossUtil-* DistBoss
#     use BesPolicy BesPolicy-* 
#     use IRawFile IRawFile-* Event
#       use BesPolicy BesPolicy-01-* 
#   use NetDataWriter NetDataWriter-* DistBoss
#     use BesPolicy BesPolicy-* 
#     use GaudiInterface GaudiInterface-* External
#     use DimSetup DimSetup-* DistBoss
#       use BesExternalArea BesExternalArea-* External
#     use DistBossUtil DistBossUtil-* DistBoss
#     use ClientErrHandler ClientErrHandler-* DistBoss
#       use BesPolicy BesPolicy-* 
#       use DimSetup DimSetup-* DistBoss
#       use DistBossUtil DistBossUtil-* DistBoss
# use MdcNavigation MdcNavigation-* Mdc
#   use BesPolicy BesPolicy-* 
#   use GaudiInterface GaudiInterface-* External
#   use BesAIDA BesAIDA-* External
#     use AIDA v* LCG_Interfaces (no_version_directory) (native_version=3.2.1)
#   use PartPropSvc *  (no_version_directory)
#     use GaudiPolicy v*  (no_version_directory)
#     use GaudiKernel v*  (no_version_directory)
#     use HepPDT v* LCG_Interfaces (no_version_directory)
#   use EventNavigator EventNavigator-* Event
#   use EventModel EventModel-* Event
#   use McTruth McTruth-* Event
#   use RawDataProviderSvc RawDataProviderSvc-* Event
#   use MdcData MdcData-* Reconstruction/MdcPatRec
#     use BesPolicy BesPolicy-* 
#     use GaudiInterface GaudiInterface-* External
#     use EventModel EventModel-* Event
#     use RawEvent RawEvent-* Event
#     use MdcRawEvent MdcRawEvent-* Mdc
#     use MdcCalibFunSvc MdcCalibFunSvc-* Mdc
#     use Identifier Identifier-* DetectorDescription
#     use TrkBase TrkBase-* Reconstruction/MdcPatRec
#       use BesPolicy BesPolicy-01-* 
#       use MdcGeom MdcGeom-* Reconstruction/MdcPatRec
#         use BesPolicy BesPolicy-01-* 
#         use GaudiInterface GaudiInterface-* External
#         use Identifier Identifier-* DetectorDescription
#         use MdcGeomSvc MdcGeomSvc-* Mdc
#         use BesCLHEP BesCLHEP-* External
#       use MdcRecoUtil MdcRecoUtil-* Reconstruction/MdcPatRec
#         use BesPolicy BesPolicy-* 
#         use BesCLHEP BesCLHEP-* External
#       use ProxyDict ProxyDict-* Reconstruction/MdcPatRec
#         use BesPolicy BesPolicy-01-* 
#       use ProbTools ProbTools-* Reconstruction/MdcPatRec
#         use BesPolicy BesPolicy-01-* 
#       use BField BField-* Reconstruction/MdcPatRec
#         use BesPolicy BesPolicy-* 
#         use MdcGeom MdcGeom-* Reconstruction/MdcPatRec
#         use MagneticField MagneticField-* 
#           use BesPolicy BesPolicy-01-* 
#           use GaudiInterface GaudiInterface-* External
#           use BesCLHEP * External
#           use BesROOT * External
#           use EventModel EventModel-* Event
#           use rdbModel * Calibration
#           use DatabaseSvc * Database
#           use BesTimerSvc BesTimerSvc-* Utilities
#             use BesPolicy BesPolicy-* 
#             use GaudiInterface GaudiInterface-* External
#       use BesCLHEP BesCLHEP-* External
#       use CERNLIB CERNLIB-* External
#         use cernlib v* LCG_Interfaces (no_version_directory) (native_version=2006a)
#           use LCG_Configuration v*  (no_version_directory)
#           use LCG_Settings v*  (no_version_directory)
#           use blas v* LCG_Interfaces (no_version_directory) (native_version=20070405)
#             use LCG_Configuration v*  (no_version_directory)
#             use LCG_Settings v*  (no_version_directory)
#           use lapack v* LCG_Interfaces (no_version_directory) (native_version=3.1.1)
#             use LCG_Configuration v*  (no_version_directory)
#             use LCG_Settings v*  (no_version_directory)
#             use blas v* LCG_Interfaces (no_version_directory) (native_version=20070405)
#         use CASTOR v* LCG_Interfaces (no_version_directory) (native_version=2.1.8-10)
#       use BesBoost BesBoost-* External
#         use Boost v* LCG_Interfaces (no_version_directory) (native_version=1.39.0_python2.5)
#       use MdcRecEvent MdcRecEvent-* Mdc
#     use MdcRecoUtil MdcRecoUtil-* Reconstruction/MdcPatRec
#   use MdcGeom MdcGeom-* Reconstruction/MdcPatRec
#   use MdcTrkRecon MdcTrkRecon-* Reconstruction/MdcPatRec
#     use BesPolicy BesPolicy-* 
#     use GaudiInterface GaudiInterface-* External
#     use MdcRawEvent MdcRawEvent-* Mdc
#     use MdcRecEvent MdcRecEvent-* Mdc
#     use EventModel EventModel-* Event
#     use McTruth McTruth-* Event
#     use BesCLHEP BesCLHEP-* External
#     use BesBoost BesBoost-* External
#     use BesAIDA BesAIDA-* External
#     use MdcData MdcData-* Reconstruction/MdcPatRec
#     use MdcGeom MdcGeom-* Reconstruction/MdcPatRec
#     use BField BField-* Reconstruction/MdcPatRec
#     use TrkFitter TrkFitter-* Reconstruction/MdcPatRec
#       use BesPolicy BesPolicy-01-* 
#       use MdcGeom MdcGeom-* Reconstruction/MdcPatRec
#       use BField BField-* Reconstruction/MdcPatRec
#       use BesCLHEP BesCLHEP-* External
#       use TrkBase TrkBase-* Reconstruction/MdcPatRec
#     use MdcCalibFunSvc MdcCalibFunSvc-* Mdc
#     use MagneticField MagneticField-* 
#     use RootHistCnv v*  (no_version_directory)
#     use EvTimeEvent EvTimeEvent-* Event
#     use ReconEvent ReconEvent-* Event
#     use RawDataProviderSvc RawDataProviderSvc-* Event
#     use MdcPrintSvc MdcPrintSvc-* Mdc/MdcCheckUtil
#       use BesPolicy BesPolicy-01-* 
#       use GaudiInterface GaudiInterface-* External
#       use EventModel EventModel-* Event
#       use McTruth McTruth-* Event
#       use RawDataProviderSvc RawDataProviderSvc-* Event
#       use EvtRecEvent EvtRecEvent-* Event
#       use MdcRecEvent MdcRecEvent-* Mdc
#       use MdcRawEvent MdcRawEvent-* Mdc
#   use MdcGeomSvc MdcGeomSvc-* Mdc
#   use MagneticField MagneticField-* 
#   use TrigEvent TrigEvent-* Event
#   use EvtRecEvent EvtRecEvent-* Event
#   use MdcCalibFunSvc MdcCalibFunSvc-* Mdc
#   use McTruth McTruth-* Event
#   use MdcRecEvent MdcRecEvent-* Mdc
#   use MdcRawEvent MdcRawEvent-* Mdc
#   use EvTimeEvent EvTimeEvent-* Event
#   use RawEvent RawEvent-* Event
#   use RootHistCnv v*  (no_version_directory)
# use DstEvent DstEvent-* Event
# use EventModel EventModel-* Event
# use EvtRecEvent EvtRecEvent-* Event
# use ParticleID ParticleID-* Analysis
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use DstEvent DstEvent-* Event
#   use BesROOT BesROOT-* External
#   use EvtRecEvent EvtRecEvent-* Event
#   use MdcRecEvent MdcRecEvent-* Mdc
#   use TofRecEvent TofRecEvent-* Tof
#   use EmcRecEventModel EmcRecEventModel-* Emc
#   use MucRecEvent MucRecEvent-* Muc
#   use ExtEvent ExtEvent-* Event
# use MdcRawEvent MdcRawEvent-* Mdc
# use McTruth McTruth-* Event
# use ReconEvent ReconEvent-* Event
# use DTagTool DTagTool-* Analysis
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use CERNLIB CERNLIB-* External
#   use DstEvent DstEvent-* Event
#   use McTruth McTruth-* Event
#   use BesROOT BesROOT-* External
#   use CERNLIB CERNLIB-* External
#   use ReconEvent ReconEvent-* Event
#   use RawDataProviderSvc RawDataProviderSvc-* Event
#   use EvtRecEvent EvtRecEvent-* Event
#   use MdcRecEvent MdcRecEvent-* Mdc
#   use DedxCorrecSvc DedxCorrecSvc-* Mdc
#     use BesPolicy BesPolicy-* 
#     use GaudiInterface GaudiInterface-* External
#     use BesCLHEP BesCLHEP-* External
#     use MdcGeomSvc MdcGeomSvc-* Mdc
#     use calibUtil * Calibration
#     use CalibData * Calibration
#     use MagneticField MagneticField-* 
#     use Identifier * DetectorDescription
#     use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#     use MYSQL MYSQL-00-00-* External
#   use SimplePIDSvc SimplePIDSvc-* Utilities
#     use BesPolicy BesPolicy-01-* 
#     use GaudiInterface GaudiInterface-01-* External
#     use EvtRecEvent EvtRecEvent-* Event
#   use TofRecEvent TofRecEvent-* Tof
#   use EmcRecEventModel EmcRecEventModel-* Emc
#   use MucRecEvent MucRecEvent-* Muc
#   use ExtEvent ExtEvent-* Event
#   use VertexFit VertexFit-* Analysis
#     use BesPolicy BesPolicy-01-* 
#     use GaudiInterface GaudiInterface-* External
#     use BesCLHEP BesCLHEP-* External
#     use MYSQL MYSQL-* External
#     use DstEvent DstEvent-* Event
#     use MdcRecEvent MdcRecEvent-* Mdc
#     use EmcRecEventModel EmcRecEventModel-* Emc
#     use MagneticField MagneticField-* 
#     use EventModel EventModel-* Event
#     use EvtRecEvent EvtRecEvent-* Event
#     use DatabaseSvc DatabaseSvc-* Database
# use BesROOT BesROOT-* External
# use BesDChain BesDChain-* Event
#   use BesPolicy BesPolicy-* 
#   use BesCLHEP BesCLHEP-* External
#   use EvtRecEvent EvtRecEvent-* Event
#   use MdcRecEvent MdcRecEvent-* Mdc
#   use EmcRecEventModel EmcRecEventModel-* Emc
#   use VertexFit VertexFit-* Analysis
#   use DecayChain DecayChain-* Event
#     use BesPolicy BesPolicy-* 
# use DumpDecayTreeAlg DumpDecayTreeAlg-* Analysis
#   use BesPolicy BesPolicy-* 
#   use GaudiInterface GaudiInterface-* External
#   use EventModel EventModel-* Event
#   use EvtRecEvent EvtRecEvent-* Event
#   use McTruth McTruth-* Event
# use GaudiInterface GaudiInterface-* External
# use BesCLHEP * External
# use BesKernel * Control
#   use BesPolicy BesPolicy-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use BesCLHEP * External (private)
# use PartPropSvc *  (no_version_directory)
# use CASTOR * LCG_Interfaces (no_version_directory)
# use AbsCor AbsCor-* Analysis/PhotonCor
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use DstEvent DstEvent-* Event
#   use EventModel EventModel-* Event
#   use EvtRecEvent EvtRecEvent-* Event
#   use MdcRawEvent MdcRawEvent-* Mdc
#   use ParticleID ParticleID-* Analysis
#   use VertexFit VertexFit-* Analysis
#   use BesROOT BesROOT-00-* External
#   use Identifier Identifier-* DetectorDescription
#   use EmcRecEventModel EmcRecEventModel-* Emc
# use VertexFit VertexFit-* Analysis
# use RootIO RootIO-* Event
#   use GaudiKernel *  (no_version_directory)
#   use Gaudi *  (no_version_directory)
#     use GaudiSys v*  (no_version_directory)
#       use GaudiKernel v*  (no_version_directory)
#       use GaudiSvc v*  (no_auto_imports) (no_version_directory)
#       use GaudiAud v*  (no_auto_imports) (no_version_directory)
#         use GaudiKernel v*  (no_version_directory)
#       use GaudiAlg v*  (no_auto_imports) (no_version_directory)
#         use GaudiKernel v*  (no_version_directory)
#         use GaudiUtils v*  (no_version_directory)
#           use GaudiKernel v*  (no_version_directory)
#           use ROOT v* LCG_Interfaces (no_version_directory) (native_version=5.24.00b)
#           use AIDA v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=3.2.1)
#           use Boost v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=1.39.0_python2.5)
#           use uuid v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=1.38)
#             use LCG_Configuration v*  (no_version_directory)
#             use LCG_Settings v*  (no_version_directory)
#           use Reflex v* LCG_Interfaces (no_auto_imports) (no_version_directory)
#           use XercesC v* LCG_Interfaces (no_auto_imports) (no_version_directory)
#         use ROOT v* LCG_Interfaces (no_version_directory) (native_version=5.24.00b)
#         use AIDA v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=3.2.1)
#         use Boost v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=1.39.0_python2.5)
#       use GaudiPython v*  (no_auto_imports) (no_version_directory)
#         use GaudiKernel v*  (no_version_directory)
#         use GaudiAlg v*  (no_version_directory)
#         use GaudiUtils v*  (no_version_directory)
#         use AIDA v* LCG_Interfaces (no_version_directory) (native_version=3.2.1)
#         use CLHEP v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=2.0.4.5)
#         use Python v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=2.5.4p2)
#         use Reflex v* LCG_Interfaces (no_auto_imports) (no_version_directory)
#         use GaudiSvc v*  (private) (no_auto_imports) (no_version_directory)
#   use ReconEvent ReconEvent-* Event
#   use RootCnvSvc RootCnvSvc-* Event
#   use BesROOT BesROOT-00-* External
#   use BesCLHEP BesCLHEP-* External
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use MdcRawEvent MdcRawEvent-* Mdc
#   use TofRawEvent TofRawEvent-* Tof
#   use EmcRawEvent EmcRawEvent-* Emc
#   use DstEvent DstEvent-* Event
#   use EventModel EventModel-* Event
#   use McTruth McTruth-* Event
#   use Identifier Identifier-* DetectorDescription
#   use RootPolicy RootPolicy-* 
#   use RootEventData RootEventData-* Event
# use RootHistCnv v*  (no_version_directory)
# use MagneticField MagneticField-* 
# use RunEventNumberAlg RunEventNumberAlg-* Event
#   use BesPolicy BesPolicy-* 
#   use GaudiInterface GaudiInterface-* External
#   use EventModel EventModel-* Event
# use Pi0EtaToGGRecAlg Pi0EtaToGGRecAlg-* Reconstruction
#   use BesPolicy BesPolicy-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use EventModel EventModel-* Event
#   use EvtRecEvent EvtRecEvent-* Event
#   use VertexFit VertexFit-* Analysis
# use DTagAlg DTagAlg-* Reconstruction
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use DstEvent DstEvent-* Event
#   use EventModel EventModel-* Event
#   use EvtRecEvent EvtRecEvent-* Event
#   use DecayChain DecayChain-* Event
#   use BesDChain BesDChain-* Event
#   use MdcRawEvent MdcRawEvent-* Mdc
#   use McTruth McTruth-* Event
#   use ReconEvent ReconEvent-* Event
#   use ParticleID ParticleID-* Analysis
#   use VertexFit VertexFit-* Analysis
#   use BesROOT BesROOT-* External
#   use SimplePIDSvc SimplePIDSvc-* Utilities
#   use DatabaseSvc DatabaseSvc-* Database
#
# Selection :
use CMT v1r20p20090520 (/cluster/bes3)
use BesExternalArea BesExternalArea-00-00-21 External (/cluster/bes3/dist/6.6.4.p01/)
use DimSetup DimSetup-00-00-05 DistBoss (/cluster/bes3/dist/6.6.4.p01/)
use GdmlManagement GdmlManagement-00-00-31 DetectorDescription (/cluster/bes3/dist/6.6.4.p01/)
use SLC5_Compat SLC5_Compat-00-00-01 External (/cluster/bes3/dist/6.6.4.p01/)
use LCG_Configuration v1  (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5)
use LCG_SettingsCompat v1  (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5)
use LCG_Settings v1  (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5)
use uuid v1 LCG_Interfaces (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/) (no_auto_imports)
use blas v1 LCG_Interfaces (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use lapack v1 LCG_Interfaces (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use cernlib v1 LCG_Interfaces (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use HepPDT v1 LCG_Interfaces (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use HepMC v1 LCG_Interfaces (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use sqlite v1 LCG_Interfaces (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use CASTOR v1 LCG_Interfaces (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use CERNLIB CERNLIB-01-02-02 External (/cluster/bes3/dist/6.6.4.p01/)
use mysql v1 LCG_Interfaces (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use MYSQL MYSQL-00-00-09 External (/cluster/bes3/dist/6.6.4.p01/)
use XercesC v1 LCG_Interfaces (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use PCRE v1 LCG_Interfaces (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/) (no_auto_imports)
use AIDA v1 LCG_Interfaces (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use BesAIDA BesAIDA-00-00-01 External (/cluster/bes3/dist/6.6.4.p01/)
use CLHEP v1 LCG_Interfaces (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use BesCLHEP BesCLHEP-00-00-09 External (/cluster/bes3/dist/6.6.4.p01/)
use BesGeant4 BesGeant4-00-00-09 External (/cluster/bes3/dist/6.6.4.p01/)
use GdmlToG4 GdmlToG4-00-00-10 External (/cluster/bes3/dist/6.6.4.p01/)
use CppUnit v1 LCG_Interfaces (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/) (no_auto_imports)
use GCCXML v1 LCG_Interfaces (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/) (no_auto_imports)
use BesFortranPolicy BesFortranPolicy-00-01-03  (/cluster/bes3/dist/6.6.4.p01)
use tcmalloc v1 LCG_Interfaces (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/) (no_auto_imports)
use Python v1 LCG_Interfaces (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/) (no_auto_imports)
use Boost v1 LCG_Interfaces (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use BesBoost BesBoost-00-00-01 External (/cluster/bes3/dist/6.6.4.p01/)
use ROOT v1 LCG_Interfaces (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use BesROOT BesROOT-00-00-07 External (/cluster/bes3/dist/6.6.4.p01/)
use GdmlToRoot GdmlToRoot-00-00-13 External (/cluster/bes3/dist/6.6.4.p01/)
use Reflex v1 LCG_Interfaces (/cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use GaudiPolicy v10r4  (/cluster/bes3/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5)
use GaudiKernel v27r6  (/cluster/bes3/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5)
use GaudiUtils v3r5  (/cluster/bes3/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5) (no_auto_imports)
use GaudiAlg v12r4  (/cluster/bes3/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5) (no_auto_imports)
use GaudiAud v9r1  (/cluster/bes3/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5) (no_auto_imports)
use PartPropSvc v3r2  (/cluster/bes3/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5)
use RootHistCnv v10r2  (/cluster/bes3/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5)
use GaudiSvc v18r6  (/cluster/bes3/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5)
use GaudiPython v10r6  (/cluster/bes3/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5) (no_auto_imports)
use GaudiSys v21r6  (/cluster/bes3/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5)
use Gaudi v21r6  (/cluster/bes3/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5)
use GaudiInterface GaudiInterface-01-03-07 External (/cluster/bes3/dist/6.6.4.p01/)
use BesCxxPolicy BesCxxPolicy-00-01-01  (/cluster/bes3/dist/6.6.4.p01)
use BesPolicy BesPolicy-01-05-03  (/cluster/bes3/dist/6.6.4.p01)
use BesKernel BesKernel-00-00-03 Control (/cluster/bes3/dist/6.6.4.p01/)
use DecayChain DecayChain-00-00-03 Event (/cluster/bes3/dist/6.6.4.p01/)
use BesTimerSvc BesTimerSvc-00-00-12 Utilities (/cluster/bes3/dist/6.6.4.p01/)
use ProbTools ProbTools-00-00-01 Reconstruction/MdcPatRec (/cluster/bes3/dist/6.6.4.p01/)
use ProxyDict ProxyDict-00-00-01 Reconstruction/MdcPatRec (/cluster/bes3/dist/6.6.4.p01/)
use MdcRecoUtil MdcRecoUtil-00-01-08 Reconstruction/MdcPatRec (/cluster/bes3/dist/6.6.4.p01/)
use IRawFile IRawFile-00-00-03 Event (/cluster/bes3/dist/6.6.4.p01/)
use DistBossUtil DistBossUtil-00-00-02 DistBoss (/cluster/bes3/dist/6.6.4.p01/)
use ClientErrHandler ClientErrHandler-00-00-01 DistBoss (/cluster/bes3/dist/6.6.4.p01/)
use NetDataWriter NetDataWriter-00-00-03 DistBoss (/cluster/bes3/dist/6.6.4.p01/)
use TrigEvent TrigEvent-00-01-01 Event (/cluster/bes3/dist/6.6.4.p01/)
use DataInfoSvc DataInfoSvc-00-00-03 Control (/cluster/bes3/dist/6.6.4.p01/)
use EmcWaveform EmcWaveform-00-00-03 Emc (/cluster/bes3/dist/6.6.4.p01/)
use SimUtil SimUtil-00-00-37 Simulation/BOOST (/cluster/bes3/dist/6.6.4.p01/)
use ROOTGeo ROOTGeo-00-00-15 DetectorDescription (/cluster/bes3/dist/6.6.4.p01/)
use Identifier Identifier-00-02-13 DetectorDescription (/cluster/bes3/dist/6.6.4.p01/)
use EmcGeneralClass EmcGeneralClass-00-00-03 Emc (/cluster/bes3/dist/6.6.4.p01/)
use G4Geo G4Geo-00-00-11 DetectorDescription (/cluster/bes3/dist/6.6.4.p01/)
use MucGeomSvc MucGeomSvc-00-02-25 Muc (/cluster/bes3/dist/6.6.4.p01/)
use EmcRecGeoSvc EmcRecGeoSvc-01-01-07 Emc (/cluster/bes3/dist/6.6.4.p01/)
use RelTable RelTable-00-00-02 Event (/cluster/bes3/dist/6.6.4.p01/)
use RootPolicy RootPolicy-00-01-02  (/cluster/bes3/dist/6.6.4.p01)
use EventModel EventModel-01-05-31 Event (/cluster/bes3/dist/6.6.4.p01/)
use RunEventNumberAlg RunEventNumberAlg-00-00-02 Event (/cluster/bes3/dist/6.6.4.p01/)
use McTruth McTruth-00-02-19 Event (/cluster/bes3/dist/6.6.4.p01/)
use RawEvent RawEvent-00-03-19 Event (/cluster/bes3/dist/6.6.4.p01/)
use HltEvent HltEvent-00-02-06 Event (/cluster/bes3/dist/6.6.4.p01/)
use MucRawEvent MucRawEvent-00-02-02 Muc (/cluster/bes3/dist/6.6.4.p01/)
use EmcRawEvent EmcRawEvent-00-02-05 Emc (/cluster/bes3/dist/6.6.4.p01/)
use TofRawEvent TofRawEvent-00-02-07 Tof (/cluster/bes3/dist/6.6.4.p01/)
use LumiDigi LumiDigi-00-00-02 Event (/cluster/bes3/dist/6.6.4.p01/)
use MdcRawEvent MdcRawEvent-00-03-08 Mdc (/cluster/bes3/dist/6.6.4.p01/)
use DstEvent DstEvent-00-02-50-patch Event (/cluster/bes3/dist/6.6.4.p01/)
use ExtEvent ExtEvent-00-00-13 Event (/cluster/bes3/dist/6.6.4.p01/)
use ReconEvent ReconEvent-00-00-04 Event (/cluster/bes3/dist/6.6.4.p01/)
use MucRecEvent MucRecEvent-00-02-50-patch Muc (/cluster/bes3/dist/6.6.4.p01/)
use RootEventData RootEventData-00-03-78 Event (/cluster/bes3/dist/6.6.4.p01/)
use EmcRecEventModel EmcRecEventModel-01-01-18 Emc (/cluster/bes3/dist/6.6.4.p01/)
use TofRecEvent TofRecEvent-00-02-14 Tof (/cluster/bes3/dist/6.6.4.p01/)
use DatabaseSvc DatabaseSvc-00-00-22 Database (/cluster/bes3/dist/6.6.4.p01/)
use facilities facilities-00-00-03 Calibration (/cluster/bes3/dist/6.6.4.p01/)
use CalibData CalibData-00-01-09 Calibration (/cluster/bes3/dist/6.6.4.p01/)
use TofQCorrSvc TofQCorrSvc-00-00-09 Tof (/cluster/bes3/dist/6.6.4.p01/)
use xmlBase xmlBase-00-00-02 Calibration (/cluster/bes3/dist/6.6.4.p01/)
use rdbModel rdbModel-00-01-00 Calibration (/cluster/bes3/dist/6.6.4.p01/)
use MagneticField MagneticField-00-01-38  (/cluster/bes3/dist/6.6.4.p01)
use calibUtil calibUtil-00-00-38 Calibration (/cluster/bes3/dist/6.6.4.p01/)
use CalibDataSvc CalibDataSvc-00-01-03 Calibration/CalibSvc (/cluster/bes3/dist/6.6.4.p01/)
use CalibXmlCnvSvc CalibXmlCnvSvc-00-01-01 Calibration/CalibSvc (/cluster/bes3/dist/6.6.4.p01/)
use CalibMySQLCnv CalibMySQLCnv-00-01-09 Calibration/CalibSvc (/cluster/bes3/dist/6.6.4.p01/)
use CalibTreeCnv CalibTreeCnv-00-01-12 Calibration/CalibSvc (/cluster/bes3/dist/6.6.4.p01/)
use CalibROOTCnv CalibROOTCnv-00-01-06 Calibration/CalibSvc (/cluster/bes3/dist/6.6.4.p01/)
use CalibSvc CalibSvc-00-01-93 Calibration (/cluster/bes3/dist/6.6.4.p01/)
use TofQElecSvc TofQElecSvc-00-00-04 Tof (/cluster/bes3/dist/6.6.4.p01/)
use TofCaliSvc TofCaliSvc-00-01-05 Tof (/cluster/bes3/dist/6.6.4.p01/)
use EmcCalibConstSvc EmcCalibConstSvc-00-00-10 Emc (/cluster/bes3/dist/6.6.4.p01/)
use MdcGeomSvc MdcGeomSvc-00-01-37 Mdc (/cluster/bes3/dist/6.6.4.p01/)
use DedxCorrecSvc DedxCorrecSvc-00-02-52 Mdc (/cluster/bes3/dist/6.6.4.p01/)
use MdcGeom MdcGeom-00-01-17 Reconstruction/MdcPatRec (/cluster/bes3/dist/6.6.4.p01/)
use BField BField-00-01-02 Reconstruction/MdcPatRec (/cluster/bes3/dist/6.6.4.p01/)
use MdcCalibFunSvc MdcCalibFunSvc-00-03-15 Mdc (/cluster/bes3/dist/6.6.4.p01/)
use MdcRecEvent MdcRecEvent-00-05-14 Mdc (/cluster/bes3/dist/6.6.4.p01/)
use TrkBase TrkBase-00-01-11 Reconstruction/MdcPatRec (/cluster/bes3/dist/6.6.4.p01/)
use TrkFitter TrkFitter-00-01-11 Reconstruction/MdcPatRec (/cluster/bes3/dist/6.6.4.p01/)
use MdcData MdcData-00-01-27 Reconstruction/MdcPatRec (/cluster/bes3/dist/6.6.4.p01/)
use EventNavigator EventNavigator-00-01-03 Event (/cluster/bes3/dist/6.6.4.p01/)
use EvTimeEvent EvTimeEvent-00-00-08 Event (/cluster/bes3/dist/6.6.4.p01/)
use RawDataProviderSvc RawDataProviderSvc-00-03-38 Event (/cluster/bes3/dist/6.6.4.p01/)
use EmcRec EmcRec-01-02-52 Reconstruction (/cluster/bes3/dist/6.6.4.p01/)
use EvtRecEvent EvtRecEvent-00-01-04 Event (/cluster/bes3/dist/6.6.4.p01/)
use DumpDecayTreeAlg DumpDecayTreeAlg-00-00-04 Analysis (/cluster/bes3/dist/6.6.4.p01/)
use VertexFit VertexFit-00-02-69 Analysis (/cluster/bes3/dist/6.6.4.p01/)
use Pi0EtaToGGRecAlg Pi0EtaToGGRecAlg-00-00-09 Reconstruction (/cluster/bes3/dist/6.6.4.p01/)
use BesDChain BesDChain-00-00-14 Event (/cluster/bes3/dist/6.6.4.p01/)
use SimplePIDSvc SimplePIDSvc-00-00-06 Utilities (/cluster/bes3/dist/6.6.4.p01/)
use DTagTool DTagTool-00-00-09 Analysis (/cluster/bes3/dist/6.6.4.p01/)
use ParticleID ParticleID-00-04-54 Analysis (/cluster/bes3/dist/6.6.4.p01/)
use DTagAlg DTagAlg-00-00-49 Reconstruction (/cluster/bes3/dist/6.6.4.p01/)
use AbsCor AbsCor-00-00-28 Analysis/PhotonCor (/cluster/bes3/dist/6.6.4.p01/)
use MdcPrintSvc MdcPrintSvc-00-00-01 Mdc/MdcCheckUtil (/cluster/bes3/dist/6.6.4.p01/)
use MdcTrkRecon MdcTrkRecon-00-03-44 Reconstruction/MdcPatRec (/cluster/bes3/dist/6.6.4.p01/)
use MdcNavigation MdcNavigation-00-00-17 Mdc (/cluster/bes3/dist/6.6.4.p01/)
use RootCnvSvc RootCnvSvc-02-01-03 Event (/cluster/bes3/dist/6.6.4.p01/)
use RootIO RootIO-00-01-31 Event (/cluster/bes3/dist/6.6.4.p01/)
use EventWriter EventWriter-00-00-17 EvtPreSelect (/cluster/bes3/dist/6.6.4.p01/)
----------> tags
CMTv1 (from CMTVERSION)
CMTr20 (from CMTVERSION)
CMTp20090520 (from CMTVERSION)
Linux (from uname) package BesPolicy implies [Unix host-linux]
x86_64-slc5-gcc43-opt (from CMTCONFIG) package LCG_Settings implies [Linux slc5-amd64 gcc43 optimized target-linux target-x86_64 target-slc5 target-gcc43 target-opt]
LOCAL (from CMTSITE)
bgarillo_no_config (from PROJECT) excludes [bgarillo_config]
bgarillo_root (from PROJECT) excludes [bgarillo_no_root]
bgarillo_cleanup (from PROJECT) excludes [bgarillo_no_cleanup]
bgarillo_no_prototypes (from PROJECT) excludes [bgarillo_prototypes]
bgarillo_with_installarea (from PROJECT) excludes [bgarillo_without_installarea]
bgarillo_with_version_directory (from PROJECT) excludes [bgarillo_without_version_directory]
bgarillo (from PROJECT)
BOSS_no_config (from PROJECT) excludes [BOSS_config]
BOSS_root (from PROJECT) excludes [BOSS_no_root]
BOSS_cleanup (from PROJECT) excludes [BOSS_no_cleanup]
BOSS_no_prototypes (from PROJECT) excludes [BOSS_prototypes]
BOSS_with_installarea (from PROJECT) excludes [BOSS_without_installarea]
BOSS_with_version_directory (from PROJECT) excludes [BOSS_without_version_directory]
GAUDI_no_config (from PROJECT) excludes [GAUDI_config]
GAUDI_root (from PROJECT) excludes [GAUDI_no_root]
GAUDI_cleanup (from PROJECT) excludes [GAUDI_no_cleanup]
GAUDI_prototypes (from PROJECT) excludes [GAUDI_no_prototypes]
GAUDI_with_installarea (from PROJECT) excludes [GAUDI_without_installarea]
GAUDI_without_version_directory (from PROJECT) excludes [GAUDI_with_version_directory]
LCGCMT_no_config (from PROJECT) excludes [LCGCMT_config]
LCGCMT_no_root (from PROJECT) excludes [LCGCMT_root]
LCGCMT_cleanup (from PROJECT) excludes [LCGCMT_no_cleanup]
LCGCMT_prototypes (from PROJECT) excludes [LCGCMT_no_prototypes]
LCGCMT_without_installarea (from PROJECT) excludes [LCGCMT_with_installarea]
LCGCMT_with_version_directory (from PROJECT) excludes [LCGCMT_without_version_directory]
x86_64 (from package CMT) package LCG_Settings implies [host-x86_64]
sl67 (from package CMT)
gcc432 (from package CMT) package LCG_Settings implies [gcc43 host-gcc43]
Unix (from package CMT) package LCG_Settings implies [host-unix] package LCG_Settings excludes [WIN32 Win32]
gcc43 (from package LCG_SettingsCompat)
amd64 (from package LCG_SettingsCompat)
slc5 (from package LCG_SettingsCompat)
slc5-amd64 (from package LCG_SettingsCompat) package LCG_SettingsCompat implies [slc5 amd64]
optimized (from package LCG_SettingsCompat) package BesPolicy implies [opt]
target-unix (from package LCG_Settings)
host-x86_64 (from package LCG_Settings)
host-gcc4 (from package LCG_Settings) package LCG_Settings implies [host-gcc]
host-gcc43 (from package LCG_Settings) package LCG_Settings implies [host-gcc4]
host-gcc (from package LCG_Settings)
host-linux (from package LCG_Settings)
host-unix (from package LCG_Settings)
target-linux (from package LCG_Settings) package LCG_Settings implies [target-unix]
target-slc5 (from package LCG_Settings) package LCG_Settings implies [target-slc]
target-opt (from package LCG_Settings)
target-gcc43 (from package LCG_Settings) package LCG_Settings implies [target-gcc4]
target-x86_64 (from package LCG_Settings)
target-slc (from package LCG_Settings)
target-gcc4 (from package LCG_Settings) package LCG_Settings implies [target-gcc]
target-gcc (from package LCG_Settings)
ROOT_GE_5_15 (from package LCG_Configuration)
ROOT_GE_5_19 (from package LCG_Configuration)
opt (from package BesCxxPolicy) package BesPolicy implies [optimized]
HasAthenaRunTime (from package BesPolicy)
ROOTBasicLibs (from package BesROOT)
----------> CMTPATH
# Add path /home/bgarillo/boss from initialization
# Add path /cluster/bes3/dist/6.6.4.p01 from initialization
# Add path /cluster/bes3/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5 from initialization
# Add path /cluster/bes3/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5 from initialization
