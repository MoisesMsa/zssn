# ZSSN

Rest API ZSSN in Rails

Things you may want to cover:

* Ruby version - 2.6

* Rails version - 6.0

##Suvirvors

**Show Suvivor**
----

* **URL**

  /survivors/show?id

* **Method:**
  
  `GET` 
  
*  **URL Params**

   **Required:**
 
   `id=[integer]`


* **Data Params**

	none

* **Success Response:**
   * **Code:** 200 <br />
    **Content:** 
   	 	{
    		"status": "ok",
    		"message": "success",
   			 "data": {
        				"id": 65,
        				"name": "Mario",
        				"age": 20,
        				"gender": "Male",
        				"latitude": 90.0,
        				"longitude": 180.0,
        				"created_at": "2019-09-09T15:14:55.928Z",
        				"updated_at": "2019-09-09T15:14:55.928Z",
        				"infected": null
   					 }
			}

**Survivors Index**
----

* **URL**

  /survivors

* **Method:**
  
  `GET` 
  
*  **URL Params**

   **Required:**
 
   none


* **Data Params**

	none

* **Success Response:**
   * **Code:** 200 <br />
    **Content:** 
 	 	{
    		"status": "ok",
    		"message": "success",
   			 "data": {
        				"id": 65,
        				"name": "Mario",
        				"age": 20,
        				"gender": "Male",
        				"latitude": 90.0,
        				"longitude": 180.0,
        				"created_at": "2019-09-09T15:14:55.928Z",
        				"updated_at": "2019-09-09T15:14:55.928Z",
        				"infected": null
   					 }
			}

**Survivor Create**
----

* **URL**

  /survivors/create?name=Mario&age=20&gender=Male&latitude=90.0&longitude=180.0&items[food]=3&items[water]=5

* **Method:**
  
  `GET` 
  
*  **URL Params**

   **Required:**
 	Name
	 Age
	 Gender
	 Latitude
	 Longitude
   


* **Data Params**

	 Items[]

* **Success Response:**
   * **Code:** 200 <br />
    **Content:** 
			{
   			 "status": "ok",
   			 "message": "success",
  				  "data": {
       					 "id": 67,
       					 "name": "Mario",
       					 "age": 20,
        				"gender": "Male",
       					 "latitude": 90.0,
       					 "longitude": 180.0,
       					 "created_at": "2019-09-09T23:15:12.227Z",
       					 "updated_at": "2019-09-09T23:15:12.227Z",
       					 "infected": null
   					 }
			}


**Survivor update Location**
----

* **URL**

  /survivors/location/survivor_id/latitude/longitude
  /survivors/location/65/10/10


* **Method:**
  
  `GET` 
  
*  **URL Params**

   **Required:**
 	 Survivor id
	 Latitude
	 Longitude
   


* **Data Params**

	 none

* **Success Response:**
   * **Code:** 200 <br />
    **Content:** 
			{
   			 "status": "ok",
   			 "message": "success",
  				  "data": {
       					 "id": 67,
       					 "name": "Mario",
       					 "age": 20,
        				"gender": "Male",
       					 "latitude": 90.0,
       					 "longitude": 180.0,
       					 "created_at": "2019-09-09T23:15:12.227Z",
       					 "updated_at": "2019-09-09T23:15:12.227Z",
       					 "infected": null
   					 }
			}


**Survivor trade items**
----

Trade items if the points are equivalentes and if both survivors are not infected


* **URL**

 /inventories/trade?id1=65&id2=66&items[survivor1][food]=3&items[survivor1][water]=1&items[survivor2][food]=1&items[survivor2][water]=3


* **Method:**
  
  `GET` 
  
*  **URL Params**

   **Required:**
 	 Survivor id 1
	  Survivor id 2
	 Items[survivor1][item name] = total
	 Items[survivor2][item name] = total
   


* **Data Params**

	 none

* **Success Response:**
   * **Code:** 200 <br />
    **Content:** 
			{
   			 "status": "ok",
   			 "message": "success",
  				  "data": {
       					 "id": 67,
       					 "name": "Mario",
       					 "age": 20,
        				"gender": "Male",
       					 "latitude": 90.0,
       					 "longitude": 180.0,
       					 "created_at": "2019-09-09T23:15:12.227Z",
       					 "updated_at": "2019-09-09T23:15:12.227Z",
       					 "infected": null
   					 }
			}

* **Error Response:**
		{
    		"error": "infected"
		}
		
		{
    		"error": "diferent potuations"
		}


**Create Item**
----

* **URL**

  /items/create?name=food&points=3

* **Method:**
  
  `GET` 
  
*  **URL Params**

   **Required:**
 	Name
	 Points
   
* **Data Params**

	 Items[]

* **Success Response:**
   * **Code:** 200 <br />
    **Content:** 
			{
    			"status": "ok",
    			"message": "success",
   			 "data": {
       				 "id": 9,
        				"name": "food",
        				"points": 3,
       					 "created_at": "2019-09-10T00:22:17.204Z",
       					 "updated_at": "2019-09-10T00:22:17.204Z"
   		 }
		 }



**Create infected**
----

Marks a survivor as infected if it has 3 records in the infected tables

* **URL**

 /infecteds/create?id=65


* **Method:**
  
  `GET` 
  
*  **URL Params**

   **Required:**
 	 Survivor id


* **Data Params**

	 none

* **Success Response:**
   * **Code:** 200 <br />
    **Content:** 
			{
   			 "status": "ok",
    			"message": "infected"
			}

**Report infecteds percentage**
----


* **URL**

 /reports/get_infected_total


* **Method:**
  
  `GET` 
  
*  **URL Params**

   **Required:**
 	 none


* **Data Params**

	 none

* **Success Response:**
   * **Code:** 200 <br />
    **Content:** 
			{
    				"status": "ok",
   			 	"message": "success",
  			 	"total_infecteds": 66.66666666666666
			}


**Get not infecteds percentage**
----


* **URL**

 /reports/get_non_infected_total


* **Method:**
  
  `GET` 
  
*  **URL Params**

   **Required:**
 	 none

* **Data Params**

	 none

* **Success Response:**
   * **Code:** 200 <br />
    **Content:** 
			{
				"status": "ok",
			 	"message": "success",
				"total_survivors": 40.66
			}

**Get not Items average**
----


* **URL**

 /reports/avg_items


* **Method:**
  
  `GET` 
  
*  **URL Params**

   **Required:**
 	 none

* **Data Params**

	 none

* **Success Response:**
   * **Code:** 200 <br />
    **Content:** 
			{
   			 "status": "ok",
   			 "message": "success",
    			"item_average": {
       		 "food": "8.66666666666667",
        		"medication": "0.0",
        		"Ammunition": "0.0",
        		"Water": "3.66666666666667"
   			 }
		}


**Get points lost **
----


* **URL**

 /reports/infected_lost_points


* **Method:**
  
  `GET` 
  
*  **URL Params**

   **Required:**
 	 none

* **Data Params**

	 none

* **Success Response:**
   * **Code:** 200 <br />
    **Content:** 
			{
   			 "status": "ok",
   			 "message": "success",
   			 "lost_points": 20
			}









# zssn
