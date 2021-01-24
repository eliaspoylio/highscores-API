*** Settings ***
Library     RequestsLibrary
Library     JsonValidator
Library     Collections

*** Variables ***
${SERVER}       http://localhost:2400
${EMAIL}        test@test.com
${PASSWORD}     password
${CONTENT_TYPE}     application/json


*** Test Cases ***
Server Up
	Create Session    session    ${SERVER}
	${response}=    GET On Session      session     /
    #Log To Console      ${response.content}
	Should be equal as strings    ${response.status_code}    200

Login
    ${HEADERS}=         Create Dictionary
    ...                 Content-Type=${CONTENT_TYPE}
    ...                 User-Agent=RobotFramework
    Create Session  login    ${SERVER}
    #&{data}=        Create dictionary   "email":"${EMAIL}"  "password":"${PASSWORD}"
    ${response}=    POST On Session     login   /api/auth/login     data={"email":"${EMAIL}","password":"${PASSWORD}"}      headers=${HEADERS}
    #${response}=    GET On Session    login     /api/auth/login    json=${data}
    Should Be Equal As Strings      ${response.status_code}     200
    Element should exist        ${response.json()}     .token
    ${token}=       Get From Dictionary     ${response.json()}      token
    Set Suite Variable      ${token}        ${token}