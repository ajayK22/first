global class StudentDeptList {
    //request class
    global class Request{
    	webservice string department;
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
       	
       if (req <> null ){
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
            list<student__c> student=[SELECT first_Name__c,last_Name__c,Age__c,Gender__c,department__c from student__c where department__c = :req.department ];
        	//3.create response.
            for(student__c s: student){
                if(s.department__c =='Computers'){
              res.firstName=s.first_Name__c;
              res.lastName=s.last_Name__c;
              res.Age=s.Age__c;
              res.Gender=s.Gender__c;
              res.department=s.department__c;
        	}
                    system.debug('++++'  + res);
            }
            //        if(student.size()==0)
            // System.debug('the given id is not there' );
        } else {
        	  // send the error.
        }
        
    
        
        //4.send the repsonse.
    	return res;        
    }    
}