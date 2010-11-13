<cfcomponent  displayname="AbstractController" hint="I am an abstract controller, not meant to be instantiated" output="false">

	<cfparam name="url.method" default="">
	<cfset var _response = {}>
		<cfset _response.layout = "">
		<cfset _response.contents = "">
		<cfset _response.title = url.method>

	<cfset var _event = defaultEvent()>

	<cffunction name="init">
		<cfreturn this>
	</cffunction>



	<cffunction name="defaultEvent" access="package" output="false" hint="I return a barebones event">
		<cfargument name="eventName" default="none">
		
		<cfset var event = {}>
			<cfset event[ 'success' ]	= true>
			<cfset event[ 'display' ] 	= "">
			<cfset event[ 'context' ] 	= "">
			<cfset event[ 'name' ] 		= arguments.eventName>
			<cfset event[ 'error' ] 	= "">
		
		<cfreturn event>
	</cffunction>
	
	

	<cffunction name="defaultEventObject" access="package" output="false" hint="I return a barebones eventObject">
		<cfset var eventObject = {}>
		<cfset eventObject[ 'context' ] = "body">
		<cfset eventObject[ 'displayBy' ] = "html">
		
		<cfreturn eventObject>
	</cffunction>



	<cffunction name="onMissingMethod" access="private" output="false" hint="I accept an eventObject and turn it into a new event">
		<cfargument name="methodName" hint="I'm the name of action">
		<cfargument name="methodArguments" hint="I'm the eventObject passed into the controller's action">
		<cfif StructKeyExists( arguments.methodArguments, 'eventObject' )>

		</cfif>
		
	</cffunction>


	
	<cffunction name="render" access="private" output="true">
		<cfargument name="viewFiles" default="#[]#">
		<cfargument name="layout" default="#[url.method]#">
		
		<!--- If a view file was specified, use it and fold into response.contents --->
		<cfif Len( arguments.view_file )>
			<cfsavecontent variable="response.contents">
				<cfinclude template="#application.viewpath#/#arguments.view_file#">
			</cfsavecontent>
		<!--- Otherwise, use the name of the action --->
		<cfelse>
			<cftry>
				<cfsavecontent variable="response.contents">
					<cfinclude template="#application.viewpath#/#action#.cfm">
				</cfsavecontent>
				<!--- And, if all else fails, output response.contents --->
				<cfcatch>
					<cfsavecontent variable="response.contents">
						#response.contents#				
					</cfsavecontent>
				</cfcatch>
			</cftry>
		</cfif>
		
		<!--- Now try for the layouts -- use a specified one if it exists --->
		<cftry>
			<cfinclude template="#application.layoutpath#/#response.layout#">
			<!--- Nothing specified? then try using the controller's layout --->
			<cfcatch>
				<cftry>
					<cfsavecontent variable="response.contents">
						<cfinclude template="#application.layoutpath#/#controller#.cfm">
					</cfsavecontent>
					<!--- Nothing found? Then we'll just use the general layout --->
					<cfcatch></cfcatch>
				</cftry>
			</cfcatch>
		</cftry>
		
		<cfinclude template="#application.layoutpath#/general.cfm">
	</cffunction>
	
	
	
	<cffunction name="layout" access="private" output="false">
		<cfargument name="layout_file" default="">
		<cfif Len( arguments.layout_file )>
			<cfset response.layout = arguments.layout_file>
		</cfif>
	</cffunction>
	
	
	<cffunction name="build" access="private" output="false" hint="I add to the _response hash">
		<cfargument name="key">
		<cfargument name="value">
		<cfset _response[ arguments.key ] = arguments.value>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="title" access="private" output="false">
		<cfargument name="page_title" default="#action#">
		<cfset response.title = arguments.page_title>
	</cffunction>
</cfcomponent>