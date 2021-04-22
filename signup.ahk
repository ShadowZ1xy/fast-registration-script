SetWorkingDir %A_ScriptDir%

writeCounter(ByRef text)
{
    IniWrite, %text%, config.ini, user, counter
}

readCounter()
{
    IniRead, someText, config.ini, user, counter
    return %someText%
}

readTail()
{
    IniRead, someText, config.ini, user, mailTail
    return %someText%
}

typeFirstName()
{
    IniRead, someText, config.ini, user, firstName
    SendRaw, %someText%
}

typeLastName()
{
    IniRead, someText, config.ini, user, lastName
    SendRaw, %someText%
}

typePassword()
{
    IniRead, someText, config.ini, user, password
    SendRaw, %someText%
}

readHead()
{
    IniRead, someText, config.ini, user, mailHead
    return %someText%
}

typeMail()
{
    head := readHead()
    tail := readTail()
    counter := readCounter()
    FileAppend,
    (
    %counter%
             
    ), registeredAccounts.txt
    writeCounter(counter + 1)
    SendRaw, %head%+%counter%%tail%
}


^!+p::
    Send ^a
    typeFirstName()
    Send, {Tab}
    Send ^a
    typeLastName()
    Send, {Tab}
    Send ^a
    typeMail()
    Send, {Tab}
    Send ^a
    typePassword()
    Send, {Tab}
    Send ^a
    typePassword()
    Send, {Tab}
    Send, {Space}
    Send, {Tab}
    Send, {Tab}
    Send, {Tab}
    Send, {Enter}
return
