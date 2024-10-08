
# This file is automatically generated, you probably don't want to edit this

outliersOptions <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "outliersOptions",
    inherit = jmvcore::Options,
    public = list(
        initialize = function(
            dep = NULL,
            useMin = FALSE,
            useMax = FALSE,
            minValue = 0,
            maxValue = 0,
            useZ = FALSE,
            zLimit = 3.29,
            useIQR = FALSE,
            iqrLimitMild = 1.5,
            iqrLimitExtreme = 3,
            hist = FALSE,
            box = FALSE, ...) {

            super$initialize(
                package="outliers",
                name="outliers",
                requiresData=TRUE,
                ...)

            private$..dep <- jmvcore::OptionVariable$new(
                "dep",
                dep,
                suggested=list(
                    "continuous"),
                permitted=list(
                    "numeric"))
            private$..useMin <- jmvcore::OptionBool$new(
                "useMin",
                useMin,
                default=FALSE)
            private$..useMax <- jmvcore::OptionBool$new(
                "useMax",
                useMax,
                default=FALSE)
            private$..minValue <- jmvcore::OptionNumber$new(
                "minValue",
                minValue,
                default=0)
            private$..maxValue <- jmvcore::OptionNumber$new(
                "maxValue",
                maxValue,
                default=0)
            private$..useZ <- jmvcore::OptionBool$new(
                "useZ",
                useZ,
                default=FALSE)
            private$..zLimit <- jmvcore::OptionNumber$new(
                "zLimit",
                zLimit,
                min=0,
                default=3.29)
            private$..useIQR <- jmvcore::OptionBool$new(
                "useIQR",
                useIQR,
                default=FALSE)
            private$..iqrLimitMild <- jmvcore::OptionNumber$new(
                "iqrLimitMild",
                iqrLimitMild,
                default=1.5)
            private$..iqrLimitExtreme <- jmvcore::OptionNumber$new(
                "iqrLimitExtreme",
                iqrLimitExtreme,
                default=3)
            private$..hist <- jmvcore::OptionBool$new(
                "hist",
                hist,
                default=FALSE)
            private$..box <- jmvcore::OptionBool$new(
                "box",
                box,
                default=FALSE)

            self$.addOption(private$..dep)
            self$.addOption(private$..useMin)
            self$.addOption(private$..useMax)
            self$.addOption(private$..minValue)
            self$.addOption(private$..maxValue)
            self$.addOption(private$..useZ)
            self$.addOption(private$..zLimit)
            self$.addOption(private$..useIQR)
            self$.addOption(private$..iqrLimitMild)
            self$.addOption(private$..iqrLimitExtreme)
            self$.addOption(private$..hist)
            self$.addOption(private$..box)
        }),
    active = list(
        dep = function() private$..dep$value,
        useMin = function() private$..useMin$value,
        useMax = function() private$..useMax$value,
        minValue = function() private$..minValue$value,
        maxValue = function() private$..maxValue$value,
        useZ = function() private$..useZ$value,
        zLimit = function() private$..zLimit$value,
        useIQR = function() private$..useIQR$value,
        iqrLimitMild = function() private$..iqrLimitMild$value,
        iqrLimitExtreme = function() private$..iqrLimitExtreme$value,
        hist = function() private$..hist$value,
        box = function() private$..box$value),
    private = list(
        ..dep = NA,
        ..useMin = NA,
        ..useMax = NA,
        ..minValue = NA,
        ..maxValue = NA,
        ..useZ = NA,
        ..zLimit = NA,
        ..useIQR = NA,
        ..iqrLimitMild = NA,
        ..iqrLimitExtreme = NA,
        ..hist = NA,
        ..box = NA)
)

outliersResults <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "outliersResults",
    inherit = jmvcore::Group,
    active = list(
        text = function() private$.items[["text"]],
        outofrange = function() private$.items[["outofrange"]],
        zscores = function() private$.items[["zscores"]],
        iqr = function() private$.items[["iqr"]],
        hist = function() private$.items[["hist"]],
        boxplot = function() private$.items[["boxplot"]]),
    private = list(),
    public=list(
        initialize=function(options) {
            super$initialize(
                options=options,
                name="",
                title="Outlier Detection")
            self$add(jmvcore::Preformatted$new(
                options=options,
                name="text",
                title="Outliers"))
            self$add(jmvcore::Table$new(
                options=options,
                name="outofrange",
                title="Out of Range",
                visible="(useMin | useMax)",
                rows=0,
                columns=list(
                    list(
                        `name`="id", 
                        `title`="id", 
                        `type`="text"),
                    list(
                        `name`="value", 
                        `title`="value", 
                        `type`="number"),
                    list(
                        `name`="outlier", 
                        `title`="outlier", 
                        `type`="text"))))
            self$add(jmvcore::Table$new(
                options=options,
                name="zscores",
                title="Z Scores",
                visible="(useZ)",
                rows=0,
                columns=list(
                    list(
                        `name`="id", 
                        `title`="id", 
                        `type`="text"),
                    list(
                        `name`="value", 
                        `title`="value", 
                        `type`="number"),
                    list(
                        `name`="zvalue", 
                        `title`="zvalue", 
                        `type`="number"))))
            self$add(jmvcore::Table$new(
                options=options,
                name="iqr",
                title="IQR based outliers",
                visible="(useIQR)",
                rows=0,
                columns=list(
                    list(
                        `name`="id", 
                        `title`="id", 
                        `type`="text"),
                    list(
                        `name`="value", 
                        `title`="value", 
                        `type`="number"),
                    list(
                        `name`="distance", 
                        `title`="distance", 
                        `type`="number"),
                    list(
                        `name`="type", 
                        `title`="type", 
                        `type`="text"))))
            self$add(jmvcore::Image$new(
                options=options,
                name="hist",
                title="Histogram",
                visible="(hist)",
                width=400,
                height=300,
                renderFun=".plotHistogram"))
            self$add(jmvcore::Image$new(
                options=options,
                name="boxplot",
                title="Boxplot",
                visible="(box)",
                width=400,
                height=300,
                renderFun=".plotBoxplot"))}))

outliersBase <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "outliersBase",
    inherit = jmvcore::Analysis,
    public = list(
        initialize = function(options, data=NULL, datasetId="", analysisId="", revision=0) {
            super$initialize(
                package = "outliers",
                name = "outliers",
                version = c(1,0,0),
                options = options,
                results = outliersResults$new(options=options),
                data = data,
                datasetId = datasetId,
                analysisId = analysisId,
                revision = revision,
                pause = NULL,
                completeWhenFilled = FALSE,
                requiresMissings = FALSE,
                weightsSupport = 'auto')
        }))

#' outliers
#'
#' 
#' @param data .
#' @param dep .
#' @param useMin \code{TRUE} or \code{FALSE} (default), provide lower bound
#' @param useMax \code{TRUE} or \code{FALSE} (default), provide upper bound
#' @param minValue a number specifying the lower bound of the valid range
#' @param maxValue a number specifying the upper bound of the valid range
#' @param useZ \code{TRUE} or \code{FALSE} (default), use z-scores for outlier
#'   detection
#' @param zLimit a number specifying the min absolute z value to be considered
#'   an outlier
#' @param useIQR \code{TRUE} or \code{FALSE} (default), use z-scores for
#'   outlier detection
#' @param iqrLimitMild a number specifying iqr distance for mild outliers
#' @param iqrLimitExtreme a number specifying iqr distance for extreme
#'   outliers
#' @param hist \code{TRUE} or \code{FALSE} (default), provide histograms
#'   (continuous variables only)
#' @param box \code{TRUE} or \code{FALSE} (default), provide box plots
#'   (continuous variables only)
#' @return A results object containing:
#' \tabular{llllll}{
#'   \code{results$text} \tab \tab \tab \tab \tab a preformatted \cr
#'   \code{results$outofrange} \tab \tab \tab \tab \tab a table of the out of range values \cr
#'   \code{results$zscores} \tab \tab \tab \tab \tab a table of the outliers based on z-scores \cr
#'   \code{results$iqr} \tab \tab \tab \tab \tab a table of the outliers based on IQRs \cr
#'   \code{results$hist} \tab \tab \tab \tab \tab an image \cr
#'   \code{results$boxplot} \tab \tab \tab \tab \tab an image \cr
#' }
#'
#' Tables can be converted to data frames with \code{asDF} or \code{\link{as.data.frame}}. For example:
#'
#' \code{results$outofrange$asDF}
#'
#' \code{as.data.frame(results$outofrange)}
#'
#' @export
outliers <- function(
    data,
    dep,
    useMin = FALSE,
    useMax = FALSE,
    minValue = 0,
    maxValue = 0,
    useZ = FALSE,
    zLimit = 3.29,
    useIQR = FALSE,
    iqrLimitMild = 1.5,
    iqrLimitExtreme = 3,
    hist = FALSE,
    box = FALSE) {

    if ( ! requireNamespace("jmvcore", quietly=TRUE))
        stop("outliers requires jmvcore to be installed (restart may be required)")

    if ( ! missing(dep)) dep <- jmvcore::resolveQuo(jmvcore::enquo(dep))
    if (missing(data))
        data <- jmvcore::marshalData(
            parent.frame(),
            `if`( ! missing(dep), dep, NULL))


    options <- outliersOptions$new(
        dep = dep,
        useMin = useMin,
        useMax = useMax,
        minValue = minValue,
        maxValue = maxValue,
        useZ = useZ,
        zLimit = zLimit,
        useIQR = useIQR,
        iqrLimitMild = iqrLimitMild,
        iqrLimitExtreme = iqrLimitExtreme,
        hist = hist,
        box = box)

    analysis <- outliersClass$new(
        options = options,
        data = data)

    analysis$run()

    analysis$results
}

