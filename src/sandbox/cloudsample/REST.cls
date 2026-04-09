Class Sandbox.Cloudsample.REST Extends %CSP.REST
{

Parameter CHARSET = "utf-8";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
  <Route Url="/test" Method="GET" Call="Test"/>
  <Route Url="/getVars" Method="GET" Call="GetVars"/>
</Routes>
}

ClassMethod Test() As %Status
{
    set payload = {}
    set payload.status = "OK"

    do ..WriteJSON(payload)
    quit $$$OK
}

ClassMethod GetVars() As %Status
{
    set payload = {}
    set payload.var1 = ..GetEnv("var1")
    set payload.var2 = ..GetEnv("var2")

    do ..WriteJSON(payload)
    quit $$$OK
}

ClassMethod GetEnv(name As %String) As %String
{
    set value = $SYSTEM.Util.GetEnviron(name)
    if value = "" set value = "(" _ name _ " is not set)"
    quit value
}

ClassMethod WriteJSON(payload As %DynamicObject) As %Status
{
    set %response.ContentType = "application/json"
    write payload.%ToJSON()
    quit $$$OK
}

}
