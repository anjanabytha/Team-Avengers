@isTest
private class Trigger_testclass {
    static testmethod void myTest(){
        PTO_Request__c pt = new PTO_Request__c();
        pt.Name = 'test1122';
        pt.PTO_start_date__c=Date.newInstance(2019, 10, 27);
        pt.PTO_End_Date__c=Date.newInstance(2019, 11, 2);
        pt.Approval_status__c = 'Approved';
        insert pt;
        
         PTO_Request__c p = new PTO_Request__c();
        p.Name = 'test112233';
        p.PTO_start_date__c=Date.newInstance(2019, 12, 27);
        p.PTO_End_Date__c=Date.newInstance(2020, 11, 2);
        
        insert p;
        //insert pt.Last_PTO_End_Date__c;
       
    }
}