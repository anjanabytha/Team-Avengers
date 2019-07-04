trigger PTO_Trigger on PTO_Request__c (before insert,after update) {
           
    for(PTO_Request__c p: Trigger.new) {
            if(Trigger.isInsert){
            System.debug('testing');
            string i=UserInfo.getUserId();
            for(PTO_Request__c pto: [SELECT Id, PTO_End_Date__c, Approval_status__c FROM PTO_Request__c where Approval_status__c='Approved' and  OwnerID =:i order by PTO_End_Date__c DESC limit 1])                
    			p.Last_PTO_End_Date__c = pto.PTO_End_Date__c; 
              					}
    

}
}