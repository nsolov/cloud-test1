Class Sandbox.Cloudsample.ObjectScript
{

ClassMethod HelloWorld(name As %String = "") As %Status
{
    if (name = "") {
        set name =  "World"
    } 
    write "Hello " _ name _ "!"

    write !!
    write "This is InterSystems IRIS with version ",$zv,!
    write "Current time is: "_$zdt($now(),3,,6),!
    return $$$OK
}

ClassMethod ShowVars() As %Status
{
    set var1 = $SYSTEM.Util.GetEnviron("var1")
    set var2 = $SYSTEM.Util.GetEnviron("var2")
    
    
    if (var1="") {
        set var1 = "(var1 is not set)"
    }
    if (var2="") {
        set var2 = "(var2 is not set)"
    }
    
    write "var1 = " _ var1
    write "var2 = " _ var2
    
    q 1
}

}
