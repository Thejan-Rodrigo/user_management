# user_management
Manage User using API


# GET manageUser/users 
This Api will returns all the users in the database.

output: 
[
	{
		"ID": <User Id>,
	  "FristName": "<User firstName>",
	  "LastName": "<User LastName>",
	  "Age": <User Age>
	},
	{
		"ID": <User Id>,
	  "FristName": "<User firstName>",
	  "LastName": "<User LastName>",
	  "Age": <User Age>
	},
	{
		"ID": <User Id>,
	  "FristName": "<User firstName>",
	  "LastName": "<User LastName>",
	  "Age": <User Age>
	},
	{
		"ID": <User Id>,
	  "FristName": "<User firstName>",
	  "LastName": "<User LastName>",
	  "Age": <User Age>
	}
]

# GET manageUser/users/<User Id> 
This API will returns a specific user in the database.

{
	"ID": <User Id>,
	"FristName": "<User firstName>",
	"LastName": "<User LastName>",
	"Age": <User Age>
}

# POST manageUser/users/insert
This API will insert a usern into the database.
input:
{
    "ID" : 6, 
    "FristName" : "Achira",
    "LastName" : "Manathunga", 
    "Age" : 2

}

output: 
{
    "ID" : 6, 
    "FristName" : "Achira",
    "LastName" : "Manathunga", 
    "Age" : 2

}


# PUT manageUser/users/<User Id>/update
This API will update a specific user in the database.

input:
{ 
    "FristName" : "Achira",
    "LastName" : "Manathunga", 
    "Age" : 25

}

output:
{ 
    "FristName" : "Achira",
    "LastName" : "Manathunga", 
    "Age" : 25

}

# DELETE manageUser/users/<User Id>/delete
This API will delete a specific user in the database.

output:
{
	"ID": <User Id>,
	"FristName": "<User FirstName>",
	"LastName": "<User LastName>",
	"Age": <User Age>
}


