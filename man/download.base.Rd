\name{download.base}
\alias{download.base}
\alias{downloadbase}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Download taxonomic information from CatalogueOfLife
}
\description{
The taxonomic information of phylum will download for offline use.
}
\usage{
download.base(phylumname, overwrite = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{phylumname}{
Name of phylum which you would like to download
}
  \item{overwrite}{
Overwrite the data if it exist
}
}
\details{
The taxonomic information of phylum will download, then save under .xml file in folder xml-base under current directory.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
M. Trinh Dang
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
## Download databse of phylum Rotifera
getwd()
download.base("Rotifera", overwrite = FALSE)
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
