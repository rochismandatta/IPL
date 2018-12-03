import random
import numpy as np
import matplotlib.pyplot as plt

teamscore=[]
for i in range(100000):
##player1
    p1mu=10
    p1sig=3
    p1score=random.gauss(p1mu,p1sig)
##player2
    p2mu=10
    p2sig=3
    p2score=random.gauss(p2mu,p2sig)
##player3
    p3mu=10
    p3sig=3
    p3score=random.gauss(p3mu,p3sig)
##player4
    p4mu=10
    p4sig=3
    p4score=random.gauss(p4mu,p4sig)
##player5
    p5mu=10
    p5sig=3
    p5score=random.gauss(p5mu,p5sig)
##player6
    p6mu=10
    p6sig=3
    p6score=random.gauss(p6mu,p6sig)
##player7
    p7mu=10
    p7sig=3
    p7score=random.gauss(p7mu,p7sig)
##player8
    p8mu=10
    p8sig=3
    p8score=random.gauss(p8mu,p8sig)
##player9
    p9mu=10
    p9sig=3
    p9score=random.gauss(p9mu,p9sig)
##player10
    p10mu=10
    p10sig=3
    p10score=random.gauss(p10mu,p10sig)
##player11
    p11mu=10
    p11sig=3
    p11score=random.gauss(p11mu,p11sig)

    teamscore.append(p1score+p2score+p3score+p4score+p5score+p6score+p7score+p8score+p9score+p10score+p11score)

teamscorenp = np.array(teamscore)
plt.hist(teamscorenp, normed ='True')
plt.show()
##for i in teamscore:

print(teamscorenp.mean())
print(teamscorenp.std())

