import sys
n     = 0
low   = 0
high  = 0
mode1 = 're'
mode2 = ''
if len(sys.argv) >= 2: 
  n    = sys.argv[1]
if n == 0:
  print 'no job number given'
  quit()
if len(sys.argv) >= 3:
  mode1 = sys.argv[2]
if len(sys.argv) >= 4:
  mode2 = sys.argv[3]
if len(sys.argv) >= 5:
  low  = int(sys.argv[4])
if len(sys.argv) >= 6:
  high = int(sys.argv[5])
else:
  high = len(jobs(n).subjobs)

for i in range(low,high):
  killed = 0
  if mode1 == 're' and (jobs(n).subjobs(i).status == 'failed' or jobs(n).subjobs(i).status == 'killed'):
    jobs(n).subjobs(i).resubmit()
  if mode1 == 'killrun' and jobs(n).subjobs(i).status == 'running':
    jobs(n).subjobs(i).kill()
    killed = 1
  if mode1 == 'killsub' and jobs(n).subjobs(i).status == 'submitted':
    jobs(n).subjobs(i).kill()
    killed = 1
  if mode1 == 'killall' and (jobs(n).subjobs(i).status == 'submitted' or jobs(n).subjobs(i).status == 'running'):
    jobs(n).subjobs(i).kill()
    killed = 1
  if mode2 == 're' and killed == 1:
    jobs(n).subjobs(i).resubmit()
  #if mode1 == 're':
  #  jobs(n).subjobs(i).resubmit()
  #if jobs(n).subjobs(i).status == 'completed':
