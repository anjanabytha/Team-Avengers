@isTest
public class Mycontroller_Testclass {
    
    private static testmethod void myTest(){
        Contact con1=new Contact();
        Contact con2= new Contact();
        Account a1=new Account();
        Account a2=new Account();
        a1.Name='Aura Bikes';
        a1.Project_Status__c='New';
        a1.Project_Start_Date__c= Date.newInstance(2019,09,10);
        a1.Project_End_Date__c= Date.newInstance(2019, 09, 23);
        insert a1;
         con1.LastName='test1';
         //con1.AccountId=a1.Name;
         con1.Practitioner_Start_Date__c=Date.newInstance(2019,09,12);
         con1.Practitioner_End_Date__c=Date.newInstance(2019,09,16);
       
        insert con1;
       
        contact[] newContact1 = [select id,Account.Project_Start_Date__c,Account.Project_End_Date__c,Lastname,Practitioner_Start_Date__c,Practitioner_End_Date__c from contact where LastName='test1'];
       
        a2.Name='Fero Watches';
        a2.Project_Status__c='Current';
        a2.Project_Start_Date__c= Date.newInstance(2019,10,10);
        a2.Project_End_Date__c= Date.newInstance(2019, 10, 23);
        
        insert a2;
		con2.LastName='test2';
        //con2.AccountId=a2.Name;
         con2.Practitioner_Start_Date__c=Date.newInstance(2019,10,12);
         con2.Practitioner_End_Date__c=Date.newInstance(2019,10,16);
         
        insert con2;
        
        contact[] newContact2 = [select id,Account.Project_Start_Date__c,Account.Project_End_Date__c,Lastname,Practitioner_Start_Date__c,Practitioner_End_Date__c from contact where LastName='test2'];
        Test.StartTest();
        
        PageReference pageRef = new PageReference('https://ap15.lightning.force.com/lightning/o/Contact/list?filterName=00B2v00000EeolBEAR');
        pageRef.getParameters().put('id', 'newContact1.id');
        Test.setCurrentPage(pageRef);
        
        
        // pageRef.getParameters().put('Id', String.valueOf(prac1.Id));
        ApexPages.StandardSetController sec = new ApexPages.StandardSetController(newContact1);
        MyController testAccPlan1 = new MyController(sec); 
        PageReference pg1 = testAccPlan1.swapPrac();
        
        ApexPages.StandardSetController sc = new ApexPages.StandardSetController(newContact2);
        MyController testAccPlan2 = new MyController(sc); 
        
        
        PageReference pg2 = testAccPlan2.swapPrac();
        Test.StopTest();
        
    }
}