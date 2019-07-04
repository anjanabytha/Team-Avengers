public class MyController 
{	
    public MyController(ApexPages.StandardSetController controller) {
        prac1= new Contact();
        prac2= new Contact();
       	Id profileId=userinfo.getProfileId();
         //Id profileId = ApexPages.currentPage().getParameters().get('Id');
String profileName=[Select Id,Name from Profile where Id=:profileId].Name;
system.debug('ProfileName'+profileName);
        if (ProfileName !='Service Line Leader')
{
	disabled=true;
    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Option Disabled'));
    
} 
        else{
            disabled=false;
        }
        
        
    }

    public boolean disabled {get;set;}
    public Contact prac1{get; set;}
    public Contact prac2{get; set;}
    
    
    public PageReference swapPrac()
    {
        try{
            Contact c1= [select Account.Project_Start_Date__c,Account.Project_End_Date__c,AccountId,Id,Practitioner_Start_Date__c,Practitioner_End_Date__c from Contact where Id=:prac1.Practitioner_Swap__c];
            Contact c2 =[select Account.Project_Start_Date__c,Account.Project_End_Date__c,AccountId,Id,Practitioner_Start_Date__c,Practitioner_End_Date__c from Contact where Id=:prac2.Practitioner_Swap__c];
            system.debug('ananya');
            
             Date t1= c1.Account.Project_Start_Date__c;
            c1.Account.Project_Start_Date__c=c2.Account.Project_Start_Date__c;
            c2.Account.Project_Start_Date__c=t1;
            
            Date t2= c1.Account.Project_End_Date__c;
            c1.Account.Project_End_Date__c=c2.Account.Project_End_Date__c;
            c2.Account.Project_End_Date__c=t2;
            system.debug('ananya');
            Date tmp1=c1.Practitioner_Start_Date__c;
            c1.Practitioner_Start_Date__c=c2.Practitioner_Start_Date__c;
            c2.Practitioner_Start_Date__c=tmp1;
            system.debug('ananya');
            
            Date tmp2=c1.Practitioner_End_Date__c;
            c1.Practitioner_End_Date__c=c2.Practitioner_End_Date__c;
            c2.Practitioner_End_Date__c=tmp2;
            
           
            system.debug('ananya');
           
            String tmpStr=c1.AccountId;
            c1.AccountId=c2.AccountId;
            c2.AccountId=tmpStr;
           
            
            system.debug('prac1'+prac1);
            system.debug('prac2'+prac2);
            update c1;
            update c2;
            system.debug('hello');
            //ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'swap success'));
            PageReference pageRef = new PageReference('https://ap15.lightning.force.com/lightning/o/Contact/list?filterName=00B2v00000EeolBEAR');
			pageRef.setRedirect(true);
            return pageRef;
            
        }
        catch(Exception e) {
           system.debug('I dont want to come here' +e);
            return null;
        }
        }
    }