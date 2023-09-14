Feature: Update New Account 

Background: Generate Token for Test perposes
Given url "https://tek-insurance-api.azurewebsites.net"
* def createAccountResult = callonce read('CreateAccount.feature')
And print createAccountResult
* def createAccountId = createAccountResult.response.id
* def result = callonce read('GenerateToken.feature')
* def validToken = result.response.token

Scenario: Validate user can create new account
Given path "/api/accounts/add-primary-account"
And header Authorization = "Bearer " + validToken
* def generateDataObjects = Java.type('api.utility.data.GenerateData')
* def autoGenerateEmail = generateDataObjects.getEmail()
* def autoGenerateName = Java.type('api.utility.data.NameGenerator')
And request
"""
      
{
      
"email": "#(autoGenerateEmail)",
"firstName": "#(generateFirstName)",
"lastName": "#(generateLastName)",
"gender": "MALE",
"maritalStatus": "MARRIED",      
"employmentStatus": "Employed",      
"dateOfBirth": "1965-05-26"
      
}

"""
And print autoGenerateName
When method post
Then status 201
And print response
And assert response.email == autoGenerateEmail

Scenario: Validate user can update Phone Number to an Existing Account
Then path "/api/accounts/add-account-phone"
And param primaryPersonId = createAccountId
And header Authorization = "Bearer " + validToken
And request
"""
      
{
      
"phoneNumber": "#(phoneNumer)",     
"phoneExtension": "011", 
"phoneTime": "Morning",
"phoneType": "Telephone"
      
}

"""
When method post
Then status 201
And print response

Scenario: Validate user can update Address to an Existing Account
Then path "/api/accounts/add-account-address"
And param primaryPersonId = createAccountId
And header Authorization = "Bearer " + validToken
And request
"""
{
      
"addressType": "House",
"addressLine1": "444 Docstone RD",
"city": "Falls Church",
"state": "VA",
"postalCode": "22401",
"countryCode": "001",
"current": true
      
}

"""
When method post
Then status 201

Scenario: Validate user can update Car to an Existing Account
Then path "/api/accounts/add-account-car"
And param primaryPersonId = createAccountId
And header Authorization = "Bearer " + validToken
And request

"""
      
{
      
"make": "BMW",
"model": "X5",
"year": "2018",
"licensePlate": "#(licensePlate)"
      
}

"""
When method post
Then status 201

Scenario: Validated user can delete an Excisting Account
Then path "/api/accounts/delete-account"
And header Authorization = "Bearer " + validToken
And param primaryPersonId = createAccountId
When method delete
Then status 200
