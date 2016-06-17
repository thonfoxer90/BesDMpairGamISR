import sys
n     = 0
low   = 0
high  = 0
if len(sys.argv) >= 2:
  n    = sys.argv[1]
if n == 0:
  print 'no job number given'
  quit()
if len(sys.argv) >= 3:
  low  = int(sys.argv[2])

high = len(jobs(n).subjobs)
if low == 0:
  for i in range(0,high):
    if jobs(n).subjobs(i).status == 'killed':
      low = i
      break

for i in range(low,high):
  if (jobs(n).subjobs(i).status == 'killed' or jobs(n).subjobs(i).status == 'failed' or jobs(n).subjobs(i).status == 'completed'):
    jobs(n).subjobs(i).resubmit()


