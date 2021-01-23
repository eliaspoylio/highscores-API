*** Settings ***
Library     RequestsLibrary

*** Variables ***
${HOST}    http://localhost:2400/


*** Test Cases ***
API Test
	# Arrange
	Create Session    session    ${HOST}
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8

	# Act
	${response}=    GET On Session    session    my-endpoint    headers=${headers}

	# Assert
	Should be equal as strings    ${response.status_code}    200