#!/usr/bin/python3

import numpy as np
import scipy.stats as stats
import scipy.special

'''
    Guesses from which distribution the given samples came, and returns the distribution name and parameters
'''
# Distribution-fitting method outline from http://www.insightsbot.com/blog/WEjdW/fitting-probability-distributions-with-python-part-1
def fit_dist(samples):
    dist_tests = ['norm', 'expon', 'uniform','pareto', 'rayleigh']
    dist_results = []
    params = {}
    for dist_name in dist_tests:

        # Fit sample data to distribution
        dist = getattr(stats, dist_name)
        param = dist.fit(samples)
        params[dist_name] = param
        
        # Run the Kolmogorov-Smirnov test on the distribution
        D, p = stats.kstest(samples, dist_name, args = param)

        dist_results.append((dist_name, p, param))
        
    return dist_results
#     dist_guess, p = (max(dist_results, key=lambda item:item[1]))
#     return (dist_guess, params[dist_guess])

'''
    Gives the nth moment of the given samples
    xs : the samples
    moment: the moment wanted
'''
def moment(xs, moment):
    samples = np.sort(xs)
    n = samples.size
    res = 0
    for j, sample in enumerate(samples):
        term = sample
        for i in range(1,moment + 1):
            term = term * (j + 1 - i) / (n - i)
        res = res + term
    return res / n

'''
    Uses Hosking, et. al's PWM method for estimating GEV parameters
'''
def gev_fit(samples):
    # Generate moments from sample data
    samples = np.sort(samples)
    n = samples.size
    b0 = moment(samples,0)
    b1 = moment(samples,1)
    b2 = moment(samples,2)

    # Generate GEV parameters
    c = (2*b1-b0)/(3*b2-b0) - np.log(2)/np.log(3)
    est_shape = 7.8590*c+2.9554*np.power(c,2)
    gamma = scipy.special.gamma(1 + est_shape)
    est_scale = est_shape*(2*b1-b0)/(gamma*(1-np.power(2,-est_shape)))
    est_loc = b0 + est_scale*(gamma-1)/est_shape
    return est_shape,est_loc,est_scale

print(fit_dist(stats.norm.rvs(size=1000)))