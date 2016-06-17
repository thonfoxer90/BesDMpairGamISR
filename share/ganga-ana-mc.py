#!/usr/bin/env ganga

import time
import sys
import os

#load BOSS Ganga libraries
from GangaBoss.Lib.BossDataSet.BossDataSet import BossDataSet
from GangaBoss.Lib.Boss import InterpretJob
from GangaBoss import *

from Ganga.Core.exceptions import *

##**********************************************************************************
j=Job()
j.name='Ana_2pi2pi0FSR'
#j.name='Ana_4pi4230'
#j.name='Ana_omega2pi'
#j.name='Ana_eta2pi'
#j.name='Ana_5piRgp'
#j.application = Boss(JobOptions= os.environ['HOME']+'/boss/UserAlgorithms/DKsKK/DKsKK-00-00-01/share/rundst' , EvtMax=-1)
j.application = Boss(JobOptions= os.environ['HOME']+'/boss/BesExample/BesDChainExAlg/BesDChainExAlg-00-00-07/share/rundst' , EvtMax=-1)


##**********************************************************************************
#choose maximum number of events
##**********************************************************************************
j.application.EvtMax=-1

##**********************************************************************************
##Specify type of job: 'Rec/Ana' or 'Sim'
##**********************************************************************************
j.application.JobType='Rec/Ana'

##**********************************************************************************
##specify input data
##in order to split jobs data files need to be specified directly in jobOption 
##script(no include file)
##**********************************************************************************
##read input data from BOSS option file
#j.Input_files=InterpretJob(j.application.JobOptions).read_input()

##define input data here
#j.Input_files= '"/local/raid0/work/weidenka/bes3data/offline/data/653-1/psipp/dst/100118/run_0011414_All_file003_SFO-2.dst", "/local/raid0/work/weidenka/bes3data/offline/data/653-1/psipp/dst/100118/run_0011414_All_file004_SFO-1.dst"'

##smart data handling using database (only available at ihep??)
#j.Input_files=BossDataSet('psipp',"REAL").datafilelist()

##**********************************************************************************
##choose splitter
##jobs are crashing with more than 4 files per job
##**********************************************************************************
#j.splitter = None
#j.splitter = FileSplitter (filesPerJob = 1, maxFiles=-1)  
j.splitter = FileSplitter (filesPerJob = 1, maxFiles=-1)  
#j.splitter = FileSplitter (filesPerJob = 5, maxFiles=-1)  
#j.splitter = FileSplitter (filesPerJob = 50, maxFiles=-1)  
#j.splitter = BoostSplitter(eventsPerJob=10000, numberOfJobs=5)  

##**********************************************************************************
##choose merger: SmartMerger, MultipleMerger, RootMerger, TextMerger, CustomMerger
##**********************************************************************************
merger = SmartMerger()
#merger = CustomMerger()
merger.files = ['out.root']
merger.ignorefailed = True
merger.overwrite = True
#merger.module = '/home/ripka/Ganga/gencardMerger.py'
j.merger = merger 

##**********************************************************************************
##choose backend
##**********************************************************************************
#j.backend = Local()
##choose queue: 'batch' or 'batch_x86_64'
#j.backend = PBS(queue='express')
j.backend = PBS(queue='medium')
#j.backend = PBS(queue='long')

##**********************************************************************************
##select files stored in output directory
##**********************************************************************************
j.outputsandbox = ['*.root','*.txt','*.dst']

