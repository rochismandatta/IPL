import matplotlib
import matplotlib.pyplot as plt
import matplotlib.mlab as mlab
import scipy.stats as stats
import numpy as np
import random
##a=0
##b=100
##mu = 50
##sigma = 20
####
####x = np.array()
####for i in range(1000):
####    x= np.append(i)= stats.truncnorm((a - mu)/sigma, (b-mu)/sigma, loc= mu, scale = sigma)
######    x[i] = np.random.normal(mu, sigma)
####
####for i in range(len(x)):
####    print(x[i])
##x = stats.truncnorm((a - mu)/sigma, (b-mu)/sigma, loc= mu, scale = sigma)
##print(int(x))
mu = 10
sigma = 3
x=[]
for i in range(100):
##    x.append(random.gauss(mu,sigma))
##    print(x)
    print(random.gauss(mu,sigma))


##for i in range(100):
##    plt.plot(x[i], mlab.normpdf(x,mu,sigma))
##
##plt.show()
