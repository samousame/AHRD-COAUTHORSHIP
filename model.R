#1 Base model
m1<-ergm(net ~ edges + mutual ,burnin=15000,MCMCsamplesize=30000,verbose=FALSE)
mcmc.diagnostics(m1)
summary(m1)

m2<-ergm(net ~ edges + mutual + ctriple ,burnin=15000,MCMCsamplesize=30000,verbose=FALSE)
mcmc.diagnostics(m2)
summary(m2)

m3<-ergm(net ~ edges + mutual + idegreepopularity, burnin=15000, 
         MCMCsamplesize=30000,verbose=FALSE, 
         seed=25, calc.mcmc.se = FALSE,maxit=10,parallel=4)
mcmc.diagnostics(m3)
summary(m3)

m4<-ergm(net ~ edges + mutual + ctriple, burnin=15000,
         MCMCsamplesize=50000,verbose=FALSE,
         seed=26, calc.mcmc.se = FALSE,maxit=10,parallel=4,
         MCMLE.density.guard.min= 10000, MCMLE.density.guard= 20.08554,
         MCMLE.check.degeneracy = TRUE)
mcmc.diagnostics(m4)
summary(m4)

m5<-ergm(net ~ edges + mutual + ctriple + idegreepopularity,
         MCMLE.density.guard.min= 1000000, MCMLE.density.guard= 200000.08554,
         MCMLE.check.degeneracy = FALSE)
mcmc.diagnostics(m5)
summary(m5)

m7<-ergm(net ~ edges + mutual + ctriple + transitiveties +twopath,
         MCMLE.density.guard.min= 10000000, MCMLE.density.guard= 2000000.08554,
         MCMLE.check.degeneracy = FALSE)
mcmc.diagnostics(m7)
summary(m7)

attm1 <- ergm(net ~ edges + mutual + smalldiff("ARTICLE", 3) +
                      ostar(3, "DURATION") ,burnin=20000,
              MCMCsamplesize=70000,verbose=FALSE,seed=25,
              calc.mcmc.se = FALSE,maxit=6)

fit <- ergm(net ~ edges + mutual
            ,
            seed=1,
            maxit=10,
            burnin=15000,
            MCMCsamplesize=50000,        
            MCMLE.density.guard.min= 1000, 
            MCMLE.density.guard= 20.08554,
            verbose=FALSE,
            calc.mcmc.se = TRUE,
            parallel=4,
)

pdf("m1.pdf")
mcmc.diagnostics(m1)
dev.off()