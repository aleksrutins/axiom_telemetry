-module(axiom_telemetry).

-export([]).

-spec send_log(string(), string(), string()) -> {ok, Result} | {error, term()} when
    Result ::
        {StatusLine :: {HttpVersion, StatusCode, string()}, [HttpHeader], HttpBodyResult}
        | {StatusCode, HttpBodyResult}
        | RequestId
        | saved_to_file,
    HttpBodyResult :: uri_string:uri_string() | binary(),
    HttpVersion :: uri_string:uri_string(),
    StatusCode :: non_neg_integer(),
    HttpHeader :: {Field :: [byte()], Value :: binary() | iolist()},
    RequestId :: any().
send_log(APIToken, Dataset, Data) ->
    httpc:request("https://api.axiom.co/v1/datasets/" ++ Dataset ++ "/ingest"). % TODO: do stuff
