## Examples for the igraph package by Michael Hahsler
## see: http://igraph.sourceforge.net/documentation.html

library(igraph)


## create a random graph
inet_sim <-erdos.renyi.game(50, 2/50)
summary(inet_sim)

## plot
plot(inet)
layout <-layout.fruchterman.reingold(inet)

plot(inet, layout=layout, vertex.label=NA, vertex.size=1, edge.width=0.5, edge.arrow.size=0.05)
tkplot(inet)

## degree
degree(inet)
hist(degree(inet))
#

## number of paths between vertices
edge.disjoint.paths(inet,0,1)

## number of geodesics (shortest paths) going through a vertex or an edge
betweenness(inet)
edge.betweenness(inet)

plot(inet, layout=layout, vertex.size=betweenness(inet),c(1,15)), edge.width=map(edge.betweenness(inet), c(1,10)))


## diameter - longest geodesic
diameter(inet)
get.diameter(inet)

## Maximal independent vertex sets
independence.number(inet)
maximal.independent.vertex.sets(inet) # largest independent vertex set

col <- rep("blue",length(V(inet)))
col[maximal.independent.vertex.sets(inet)[[1]]+1L] <- "red"
plot(inet, layout=layout, vertex.color=col)


## Max-flow / min-cut
graph.maxflow(inet, 23, 6)
graph.mincut(inet, value.only=FALSE)


## find connected components
cl <- clusters(inet)
cl

plot(inet, layout=layout, vertex.color=cl$membership+2)


## get components
dg <- decompose.graph(inet)
length(dg)

## find neighborhood of vertex
gn <- graph.neighborhood(inet, 2)
plot(gn[[50]], layout=layout.fruchterman.reingold)

## find cliques
maximal.cliques(inet)


## large graph (social networks)
inet <- barabasi.game(1000, power=1)
layout <- layout.fruchterman.reingold(inet)
plot(inet, layout=layout, vertex.size=2, vertex.label=NA, edge.arrow.size=.2)

## Page Rank
pr <- page.rank(inet)$vector
plot(inet, layout=layout, vertex.size=map(pr, c(1,20)), vertex.label=NA, edge.arrow.size=.2)

## Eigenvector centrality
ec <- evcent(inet)$vector
plot(inet, layout=layout, vertex.size=map(ec, c(1,20)), vertex.label=NA, edge.arrow.size=.2)


## Kleinberg's hub and authority scores.
auth <- authority.score(inet)$vector
hub <- hub.score(inet)$vector
plot(inet, layout=layout, vertex.size=map(hub, c(1,5)), vertex.label=NA, edge.arrow.size=.2)
plot(inet, layout=layout, vertex.size=map(auth, c(1,20)), vertex.label=NA, edge.arrow.size=.2)


## community detection
## betweenness
eb <- edge.betweenness.community(inet)
community.to.membership(graph, eb)
member <- community.to.membership(inet, eb$merges, step=nrow(eb$merges)-10)
plot(inet, vertex.color= member$membership+2, vertex.size=5, layout=layout,  vertex.label=NA, edge.arrow.size=.2)


## random walk
eb <- walktrap.community(inet)
community.to.membership(graph, eb)
member <- community.to.membership(inet, eb$merges, step=nrow(eb$merges)-10)
plot(inet, vertex.color= member$membership+2, vertex.size=5, layout=layout,  vertex.label=NA, edge.arrow.size=.2)


