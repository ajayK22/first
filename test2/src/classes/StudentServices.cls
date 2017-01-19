global class StudentServices {
    //request class
    global class Request{
    	webservice integer studentId;
    }
    
    //response class
    global class Response{
        webservice string firstName;
        webservice string lastName;
        webservice  double  Age;
        webservice  string Gender;
        webservice string department;
    }
    
    public static boolean validate(Request req){
       	
       if (req <> null && req.studentId <> 0){
            return true;
        }
        
       return false; 
    }  
    
    webservice static Response getStudentDetails(Request req){
            Response res =new Response();
        	//1.validate the request.
        	boolean isvalid =  validate(req);
                if (isvalid){
            //2.query the database of the student object.
            list<student__c> student=[SELECT first_Name__c,last_Name__c,Age__c,Gender__c,department__c from student__c where Student_Id__c = :req.studentId ];
        	//3.create response.
            for(student__c s: student){
              res.firstName=s.first_Name__c;
              res.lastName=s.last_Name__c;
              res.Age=s.Age__c;
              res.Gender=s.Gender__c;
              res.department=s.department__c;
        	}
                    if(student.size()==0)
             System.debug('the given id is not there' );
        } else {
        	  // send the error.
        }
        
        system.debug('++++'  + res);
        
        //4.send the repsonse.
    	return res;        
    }    
}