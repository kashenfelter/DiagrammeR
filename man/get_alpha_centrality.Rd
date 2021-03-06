% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_alpha_centrality.R
\name{get_alpha_centrality}
\alias{get_alpha_centrality}
\title{Get the alpha centrality for nodes in the graph}
\usage{
get_alpha_centrality(graph, alpha = 1, exo = 1, weights_attr = NULL,
  tol = 1e-07)
}
\arguments{
\item{graph}{a graph object of class
\code{dgr_graph}.}

\item{alpha}{the parameter that specifies the
relative importance of endogenous versus exogenous
factors in the determination of centrality.}

\item{exo}{the exogenous factors, in most cases
this is either a constant (which applies the same
factor to every node), or a vector giving the factor
for every node.}

\item{weights_attr}{an optional name of the edge
attribute to use in the adjacency matrix. If
\code{NULL} then, if it exists, the \code{weight}
edge attribute of the graph will be used. Failing
that, the standard adjacency matrix will be used
in calculations.}

\item{tol}{the tolerance for near-singularities
during matrix inversion. Default value is set to
\code{1e-7}.}
}
\value{
a data frame with alpha centrality scores
for each of the nodes.
}
\description{
Get the alpha centrality values for
all nodes in the graph.
}
\examples{
# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() \%>\%
  add_gnm_graph(
    n = 10,
    m = 12,
    set_seed = 23)

# Get the alpha centrality scores for nodes
# in the graph
get_alpha_centrality(graph)
#>    id alpha_centrality
#> 1   1                9
#> 2   2                6
#> 3   3                2
#> 4   4                1
#> 5   5                4
#> 6   6                1
#> 7   7                2
#> 8   8                2
#> 9   9                7
#> 10 10                4

# Add the alpha centrality
# scores to the graph as a node
# attribute
graph <-
  graph \%>\%
  join_node_attrs(
    df = get_alpha_centrality(.))

# Display the graph's node data frame
get_node_df(graph)
#>    id type label alpha_centrality
#> 1   1 <NA>  <NA>                9
#> 2   2 <NA>  <NA>                6
#> 3   3 <NA>  <NA>                2
#> 4   4 <NA>  <NA>                1
#> 5   5 <NA>  <NA>                4
#> 6   6 <NA>  <NA>                1
#> 7   7 <NA>  <NA>                2
#> 8   8 <NA>  <NA>                2
#> 9   9 <NA>  <NA>                7
#> 10 10 <NA>  <NA>                4
}
