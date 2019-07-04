<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>field_change</fullName>
        <field>OwnerId</field>
        <lookupValue>yvaidik97@gmail55.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>field change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>update ownership</fullName>
        <actions>
            <name>field_change</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>OwnerId   &lt;&gt;   Practitioner_name__c</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
