*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser

*** Test Cases ***
At start the counter is zero
    Go To  ${HOME_URL}
    Get Title  ==  Laskuri
    Get Text  body  *=  nappia painettu 0 kertaa

When button pressed twice the counter is two
    Go To  ${HOME_URL}
    Click  button >> text=Paina
    Click  button >> text=Paina
    Get Text  body  *=  nappia painettu 2 kertaa

When reset button is pressed the counter returns to zero
    Go To  ${HOME_URL}
    Click  button >> text=Paina
    Click  button >> text=Paina
    Click  button >> text=Nollaa
    Get Text  body  *=  nappia painettu 0 kertaa

When a value is entered the counter is set to that value
    Go To  ${HOME_URL}
    Fill Text  input[name="value"]  42
    Click  button >> text=Aseta
    Get Text  body  *=  nappia painettu 42 kertaa
