<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>mail_to_hr</fullName>
        <description>mail to hr</description>
        <protected>false</protected>
        <recipients>
            <recipient>jackmanlogan97@gmail55.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Approval_mail</template>
    </alerts>
    <rules>
        <fullName>New Practitioner creation</fullName>
        <active>false</active>
        <formula>FirstName  &lt;&gt;  NULL</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>New Practitioner creation2</fullName>
        <actions>
            <name>mail_to_hr</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>FirstName  &lt;&gt;  NULL</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
