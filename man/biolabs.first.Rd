\name{biolabs.first}
\alias{biolabs.first}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Create an database for Biolabs
}
\description{
Create an sqlite database for Biolabs. The data base was inclued 14 tables: citekey, kingdom, phylum, ordert, class, family, genus, species, specimen, project, location, locality, login, reference.
}
\usage{
biolabs.first(dbname)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dbname}{
name of sqlite database which you want to create
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
}
\author{
M. Trinh Dang
}
\note{}

\seealso{
}
\examples{
##---- Should be DIRECTLY executable !! ----
# create an sqlite database name 'biolab01.sqlite'
biolabs.first("biolab01.sqlite")
dbListTables(conn())
dnListFields(conn(), "species")

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{database}
