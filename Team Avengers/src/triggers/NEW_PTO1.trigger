trigger NEW_PTO1 on PTO_Request__c (before insert) {
     List<PTO_Request__c> lreq = new List<PTO_Request__c>(); 
     System.debug('inside');
   
    for(PTO_Request__c p: Trigger.new) { 
        System.debug(p);
        //p.Approval_status__c == 'Approved' //query 
        //field is updated on Practitioner
        //lreq.add(p.Id); //so that we dont exceed governer limits
       // List<PTO_Request__c> upList = new List<PTO_Request__c>(); 
       string i=UserInfo.getUserId();
       for(PTO_Request__c pto: [SELECT Id, PTO_End_Date__c, Approval_status__c FROM PTO_Request__c where Approval_status__c='Approved' and  OwnerID =:i order by PTO_End_Date__c DESC limit 1])                
        {
             System.debug(pto.PTO_End_Date__c);
            p.Last_PTO_End_Date__c = pto.PTO_End_Date__c; 
            //upList.add(pto); 
             //update pto;
        } 
        //if(upList.size()>0) 
            //update upList; 
        }
}
    
/*    if(lreq.size()>0) 
    { 
        List<PTO_Request__c> upList = new List<PTO_Request__c>(); 
        for(PTO_Request__c pto: [SELECT Id, PTO_End_Date__c, Approval_status__c 
                                 FROM PTO_Request__c 
                                 where Approval_status__c='Approved' and Id='a012v000022VT4XAAW' 
                                 order by PTO_End_Date__c DESC limit 1]){
            pto.Last_PTO_End_Date__c = pto.PTO_End_Date__c; 
            upList.add(pto); 
        } 
        if(upList.size()>0) 
            update upList; 
    } 
}*/