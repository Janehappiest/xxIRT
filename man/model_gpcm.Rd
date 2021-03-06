% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/module1_model_gpcm.R
\name{model_gpcm}
\alias{model_gpcm}
\alias{model_gpcm_prob}
\alias{model_gpcm_info}
\alias{model_gpcm_lik}
\alias{model_gpcm_gendata}
\alias{model_gpcm_plot}
\alias{model_gpcm_plot_loglik}
\alias{model_gpcm_jmle}
\title{Generalized partial credit model}
\usage{
model_gpcm_prob(t, a, b, d, D = 1.702, add_initial = NULL)

model_gpcm_info(t, a, b, d, D = 1.702, add_initial = NULL)

model_gpcm_lik(u, t, a, b, d, D = 1.702, add_initial = NULL, log = FALSE)

model_gpcm_gendata(num_people, num_item, num_category, sort_b = TRUE,
  t = NULL, a = NULL, b = NULL, D = 1.702, set_initial = NULL,
  t_dist = c(0, 1), a_dist = c(0, 0.2), b_dist = c(0, 1),
  missing = NULL)

model_gpcm_plot(a, b, d, D = 1.702, add_initial = NULL, type = c("prob",
  "info"), by_item = FALSE, total = FALSE, xaxis = seq(-6, 6, 0.1))

model_gpcm_plot_loglik(u, a, b, d, D = 1.702, add_initial = NULL,
  xaxis = seq(-6, 6, 0.1), show_mle = FALSE)

model_gpcm_jmle(u, t = NA, a = NA, b = NA, d = NA, D = 1.702,
  set_initial = 0, num_iter = 100, num_nr = 15, h_max = 1, conv = 0.1,
  decay = 0.95, scale = NULL, bounds = list(t = c(-4, 4), a = c(0.1, 2), b
  = c(-4, 4)), priors = list(t = c(0, 1), a = c(0, 0.2), b = c(0, 1)),
  debug = FALSE)
}
\arguments{
\item{t}{ability parameters, a vector}

\item{a}{discrimination parameters, a vector}

\item{b}{item location parameters when it's a matrix; item-category parameters when it's a vector}

\item{d}{NULL or item category parameters}

\item{D}{the scaling constant}

\item{add_initial}{the initial value added to item category parameters}

\item{u}{the observed scores (starting from 0), 2d matrix}

\item{log}{TRUE to return log-likelihood}

\item{num_people}{the number of people to be generated}

\item{num_item}{the number of items to be generated}

\item{num_category}{the number of score categories}

\item{sort_b}{TRUE to sort b parameters of each item}

\item{set_initial}{the value of the initial category}

\item{t_dist}{the normal distribution parameters of t-parameters, a vector: c(mean, sd)}

\item{a_dist}{the lognormal distribution parameters of a-parameters, a vector: c(meanlog, sdlog)}

\item{b_dist}{the normal distribution parameters of b-parameters, a vector: c(mean, sd)}

\item{missing}{the proportion or number of missing responses}

\item{type}{the type of plot, prob for ICC and info for IIFC}

\item{by_item}{TRUE to combine categories}

\item{total}{TRUE to sum values over items}

\item{xaxis}{the values of x-axis}

\item{show_mle}{TRUE to print maximum likelihood values}

\item{num_iter}{the maximum number of overall iterations}

\item{num_nr}{the maximum number of the newton-raphson iterations}

\item{h_max}{the maximum value of h in the newton-raphson method}

\item{conv}{the convergence criterion in -2 log-likelihood of model fit}

\item{decay}{the epoch decay parameter}

\item{scale}{the scale of theta parameters}

\item{bounds}{the bounds of parameters, a list}

\item{priors}{the priors of parameters used in the maximum a posteriori estimation}

\item{debug}{TRUE to print debugging information}
}
\value{
\code{model_gpcm_gendata} returns a list of generated data

\code{model_gpcm_plot} returns a ggplot graph

\code{model_gpcm_plot} returns a ggplot graph
}
\description{
Generalized partial credit model

\code{model_gpcm_prob} computes the probability of all score categories

\code{model_gpcm_info} computes the informations of all score categories

\code{model_gpcm_lik} computes the (log-)likelihood of the responses

\code{model_gpcm_gendata} generates data using the GPCM model

\code{model_gpcm_plot} plots the item characteristics curve (ICC) or 
item information function curve (IIFC)

\code{model_gpcm_plot_loglik} plots the log-likelihood curves for each response vector

\code{model_gpcm_jmle} estimates the parameters using the joint MLE method
}
\details{
The GPCM has two kinds of parameterization: (1) \code{b} as the item-category parameters or 
(2) \code{b - d} as the item-category parameters. In (1), b must be a matrix and d NULL. 
In (2), b must be a vector and d a matrix. Use \code{NA} to represent unused category. Use
\code{initial} to insert the values of the initial category.
}
\examples{
model_gpcm_gendata(10, 5, 3)
model_gpcm_gendata(10, 5, 3, set_initial=0, missing=.1)
# Figure 1 in Muraki, 1992 (APM)
model_gpcm_plot(a=c(1,1,.7), b=matrix(c(-2,0,2,-.5,0,2,-.5,0,2), nrow=3, byrow=TRUE), 
    d=NULL, D=1.0, add_initial=0, xaxis=seq(-4, 4, .1), type='prob')
# Figure 2 in Muraki, 1992 (APM)
model_gpcm_plot(a=.7, b=matrix(c(.5,0,NA,0,0,0), nrow=2, byrow=TRUE), 
    d=NULL, D=1.0, add_initial=0, xaxis=seq(-4, 4, .1))
# Figure 3 in Muraki, 1992 (APM)
model_gpcm_plot(a=c(.778,.946), b=matrix(c(1.759,-1.643,3.970,-2.764), nrow=2, byrow=TRUE), 
    d=NULL, D=1.0, add_initial=0)
# Figure 1 in Muraki, 1993 (APM)
model_gpcm_plot(a=1, b=matrix(c(0,-2,4,0,-2,2,0,-2,0,0,-2,-2,0,-2,-4), nrow=5, byrow=TRUE), 
    d=NULL, D=1.0)
# Figure 2 in Muraki, 1993 (APM)
model_gpcm_plot(a=1, b=matrix(c(0,-2,4,0,-2,2,0,-2,0,0,-2,-2,0,-2,-4), nrow=5, byrow=TRUE), 
    d=NULL, D=1.0, type='info', by_item=TRUE)
with(model_gpcm_gendata(5, 50, 3, set_initial=0), 
    model_gpcm_plot_loglik(u, a, b, NULL, show_mle=TRUE))
\dontrun{
data_tru <- model_gpcm_gendata(1500, 30, 3, set_initial=0)
data_est <- model_gpcm_jmle(data_tru$u, prior=NULL, debug=TRUE)
evaluate_gpcm_estimation(data_tru, data_est)
}
}
