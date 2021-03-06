#TEMPLETE 
#fit <- ergm(net ~ edges + mutual
#            ,
#            seed=1,
#            maxit=10,
#            burnin=15000,
#            MCMCsamplesize=50000,        
#            MCMLE.density.guard.min= 1000, 
#            MCMLE.density.guard= 20.08554,
#            verbose=FALSE,
#            calc.mcmc.se = TRUE,
#            parallel=4,
#)

#Diagnosis and Summary Templete
#mcmc.diagnostics(m1)
#summary(m1)

#Graphic Export Templete
#pdf("m1.pdf")
#mcmc.diagnostics(m1)
#dev.off()


#1 Base model
m1<-ergm(net ~ edges + mutual ,
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



attm1 <- ergm(net ~ edges + mutual + smalldiff("ARTICLE", 3) +
                      ostar(3, "DURATION") ,burnin=20000,
              MCMCsamplesize=70000,verbose=FALSE,seed=25,
              calc.mcmc.se = FALSE,maxit=6)



pdf("m1.pdf")
mcmc.diagnostics(m1)
dev.off()